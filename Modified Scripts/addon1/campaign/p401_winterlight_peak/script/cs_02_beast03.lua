State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_CS_Beasts_Spawn"},
		},
		DelayedActions =
		{
			FigureLookAtDirection {Tag = "default", Direction = 225},
		},
	},	
}