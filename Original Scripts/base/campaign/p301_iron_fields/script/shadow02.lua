State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		NoSpawnEffect = true,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_Shadow_Spawn"},
		},
		Actions =
		{
		},
		DelayedActions =
		{
		},
	},
}
	
