local iImmerFrostLevel = 10
local iNumImmerFrost = 5

if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		EventName = "Debug",
		Conditions = 
		{
			DebugQuestionYes	{Caption = "HeroQuest Wind", Question = "HeroQuest von Wind gleich starten?"},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_Delay"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "Debug",
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_Delay", Seconds = 1},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_EndEndeCS"},
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
			MapFlagIsTrue	{Name = "mf_DisableSideQuests"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "pl_HumanHeroWind"},
		},
		GotoState = "END",
	};

	OnEvent
	{
		EventName = "GotoMain",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_EndEndeCS"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "HeroWind"},
			QuestSetActive	{Quest = "HeroWindTalkToAedar"},
			--DialogSetEnabled	{Tag = "SQWind_Maira"},
		},
		GotoState = "GotoAedar",
	};
};

local tSpawnImmerFrost = {}
table.insert(tSpawnImmerFrost, FigureWalkToEntity	{Tag = "SQWind_Aedar", TargetTag = "SQWind_Maira"})
table.insert(tSpawnImmerFrost, ObjectSpawnToEntity	{ObjectId = 1433, TargetTag = "SQWind_Aedar", Direction = 0, Tag = "SQWind_AedarReward"})
table.insert(tSpawnImmerFrost, ObjectLootItemEquipmentAdd	{Tag = "SQWind_AedarReward", DropChance = 100, ItemId = 1163})
table.insert(tSpawnImmerFrost, ObjectSpawnToEntity	{ObjectId = 1918, TargetTag = "SQWind_ChestPlaceholder", Direction = 0, Tag = "SQWind_Chest"})
table.insert(tSpawnImmerFrost, ObjectLootItemMiscAdd	{Tag = "SQWind_Chest", DropChance = 100, ItemId = 319})
table.insert(tSpawnImmerFrost, ObjectLootItemEquipmentAdd	{Tag = "SQWind_Chest", DropChance = 100, ItemId = 1162})
table.insert(tSpawnImmerFrost, ObjectLootItemEquipmentAdd	{Tag = "SQWind_Chest", DropChance = 100, ItemId = 1164})
table.insert(tSpawnImmerFrost, ObjectLootItemEquipmentAdd	{Tag = "SQWind_Chest", DropChance = 100, ItemId = 1165})

for i = 1, iNumImmerFrost do
	table.insert(tSpawnImmerFrost, FigureNpcSpawnToEntity	{Tag = "SQWind_Immerfrost" .. i, Level = iImmerFrostLevel, UnitId = 1197, TargetTag = "SQWind_ChestPlaceholder", Team = "tm_Team2"})
	table.insert(tSpawnImmerFrost, FigureRoamingEnable	{Tag = "SQWind_Immerfrost" .. i})
end

State
{
	StateName = "GotoAedar",

	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "SQWind_Aedar", Range = 12},
		},
		Actions = 
		{
			FigureForcedRunToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "SQWind_Aedar"},
			FigureOutcry	{TextTag = "SQWind2", Tag = "pl_HumanHeroWind"},
			EntityTimerStart	{Name = "et_WindDialogEnableDelay"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "SQWind_Aedar", Range = 2},
		},
		Actions = 
		{
			FigureStop	{Tag = "pl_HumanHeroWind"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_WindDialogEnableDelay", Seconds = 4},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_SQWind_WindDialogEnabled"},
		},
		GotoState = "TalkToAedar",
	};
};

State
{
	StateName = "TalkToAedar",

	OnPlayHeroAnimEvent	{Tag = "pl_HumanAvatar",	Anim = "emote_point",	EventName = "AedarDialogAnim",
		Conditions = {	MapFlagIsTrue	{Name = "mf_SQWind_AedarPlayAnimPoint"},	},
		Actions = {	MapFlagSetFalse	{Name = "mf_SQWind_AedarPlayAnimPoint"},	},	};

	OnPlayHeroAnimEvent	{Tag = "pl_HumanAvatar",	Anim = "emote_yes",	EventName = "AedarDialogAnim",
		Conditions = {	MapFlagIsTrue	{Name = "mf_SQWind_AedarPlayAnimYes"},	},
		Actions = {	MapFlagSetFalse	{Name = "mf_SQWind_AedarPlayAnimYes"},	},	};

	OnPlayHeroAnimEvent	{Tag = "pl_HumanAvatar",	Anim = "emote_no",	EventName = "AedarDialogAnim",
		Conditions = {	MapFlagIsTrue	{Name = "mf_SQWind_AedarPlayAnimNo"},	},
		Actions = {	MapFlagSetFalse	{Name = "mf_SQWind_AedarPlayAnimNo"},	},	};

	OnPlayHeroAnimEvent	{Tag = "pl_HumanAvatar",	Anim = "emote_cheer",	EventName = "AedarDialogAnim",
		Conditions = {	MapFlagIsTrue	{Name = "mf_SQWind_AedarPlayAnimCheer"},	},
		Actions = {	MapFlagSetFalse	{Name = "mf_SQWind_AedarPlayAnimCheer"},	},	};

	OnPlayHeroAnimEvent	{Tag = "pl_HumanAvatar",	Anim = "emote_sad",	EventName = "AedarDialogAnim",
		Conditions = {	MapFlagIsTrue	{Name = "mf_SQWind_AedarPlayAnimSad"},	},
		Actions = {	MapFlagSetFalse	{Name = "mf_SQWind_AedarPlayAnimSad"},	},	};

	OnPlayHeroAnimEvent	{Tag = "pl_HumanAvatar",	Anim = "emote_taunt",	EventName = "AedarDialogAnim",
		Conditions = {	MapFlagIsTrue	{Name = "mf_SQWind_AedarPlayAnimTaunt"},	},
		Actions = {	MapFlagSetFalse	{Name = "mf_SQWind_AedarPlayAnimTaunt"},	},	};

	OnPlayHeroAnimEvent	{Tag = "pl_HumanAvatar",	Anim = "emote_beg",	EventName = "AedarDialogAnim",
		Conditions = {	MapFlagIsTrue	{Name = "mf_SQWind_AedarPlayAnimBeg"},	},
		Actions = {	MapFlagSetFalse	{Name = "mf_SQWind_AedarPlayAnimBeg"},	},	};

	OnToggleEvent
	{
		EventName = "WindDialogEnable",
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQWind_WindDialogEnabled"},
			FigureIsAlive	{Tag = "pl_HumanHeroWind"},
		},
		OnActions = 
		{
			MapFlagSetFalse	{Name = "mf_SQWind_MapChangeDetected"},
			DialogTypeSetSideQuest	{Tag = "pl_HumanHeroWind"},
			DialogSetEnabled	{Tag = "pl_HumanHeroWind"},
		},
		OffConditions = 
		{
			OR
			{
				FigureIsDead	{Tag = "pl_HumanHeroWind"},
				MapFlagIsTrue	{Name = "mf_SQWind_MapChangeDetected"},
			},
		},
		OffActions = 
		{
			MapFlagSetFalse	{Name = "mf_SQWind_MapChangeDetected"},
			DialogSetDisabled	{Tag = "pl_HumanHeroWind"},
			DialogSetDisabled	{Tag = "pl_HumanHeroWind_DEAD"},
		},
	};

	OnEvent
	{
		EventName = "dsada",
		Conditions = 
		{
			QuestIsActive	{Quest = "HeroWindAedarsChest"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			unpack(tSpawnImmerFrost)
		},
		GotoState = "Document",
	};
};

State
{
	StateName = "Document",

	OnEvent
	{
		EventName = "Ende",
		Conditions = 
		{
			AvatarHasItemMisc	{ItemId = 319, Amount = 1},
			FigureIsAlive	{Tag = "pl_HumanHeroWind"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "SQWind3", Tag = "pl_HumanHeroWind"},
			FigureOutcry	{TextTag = "SQWind4", Tag = "pl_HumanHeroWind"},
			FigureOutcry	{TextTag = "SQWind5", Tag = "pl_HumanHeroWind"},
			FigureOutcry	{TextTag = "SQWind6", Tag = "pl_HumanHeroWind"},

			QuestSetSolved	{Quest = "HeroWindAedarsChest"},
			QuestSetActive	{Quest = "HeroWindDocument"},
		},
		GotoState = "END",
	};
};

State{StateName = "END"};
