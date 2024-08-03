

State
{
	StateName = "MainState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Cutscene02_Figure_Spawn"},
		},
		Actions = 
		{
		},
	},

   
   
				
   
};

