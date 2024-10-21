State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_CS_Beasts_Spawn"},
		},
		DelayedActions =
		{
			FigureLookAtDirection {Tag = "default", Direction = 225},
			EntityTimerStart {Name = "et_KillTimer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_KillTimer", Seconds = 5},
		},
		Actions =
		{
			FigureKill {Tag = "default"},
			SoundAmbientPlayOnceAddon1 {File = "06_level/lvl_WP_beastman_squished", X = 149, Y = 10, Z = 105, MaxRange = 100, FallOffRange = 100},
			EntityTimerStart {Name = "et_KillTimer"},
		},
		GotoState = "ScriptEnd",
	},	
};

State
{
	StateName = "ScriptEnd",
};