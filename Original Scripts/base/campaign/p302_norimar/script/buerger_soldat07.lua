--Soldat04
State
{
	StateName = "Init",
	OnOneTimeEvent
	{
		GotoState = "Go",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_BuergerGo"},
		},
		Actions = {},
	},
};


State
{
	StateName = "Go",
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigurePatrolWalk{Tag = "default", X = GetEntityX()+1, Y = GetEntityY()+1}, 
    			Points = 
    			{
       	 			"450.293, 557.003", 
        			"432.63, 621.157",
        			"422.619, 586.277", 
        			"465.885, 580.262",
        			
        			
        			
    			}
			}
		}
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_AlarmedSoldiers"},
		},
		Actions =
		{
			FigureForcedRun	{Tag = "default", X = 440, Y = 583},
		}
	},
	
	
	OnOneTimeEvent
	{
		GotoState = "Off",
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_BuergerGo"},
		},
		Actions =
		{},
	},
	
}


State
{
	StateName = "Off",
	OnOneTimeEvent
	{
		GotoState = "Go",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_BuergerGo"},
		},
		Actions =
		{
		},
	},
	
};