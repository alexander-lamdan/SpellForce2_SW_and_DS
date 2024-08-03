State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_06_TeamD_Spawn"},
		},
		Actions = 
		{
		},
	};
};                                                                        