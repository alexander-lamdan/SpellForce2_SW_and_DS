State
{	
	StateName = "Jared_Anim",
	OnOneTimeEvent
	{
		Conditions = 
		{	
			MapFlagIsTrue {Name = "mf_P304_Windhammer_Dead_Anim_Play"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "Windhammer", File = "base/gfx/figures/npc/figure_npc_dwarf_die.ska"}, -- 1.79s
			EntityTimerStart {Name = "et_AnimPlayA"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			AvatarFlagIsFalse{Name = "af_P304_DwarfEmbassadorAlive"},
			EntityTimerIsElapsed {Name = "et_AnimPlayA", Seconds = 1.79},
		},
		Actions = 
		{
			FigureAnimPlayLooped {Tag = "Windhammer", File = "base/gfx/figures/npc/figure_npc_dwarf_dead.ska"}, -- 0.08s
			EntityTimerStart {Name = "et_AnimPlayA"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P304_Windhammer_Dead_Anim_Stop"},
		},
		Actions = 
		{
			FigureVanish {Tag = "Windhammer"},
		},
		GotoState = "EndScript"
	};
};
	
State
{	
	StateName = "EndScript",
};