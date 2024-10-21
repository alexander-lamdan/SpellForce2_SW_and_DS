
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
			MapFlagSetFalse{Name = "mf_PuzzleSwap06On"}, -- ist zu Beginn aus
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
			XOR
			{
				MapFlagIsTrue{Name = "mf_PuzzleSwap01On"},
				MapFlagIsTrue{Name = "mf_PuzzleSwap02On"},
			},
		},
		OnActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1557, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetTrue{Name = "mf_PuzzleSwap06On"},
		},
		OffConditions = 
		{
			XAND
			{
				MapFlagIsTrue{Name = "mf_PuzzleSwap01On"},
				MapFlagIsTrue{Name = "mf_PuzzleSwap02On"},
			},
		},
		OffActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1490, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetFalse{Name = "mf_PuzzleSwap06On"},
		},
	};


    

}
