State
{	
	StateName = "Shadowsong_Anim",
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_12_KneelDown"},
		},
		Actions = 
		{
			FigureAnimPlayOnce {Tag = "Shadowsong", File = "base/gfx/figures/hero/figure_hero_female_emote_kneel_down.ska"}, -- 3.29s
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
			FigureAnimPlayOnce {Tag = "Shadowsong", File = "base/gfx/figures/hero/figure_hero_female_emote_kneel_hold.ska"}, -- 3.29s
			EntityTimerStop {Name = "et_timer001"},
			EntityTimerStart {Name = "et_timer002"},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_timer002", Seconds = 3},
		},
		Actions = 
		{
			FigureAnimPlayOnce {Tag = "Shadowsong", File = "base/gfx/figures/hero/figure_hero_female_emote_kneel_hold.ska"}, -- 3.29s
			EntityTimerStart {Name = "et_timer002"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_12_Shadowsong_KneelUp"},
		},
		Actions =
		{
			FigureAnimPlayOnce {Tag = "Shadowsong", File = "base/gfx/figures/hero/figure_hero_female_emote_kneel_up.ska"}, -- 3.29s
		},
		GotoState = "EndScript"
	},
};
		
State
{	
	StateName = "EndScript",
};