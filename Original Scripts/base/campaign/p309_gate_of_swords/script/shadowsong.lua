State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigureVanish {},
		}
	},
	OnFigureRespawnEvent
	{
		X = 566.818,
		Y = 430.885,
		WaitTime = 1,
		NoSpawnEffect = true,
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P309_Shadowsong_Dont_Respawn_Please"},
			MapFlagIsFalse {Name = "mf_P309_ShadowSongChange"},
			AvatarFlagIsTrue {Name = "af_P309_CutsceneIronLordEnd"},
		},
		Actions =
		{
		},
		DelayedActions =
		{
			DialogTypeSetMainQuest {Tag = "ShadowSong"},
			DialogSetEnabled {Tag = "ShadowSong"},
		}
	},
	OnIdleGoHomeFake
	{
		X = 445,
		Y = 485,
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P309_HeulenDone"},
			QuestIsSolved {Quest = "TalkToNightsongAboutShadows"},
		},
		Actions =
		{
			FogOfWarRevealAtEntity {Range = 7},
		},
		HomeActions =
		{
		},
	},
	-- Der SPieler hat die Cutscene gesehen oder kommt von Uram Gor zurück, also geht Schattenlied wieder ins Lager
	OnIdleGoHomeFake
	{
		X = 566,
		Y = 430,
		Conditions =
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_P309_HeulenDone"},
				QuestIsKnown {Quest = "ThroughValley"}
			},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P309_TalkedToShadowsong"},
			DialogSetDisabled {},
			MapFlagSetTrue {Name = "mf_P309_HeulenDone"},
		},
	},
	-- Quest auf unsolvable
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P309_HeulenDone"},
			QuestIsKnown {Quest = "ThroughValley"},
		},
		Actions =
		{
			QuestSetUnsolvable {Quest = "TalkToNightsongAboutShadows"},
		},
	},
	-- Dialog wieder an
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "BringMirrorToShadowWarrior"},
		},
		Actions =
		{
			DialogSetEnabled {},
		},
	},
		OnOneTimeEvent
	{
		GotoState = "ShadowTalk",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_ShadowSongChange"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			PlayerHeroAdd {Player = "pl_Human", HeroId = 25},
			FigureOutcry {TextTag = "System1", Tag = "System_Npc"}, --SYSTEM-OC: sie haben die Schattenliesel bekommen
			FigureHeroSpawnToEntity {Player = "default", Tag = "NightSong", TargetTag = "Shadowsong", Direction = 0},
			FigureVanish {Tag = "ShadowSong"},
		}
	},
}

-- Cutscene Mit Mordecay gelaufen, jetzt kann Shadowsong ihren Dialog anschalten
State
{
	StateName = "ShadowTalk",
}


