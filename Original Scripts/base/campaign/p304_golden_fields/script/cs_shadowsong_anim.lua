State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_A_01_Shadowsong_Attack"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "Schattenlied", File = "base/gfx/figures/hero/figure_hero_female_attack_1h_left_1.ska"}, -- 1.58s
			EntityTimerStart {Name = "et_timer001"},
		},
			GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};