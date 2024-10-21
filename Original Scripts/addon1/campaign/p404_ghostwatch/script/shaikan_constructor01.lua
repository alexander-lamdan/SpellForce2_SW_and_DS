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
			MapFlagIsTrue {Name = "mf_CS_03_Worker_Spawn"},
		},
		DelayedActions =
		{
			FigureSimpleWalk {Tag = "default", X = GetEntityX()+CS_03_Worker_GotoX, Y = GetEntityY()+CS_03_Worker_GotoY},
		},
	},
};