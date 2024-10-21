State
{
	StateName = "INIT",
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim1",
		Tag = "pl_HumanHeroCaine",
		Anim = "kneel_down",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_05_Caine_Kneel_Down_Anim_Play"},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_RepeatAnim"},
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim2",
		Tag = "pl_HumanHeroCaine",
		Anim = "kneel_hold",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_RepeatAnim", Seconds = 2.1},
		},
		Actions = 
		{
			EntityTimerStop {Name = "et_RepeatAnim1"},
			EntityTimerStart {Name = "et_RepeatAnim2"},
		},
	};
	OnPlayHeroAnimEvent
	{
		EventName = "Anim3",
		Tag = "pl_HumanHeroCaine",
		Anim = "kneel_hold",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_RepeatAnim2", Seconds = 2.1},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_RepeatAnim2"},
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim4",
		Tag = "pl_HumanHeroCaine",
		Anim = "kneel_up",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_05_Caine_Kneel_Up_Anim_Play"},
		},
		Actions = 
		{
			EntityTimerStop {Name = "et_RepeatAnim2"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS05Ended"},
		},
		Actions = 
		{
		},
		GotoState = "End",
	};
};

State
{
	StateName = "End",
};