
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
			MapFlagSetFalse{Name = "mf_PuzzleSwap10On"}, -- ist zu Beginn aus
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
			AND
			{
				MapFlagIsTrue{Name = "mf_PuzzleSwap08On"},
				MapFlagIsTrue{Name = "mf_PuzzleSwap09On"},
			},
		},
		OnActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1557, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetTrue{Name = "mf_PuzzleSwap10On"},
		},
		OffConditions = 
		{
			NotAND
			{
				MapFlagIsTrue{Name = "mf_PuzzleSwap08On"},
				MapFlagIsTrue{Name = "mf_PuzzleSwap09On"},
			},
		},
		OffActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1490, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetFalse{Name = "mf_PuzzleSwap10On"},
		},
	};


    

}
