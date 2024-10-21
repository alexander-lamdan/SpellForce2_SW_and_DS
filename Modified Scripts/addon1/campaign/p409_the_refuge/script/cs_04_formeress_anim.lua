State
{
	StateName = "INIT",
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim1",
		Tag = "Shaperess",
		Anim = "die",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_04_Shaperess_Dead_Anim_Play"},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_RepeatAnim"},
		},
	};
	OnPlayHeroAnimEvent
	{
		EventName = "Anim2",
		Tag = "Shaperess",
		Anim = "special_dead",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_RepeatAnim", Seconds = 3.2},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_RepeatAnim"},
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