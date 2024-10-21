
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
	
	OnToggleEvent
	{
		OnConditions = 
		{
			MapFlagIsTrue{Name = "mf_PuzzleSwap12On"},
		},
		OnActions = 
		{
			DialogSetDisabled{},
		},
		OffConditions = 
		{
			MapFlagIsFalse{Name = "mf_PuzzleSwap12On"},
		},
		OffActions = 
		{
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
		},
	};


    

}
