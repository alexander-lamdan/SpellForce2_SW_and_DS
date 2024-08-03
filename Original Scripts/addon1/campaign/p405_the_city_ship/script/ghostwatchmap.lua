
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
		-- Dialog wird zusammen mit DraghLur-Map freigeschaltet
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS02Ended"},
			QuestIsActive {Quest = "CityShip2_FindCoordsDraghLur"},
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
    		MapFlagIsTrue{Name = "mf_GhostwatchCoordsGiven"},
    	},
    	Actions =
    	{
    		DialogSetDisabled{},
    	},
    },

}
