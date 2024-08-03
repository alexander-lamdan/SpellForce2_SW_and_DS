
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
			MapFlagSetFalse{Name = "mf_PuzzleSwap08On"}, -- ist zu Beginn aus
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
			XAND
			{
				MapFlagIsTrue{Name = "mf_PuzzleSwap06On"},
				MapFlagIsTrue{Name = "mf_PuzzleSwap07On"},
			},
		},
		OnActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1557, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetTrue{Name = "mf_PuzzleSwap08On"},
		},
		OffConditions = 
		{
			XOR
			{
				MapFlagIsTrue{Name = "mf_PuzzleSwap06On"},
				MapFlagIsTrue{Name = "mf_PuzzleSwap07On"},
			},
		},
		OffActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1490, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetFalse{Name = "mf_PuzzleSwap08On"},
		},
	};


    

}
