State
{
	StateName = "WaitForQuestStart",

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQPriest_BarubasMustDie"},
		},
		Actions = 
		{
			FigureTeleportToEntity	{TargetTag = "SQPriest_WellSpawn5"},
			FigureDirectionSet	{Direction = 50},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "SQPriest_Hazibelah"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_PlayAnimFirst"},
			MapFlagSetTrue	{Name = "mf_SQPriest_IdaraIsSleeping"},
			FigureRoamingDisable	{},
			FigureDirectionSet	{Direction = 50},
		},
		GotoState = "PlaySleepAnim",
	};
};


State
{
	StateName = "PlaySleepAnim",

	OnPlayHeroAnimEvent
	{
		EventName = "special_idara_sleep",
		Tag = "SQPriest_Idara",
		Anim = "special_idara_sleep",
		Conditions = 
		{
			OR
			{
				EntityFlagIsTrue {Name = "ef_PlayAnimFirst"},
				EntityTimerIsElapsed {Name = "et_RepeatAnimFirst", Seconds = 3.3},
			},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name = "ef_PlayAnimFirst"},
			EntityTimerStart {Name = "et_RepeatAnimFirst"},
		},
	};
};

--State{StateName = "END"};
