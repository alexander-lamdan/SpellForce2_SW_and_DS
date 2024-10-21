State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQPriest_SpawnGalius"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_SQPriest_SpawnGalius"},
			DialogTypeSetSideQuest	{},
			DialogSetEnabled	{},
		},
		DelayedActions = 
		{
		},
	};

	OnEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "PriestEpicLifeTalkToGaliusAgain"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_DespawnMe"},
			EffectStart	{File = "Effect_DeSpawn_Unit"},
			FigureHoldPosition	{},
			FigureSwappingDisable	{},
		},
		GotoState = "Despawn",
	};
};

State
{
	StateName = "Despawn",
	
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_DespawnMe", Seconds = 2.8},
		},
		Actions =
		{
			ObjectSpawnToEntity	{ObjectId = 1433, TargetTag = GetScriptTag(), Direction = 0, Tag = "SQPriest_GaliusReward"},
			ObjectLootItemEquipmentAdd	{Tag = "SQPriest_GaliusReward", DropChance = 100, ItemId = 1190},
			FigureVanish	{},
		},
		GotoState = "END",
	};
};

State	{StateName = "END"};
