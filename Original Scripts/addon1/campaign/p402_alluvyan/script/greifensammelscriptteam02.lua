--*******************************************************
--***                                                 ***
--***             GreifenSammelscriptTeam02           ***
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
			FigureWalkToEntity	{TargetTag = "AimGreifenTeam02"},
		},
		
	},
	
	OnFigureRespawnEvent	
	{
		WaitTime = 60,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			BuildingIsAlive	{Tag = "HaupthausOrc2"},
			BuildingIsAlive	{Tag = "HaupthausOrc2_1"},
		},
		Actions = 
		{
			FigureWalkToEntity	{TargetTag = "AimGreifenTeam02"},
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
			BuildingIsDead	{Tag = "HaupthausOrc2"},
			BuildingIsDead	{Tag = "HaupthausOrc2_1"},
		},
		Actions =
		{
			FigureVanish	{Tag = "Greif01"},
			FigureVanish	{Tag = "Greif02"},
			FigureVanish	{Tag = "Greif05"},
			FigureVanish	{Tag = "Greif06"},
		},
		
	},
	
};

