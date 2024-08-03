State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_08_pl_HumanHeroMordecay_KneelDown"},
		},
		Actions =
		{
 			FigureSimpleWalk {Tag = "pl_HumanHeroMordecay", X = 188.218, Y = 312.668, },
			EntityTimerStart {Name = "et_Start"},
		},
	},
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim1",
		Tag = "pl_HumanHeroMordecay",
		Anim = "emote_kneel_down",
		Looped = false,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_Start", Seconds = 1},
			FigureIsIdle {Tag = "pl_HumanHeroMordecay"},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_timer001"},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 232},			
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim2",
		Tag = "pl_HumanHeroMordecay",
		Anim = "emote_kneel_hold",
		Looped = false,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_timer001", Seconds = 2.1},
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
		Tag = "pl_HumanHeroMordecay",
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
};