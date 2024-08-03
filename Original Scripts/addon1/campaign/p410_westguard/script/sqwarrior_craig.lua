State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{},
		},
		GotoState = "Respawn",
	};
};

State
{
	StateName = "Respawn",

	OnFigureRespawnEvent
	{
		WaitTime = 0,
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQWarrior_SpawnCraigsGhost"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_SQWarrior_SpawnCraigsGhost"},
			DialogTypeSetSideQuest	{},
			DialogSetEnabled	{},
			FigureWalkToEntity	{TargetTag = "pl_HumanAvatar"},
			EntityTimerStart	{Name = "et_LookAtMeImBeautiful"},
			EntityTimerStart	{Name = "et_ComeCloserIWantToLookAtYou"},
		},
		DeathActions = 
		{
		},
		DelayedActions = 
		{
		},
	};

	OnEvent
	{
		Conditions = 
		{
			FigureIsNotInRangeToEntity	{TargetTag = "pl_HumanAvatar", Range = 6},
			OR
			{
				FigureIsIdle	{},
				EntityTimerIsElapsed	{Name = "et_ComeCloserIWantToLookAtYou", Seconds = 5},
			},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_ComeCloserIWantToLookAtYou"},
			FigureWalkToEntity	{TargetTag = "pl_HumanAvatar"},
		},
	};

	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_LookAtMeImBeautiful", Seconds = 0.2},
			FigureIsIdle	{},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_LookAtMeImBeautiful"},
			FigureDirectionSetToEntity	{TargetTag = "pl_HumanAvatar"},
		},
	};

	OnEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "WarriorEpicVeracity"},
			--AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureHoldPosition	{},
			FigureSwappingDisable	{},
		},
		GotoState = "TalkToNightsong",
	};

	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQWarrior_AvatarFailedTrial"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_SQWarrior_AvatarFailedTrial"},
			EntityTimerStart	{Name = "et_VanishMe"},
			EffectStart	{File = "Effect_DeSpawn_Unit"},
			FigureHoldPosition	{},
			FigureSwappingDisable	{},
		},
		GotoState = "Vanish",
	};
};


State
{
	StateName = "Vanish",
	
	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_VanishMe", Seconds = 3.0},
			QuestIsActive	{Quest = "WarriorEpicVeracity"},
		},
		Actions = 
		{
			FigureVanish	{},
		},
		GotoState = "Respawn",
	};
	
	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_VanishMe", Seconds = 3.0},
			QuestIsSolved	{Quest = "WarriorEpicVeracity"},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1918, TargetTag = GetScriptTag(), Direction = 0, Tag = "SQWarrior_CraigReward"},
			ObjectLootItemEquipmentAdd	{Tag = "SQWarrior_CraigReward", DropChance = 100, ItemId = 1174},
			ObjectLootItemEquipmentAdd	{Tag = "SQWarrior_CraigReward", DropChance = 100, ItemId = 1175},
			ObjectLootItemEquipmentAdd	{Tag = "SQWarrior_CraigReward", DropChance = 100, ItemId = 1177},
			ObjectLootItemEquipmentAdd	{Tag = "SQWarrior_CraigReward", DropChance = 100, ItemId = 1178},
			ObjectLootItemMiscAdd	{Tag = "SQWarrior_CraigReward", DropChance = 100, ItemId = 362},
			EffectStart	{Tag = "SQWarrior_CraigReward", File = "Effect_Spawn_Unit"},
			FigureVanish	{},
		},
		GotoState = "END",
	};
};


State
{
	StateName = "TalkToNightsong",

	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "pl_HumanNightsong"},
			EntityTimerIsNotElapsed	{Name = "et_NightsongOutcries", Seconds = 0.1},
		},
		Actions = 
		{
			FigureHeroSpawnToEntity	{Tag = "Nightsong", TargetTag = "SQWarrior_SpawnNightsong", Direction = 0},
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanNightsong"},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanNightsong", TargetTag = "SQWarrior_SpawnNightsong"},
			FigureDirectionSetToEntity	{Tag = "pl_HumanNightsong", TargetTag = "SQWarrior_Craig"},
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanNightsong"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureDirectionSetToEntity	{Tag = "SQWarrior_Craig", TargetTag = "pl_HumanNightsong"},
			FigureForcedWalkToEntity	{Tag = "pl_HumanNightsong", TargetTag = "SQWarrior_Craig"},
			EntityTimerStart	{Name = "et_NightsongOutcries"},
			FigureOutcry	{TextTag = "SQWarrior1", Tag = "pl_HumanNightsong"},
			FigureOutcry	{TextTag = "SQWarrior2", Tag = "SQWarrior_Craig"},
			FigureOutcry	{TextTag = "SQWarrior3", Tag = "SQWarrior_Craig"},
			FigureOutcry	{TextTag = "SQWarrior4", Tag = "SQWarrior_Craig"},
			FigureOutcry	{TextTag = "SQWarrior5", Tag = "SQWarrior_Craig"},
			FigureOutcry	{TextTag = "SQWarrior6", Tag = "SQWarrior_Craig"},
			FigureOutcry	{TextTag = "SQWarrior7", Tag = "SQWarrior_Craig"},
			FigureOutcry	{TextTag = "SQWarrior8", Tag = "pl_HumanNightsong"},
			FigureOutcry	{TextTag = "SQWarrior9", Tag = "SQWarrior_Craig"},
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "SQWarrior_Craig", Range = 2},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureStop	{Tag = "pl_HumanNightsong"},
			FigureDirectionSetToEntity	{Tag = "pl_HumanNightsong", TargetTag = "SQWarrior_Craig"},
			FigureDirectionSetToEntity	{Tag = "SQWarrior_Craig", TargetTag = "pl_HumanNightsong"},
		},
	};
	
	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_NightsongOutcries", Seconds = 53},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_VanishMe"},
			EffectStart	{File = "Effect_DeSpawn_Unit"},
			FigureHoldPosition	{},
			FigureSwappingDisable	{},
		},
		GotoState = "Vanish",
	};
};

State	{StateName = "END"};

