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

