
	State
	{
		StateName = "INIT01",
	
		
		OnFigureRespawnEvent
		{
			WaitTime = 300,
			X = 570.08, Y = 558.891, 
			Conditions = 
			{
				MapFlagIsFalse {Name = "mf_BeastBuildKilled"},
				BuildingIsAlive	{Tag = "BonusBeastSpawnCamp"},
			},
			Actions = 
			{
			},
		};
		
		
		
		OnIdleRunHomeFake
		{
			X = GetEntityX(),
			Y = GetEntityY(),
			Range = 8,
			GotoForced = false,
			UpdateInterval = 10,
			Conditions = 
			{
			},
			Actions = 
			{
			},
			HomeActions = 
			{
			},
		};
}
