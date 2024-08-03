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
			MapFlagIsTrue {Name = "mf_CS_B_03_Grimrot_Spawn"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
		},
	};
};