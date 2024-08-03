-- this script is shared by all SQ Wind - FearWindCopySpawn whatever queststep scripts

-- this script is active on the following maps:
-- Winterlight, Alluvyan, Ghostwatch, Refuge

local tWind =
{
	P401 = {WindCopyLevel = 18, WindHelperLevel = 16, NumHelper = 4, WindCopyUnitId = 1190, WindHelperUnitId = 1186, RewardItem = 1183, FearQuest = "HeroWindFightNorthWind"},
	P402 = {WindCopyLevel = 18, WindHelperLevel = 16, NumHelper = 5, WindCopyUnitId = 1191, WindHelperUnitId = 1187, RewardItem = 1160, FearQuest = "HeroWindFightWestWind"},
	P404 = {WindCopyLevel = 19, WindHelperLevel = 16, NumHelper = 6, WindCopyUnitId = 1192, WindHelperUnitId = 1188, RewardItem = 1159, FearQuest = "HeroWindFightSouthWind"},
	P409 = {WindCopyLevel = 20, WindHelperLevel = 17, NumHelper = 8, WindCopyUnitId = 1193, WindHelperUnitId = 1189, RewardItem = 1182, FearQuest = "HeroWindFightEastWind"},
}

local iCopyLevel = tWind[GetPlatform()].WindCopyLevel
local iHelperLevel = tWind[GetPlatform()].WindHelperLevel
local iCopyUnitId = tWind[GetPlatform()].WindCopyUnitId
local iHelperUnitId = tWind[GetPlatform()].WindHelperUnitId
local iNumHelper = tWind[GetPlatform()].NumHelper
local sWindFearQuest = tWind[GetPlatform()].FearQuest
local iRewardItem = tWind[GetPlatform()].RewardItem


local tSpawnHelper = {}
for i = 1, iNumHelper do
	local sTag = "SQWind_CopyHelper" .. i
	table.insert(tSpawnHelper, FigureNpcSpawnToEntity	{Tag = sTag, Level = iHelperLevel, UnitId = iHelperUnitId, TargetTag = "SQWind_Location", Team = "tm_Team2"})
	table.insert(tSpawnHelper, FigureDirectionSetToEntity	{Tag = sTag, TargetTag = "pl_HumanHeroWind"})
	table.insert(tSpawnHelper, FigureRoamingEnable	{Tag = sTag})
end

if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		EventName = "DebugInit",
		Conditions = 
		{
			QuestIsNotKnown		{Quest = "HeroWind"},
			DebugQuestionYes	{Question = "Den entsprechenden Questabschnitt (Kampf gegen eine von 4 Wind-Kopien) starten?", Caption = "SQ Hero Wind - Kampf mit Ängsten"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "HeroWind"},
			QuestSetActive	{Quest = sWindFearQuest},
		},
	};
end

State
{
	StateName = "SpawnWind",

	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = sWindFearQuest},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "SQWind_Location", Range = 18},
			FigureIsAlive	{Tag = "pl_HumanHeroWind"},
		},
		Actions = 
		{
			-- NOTE: on every SQ Wind Map (Winterlight, Alluvyan, Ghostwatch, Refuge) the following Outcries 
			-- MUST EXIST with these TextTags in the respective OutcryText.lua file !!!
			-- Do not forget to update all those OutcryText.lua if you add more Outcries here ...
			FigureOutcry	{TextTag = "SQWindSpawn1", Tag = "pl_HumanHeroWind"},
			FigureOutcry	{TextTag = "SQWindSpawn2", Tag = "pl_HumanHeroWind"},
			
			EntityTimerStart	{Name = "et_SpawnWindCopy"},
		},
	};

	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_SpawnWindCopy", Seconds = 8},
		},
		Actions = 
		{
			EntityTimerStop	{Name = "et_SpawnWindCopy"},
			FigureNpcSpawnToEntity	{Tag = "SQWind_Copy", Level = iCopyLevel, UnitId = iCopyUnitId, TargetTag = "SQWind_Location", Team = "tm_Team2"},
			FigureLootItemEquipmentAdd	{Tag = "SQWind_Copy", DropChance = 100, ItemId = iRewardItem},
			FigureDirectionSetToEntity	{Tag = "SQWind_Copy", TargetTag = "pl_HumanHeroWind"},
			unpack(tSpawnHelper)	-- muss die letzte Action sein!
		},
		GotoState = "WindCopyDead",
	};
};


local tHelperDead = {}
for i = 1, iNumHelper do
	table.insert(tHelperDead, FigureIsDead	{Tag = "SQWind_CopyHelper" .. i})
end

State
{
	StateName = "WindCopyDead",

	OnEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "SQWind_Copy"},
			unpack(tHelperDead)	-- muss die letzte Condition sein!
		},
		Actions = 
		{
			QuestSetSolved	{Quest = sWindFearQuest},
		},
		GotoState = "CheckAllSolved",
	};
};

State
{
	StateName = "CheckAllSolved",

	OnEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "HeroWindFightEastWind"},
			QuestIsSolved	{Quest = "HeroWindFightSouthWind"},
			QuestIsSolved	{Quest = "HeroWindFightWestWind"},
			QuestIsSolved	{Quest = "HeroWindFightNorthWind"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "HeroWind"},
			AvatarFlagSetTrue	{Name = "af_P400_GiveHeroAbilityToWind"},
		},
		GotoState = "SolveQuestOutcries",
	};

	OnEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
		},
		GotoState = "END",
	};
};

State
{
	StateName = "SolveQuestOutcries",

	OnEvent
	{
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			FigureIsAlive	{Tag = "pl_HumanHeroWind"},
			FigureIsAlive	{Tag = "pl_HumanHeroWhisper"},
		},
		Actions = 
		{
			-- NOTE: on every SQ Wind Map (Winterlight, Alluvyan, Ghostwatch, Refuge) the following Outcries 
			-- MUST EXIST with these TextTags in the respective OutcryText.lua file !!!
			-- Do not forget to update all those OutcryText.lua if you add more Outcries here ...
			FigureOutcry	{TextTag = "SQWindSolved1", Tag = "pl_HumanHeroWind"},
			FigureOutcry	{TextTag = "SQWindSolved2", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "SQWindSolved3", Tag = "pl_HumanHeroWind"},
			FigureOutcry	{TextTag = "SQWindSolved4", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWindSolved5", Tag = "pl_HumanHeroWind"},
		},
		GotoState = "END",
	};
};


State	{StateName = "END"};

