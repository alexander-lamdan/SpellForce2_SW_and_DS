
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
	
	-- zu Beginn disablen
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
		-- sobald man die Quest hat, die Koordinaten zu holen & die Cutscene gelaufen ist
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
    		MapFlagIsTrue{Name = "mf_DraghLurCoordsGiven"},
    	},
    	Actions =
    	{
    		DialogSetDisabled{},
    	},
    },

}
