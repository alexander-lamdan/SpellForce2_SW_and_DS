State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_08_pl_HumanHeroWind_KneelDown"},
		},
		Actions =
		{
 			FigureSimpleWalk {Tag = "pl_HumanHeroWind", X = 184.652, Y = 312.787, },
			EntityTimerStart {Name = "et_Start"},
		},
	},
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim1",
		Tag = "pl_HumanHeroWind",
		Anim = "emote_kneel_down",
		Looped = false,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_Start", Seconds = 1},
			FigureIsIdle {Tag = "pl_HumanHeroWind"},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_timer001"},
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 123},			
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim2",
		Tag = "pl_HumanHeroWind",
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
		Tag = "pl_HumanHeroWind",
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