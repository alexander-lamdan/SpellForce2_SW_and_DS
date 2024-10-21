State
{	
	StateName = "MainScript",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_NightSong_Spawn"},
		},
		Actions = 
		{
		},
		DelayedActions =
		{
			-- Waffen Hide
			CutsceneFigureWeaponsHide {Tag = "default"},
			EntityFlagSetTrue {Name = "ef_spawned"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue {Name = "ef_spawned"},
		},
		Actions = 
		{
			FigureTeleport {Tag = "default", X = 374.962, Y = 428.404},			
			FigureLookAtDirection {Tag = "default", Direction = 252.856},
			FigureAnimPlayLooped {Tag = "default", File = "base/gfx/figures/hero/figure_hero_female_dead.ska"},
		},
	};
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_NightSong_Kneel_Down"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "default", File = "base/gfx/figures/hero/figure_hero_female_emote_kneel_down.ska"}, -- 2.17s
			EntityTimerStart {Name = "et_timer001"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_timer001", Seconds = 2.17},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "default", File = "base/gfx/figures/hero/figure_hero_female_emote_kneel_hold.ska"}, -- 3.29s
			EntityTimerStart {Name = "et_kneel_hold"},
		},
	},
	OnEvent
	{
		EventName = KneelHold2,
		GotoState = self,
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_NightSong_Kneel_Stop"},
			EntityTimerIsElapsed {Name = "et_kneel_hold", Seconds = 3},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "default", File = "base/gfx/figures/hero/figure_hero_female_emote_kneel_hold.ska"}, -- 3.29s
			EntityTimerStart {Name = "et_kneel_hold"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_NightSong_Kneel_Up"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "default", File = "base/gfx/figures/hero/figure_hero_female_emote_kneel_up.ska"}, -- 1.83s
			EntityTimerStop {Name = "et_kneel_hold"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_NightSong_Vanish"},
		},
		Actions =
		{
			FigureVanish {Tag = "default"},			
		},
		GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};