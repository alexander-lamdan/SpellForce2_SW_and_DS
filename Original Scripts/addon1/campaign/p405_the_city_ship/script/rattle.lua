
State
{
	StateName = "INIT",

	OnToggleEvent
	{
		OnConditions = 
		{
			MapFlagIsTrue{Name = "mf_AvatarDoesRattling"},
		},
		OnActions = 
		{
			FigureOutcryImmediate{TextTag = "Rattle01", Tag = "pl_HumanAvatar"},
			FigureOutcryImmediate{TextTag = "Rattle02", Tag = "MoanSpook"},
			EntityTimerStart{Name = "et_InBetweenTwoRattleSessions"},
		},
		OffConditions = 
		{
			EntityTimerIsElapsed{Name = "et_InBetweenTwoRattleSessions", Seconds = 30},
		},
		OffActions = 
		{
			MapFlagSetFalse{Name = "mf_AvatarDoesRattling"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			-- Beim 50sten Mal Rasseln
			MapValueIsGreater{Name = "mv_RattlingCounter", Value = 49},
		},
		Actions =
		{
			-- wird die Rassel zerstört
			FigureOutcryImmediate{TextTag = "RattleCrumble01", Tag = "pl_HumanAvatar"},
			FigureOutcryImmediate{TextTag = "RattleCrumble02", Tag = "pl_HumanHeroCaine"},
			AvatarItemMiscTake	{Player = "pl_Human", ItemId = 327, Amount = 1},
		},
	},


	
}