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
			MapFlagIsTrue {Name = "mf_CS_03_Actors_Spawn"},
		},
		Actions = 
		{
		},
	};
}
