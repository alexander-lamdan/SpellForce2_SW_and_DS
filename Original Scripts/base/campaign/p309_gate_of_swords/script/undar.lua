State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				QuestIsActive {Quest = "GoSPart2ShadowKnowledge"},
				AvatarFlagIsTrue {Name = "af_P309_CutsceneIronLordEnd"},
			},
		},
		Actions = 
		{
			DialogTypeSetSideQuest {},
			DialogSetEnabled {},
		}
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P309_Fight"}
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Undar", Team = "tm_EnemyPact"},
			FigureAbilityAdd {AbilityId = Ability.Immortal},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth {Percent = 50}
		},
		Actions =
		{

			FigureTeamTransfer {Tag = "Undar", Team = "tm_Neutral"},
			FigureHateClear	{},
			FigureStop{},
			-- weil der Avatar sonst munter weiterkämpft ...
			FigureStop	{Tag = "pl_HumanAvatar"},
			-- und die Helden?
			FigureStop	{Tag = "pl_HumanHeroBor"},
			FigureStop	{Tag = "pl_HumanHeroLya"},
			FigureStop	{Tag = "pl_HumanHeroShae"},
			FigureStop	{Tag = "pl_HumanHeroJared"},
			FigureStop	{Tag = "pl_HumanHeroMordecay"},
			FigureStop	{Tag = "pl_HumanNightSong"},
			FigureStop	{Tag = "pl_HumanKor"},
			--FigureAbilityRemove {AbilityId = Ability.Immortal},
			DialogTypeSetSideQuest {Tag = "Undar"},
			DialogSetEnabled {Tag = "Undar"},
			MapFlagSetTrue {Name = "mf_P309_UndarFought"},
			MapTimerStart {Name = "mt_UndarFougthTimer"}
		},
	},
	-- Wenn Undar von der Arena erzählt hat geht er auch dahin
	OnIdleGoHomeFake
	{
		X = 557, 
		Y = 347, 
		Conditions =
		{
			AvatarIsNotTalking {},
			GameInterfaceIsVisible	{},
			OR
			{
				MapTimerIsElapsed {Name = "mt_UndarFougthTimer", Seconds = 90},
				MapFlagIsTrue {Name = "mf_P309_UndarBeTalked"},
			},
		},
		Actions =
		{
			MapTimerStop {Name = "mt_UndarFougthTimer"},
		}
	},
	
	-- Undar jubelt, wenn der Spieler eine Runde gewinnt und er an der Arena steht
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {X = 557, Y = 347, Range = 3},
			MapValueIsEqual {Name = "mv_P309_PitFightsWon", Value = 1},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_down.ska"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {X = 557, Y = 347, Range = 3},
			MapValueIsEqual {Name = "mv_P309_PitFightsWon", Value = 2},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_down.ska"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {X = 557, Y = 347, Range = 3},
			MapValueIsEqual {Name = "mv_P309_PitFightsWon", Value = 3},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_down.ska"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {X = 557, Y = 347, Range = 3},
			MapValueIsEqual {Name = "mv_P309_PitFightsWon", Value = 4},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_down.ska"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {X = 557, Y = 347, Range = 3},
			MapValueIsEqual {Name = "mv_P309_PitFightsWon", Value = 5},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_down.ska"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {X = 557, Y = 347, Range = 3},
			MapValueIsEqual {Name = "mv_P309_PitFightsWon", Value = 6},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_down.ska"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {X = 557, Y = 347, Range = 3},
			MapValueIsEqual {Name = "mv_P309_PitFightsWon", Value = 7},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_down.ska"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {X = 557, Y = 347, Range = 3},
			MapValueIsEqual {Name = "mv_P309_PitFightsWon", Value = 8},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_down.ska"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {X = 557, Y = 347, Range = 3},
			MapValueIsEqual {Name = "mv_P309_PitFightsWon", Value = 9},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_down.ska"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {X = 557, Y = 347, Range = 3},
			MapValueIsEqual {Name = "mv_P309_PitFightsWon", Value = 10},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_down.ska"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {X = 557, Y = 347, Range = 3},
			MapValueIsEqual {Name = "mv_P309_PitFightsWon", Value = 11},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_down.ska"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {X = 557, Y = 347, Range = 3},
			MapValueIsEqual {Name = "mv_P309_PitFightsWon", Value = 12},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_npc_orc_captain_emote_kneel_down.ska"}
		},
	},
	
}
	
