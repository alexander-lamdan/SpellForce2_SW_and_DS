--*******************************************************
--***                                                 ***
--***             GreifenSammelscriptTeam01           ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "AimGreifenTeam01"},
			MapFlagSetTrue {Name = "mf_StartOutcryFlyingSupport"},
		},
		
	},
	
	OnFigureRespawnEvent	
	{
		WaitTime = 60,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			BuildingIsAlive	{Tag = "HaupthausOrc1"},
			BuildingIsAlive	{Tag = "HaupthausOrc1_1"},
		},
		Actions = 
		{
			FigureWalkToEntity	{TargetTag = "AimGreifenTeam01"},
		},
		DeathActions = 
		{
			
		}, 
		DelayedActions = 
		{
		}, 
		NoSpawnEffect = false, 
		IsSpawnOnlyWhen = false,
	},
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			BuildingIsDead	{Tag = "HaupthausOrc1"},
			BuildingIsDead	{Tag = "HaupthausOrc1_1"},
		},
		Actions =
		{
			FigureVanish	{Tag = "Greif03"},
			FigureVanish	{Tag = "Greif04"},
			FigureVanish	{Tag = "Greif07"},
			FigureVanish	{Tag = "Greif08"},
		},
		
	},
	
};

