State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_08_pl_HumanHeroYasha_KneelDown"},
		},
		Actions =
		{
 			FigureSimpleRun {Tag = "pl_HumanHeroYasha", X = 186.475, Y = 312.146, },
			EntityTimerStart {Name = "et_Start"},
		},
	},
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim1",
		Tag = "pl_HumanHeroYasha",
		Anim = "emote_kneel_down",
		Looped = false,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_Start", Seconds = 1},
			FigureIsIdle {Tag = "pl_HumanHeroYasha"},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_timer001"},
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 160},			
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim2",
		Tag = "pl_HumanHeroYasha",
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
		Tag = "pl_HumanHeroYasha",
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