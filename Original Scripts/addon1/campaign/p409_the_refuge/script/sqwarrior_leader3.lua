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
			OR
			{
				MapFlagIsTrue	{Name = "mf_SQWarrior_SpawnLeader3Now"},
				MapFlagIsTrue	{Name = "mf_SQWarrior_SpawnAllLeadersNow"},
			},
		},
		Actions = 
		{
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
			MapFlagIsTrue	{Name = "mf_SQWarrior_SpawnLeader3Now"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_SQWarrior_SpawnLeader3Now"},
			DialogTypeSetSideQuest	{},
			DialogSetEnabled	{},
		},
	};

	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQWarrior_AvatarGivesBannerAway"},
		},
		Actions = 
		{
			FigureHoldPosition	{},
			FigureSwappingDisable	{},
			EffectStart	{File = "Effect_DeSpawn_Unit"},
			EntityTimerStart	{Name = "et_DespawnMe"},
		},
		GotoState = "Despawn",
	};
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQWarrior_SpawnAllLeadersNow"},
		},
		Actions = 
		{
		},
		GotoState = "END",
	};
};


State	
{
	StateName = "Despawn",

	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_DespawnMe", Seconds = 3.0},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1433, TargetTag = GetScriptTag(), Direction = 0, Tag = GetScriptTag() .. "_Reward"},
			--ObjectLootItemGenericAdd	{Tag = GetScriptTag() .. "_Reward", DropChance = 100, Level = 27, Skill = 0},
			ObjectLootItemEquipmentAdd	{Tag = GetScriptTag() .. "_Reward", DropChance = 100, ItemId = 1184},
			FigureVanish	{},
		},
		GotoState = "END",
	};
};

State	{StateName = "END"};

