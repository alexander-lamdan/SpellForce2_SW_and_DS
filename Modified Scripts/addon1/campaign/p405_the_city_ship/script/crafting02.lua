
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
		Conditions =
		{
		},
		Actions =
		{
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
    	},
    },
    

}
