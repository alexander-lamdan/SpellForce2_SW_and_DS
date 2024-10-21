
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
		GotoState = "TurnOn"
	},
}


State
{
	StateName = "TurnOn",
	
	
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
			EntityIsNotExisting	{Tag = "PuzzleChest"},
		},
		Actions =
		{
			DialogSetDisabled{},
		},
	},


    

}
