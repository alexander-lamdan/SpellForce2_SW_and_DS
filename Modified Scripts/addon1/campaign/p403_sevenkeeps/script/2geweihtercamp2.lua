--*******************************************************
--***                                                 ***
--***             		Geweihter                     ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent	
	{
		X = GetEntityX(), Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SpawnGeweihteCamp02"},
		},
		Actions = 
		{
			FogOfWarRevealAtEntity	{Range = 10, Height = 130},
			--MinimapAlertSetToEntity	{Type = 3},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = false
		
	},
	
	 OnOneTimeEvent
	{
    	
		Conditions =
		{
			BuildingIsDead	{Tag = "Building1Camp2"},
			BuildingIsAlive	{Tag = "GargoyleHorst02"},
		},
		Actions =
		{
			FigureForcedRunToEntity	{TargetTag = "GargoyleHorst02"},
		},
    },
     --Geweihter vanished sobald die Cutszene beginnt.
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Shaper_Cutscene_Spawn"},	
		},
		Actions =
		{
			FigureVanish	{},
		},
		
	},
	
};

