
--*******************************************************
--***                                                 ***
--***         			LeadStatist	        	      ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	
	OnFigureRespawnEvent	
	{
		WaitTime = 5,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			GateIsClosed	{Tag = "DoorCitadel1"},
			GateIsClosed	{Tag = "DoorCitadel2"},
		},
		Actions = 
		{
			MapValueAdd	{Name = "mv_PactCollection", Value = 1},
			EntityFlagSetFalse	{Name = "ef_EinmalSchalter"},
		},
		DeathActions = 
		{
			MapValueDecrease	{Name = "mv_PactCollection"},
		}, 
		DelayedActions = 
		{
		}, 
		NoSpawnEffect = false, 
		IsSpawnOnlyWhen = false,
	},
	
	OnEvent
	{
    	
		Conditions =
		{
			MapValueIsGreaterOrEqual	{Name = "mv_PactCollection", Value = 7},
			EntityFlagIsFalse	{Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureForcedRunToEntity	{TargetTag = "GateMonster"},
			EntityFlagSetTrue	{Name = "ef_EinmalSchalter"},
		},
		
	},
	

	
};

