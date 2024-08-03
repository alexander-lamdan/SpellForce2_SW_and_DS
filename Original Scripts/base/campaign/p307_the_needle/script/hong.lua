

State
{	
	StateName = "INIT",
	
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_SpawnHong"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_HongSpawned"},
		},
	},
	
	
}



