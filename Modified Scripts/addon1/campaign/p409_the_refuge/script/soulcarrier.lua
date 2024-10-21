
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
		},
		GotoState = "MainState"
	},
}

State
{
	StateName = "MainState",
	
	
	OnOneTimeEvent
	{
		-- zu Beginn abschalten
		Conditions =
		{
		},
		Actions =
		{
			DialogSetDisabled{},
		},
	},
	
	OnOneTimeEvent
	{
		-- Dialog wird freigeschaltet
		-- sobald der Spieler den Drachen entdeckt hat
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_DiscoveredSoulCarrier"},
		},
		Actions =
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
    	},
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_TalkedWithSoulCarrier"},
    	},
    	Actions =
    	{
    		DialogSetDisabled{},
    	},
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_CS03Ended"},
    	},
    	Actions =
    	{
    		FigureVanish{Tag = "default"},
    	},
    },

}
