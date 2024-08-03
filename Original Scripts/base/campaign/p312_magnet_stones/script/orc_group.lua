GotoX = 9.449
GotoY = 19.60

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_Orc_Goto_A"},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_WalkTimerA"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_WalkTimerA", Seconds = WalkDelay},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "default", X = GetEntityX() - GotoX , Y = GetEntityY() - GotoY },
			EntityTimerStop {Name = "et_WalkTimerA"},
		},
		GotoState = "ScriptEnd"
	},
};

State
{
	StateName = "ScriptEnd",                    
};                                                                            