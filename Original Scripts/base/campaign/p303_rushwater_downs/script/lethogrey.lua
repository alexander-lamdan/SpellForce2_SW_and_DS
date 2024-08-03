State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "RushwaterPart5ReturnToMatricus"}
		},
		Actions =
		{
			FigureVanish {},
			EntityFlagSetTrue {Name = "ef_P303_BerengarMove"}
		}
	},	
	OnFigureSpawnOnlyWhenEvent
	{
		X = 265, 
		Y = 338,
		Conditions =
		{
			
		},
		Actions =
		{
		}
	},
	
	OnFigureRespawnEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		WaitTime = 1,
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P303_BerengarMove"},
			EntityFlagIsFalse {Name = "ef_P303_LethoNeverMore"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P303_LethoNeverMore"},
			EntityTimerStart {Name = "et_AnimPlayA"},
		}
	},
	-- Hinknien du Sau
	-----------------------------------------------------
	--Letho Kneel Anim ----
	-----------------------------------------------------
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_AnimPlayA", Seconds = 2},
			QuestIsNotKnown {Quest = "GoSTheHouseOfGreyLetho"},
		},
		Actions =
		{
			FigureAnimPlayLooped	{File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_hold.ska"},
			EntityTimerStart {Name = "et_AnimPlayA"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "GoSTheHouseOfGreyLetho"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_up.ska"},
			EntityTimerStop {Name = "et_AnimPlayA"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "HouseOfGreyLethoRushwaterStart"}
		},
		Actions =
		{
			DialogTypeSetSideQuest {},
			DialogSetEnabled {},
		},
	},
	OnIdleGoHomeFake
	{
		X = 646,
		Y = 434,
		Conditions =
		{
			QuestIsSolved {Quest = "HouseOfGreyLethoRushwaterStart"},
			AvatarIsNotTalking {},
		},
		HomeActions =
		{
			FigureVanish {},
		}
	},
	-- Wenn der Spieler auf GoS war verschwindet Letho hier, schlieﬂlich kann er ja nicht an zwei Orten gleichzeitig sein.
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved  {Quest = "1_KapitelAkt2"},
		},
		Actions =
		{
			FigureVanish {},
		}
	}
}