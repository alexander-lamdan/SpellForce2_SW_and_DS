State
{	
	StateName = "Avatar_Anim",
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim1",
		Tag = "pl_HumanAvatar",
		Anim = "emote_kneel_down",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_04_Kneel_Down_Avatar"},
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
			EntityTimerIsElapsed {Name = "et_AnimPlayB", Seconds = 3.29},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_AnimPlayB"},
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim4",
		Tag = "pl_HumanAvatar",
		Anim = "emote_kneel_up",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_04_Kneel_Up_Avatar"},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_AnimPlayA"},
			EntityTimerStart {Name = "et_AnimPlayB"},	
		},
		GotoState = "EndScript"
	};
};
	
State
{	
	StateName = "EndScript",
};