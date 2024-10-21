
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
			MapFlagSetFalse{Name = "mf_PuzzleSwap09On"}, -- ist zu Beginn aus
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
			OR
			{
				MapFlagIsTrue{Name = "mf_PuzzleSwap03On"},
				MapFlagIsTrue{Name = "mf_PuzzleSwap04On"},
			},
		},
		OnActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1557, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetTrue{Name = "mf_PuzzleSwap09On"},
		},
		OffConditions = 
		{
			NotOR
			{
				MapFlagIsTrue{Name = "mf_PuzzleSwap03On"},
				MapFlagIsTrue{Name = "mf_PuzzleSwap04On"},
			},
		},
		OffActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1490, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetFalse{Name = "mf_PuzzleSwap09On"},
		},
	};


    

}
