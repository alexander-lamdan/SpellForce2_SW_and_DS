

State
{
	StateName = "Zwerg03Init",
	--Zwerge meiden die Teleporter
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange	{Range = 3, X = 284, Y = 337},
			EntityFlagIsFalse	{Name = "ef_EinmalSchalter01"},
		},
		Actions =
		{
			FigureWalk	{X = 283, Y = 324},
			EntityFlagSetTrue	{Name = "ef_EinmalSchalter01"},
		},
		
	},	
		--Zwerge meiden die Teleporter
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange	{Range = 3, X = 283, Y = 324},
		},
		Actions =
		{
			EntityFlagSetFalse	{Name = "ef_EinmalSchalter01"},
		},
		
	},	
	--Zwerge meiden die Teleporter
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange	{Range = 3, X = 245, Y = 63},
			EntityFlagIsFalse	{Name = "ef_EinmalSchalter02"},
		},
		Actions =
		{
			FigureWalk	{X = 246, Y = 49},
			EntityFlagSetTrue	{Name = "ef_EinmalSchalter02"},
		},
		
	},	
		--Zwerge meiden die Teleporter
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange	{Range = 3, X = 245, Y = 49},
		},
		Actions =
		{
			EntityFlagSetFalse	{Name = "ef_EinmalSchalter02"},
		},
		
	},	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P305_WindhammerQuestSolved"},
		},
		Actions =
		{
						
			FigurePlayerTransfer	{Tag = "Zwerg03", Player = "pl_Neutral"},
			FigureWalk	{X = 292, Y = 37},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P305_WindhammerQuestSolved"},
			FigureIsInRange	{Range = 2, X = 292, Y = 37},
		},
		Actions =
		{
		
			EntityTimerStart	{Name = "et_DwarfKneeingTimer"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_DwarfKneeingTimer", Seconds = 1},		
		},
		Actions =
		{
			FigureLookAtDirection	{Direction = 180},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_DwarfKneeingTimer", Seconds = 2},		
		},
		Actions =
		{
			FigureAnimPlayOnce	{File = "base/gfx/figures/npc/figure_npc_dwarf_emote_kneel_down.ska"},	
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_DwarfKneeingTimer", Seconds = 4.17},		
		},
		Actions =
		{
			FigureAnimPlayOnce	{File = "base/gfx/figures/npc/figure_npc_dwarf_emote_kneel_hold.ska"},
		},
		
	},

};
