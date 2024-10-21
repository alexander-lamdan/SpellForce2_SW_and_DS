State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 419.779,
		Y = 418.317,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_03_Worker02_Spawn"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_state_change"},
		},
	};
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_state_change"},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Goto",
	},
};

State
{
	StateName = "Goto",
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "default", X = 404.756, Y = 418.485},
			EntityTimerStop {Name = "et_CStimer"},
		},
		GotoState = "End",
	},
};

State
{
	StateName = "End",
};

