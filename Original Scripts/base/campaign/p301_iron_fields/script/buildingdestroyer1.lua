State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Mission"},
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
    			Goto = FigurePatrolWalk{Tag = "BuildingDestroyer1", X = 509, Y = 396}, 
    			Points = 
    			{
       	 			"509, 436", 
        			"539, 450", 
        			"546, 401", 
        			"558, 393",
        			"572, 408",
        			"564, 445",
        			"567, 483", 
    			}
			}
		}
	},
}