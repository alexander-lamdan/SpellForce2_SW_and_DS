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
			MapFlagIsTrue {Name = "mf_CS_04_Orcs_Spawn"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
		}, 
		
	},
};