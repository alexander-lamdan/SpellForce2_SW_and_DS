State
{	
	StateName = "Kaziz_Anim",
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_03_FightAnim_Kaziz_Start"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "KazizEndFight", File = "base/gfx/figures/hero/figure_hero_male_attack_1h_right_2.ska"}, -- 1.42s
			EntityTimerStart {Name = "et_AnimPlay"},
		},
	},
	OnEvent
	{
		EventName = Anim2,
		GotoState = self,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_AnimPlay", Seconds = 1.58},
			EntityFlagIsFalse {Name = "ef_Stop_It"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "KazizEndFight", File = "base/gfx/figures/hero/figure_hero_male_attack_1h_left_1.ska"}, -- 1.58s
			EntityTimerStart {Name = "et_AnimPlay"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_03_FightAnims_Stop"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_Stop_It"},
			EntityTimerStop {Name = "et_AnimPlay"},
		},
		GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};