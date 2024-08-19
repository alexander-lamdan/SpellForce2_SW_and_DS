State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent	
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true, 
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_04_Orcs_Spawn"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
			CutsceneFigureTeleport {Tag = "default", X = 454.372, Y = 480.094, },
			FigureLookAtDirection {Tag = "default", Direction = 320},			
		}, 
	},
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_04_Orcs_Anim_Play"},
		},
		Actions = 
		{
			FigureAnimPlayOnce {Tag = "default", File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_down.ska"},
		}, 
	},
};