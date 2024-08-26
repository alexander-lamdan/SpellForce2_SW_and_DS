
 	
State
{	
	StateName = "INIT",
		
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			BuildingIsDead{Tag = "UndeadBuild01"},
			BuildingIsDead{Tag = "UndeadBuild02"},
			BuildingIsDead{Tag = "UndeadBuild03"},
			BuildingIsDead{Tag = "UndeadBuild04"},
			BuildingIsDead{Tag = "UndeadBuild05"},
			BuildingIsDead{Tag = "UndeadBuild06"},
			BuildingIsDead{Tag = "UndeadBuild07"},
			BuildingIsDead{Tag = "UndeadBuild08"},
			BuildingIsDead{Tag = "UndeadBuild09"},
			BuildingIsDead{Tag = "UndeadBuild10"},
			BuildingIsDead{Tag = "UndeadBuild11"},
			BuildingIsDead{Tag = "UndeadBuild12"},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_ObergeistSpawned"},
		},
		NoSpawnEffect = false,
	};
	
	
}