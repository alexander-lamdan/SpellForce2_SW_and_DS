State
{
	StateName = "INIT",
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim1",
		Tag = "Riddengard",
		Anim = "kneel_hold",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_05_Riddengard_Kneel_Hold_Anim_Play"},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_RepeatAnim"},
		},
	};
	OnPlayHeroAnimEvent
	{
		EventName = "Anim2",
		Tag = "Riddengard",
		Anim = "kneel_hold",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_RepeatAnim", Seconds = 2.1},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_RepeatAnim"},
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim3",
		Tag = "Riddengard",
		Anim = "kneel_up",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_05_Riddengard_Kneel_Up_Anim_Play"},
		},
		Actions = 
		{
			EntityTimerStop {Name = "et_RepeatAnim1"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS04Ended"},
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