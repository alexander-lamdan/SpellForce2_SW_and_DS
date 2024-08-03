
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
			MapFlagSetFalse{Name = "mf_PuzzleSwap11On"}, -- ist zu Beginn aus
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
			NotOR
			{
				MapFlagIsTrue{Name = "mf_PuzzleSwap04On"},
				MapFlagIsTrue{Name = "mf_PuzzleSwap05On"},
			},
		},
		OnActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1557, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetTrue{Name = "mf_PuzzleSwap11On"},
		},
		OffConditions = 
		{
			OR
			{
				MapFlagIsTrue{Name = "mf_PuzzleSwap04On"},
				MapFlagIsTrue{Name = "mf_PuzzleSwap05On"},
			},
		},
		OffActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1490, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetFalse{Name = "mf_PuzzleSwap11On"},
		},
	};


    

}
