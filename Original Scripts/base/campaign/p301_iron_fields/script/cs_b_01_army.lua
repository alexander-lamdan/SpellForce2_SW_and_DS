State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 282.488,
		Y = 32.36,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P301_B_Portal_Army"},
		},
		Actions = 
		{
			FigureLookAtDirection {Tag = "default", Direction = 90},
			EntityTimerStart {Name = "et_Army_Run"},
		},
	};
	OnFigureRespawnEvent
	{
		WaitTime = 0,
		X = 282.488,
		Y = 32.36,
		Conditions = 
		{
			EntityFlagIsTrue {Name = "ef_respawn"},
		},
		Actions = 
		{
			FigureLookAtDirection {Tag = "default", Direction = 90},
			EntityFlagSetFalse {Name = "ef_respawn"},
			EntityTimerStart {Name = "et_Army_Run"},
		},
	};
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Army_Run", Seconds = 1},
		},
		Actions =
		{
			FigureSimpleRun {Tag = "default", X = 293.83, Y = 32.36},
			EntityTimerStop {Name = "et_Army_Run"},
			EntityTimerStart {Name = "et_Army_Run_Vanish"},
		},
	};
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Army_Run_Vanish", Seconds = 2.5},
		},
		Actions =
		{
			FigureVanish {Tag = "default"},
			EntityTimerStop {Name = "et_Army_Run_Vanish"},
			EntityFlagSetTrue {Name = "ef_respawn"},
		},
	};
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_B_Portal_Army_Stop"},
		},
		Actions =
		{
			FigureVanish {Tag = "default"},
			EntityTimerStop {Name = "et_Army_Run_Vanish"},
			EntityTimerStop {Name = "et_Army_Run"},
		},
		GotoState = "ScriptEnd",
	};
}

State
{	
	StateName = "ScriptEnd"
}
