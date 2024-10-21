State
{
	StateName = "WaitForQuestStart",

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQPriest_StartProtectGhosts"},
		},
		Actions =
		{
    		--DebugMessage	{Message = "Dämonen spawnen"},
		},
		GotoState = "DemonsAttack",
	};
};

local tDemonGoHome = {}
local tAllDemonsDead = {}

local iNumDemons = 3
local iDemonLevelRTA = -7

local tTargetTags =
{
	"SQPriest_FoWReveal1",
	"SQPriest_FoWReveal2",
	"SQPriest_FoWReveal3",
	"SQPriest_HolyGround",
	"SQPriest_FoWReveal4",
	"SQPriest_FoWReveal5",
	"SQPriest_DeSpawnDwarf",
	"SQPriest_HolyGround",
}

local iTargetTag = 1

for iSpawnPos = 1, 2 do
	local sTargetTag = "SQPriest_SpawnDemon" .. iSpawnPos

	for i = 1, iNumDemons do
		local sTag = "SQPriest_Spawn" .. iSpawnPos .. "Demon" .. i
		local sGotoTargetTag = tTargetTags[iTargetTag]
		iTargetTag = iTargetTag + 1

		table.insert(tDemonGoHome, FigureForcedRunToEntity	{Tag = sTag, TargetTag = sTargetTag})
		table.insert(tAllDemonsDead, FigureIsDead	{Tag = sTag})

		local tActions = {}
		
		table.insert(tActions, NoSpawnEffect{Spawn = FigureNpcSpawnLRTAToEntity	{Tag = sTag, Level = iDemonLevelRTA, UnitId = 1287, TargetTag = sTargetTag, Team = "tm_Team2"}})
		--table.insert(tActions, FigureRoamingEnable	{Tag = sTag})
		table.insert(tActions, FigureForcedRunToEntity	{Tag = sTag, TargetTag = sGotoTargetTag})
		
		OnEvent
		{
			Conditions =
			{
				FigureIsDead	{Tag = sTag},
			},
			Actions = tActions,
		};
	end
end

State
{
	StateName = "DemonsAttack",

	OnEvent
	{
		Conditions =
		{
			MapFlagIsFalse	{Name = "mf_SQPriest_StartProtectGhosts"},
		},
		Actions =
		{
    		--DebugMessage	{Message = "Dämonen: Questabbruch, go home"},
			unpack(tDemonGoHome)	-- muss die letzte Action sein!
		},
		GotoState = "DemonsDespawn",
	};
};



for iSpawnPos = 1, 2 do
	local sTargetTag = "SQPriest_SpawnDemon" .. iSpawnPos

	for i = 1, iNumDemons do
		local sTag = "SQPriest_Spawn" .. iSpawnPos .. "Demon" .. i

		OnEvent
		{
			Conditions =
			{
				FigureIsAlive	{Tag = sTag},
				FigureIsInRangeToEntity	{Tag = sTag, TargetTag = sTargetTag, Range = 3},
			},
			Actions =
			{
				FigureVanish	{Tag = sTag},
			},
		};
	end
end

State
{
	StateName = "DemonsDespawn",

	OnEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "PriestEpicLifeTalkToGalius"},
			unpack(tAllDemonsDead)
		},
		Actions =
		{
    		--DebugMessage	{Message = "Dämonen: wait for Quest restart !!!!!!!!!!!!!!!"},
		},
		GotoState = "WaitForQuestStart",
	};
	
	OnEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "PriestEpicLifeProtectGhosts"},
			unpack(tAllDemonsDead)
		},
		Actions =
		{
    		--DebugMessage	{Message = "Dämonen: Quest gelöst"},
		},
		GotoState = "END",
	};
};

State	{StateName = "END"};
