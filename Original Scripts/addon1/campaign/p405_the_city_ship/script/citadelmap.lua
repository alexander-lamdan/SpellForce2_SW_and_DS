
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
	
	
	-- zu Beginn abschalten
	OnOneTimeEvent
	{
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
		-- sobald Urgi Bibliothekssobjekt erklärt hat
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_DiscoveredLibraryObject"},
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
    		MapFlagIsTrue{Name = "mf_CitadelCoordsGiven"},
    	},
    	Actions =
    	{
    		DialogSetDisabled{},
    	},
    },

}
