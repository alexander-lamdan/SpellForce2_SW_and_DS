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
				
    			Goto = FigurePatrolWalkToEntity {Tag = "PatrolMalar1", TargetTag = "WPFirstBlock1"}, 
    			Tags = 
    			{                    
    				"WPFirstBlock2", 
       	 			"WPFirstBlock3", 
        			"WPFirstBlock4", 
        			"WPFirstBlock5",
        			"WPFirstBlock6",
        			"WPFirstBlock7",
        			"WPFirstBlock8",
    			}
			},
		}
	},
}