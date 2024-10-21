State
{	
	StateName = "Mordecay_Anim_Die",
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_10_Anim_Mordecay_Dies"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "MordecayAlive", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_hold.ska"}, -- 3.29s
			EntityTimerStart {Name = "et_AnimPlay"},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_AnimPlay", Seconds = 1.2},
		},
		Actions = 
		{
			FigureAnimPlayLooped {Tag = "MordecayAlive", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_hold.ska"}, -- 3.29s
			EntityTimerStart {Name = "et_AnimPlay"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_10_Anim_Mordecay_Dead"},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_AnimPlay"},
		},
		GotoState = "EndScript"
		--GotoState = "Mordecay_Anim_Dead"
	},
};
--
--State
--{	
--	StateName = "Mordecay_Anim_Dead",
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--		},
--		Actions = 
--		{
--			FigureAnimPlayLooped {Tag = "MordecayAlive", File = "base/gfx/figures/hero/figure_hero_male_dead.ska"}, -- 0.08s
--			EntityTimerStart {Name = "et_AnimPlayB"},
--		},
--	},
--	OnEvent
--	{
--		Conditions = 
--		{
--			EntityTimerIsElapsed {Name = "et_AnimPlayB", Seconds = 1.5},
--		},
--		Actions = 
--		{
--			FigureAnimPlayLooped {Tag = "MordecayAlive", File = "base/gfx/figures/hero/figure_hero_male_dead.ska"}, -- 0.08s
--			EntityTimerStart {Name = "et_AnimPlayB"},
--		},
--	},
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			MapFlagIsTrue {Name = "mf_CS_10_Anim_Mordecay_Vanish"},
--		},
--		Actions =
--		{
--			FigureVanish {Tag = "MordecayAlive"},
--			EntityTimerStop {Name = "et_AnimPlayB"},
--		},
--		GotoState = "EndScript"
--	},
--};
--		
State
{	
	StateName = "EndScript",
};