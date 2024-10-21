portalX = 191
portalY = 313

State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 187,
		Y = 58,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_AttackGateGroup1"},
			QuestIsNotSolved {Quest = "WinterlightPeak_LastStand"},
		},
		Actions =
		{
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = myWait,
		X = 187,
		Y = 58,
		Conditions =
		{
			QuestIsNotSolved {Quest = "WinterlightPeak_LastStand"},
			MapFlagIsFalse {Name = "mf_P401_StartEndCS"},
		},
		Actions =
		{
		},
		
	},
	OnIdleRunHomeFake
	{
		X = myX,
		Y = myY,
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P401_ThroughGates"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			EntityTimerStart {Name = "et_P401_LoopAnim"}
		}
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P401_LoopAnim", Seconds = 2.4},
			MapFlagIsFalse {Name = "mf_P401_ThroughGates"},
		},
		Actions =
		{
			FigureLookAtDirection {Direction = myDirection},
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_beast_beastman_warrior_attackspecial.ska"},
			SoundAmbientPlayOnceAddon1 {File = "06_level/lvl_WP_giantshammering", X = myX, Y = 10, Z = myY, MaxRange = default, FallOffRange = default},
			EntityTimerStart {Name = "et_P401_LoopAnim"}
		},
	},
	OnIdleRunHomeFake
	{
		X = portalX,
		Y = portalY,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_ThroughGates"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			EntityTimerStart {Name = "et_P401_LoopAnim"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_StartEndCS"},
		},
		Actions =
		{
			FigureVanish {},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "WinterlightPeak_LastStand"},
		},
		Actions =
		{
			FigureVanish {},
		},
	},
}
