State
{
	StateName = "INIT",
	--Spawnt, wenn Io in CS zurueck kommt
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_HumanWorkerSpawn"},
		},
		Actions = 
		{
		},
	},
};