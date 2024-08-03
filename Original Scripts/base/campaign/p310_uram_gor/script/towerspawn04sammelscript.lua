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
			MapFlagIsTrue {Name = "mf_DemonTower04destoyed"},
			MapFlagIsTrue	{Name = "mf_UramGorPart2"},
		},
		Actions = 
		{
			 FigureRun	{X = 541, Y = 252}, 
		},
	}, 

};
