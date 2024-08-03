State
{	
	StateName = "Kor_Anim",
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_04_Kneel_Hold_Kor"},
		},
		Actions = 
		{
			FigureStop {Tag = "KorEndFight"},			
			FigureAnimPlayLooped {Tag = "KorEndFight", File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_hold.ska"}, -- 3.33s
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_04_Kneel_Up_Kor"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "KorEndFight", File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_up.ska"}, -- 1.79s
		},
		GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};