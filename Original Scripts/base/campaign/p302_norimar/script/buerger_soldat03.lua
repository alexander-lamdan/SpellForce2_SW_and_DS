--Soldat03
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
       	 			 
        			"396.162, 548.648", 
        			
        			
        			
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
			FigureForcedRun	{Tag = "default", X = 441, Y = 582},
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