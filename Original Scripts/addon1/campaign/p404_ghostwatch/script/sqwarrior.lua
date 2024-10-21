local iNumOrcGhosts = 10
local iOrcLevelRTA = -6
local iNumHumanGhosts = 15
local iHumanLevelRTA = -4

if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		EventName = "Debug",
		Conditions = 
		{
			QuestIsNotKnown	{Quest = "WarriorEpicCourage"},
			DebugQuestionYes	{Question = "Warrior Epic starten?"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "WarriorEpicCourage"},
			---QuestSetActive	{Quest = "WarriorEpicCourageProtectGhosts"},
		},
	};
end

State
{
	StateName = "INIT",

	OnEvent
	{
		EventName = "GotoMain",
		Conditions = 
		{
			QuestIsActive	{Quest = "WarriorEpicCourage"},
		},
		Actions = 
		{
		},
		GotoState = "EnableShrine",
	};
};

State
{
	StateName = "EnableShrine",

	OnEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "SQWarrior_Shrine"},
		},
		GotoState = "TalkToShrine",
	};
};

local tSpawnGhosts = {}
local tDespawnGhosts = {}
local tVanishGhosts = {}
local tAllHumanGhostsDead = {}
for i = 1, iNumOrcGhosts do
	local sTag = "SQWarrior_GhostOrc" .. i
	local sVar = "ef_IsDead_" .. sTag
	table.insert(tSpawnGhosts, FigureNpcSpawnLRTAToEntity	{Tag = sTag, Level = iOrcLevelRTA, UnitId = 1261, TargetTag = "SQWarrior_SpawnOrcs", Team = "tm_Team1"})
	table.insert(tSpawnGhosts, FigureRoamingEnable	{Tag = sTag})
	table.insert(tSpawnGhosts, EntityFlagSetFalse	{Name = sVar})	-- schalte death abfrage wieder ein
	table.insert(tDespawnGhosts, EffectStart	{Tag = sTag, File = "Effect_DeSpawn_Unit"})
	table.insert(tVanishGhosts, FigureVanish	{Tag = sTag})
end
for i = 1, iNumHumanGhosts do
	local sTag = "SQWarrior_GhostHuman" .. i
	table.insert(tSpawnGhosts, FigureNpcSpawnLRTAToEntity	{Tag = sTag, Level = iHumanLevelRTA, UnitId = 1262, TargetTag = "SQWarrior_SpawnHumans", Team = "tm_Team2"})
	table.insert(tSpawnGhosts, FigureRunToEntity	{Tag = sTag, TargetTag = "SQWarrior_SpawnOrcs"})
	--table.insert(tDespawnGhosts, EffectStart	{Tag = sTag, File = "Effect_DeSpawn_Unit"})
	--table.insert(tVanishGhosts, FigureVanish	{Tag = sTag})
	table.insert(tAllHumanGhostsDead, FigureIsDead	{Tag = sTag})
end

State
{
	StateName = "TalkToShrine",

	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQWarrior_SpawnGhosts"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_SQWarrior_SpawnGhosts"},
			EntityValueSet	{Name = "ev_NumOrcGhostsDead", Value = 0},
			unpack(tSpawnGhosts)	-- muss die letzte Action sein!
		},
		GotoState = "ProtectGhosts",
	};
};


for i = 1, iNumOrcGhosts do
	local sTag = "SQWarrior_GhostOrc" .. i
	local sVar = "ef_IsDead_" .. sTag

	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsFalse	{Name = sVar},
			FigureIsDead	{Tag = sTag},
		},
		Actions = 
		{
			EntityFlagSetTrue	{Name = sVar},
			EntityValueIncrease	{Name = "ev_NumOrcGhostsDead"},
		},
	};
end

State
{
	StateName = "ProtectGhosts",

	OnEvent
	{
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			unpack(tAllHumanGhostsDead)	-- muss die letzte Condition sein!
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_DespawnDelay"},
			unpack(tDespawnGhosts)	-- muss die letzte Action sein!
		},
		GotoState = "DespawnGhosts",
	};
};
State
{
	StateName = "DespawnGhosts",

	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_DespawnDelay", Seconds = 3},
		},
		Actions = 
		{
			unpack(tVanishGhosts)	-- muss die letzte Action sein!
		},
		GotoState = "AllHumanGhostsDead",
	};
};


State
{
	StateName = "AllHumanGhostsDead",

	OnEvent
	{
		Conditions = 
		{
			EntityValueIsGreater	{Name = "ev_NumOrcGhostsDead", Value = iNumOrcGhosts / 2},
		},
		Actions = 
		{
		},
		GotoState = "EnableShrine",
	};

	OnEvent
	{
		Conditions = 
		{
			-- höchstens die Hälfte der Orcs darf tot sein
			EntityValueIsLessOrEqual	{Name = "ev_NumOrcGhostsDead", Value = iNumOrcGhosts / 2},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "WarriorEpicCourageProtectGhosts"},
			QuestSetSolved	{Quest = "WarriorEpicCourage"},
			QuestSetActive	{Quest = "WarriorEpicSacrifice"},
			--QuestSetActive	{Quest = "WarriorEpicSacrificeYourself"},
			AvatarItemEquipmentGive	{ItemId = 1166, Amount = 1},
		},
		GotoState = "END",
	};
};

State{StateName = "END"};
