-------------------------------------------------------------------------------
--
--		
--
--		Outcries, wenn Greifen befreit wurden
--
--		
--
-------------------------------------------------------------------------------


State
{
	StateName = "Main",
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue { Name = "af_P307_GriffonsFree" },
		},
		Actions =
		{
			EntityTimerStart {Name = "et_Outcries"},		
		}
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Outcries", Seconds = 5},
		},
		Actions =
		{
			FigureOutcry{TextTag = "FreedDialog01", Tag = "Outcrier"},
			FigureOutcry{TextTag = "FreedDialog02", Tag = "Matricus"},
			FigureOutcry{TextTag = "FreedDialog03", Tag = "Matricus"},
			FigureOutcry{TextTag = "FreedDialog04", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "FreedDialog05", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "FreedDialog06", Tag = "Matricus"},
		}
	},
	
	OnOneTimeEvent
	{
		GotoState = "OutcriesDone",
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Outcries", Seconds = 20},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_MatricusGoHome"},
		}
	},
}

State
{
	StateName = "OutcriesDone",
	
}