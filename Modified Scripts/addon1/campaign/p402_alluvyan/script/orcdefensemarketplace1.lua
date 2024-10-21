
--*******************************************************
--***                                                 ***
--***             OrcDefenseMarketplace1  		      ***
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
			FigureHoldPosition	{},
		},
		
	},
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P402_EndcutszeneCS"},
		},
		Actions =
		{
			FigureVanish	{},
		},
		
	},
};

