--Soldat02
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
       	 			"427.833, 617.864", 
        			"418.556, 601.833", 
        			"400.127, 609.061", 
        			"388.61, 606.404",
        			"386.552, 577.046",
        			
        			
        			
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
			FigureForcedRun	{Tag = "default", X = 440, Y = 582},
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