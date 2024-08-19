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
			MapFlagIsTrue {Name = "mf_CS_02_RoamingDarves_Spawn"},
		},
		Actions =
		{
			FigureRoamingEnable	{Tag = "default"},
		},
	},
};