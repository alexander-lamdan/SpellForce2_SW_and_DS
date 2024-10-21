State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 446,
		Y = 219,
		Conditions =
		{
			MapFlagIsTrue {Name = myflag},
			PlayerBuildingIsInRange	{Player = "pl_DarkElves", BuildingId = 147, Range = 2, X = 451.225, Y = 229.441},
		},
		Actions =
		{
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigurePathGoto
			{
				
    			Goto = FigurePatrolWalkToEntity {Tag = myname, TargetTag = "WP1"}, 
    			Tags = 
    			{                    
    				"WP2", 
       	 			"WP3", 
        			"WP4", 
        			"WP5",
        			"WP6",
        			"WP7",
        		}
			},
		}
	}
}