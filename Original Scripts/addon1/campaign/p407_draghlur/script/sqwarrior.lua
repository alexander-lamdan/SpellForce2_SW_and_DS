if DEBUG then
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotKnown	{Quest = "WarriorEpicSacrifice"},
			DebugQuestionYes	{Question = "Warrior Epic Quest aktivieren?", Caption = "Warrior Epic"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "WarriorEpicSacrifice"},
			--QuestSetActive	{Quest = "WarriorEpicSacrificeYourself"},
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
			QuestIsActive	{Quest = "WarriorEpicSacrifice"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_SkeletonDialogEnabled"},
		},
		GotoState = "TalkToSkeleton",
	},
};
	
State
{
	StateName = "TalkToSkeleton",

	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_SkeletonDialogEnabled", Seconds = 2},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_SkeletonDialogEnabled"},
			DialogSetEnabled	{Tag = "SQWarrior_Skeleton"},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQWarrior_StartTrial"},
			FigureIsAlive	{Tag = "SQWarrior_Archon"},
			FigureIsAlive	{Tag = "SQWarrior_Sinistrim"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "SQWarrior11", Tag = "SQWarrior_Archon"},
			FigureOutcry	{TextTag = "SQWarrior12", Tag = "SQWarrior_Archon"},
			FigureOutcry	{TextTag = "SQWarrior13", Tag = "SQWarrior_Sinistrim"},
			FigureOutcry	{TextTag = "SQWarrior14", Tag = "SQWarrior_Sinistrim"},
		},
	},

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQWarrior_StartTrial"},
			FigureIsAlive	{Tag = "SQWarrior_Archon"},
			FigureIsAlive	{Tag = "SQWarrior_Sinistrim"},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_SQWarrior_StartTrial"},
			EntityTimerStart	{Name = "et_OutcryDelay"},
		},
		GotoState = "TalkToArchon",
	},
}

State
{
	StateName = "TalkToArchon",

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQWarrior_KillSinistrim"},
			AvatarIsNotTalking	{},
			--GameInterfaceIsVisible	{},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_SQWarrior_KillSinistrim"},
			FigureTeamTransfer	{Tag = "SQWarrior_Archon", Team = "tm_Archon"},
			FigureTeamTransfer	{Tag = "SQWarrior_Sinistrim", Team = "tm_Sinistrim"},
			FigureLevelSet	{Tag = "SQWarrior_Archon", Level = 30},
			FigureAbilityAdd	{Tag = "SQWarrior_Archon", AbilityId = Ability.Immortal},
			FigureAttackEntity	{Tag = "SQWarrior_Sinistrim", TargetTag = "SQWarrior_Archon"},
			--FigureAttackEntity	{Tag = "SQWarrior_Archon", TargetTag = "SQWarrior_Sinistrim"},
		},
		GotoState = "KillSinistrim",
	},
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQWarrior_KillAvatar"},
			AvatarIsNotTalking	{},
			--GameInterfaceIsVisible	{},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_SQWarrior_KillAvatar"},
			FigureHealthSet	{Tag = "pl_HumanAvatar", Percent = 100},
			FigureTeamTransfer	{Tag = "SQWarrior_Archon", Team = "tm_Team2"},
			FigureAbilityAdd	{Tag = "SQWarrior_Archon", AbilityId = Ability.Immortal},
			FigureLevelSet	{Tag = "SQWarrior_Archon", Level = 30},
			FigureAttackEntity	{Tag = "SQWarrior_Archon", TargetTag = "pl_HumanAvatar"},
		},
		GotoState = "KillAvatar",
	},
};


State
{
	StateName = "KillSinistrim",

	OnEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "SQWarrior_Sinistrim"},
		},
		Actions =
		{
			FigureLevelSet	{Tag = "SQWarrior_Archon", Level = 18},
			FigureTeamTransfer	{Tag = "SQWarrior_Archon", Team = "tm_Team2"},
			FigureAbilityRemove	{Tag = "SQWarrior_Archon", AbilityId = Ability.Immortal},
		},
		GotoState = "ArchonAggro",
	};
};
State
{
	StateName = "ArchonAggro",

	OnEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "SQWarrior_Archon"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_SkeletonDialogEnabled"},
			MapFlagSetTrue	{Name = "mf_SQWarrior_ArchonDied"},
		},
		GotoState = "TalkToSkeleton",
	},
};


State
{
	StateName = "KillAvatar",

	OnEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "SQWarrior_Archon", Team = "tm_Neutral"},
			FigureHateClear	{Tag = "SQWarrior_Archon"},
			
			EntityTimerStart	{Name = "et_VanishAfterOutcries"},

			FigureOutcry	{TextTag = "SQWarrior21", Tag = "SQWarrior_Sinistrim"},
			FigureOutcry	{TextTag = "SQWarrior22", Tag = "SQWarrior_Sinistrim"},
			FigureOutcry	{TextTag = "SQWarrior23", Tag = "SQWarrior_Archon"},
			FigureOutcry	{TextTag = "SQWarrior24", Tag = "SQWarrior_Archon"},
			FigureOutcry	{TextTag = "SQWarrior25", Tag = "SQWarrior_Archon"},

			QuestSetSolved	{Quest = "WarriorEpicFindRobe"},
			QuestSetSolved	{Quest = "WarriorEpicSacrificeYourself"},
			QuestSetSolved	{Quest = "WarriorEpicSacrifice"},
			QuestSetActive	{Quest = "WarriorEpicLoyalty"},
			--QuestSetActive	{Quest = "WarriorEpicLoyaltyFindBanner"},

			MapFlagSetTrue	{Name = "mf_SQWarrior_ScriptEnd"},
		},
		GotoState = "Vanishing",
	},
};


State
{
	StateName = "Vanishing",

	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_AvatarAliveAgain"},
		},
	};
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_AvatarAliveAgain", Seconds = 2},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "SQWarrior31", Tag = "pl_HumanAvatar"},
		},
	};

	OnOneTimeEvent
	{
		Conditions =
		{
			--EntityTimerIsElapsed	{Name = "et_VanishAfterOutcries", Seconds = 1},
		},
		Actions =
		{
			FigureWalkToEntity	{Tag = "SQWarrior_Sinistrim", TargetTag = "SQWarrior_Archon"},
			FigureDirectionSetToEntity	{Tag = "SQWarrior_Archon", TargetTag = "SQWarrior_Sinistrim"},
		},
	};

	OnOneTimeEvent
	{
		Conditions =
		{
			--EntityTimerIsElapsed	{Name = "et_VanishAfterOutcries", Seconds = 1.1},
			FigureIsInRangeToEntity	{Tag = "SQWarrior_Sinistrim", TargetTag = "SQWarrior_Archon", Range = 2.5},
		},
		Actions =
		{
			FigureStop	{Tag = "SQWarrior_Sinistrim"},
			FigureDirectionSetToEntity	{Tag = "SQWarrior_Sinistrim", TargetTag = "SQWarrior_Archon"},
			FigureDirectionSetToEntity	{Tag = "SQWarrior_Archon", TargetTag = "SQWarrior_Sinistrim"},
			ObjectLootItemEquipmentAdd	{Tag = "SQWarrior_Skeleton", DropChance = 100, ItemId = 1170},
		},
	};

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_VanishAfterOutcries", Seconds = 21},
		},
		Actions =
		{
			FigureWalkToEntity	{Tag = "SQWarrior_Archon", TargetTag = "SQWarrior_Location"},
			FigureWalkToEntity	{Tag = "SQWarrior_Sinistrim", TargetTag = "SQWarrior_Location"},
		},
	};

	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_VanishAfterOutcries", Seconds = 400},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_VanishAfterOutcries"},
			EntityTimerStart	{Name = "et_Despawn"},
			FigureHoldPosition	{Tag = "SQWarrior_Archon"},
			FigureHoldPosition	{Tag = "SQWarrior_Sinistrim"},
			EffectStart	{Tag = "SQWarrior_Archon", File = "Effect_DeSpawn_Unit"},
			EffectStart	{Tag = "SQWarrior_Sinistrim", File = "Effect_DeSpawn_Unit"},
		},
	};

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_Despawn", Seconds = 3.0},
		},
		Actions =
		{
			FigureVanish	{Tag = "SQWarrior_Archon"},
			FigureVanish	{Tag = "SQWarrior_Sinistrim"},
		},
	},

	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_Despawn", Seconds = 3.0},
			EntityTimerIsElapsed	{Name = "et_AvatarAliveAgain", Seconds = 2},
		},
		Actions =
		{
		},
		GotoState = "END",
	},
};

State	{StateName = "END"};
