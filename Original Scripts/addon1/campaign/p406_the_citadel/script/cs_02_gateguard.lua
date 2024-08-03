State
{
	StateName = "INIT",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_02_GateGuard_Walk"},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "GateMonster", X = 253.4, Y = 253.4, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			FigureIsIdle {Tag = "GateMonster"},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "GateMonster", X = 260.397, Y = 260.025, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			FigureIsIdle {Tag = "GateMonster"},
		},
		Actions =
		{
			FigureLookAtDirection {Tag = "GateMonster", Direction = 135},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "End",
	},
};

State
{
	StateName = "End",
};