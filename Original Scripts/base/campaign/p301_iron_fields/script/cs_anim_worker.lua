State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_B_Worker_Build_Anim_Start"},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "CS_B_01_Worker_01", File = "base/gfx/figures/fraction_1/figure_human_worker_build.ska"},
			EntityTimerStart {Name = "et_timer001"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_timer001", Seconds = 0.3},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "CS_B_01_Worker_02", File = "base/gfx/figures/fraction_1/figure_human_worker_build.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_timer001", Seconds = 0.6},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "CS_B_01_Worker_03", File = "base/gfx/figures/fraction_1/figure_human_worker_build.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_timer001", Seconds = 0.9},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "CS_B_01_Worker_05", File = "base/gfx/figures/fraction_1/figure_human_worker_build.ska"},
			EntityTimerStop {Name = "et_timer001"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_B_Worker_Build_Anim_Vanish"},
		},
		Actions =
		{
			FigureVanish {Tag = "CS_B_01_Worker_01"},
			FigureVanish {Tag = "CS_B_01_Worker_02"},
			FigureVanish {Tag = "CS_B_01_Worker_03"},
			FigureVanish {Tag = "CS_B_01_Worker_04"},
			FigureVanish {Tag = "CS_B_01_Worker_05"},
		},
		GotoState = "EndScript",
	},
};
	
State
{	
	StateName = "EndScript",

};