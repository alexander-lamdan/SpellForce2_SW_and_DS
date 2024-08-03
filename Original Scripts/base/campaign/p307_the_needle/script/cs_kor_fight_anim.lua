State
{	
	StateName = "Kor_Anim",
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_03_FightAnim_Kor_Start"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "KorEndFight", File = "base/gfx/figures/npc/figure_npc_orc_captain_attackspecial.ska"}, -- 2.50s
			EntityTimerStart {Name = "et_AnimPlay"},
		},
	},
	OnEvent
	{
		EventName = Anim2,
		GotoState = self,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_AnimPlay", Seconds = 2.50},
			EntityFlagIsFalse {Name = "ef_Stop_It"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "KorEndFight", File = "base/gfx/figures/npc/figure_npc_orc_captain_attackspecial.ska"}, -- 2.50s
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