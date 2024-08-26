local iGhostFatherLevel = 26

if DEBUG then
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotKnown	{Quest = "HeroWisper"},
			DebugQuestionYes	{Question = "Hero Sidequest von Whisper aktivieren?", Caption = "HeroQuest von Whisper"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "HeroWisper"},
			QuestSetActive	{Quest = "HeroWisperGraveSearch"},
		},
	};
end

State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "HeroWisperGraveSearch"},
		},
		Actions =
		{
		},
		GotoState = "Grave",
	},
};
	
State
{
	StateName = "Grave",

	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "SQWisper_Grave"},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "HeroWisperGhostFather"},
			FigureIsDead	{Tag = "pl_HumanHeroWhisper"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			NoSpawnEffect{Spawn = FigureHeroSpawnToEntity	{Tag = "HeroWhisper", TargetTag = "pl_HumanAvatar", Direction = 0}},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "HeroWisperGhostFather"},
			FigureIsAlive	{Tag = "pl_HumanHeroWhisper"},
		},
		Actions =
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "pl_HumanAvatar"},
			FigureDirectionSetToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "SQWisper_Grave"},
		},
	},

	OnEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "HeroWisperGhostFather"},
			FigureIsAlive	{Tag = "pl_HumanHeroWhisper"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			FigureDirectionSetToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "SQWisper_Grave"},
			FigureOutcry	{TextTag = "SQWisper1", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper2", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper3", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper4", Tag = "pl_HumanHeroWhisper"},
			
			EntityTimerStart	{Name = "et_SpawnGhostFather"},
		},
		GotoState = "GhostFather",
	},
}

State
{
	StateName = "GhostFather",

	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_SpawnGhostFather", Seconds = 18},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "SQWisper_Daddy", Level = iGhostFatherLevel, UnitId = 1176, TargetTag = "SQWisper_Grave", Team = "tm_Team2"},
			FigureLootItemEquipmentAdd	{Tag = "SQWisper_Daddy", DropChance = 100, ItemId = 1157},
			FigureLootItemEquipmentAdd	{Tag = "SQWisper_Daddy", DropChance = 100, ItemId = 1158},
			EntityTimerStart	{Name = "et_WipeRtsUnits"},
			PlayerRtsUnitKillInRangeToEntity	{Player = "pl_Human", Tag = "SQWisper_Daddy", Range = 30},
		},
		GotoState = "GhostFatherDead",
	},
};

State
{
	StateName = "GhostFatherDead",

	-- TODO: Bossfight scripten

	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_WipeRtsUnits", Seconds = 5},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_WipeRtsUnits"},
			PlayerRtsUnitKillInRangeToEntity	{Player = "pl_Human", Tag = "SQWisper_Daddy", Range = 30},
		},
	},

	OnEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "SQWisper_Daddy"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "SQWisper11", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper12", Tag = "pl_HumanHeroWind"},
			FigureOutcry	{TextTag = "SQWisper13", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper14", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "SQWisper15", Tag = "pl_HumanHeroWhisper"},
			
			QuestSetSolved	{Quest = "HeroWisperGhostFather"},
			QuestSetSolved	{Quest = "HeroWisper"},

			AvatarFlagSetTrue	{Name = "af_P400_GiveHeroAbilityToWhisper"},
			AvatarItemMiscTake	{ItemId = 316, Amount = 1},
		},
		GotoState = "END",
	},
};

State	{StateName = "END"};
