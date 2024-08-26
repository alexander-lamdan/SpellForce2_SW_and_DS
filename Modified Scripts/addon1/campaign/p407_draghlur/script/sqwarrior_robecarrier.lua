State
{
	StateName = "Respawn",

	OnFigureRespawnEvent
	{
		WaitTime = 3,
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_SQWarrior_ScriptEnd"},
			EntityIsNotExisting	{Tag = "SQWarrior_SkeletonLoot"},
			EntityTimerIsElapsed	{Name = "et_PickUpRobeTimer", Seconds = 10},
			AvatarHasNotItemEquipment	{ItemId = 927, Amount = 1, SearchEquipment = true, SearchHeroEquipment = true},
			FigureIsDead	{Tag = "SQWarrior_SkeletonFight1"},
			FigureIsDead	{Tag = "SQWarrior_SkeletonFight2"},
			FigureIsDead	{Tag = "SQWarrior_SkeletonFight3"},
			FigureIsDead	{Tag = "SQWarrior_SkeletonFight4"},
			FigureIsDead	{Tag = "SQWarrior_SkeletonFight5"},
			FigureIsDead	{Tag = "SQWarrior_SkeletonFight6"},
		},
		Actions = 
		{
			EntityFlagSetFalse	{Name = "ef_HasNotItem"},
			EntityTimerStop	{Name = "et_PickUpRobeTimer"},
			FigureRoamingEnable	{Tag = "default"},
		},
		DeathActions = 
		{
			FigureNpcSpawnLRTAToEntity	{Tag = "SQWarrior_SkeletonFight1", Level = -5, UnitId = 373, TargetTag = GetScriptTag() .. "_DEAD", Team = "tm_Team2"},
			FigureNpcSpawnLRTAToEntity	{Tag = "SQWarrior_SkeletonFight2", Level = -5, UnitId = 373, TargetTag = GetScriptTag() .. "_DEAD", Team = "tm_Team2"},
			FigureNpcSpawnLRTAToEntity	{Tag = "SQWarrior_SkeletonFight3", Level = -5, UnitId = 373, TargetTag = GetScriptTag() .. "_DEAD", Team = "tm_Team2"},
			FigureNpcSpawnLRTAToEntity	{Tag = "SQWarrior_SkeletonFight4", Level = -5, UnitId = 373, TargetTag = GetScriptTag() .. "_DEAD", Team = "tm_Team2"},
			FigureNpcSpawnLRTAToEntity	{Tag = "SQWarrior_SkeletonFight5", Level = -5, UnitId = 373, TargetTag = GetScriptTag() .. "_DEAD", Team = "tm_Team2"},
			FigureNpcSpawnLRTAToEntity	{Tag = "SQWarrior_SkeletonFight6", Level = -5, UnitId = 373, TargetTag = GetScriptTag() .. "_DEAD", Team = "tm_Team2"},

			ObjectSpawnToEntity	{ObjectId = 2484, TargetTag = GetScriptTag() .. "_DEAD", Direction = 200, Tag = "SQWarrior_SkeletonLoot"},
			ObjectLootItemEquipmentAdd	{Tag = "SQWarrior_SkeletonLoot", DropChance = 100, ItemId = 927},
			--ObjectLootItemEquipmentAdd	{Tag = "SQWarrior_SkeletonLoot", DropChance = 100, ItemId = 928},
			
			EntityFlagSetTrue	{Name = "ef_RespawnAttack"},
			EntityTimerStart	{Name = "et_RespawnAttack"},
		},
		DelayedActions = 
		{
		},
	};

	OnEvent
	{
		Conditions =
		{
			OR
			{
				EntityFlagIsTrue	{Name = "ef_RespawnAttack"},
				EntityTimerIsElapsed	{Name = "et_RespawnAttack", Seconds = 3},
			},
			OR
			{
				FigureIsInRangeToEntity	{Tag = "SQWarrior_SkeletonFight1", TargetTag = "pl_HumanAvatar", Range = 40},
				FigureIsInRangeToEntity	{Tag = "SQWarrior_SkeletonFight2", TargetTag = "pl_HumanAvatar", Range = 40},
				FigureIsInRangeToEntity	{Tag = "SQWarrior_SkeletonFight3", TargetTag = "pl_HumanAvatar", Range = 40},
				FigureIsInRangeToEntity	{Tag = "SQWarrior_SkeletonFight4", TargetTag = "pl_HumanAvatar", Range = 40},
				FigureIsInRangeToEntity	{Tag = "SQWarrior_SkeletonFight5", TargetTag = "pl_HumanAvatar", Range = 40},
				FigureIsInRangeToEntity	{Tag = "SQWarrior_SkeletonFight6", TargetTag = "pl_HumanAvatar", Range = 40},
			},
		},
		Actions =
		{
			EntityFlagSetFalse	{Name = "ef_RespawnAttack"},
			EntityTimerStart	{Name = "et_RespawnAttack"},

			FigureAttackEntity	{Tag = "SQWarrior_SkeletonFight1", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "SQWarrior_SkeletonFight2", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "SQWarrior_SkeletonFight3", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "SQWarrior_SkeletonFight4", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "SQWarrior_SkeletonFight5", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "SQWarrior_SkeletonFight6", TargetTag = "pl_HumanAvatar"},
		},
	};

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQWarrior_ScriptEnd"},
		},
		Actions =
		{
			FigureVanish	{},
		},
		GotoState = "END",
	};


	-- HACKs: wenn man das item an die Maus nimmt, gilt es nicht mehr als existent ... in dem Fall die Figur wieder vanishen,
	-- sobald der Spieler das item wieder ins Inventar zurücklegt ...
	OnDeadEvent
	{
		Conditions =
		{
			EntityFlagIsFalse	{Name = "ef_HasNotItem"},
			AvatarHasNotItemEquipment	{ItemId = 927, Amount = 1, SearchEquipment = true, SearchHeroEquipment = true},
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = "ef_HasNotItem"},
			EntityTimerStart	{Name = "et_PickUpRobeTimer"},
		},
	};
	OnDeadEvent
	{
		Conditions =
		{
			EntityFlagIsTrue	{Name = "ef_HasNotItem"},
			AvatarHasItemEquipment	{ItemId = 927, Amount = 1, SearchEquipment = true, SearchHeroEquipment = true},
		},
		Actions =
		{
			EntityFlagSetFalse	{Name = "ef_HasNotItem"},
			EntityTimerStop	{Name = "et_PickUpRobeTimer"},
		},
	};
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemEquipment	{ItemId = 927, Amount = 1, SearchEquipment = true, SearchHeroEquipment = true},
		},
		Actions =
		{
			FigureVanish	{},
		},
	};
}

State	{StateName = "END"};
