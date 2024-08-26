State
{	
	StateName = "INIT",
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim1",
		Tag = "pl_HumanAvatar",
		Anim = "emote_kneel_down",
		Looped = false,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_03_pl_HumanAvatar_KneelDown"},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_timer001"},
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim2",
		Tag = "pl_HumanAvatar",
		Anim = "emote_kneel_hold",
		Looped = false,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_timer001", Seconds = 2.17},
		},
		Actions = 
		{
			EntityTimerStop {Name = "et_timer001"},
			EntityTimerStart {Name = "et_kneel_hold"},
		},
	};
	OnPlayHeroAnimEvent
	{
		EventName = "Anim3",
		Tag = "pl_HumanAvatar",
		Anim = "emote_kneel_hold",
		Looped = false,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_kneel_hold", Seconds = 3},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_kneel_hold"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "Anim4",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_03_pl_HumanAvatar_KneelStop"},
		},
		Actions = 
		{
			EntityTimerStop {Name = "et_kneel_hold"},
		},
		GotoState = "EndScript"
	};
};
	
State
{	
	StateName = "EndScript",
};