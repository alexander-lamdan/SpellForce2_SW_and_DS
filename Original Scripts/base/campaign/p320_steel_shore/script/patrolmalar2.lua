State
{
	StateName = "Init",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigurePathGoto
			{
				
    			Goto = FigurePatrolWalkToEntity {Tag = "PatrolMalar2", TargetTag = "WPFirstBlock6"}, 
    			Tags = 
    			{
       	 			"WPFirstBlock7", 
        			"WPFirstBlock1", 
        			"WPFirstBlock2",
        			"WPFirstBlock3",
        			"WPFirstBlock4",
        			"WPFirstBlock5",
    			},
    		},
		}
	},
	
}