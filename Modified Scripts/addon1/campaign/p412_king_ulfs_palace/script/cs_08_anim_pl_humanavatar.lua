State
{	
	StateName = "INIT",
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim1",
		Tag = "pl_HumanAvatar",
		Anim = "die",
		Looped = false,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_08_pl_HumanAvatar_Die"},
			--MapTimerIsElapsed {Name = "mt_CS_08_pl_HumanAvatar_Die", Seconds = 0.2},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_timer001"},
		},
	};
	OnPlayHeroAnimEvent
	{
		EventName = "Anim2",
		Tag = "pl_HumanAvatar",
		Anim = "special_dead",
		Looped = false,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_timer001", Seconds = 3},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_timer001"},
		},
	};
};