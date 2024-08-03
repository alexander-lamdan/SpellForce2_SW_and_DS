
State
{
	StateName = "MainState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_MalarSpawn"},
		},
		Actions = 
		{
		},
	},

   
   
				
   
};