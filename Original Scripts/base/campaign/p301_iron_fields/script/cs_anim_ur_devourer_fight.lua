State
{	
	StateName = "INIT",
	OnOneTimeEvent 	-- Animation Teil 1 wird gestartet
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_B_01_Ur_Devourer_Fight_Anim"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "Hydra", File = "base/gfx/figures/boss/figure_boss_devourer_special_fight_1.ska"}, -- 12.50s
			FigureAnimPlayOnce	{Tag = "Ur", File = "base/gfx/figures/boss/figure_boss_dragon_ur_special_fight_1.ska"}, -- 12.50s
			EntityTimerStart {Name = "et_CStimer01"},
		},
	},
	OnOneTimeEvent	-- Animation Teil 2 wird gestartet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer01", Seconds = 12.5},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "Hydra", File = "base/gfx/figures/boss/figure_boss_devourer_special_fight_2.ska"}, -- 9.58s
			FigureAnimPlayOnce	{Tag = "Ur", File = "base/gfx/figures/boss/figure_boss_dragon_ur_special_fight_2.ska"}, -- 9.58s
			EntityTimerStart {Name = "et_CStimer02"},
		},
	},
	OnOneTimeEvent	-- Feueratem wird gestartet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer01", Seconds = 10},
		},
		Actions =
		{
			EffectStart {Tag = "Ur", File = "Effect_Misc_UrFirebreath"},			
		},
	},
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer02", Seconds = 9.58},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer01"},
			EntityTimerStop {Name = "et_CStimer02"},
		},
		GotoState = "EndScript",
	},
};
	
State
{	
	StateName = "EndScript",

};