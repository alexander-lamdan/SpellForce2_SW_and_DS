State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_05_Actors_Spawn"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
			CutsceneFigureTeleport {Tag = "default", X = 523.6, Y = 582.4, },
			FigureLookAtDirection {Tag = "default", Direction = 315},
			CutsceneFigureWeaponsHide {Tag = "default"},			
			MapFlagSetTrue {Name = "mf_CS_05_Riddengard_Kneel_Hold_Anim_Play"},
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "Anim1",
		Tag = "default",
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
		Tag = "default",
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
		Tag = "default",
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
			MapFlagIsTrue {Name = "mf_CS05Ended"},
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
