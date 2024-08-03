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
			MapFlagIsTrue {Name = "mf_CS_02_Actors_Spawn"},
		},
		DelayedActions =
		{
			FigureSimpleWalk {Tag = "default", X = GetEntityX(), Y = GetEntityY()+CS_02_Dwarf_GotoY},
		},
	},
};