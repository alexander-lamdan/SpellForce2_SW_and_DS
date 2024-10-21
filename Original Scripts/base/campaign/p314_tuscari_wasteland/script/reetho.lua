State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_02_Reetho_Kneel_Down"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "default", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_down.ska"}, -- 2.17s
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
			MapFlagSetTrue {Name = "mf_CS_02_Reetho_Kneel_Hold"},
		},
	},
	OnEvent
	{
		EventName = KneelHold1,
		GotoState = self,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_02_Reetho_Kneel_Hold"},
			MapFlagIsFalse {Name = "mf_CS_02_Reetho_Kneel_Hold2"},
			MapFlagIsFalse {Name = "mf_CS_02_Reetho_Stop_It"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "default", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_hold.ska"}, -- 3.29s
			MapFlagSetTrue {Name = "mf_CS_02_Reetho_Kneel_Hold2"},
			EntityTimerStart {Name = "et_kneel_hold"},
		},
	},
	OnEvent
	{
		EventName = KneelHold2,
		GotoState = self,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_kneel_hold", Seconds = 3},
			MapFlagIsTrue {Name = "mf_CS_02_Reetho_Kneel_Hold2"},
			MapFlagIsFalse {Name = "mf_CS_02_Reetho_Stop_It"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_CS_02_Reetho_Kneel_Hold2"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_02_Reetho_Kneel_Up"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "default", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_up.ska"}, -- 1.83s
			MapFlagSetTrue {Name = "mf_CS_02_Reetho_Stop_It"},
		},
	},
};
