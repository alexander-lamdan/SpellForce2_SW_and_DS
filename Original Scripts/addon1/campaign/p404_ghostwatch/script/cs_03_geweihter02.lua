State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(), 
		Y = GetEntityY(),
		NoSpawnEffect = false,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_03_Geweihte_Spawn"},
		},
		DelayedActions =
		{
			--FigureSimpleWalk {Tag = "default", X = GetEntityX()-CS_03_Geweihte_GotoX, Y = GetEntityY()-CS_03_Geweihte_GotoY},
		},
	},
};