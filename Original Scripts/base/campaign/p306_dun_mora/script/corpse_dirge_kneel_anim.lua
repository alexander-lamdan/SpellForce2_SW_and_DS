State
{
	StateName = "INIT",
	
-----------------------------------------------------
--Avatar Kneel Anim ----
-----------------------------------------------------
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim1",
		Tag = "pl_HumanAvatar",
		Anim = "emote_kneel_down",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Burrial_Kneel_Down_Avatar"},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_AnimPlayA"},
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim2",
		Tag = "pl_HumanAvatar",
		Anim = "emote_kneel_hold",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_AnimPlayA", Seconds = 2.17},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_AnimPlayB"},
		},
	};
	OnPlayHeroAnimEvent
	{
		EventName = "Anim3",
		Tag = "pl_HumanAvatar",
		Anim = "emote_kneel_hold",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_AnimPlayB", Seconds = 3.25},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_AnimPlayB"}, --Loopt den Timer und somit die Anim
		},
	};
	

	
	OnOneTimeEvent
	{
		GotoState = "Off",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Burrial_Kneel_Up_Avatar"},
			--EntityTimerIsElapsed {Name = "et_AnimPlayB", Seconds = 3.25},
		},
		Actions = 
		{
			EntityTimerStop {Name = "et_AnimPlayA"},
			EntityTimerStop {Name = "et_AnimPlayB"},	
		},
		
	};

}

State
{
	StateName = "Off",
	
}