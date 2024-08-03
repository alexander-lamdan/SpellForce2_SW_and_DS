local iDrakelingLevel = 7

State
{
	StateName = "WaitForSpawn1",

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQDragon_SpawnDrakeling"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_SQDragon_SpawnDrakeling"},
			FigureNpcSpawnToEntity	{Tag = "SQDragon_Drakeling1", Level = iDrakelingLevel, UnitId = 1272, TargetTag = "SQDragon_Crystal1", Team = "tm_Team1"},
			--FigurePlayerTransfer	{Tag = "SQDragon_Drakeling1"},
			EntityFlagSetTrue	{Name = "ef_Drakeling1_Spawned"},
			MapFlagSetTrue	{Name = "mf_SQDragon_SpawnDrakeling1_Reward"},
			ObjectVanish	{Tag = "SQDragon_Crystal1"},
			MapFlagSetFalse	{Name = "mf_SQDragon_GhostwatchVanishDragons"},
		},
		GotoState = "WaitForSpawn2",
	};
};

State
{
	StateName = "WaitForSpawn2",

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQDragon_SpawnDrakeling"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_SQDragon_SpawnDrakeling"},
			FigureNpcSpawnToEntity	{Tag = "SQDragon_Drakeling2", Level = iDrakelingLevel, UnitId = 1273, TargetTag = "SQDragon_Crystal2", Team = "tm_Team1"},
			--FigurePlayerTransfer	{Tag = "SQDragon_Drakeling2"},
			EntityFlagSetTrue	{Name = "ef_Drakeling2_Spawned"},
			MapFlagSetTrue	{Name = "mf_SQDragon_SpawnDrakeling2_Reward"},
			ObjectVanish	{Tag = "SQDragon_Crystal2"},
		},
	};

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQDragon_GhostwatchVanishDragons"},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_SQDragon_GhostwatchVanishDragons"},
			FigureVanish	{Tag = "SQDragon_Drakeling1"},
			FigureVanish	{Tag = "SQDragon_Drakeling2"},
		},
	};

	OnEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "SQDragon_Drakeling1"},
			FigureIsDead {Tag = "SQDragon_Drakeling2"},
			EntityFlagIsTrue	{Name = "ef_Drakeling1_Spawned"},
			EntityFlagIsTrue	{Name = "ef_Drakeling2_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "END",
	};

	OnFollowEvent
	{
		Tag = "SQDragon_Drakeling1",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			FigureIsAlive {Tag = "SQDragon_Drakeling1"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
		},
	};
	OnFollowEvent
	{
		Tag = "SQDragon_Drakeling2",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			FigureIsAlive {Tag = "SQDragon_Drakeling2"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
		},
	};
};

State	{StateName = "END"};
