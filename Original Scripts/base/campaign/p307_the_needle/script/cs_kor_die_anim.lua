State
{	
	StateName = "Kor_Anim",
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_03_DieAnim_Kor_Start"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "KorEndFight", File = "base/gfx/figures/npc/figure_npc_orc_captain_die.ska"}, -- 2.04s
			EntityTimerStart {Name = "et_AnimPlay"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_AnimPlay", Seconds = 2.03},
		},
		Actions = 
		{
			FigureAnimPlayLooped {Tag = "KorEndFight", File = "base/gfx/figures/npc/figure_npc_orc_captain_dead.ska"}, -- 0.04s
			EntityTimerStop {Name = "et_AnimPlay"},
			EntityTimerStart {Name = "et_AnimPlay2"},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsFalse {Name = "ef_stop_loop"},
			EntityTimerIsElapsed {Name = "et_AnimPlay2", Seconds = 2},
		},
		Actions = 
		{
			FigureAnimPlayLooped {Tag = "KorEndFight", File = "base/gfx/figures/npc/figure_npc_orc_captain_dead.ska"}, -- 0.04s
			EntityTimerStart {Name = "et_AnimPlay2"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_03_DieAnim_Kor_Stop"},
		},
		Actions =
		{
			FigureStop {Tag = "KorEndFight"},
			EntityFlagSetTrue {Name = "ef_stop_loop"},
			EntityTimerStop {Name = "et_AnimPlay2"},
		},
		GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};