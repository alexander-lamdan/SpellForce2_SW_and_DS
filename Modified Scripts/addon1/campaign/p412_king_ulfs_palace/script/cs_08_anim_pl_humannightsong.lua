State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_08_pl_HumanNightsong_KneelDown"},
		},
		Actions =
		{
 			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 184.553, Y = 314.981, },
			EntityTimerStart {Name = "et_Start"},
		},
	},
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim1",
		Tag = "pl_HumanNightsong",
		Anim = "emote_kneel_down",
		Looped = false,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_Start", Seconds = 1},
			FigureIsIdle {Tag = "pl_HumanNightsong"},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_timer001"},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 50},			
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim2",
		Tag = "pl_HumanNightsong",
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
		Tag = "pl_HumanNightsong",
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