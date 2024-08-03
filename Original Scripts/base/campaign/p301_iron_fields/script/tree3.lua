State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_B_03_Baumwaechter_Spawn"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
		},
	};
	OnFigureRespawnEvent
	{
		X = 650.6, 
		Y = 488.4,
		WaitTime = 1,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_AddTree"},
			EntityFlagIsFalse {Name = "ef_P301_Spawned"}
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P301_Spawned"}
		}
	},
};