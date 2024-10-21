State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 633.221,
		Y = 181.412,
		NoSpawnEffect = true,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Hydra_Spawn"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Hydra_Spawned"},
		},
		DelayedActions =
		{
			FigureLookAtDirection {Tag = "default", Direction = 85.95},
		},
	};
};