-------------------------------------------------------------------------------
--
--		Outcry, wenn Spieler in den inneren Krater vordringt
--
-------------------------------------------------------------------------------

EntryX = 169
EntryY = 163
-- Die Koordinaten der Mitte des Eingangs zum inneren Krater


State
{
	StateName = "Main",
	
	OnOneTimeEvent
	{
		Conditions =
		{  
			AvatarFlagIsTrue{Name = "af_P313_Cutscene02Ended"},
			GameInterfaceIsVisible{},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_OutcryTimer"},
		},
		
	},
	
	
	
	OnOneTimeEvent
	{
			Conditions =
			{
				EntityTimerIsElapsed {Name = "et_OutcryTimer", Seconds = 5},
			},
			Actions =
			{
				FigureOutcry{TextTag = "NaugronFight01", Tag = "Naugron"},
			},
	},
	OnOneTimeEvent
	{
			Conditions =
			{
				EntityTimerIsElapsed {Name = "et_OutcryTimer", Seconds = 10},
			},
			Actions =
			{
				FigureOutcry{TextTag = "NaugronFight02", Tag = "Naugron"},
				AvatarFlagSetTrue{Name = "af_P313_NaugronAttacksNow"},
			},
	},
	
};

	
