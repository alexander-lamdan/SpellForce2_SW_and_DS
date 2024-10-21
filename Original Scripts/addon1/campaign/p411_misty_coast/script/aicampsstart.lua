
-- AI-CAMPS starten jetzt NICHT MEHR!

State
{
	StateName = "INITCutscene",
	OnOneTimeEvent
	{
		GotoState = "Main",
		Conditions =
		{
		},
		Actions =
		{
		},
	},
}

State
{
	StateName = "Main",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_AllCampsFreed"},
		},
		Actions =
		{
			--MapTimerStart{Name = "mt_AICampStartTimer"},  -- AI-CAMPS starten jetzt NICHT MEHR!
		},
		--GotoState = "Timer01", -- AI-CAMPS starten jetzt NICHT MEHR!
	},
	
	
}


State
{
	StateName = "Timer01",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed{Name = "mt_AICampStartTimer", Seconds = 10},
		},
		Actions =
		{
			PlayerActivate	{Player = "pl_Insel1"},
		},
		GotoState = "Timer02",	
	},
	
}


State
{
	StateName = "Timer02",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed{Name = "mt_AICampStartTimer", Seconds = 60},
		},
		Actions =
		{
			PlayerActivate	{Player = "pl_Insel2"},
		},
		GotoState = "Timer03",
	},
	
}


State
{
	StateName = "Timer03",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed{Name = "mt_AICampStartTimer", Seconds = 120},
		},
		Actions =
		{
			PlayerActivate	{Player = "pl_Insel3"},
		},
		GotoState = "Timer04",
	},
	
}

State
{
	StateName = "Timer04",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed{Name = "mt_AICampStartTimer", Seconds = 180},
		},
		Actions =
		{
			PlayerActivate	{Player = "pl_Insel4"},
		},
		GotoState = "Timer05",
	},
	
}


State
{
	StateName = "Timer05",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed{Name = "mt_AICampStartTimer", Seconds = 240},
		},
		Actions =
		{
			PlayerActivate	{Player = "pl_Insel5"},
		},
	},
}
