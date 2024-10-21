
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
		-- zu Beginn ist es angeschaltet
		Conditions =
		{
		},
		Actions =
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
    	},
    },
    
    OnOneTimeEvent
    {
    	-- sobald man die Info gelesen hat
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_SoulcarrierInfoGiven"},
    	},
    	Actions =
    	{
    		DialogSetDisabled{},
    	},
    },
    

}
