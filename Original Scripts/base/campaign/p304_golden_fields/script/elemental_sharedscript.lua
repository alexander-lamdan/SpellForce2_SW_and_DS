
  

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_FirstReturnToGoldenFields"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_Spawned"},
			-- Elementare spawnen nach der 1. Rückkehr nach GF (also GF Teil 2)
			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "MainScript"
	},
}

State
{
	StateName = "MainScript",
   
  

  
};
