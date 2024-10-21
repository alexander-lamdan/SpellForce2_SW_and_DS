WalkDelay = 0.4
GotoX = 59,262
GotoY = 11,3

State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_06_Darkelf_Group_Spawn"},
		},
		Actions = 
		{
		},
	};
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_06_Darkelf_Goto"},
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
			FigureSimpleWalk {Tag = "default", X = GetEntityX() + GotoX , Y = GetEntityY() + GotoY },
			EntityTimerStop {Name = "et_WalkTimerA"},
		},
		GotoState = "ScriptEnd"
	},
};

State
{
	StateName = "ScriptEnd",                    
};