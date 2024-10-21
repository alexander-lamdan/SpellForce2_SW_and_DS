
State
{
	StateName = "UgnathStart",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_UgnathSpawn"},
		},
		Actions = 
		{
			MapFlagSetTrue  {Name = "mf_UgnathAlive"},
		},
	};

};
