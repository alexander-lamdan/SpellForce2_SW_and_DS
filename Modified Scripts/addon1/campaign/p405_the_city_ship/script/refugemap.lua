
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
		-- sobald Spieler die Quest hat
		Conditions =
		{
			QuestIsActive {Quest = "CityShip3_FindCoordsRefuge"},
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
    		MapFlagIsTrue{Name = "mf_RefugeCoordsGiven"},
    	},
    	Actions =
    	{
    		DialogSetDisabled{},
    	},
    },

}
