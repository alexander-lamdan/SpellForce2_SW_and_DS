local CUpdateInterval = SetUpdateInterval {Steps = math.random(7, 9)}

 --Wenn einer der Dämonentürme zerstört wurde

State
{
	StateName = "TowerSpawn01",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			CUpdateInterval,
			MapFlagIsTrue {Name = "mf_DemonTower01destoyed"},
			MapFlagIsTrue	{Name = "mf_UramGorPart2"},
			
		},
		Actions = 
		{
			FigureRun	{X = 378, Y = 108}, 
		},
	}, 

};
