
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
		-- sobald Spieler die Quest hat, die Koordinaten der Westguard herauszufinden
		Conditions =
		{
			QuestIsActive {Quest = "CityShip4_FindCoordsWestguard"},
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
    		MapFlagIsTrue{Name = "mf_WestguardCoordsGiven"},
    	},
    	Actions =
    	{
    		DialogSetDisabled{},
    	},
    },

}
