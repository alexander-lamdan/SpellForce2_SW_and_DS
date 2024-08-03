--************************************************************
--**														**
--**		The Needle Portal Fight							**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroBor'",
		"'pl_HumanHeroLya'",
		"'pl_HumanHeroJared'",
		"'pl_HumanHeroShae'",
		"'pl_HumanNightsong'",
		-- KazizEndFight, KorEndFight und TothLarEndFight spawnen erst in der Cutscene
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Teleport und Spawn der Akteure
	{
		AllowCombat = true,
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene03"},
				AND
				{
					OR
					{
						MapFlagIsTrue	{Name = "mf_portal_fight"},
						AvatarFlagIsTrue {Name = "af_P307_PortalFight"},
						AvatarFlagIsTrue {Name = "af_P307_Cutscene03"},
					},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsAlive {Tag = "pl_HumanAvatar"},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
				},
			},
		},
		Actions =
		{
			_tRenderList,
			-- zum testen GateSetOpen wieder einkommentieren
			GateSetOpen	{Tag = "Rampart_Gate01"},
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Akteure Teleport und Spawn
			MapFlagSetTrue {Name = "mf_Spawn_3rd_Cutscene"},
			FigureLookAtDirection {Tag = "TothLarEndFight", Direction = 137.51},
			FigureLookAtDirection {Tag = "KazizEndFight", Direction = 188.113},
			FigureLookAtDirection {Tag = "KorEndFight", Direction = 9.7859},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 466.048, Y = 529.183},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 285.206},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 467.953, Y = 528.685},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 285.206},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 469.241, Y = 527.863},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 285.206},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 466.984, Y = 531.778},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 285.206},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 468.848, Y = 531.336},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 285.206},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 464.878, Y = 531.243},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 285.206},
			-- Kor und Kaziz spielen Kampfanimationen
			--MapFlagSetTrue {Name = "mf_CS_03_FightAnim_Kaziz_Start"},
			--MapFlagSetTrue {Name = "mf_CS_03_FightAnim_Kor_Start"},
			-- Effekt auf Portal
			EffectStart {Tag = "WayToIF", File = "Effect_Spawn_Gate"},
			-- Kaziz und Kor werden Immortal
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Kamera auf TothLar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Kaziz und Kor hören auf zu kämpfen
			--MapFlagSetTrue {Name = "mf_CS_03_FightAnims_Stop"},
			CutsceneFigureWeaponsHide {Tag = "KorEndFight"},
			ObjectSpawn	{ObjectId = 1480, X = 432.436, Y = 524.666, Direction = 274.056, Tag = "Kor_FightingStaff"},
			-- Helden werden geheilt
			FigureHealthAdd	{Tag = "pl_HumanAvatar", Percent = 100},
			FigureHealthAdd	{Tag = "pl_HumanHeroBor", Percent = 100},
			FigureHealthAdd	{Tag = "pl_HumanHeroLya", Percent = 100},
			FigureHealthAdd	{Tag = "pl_HumanHeroJared", Percent = 100},
			FigureHealthAdd	{Tag = "pl_HumanHeroShae", Percent = 100},
			FigureHealthAdd	{Tag = "pl_HumanNightsong", Percent = 100},
			-- Kor und Kaziz werden in das neutrale Team gesteckt
			FigureTeamTransfer {Tag = "KorEndFight", Team = "tm_Neutral"},
			FigureTeamTransfer {Tag = "KazizEndFight", Team = "tm_Neutral"},
			-- Kor und Kaziz werden an die Editorpositionen teleportiert, nur falls sie
			-- durch den KI-gesteuerten Kampf woanders stehen sollten
			FigureTeleport {Tag = "KorEndFight", X = 434.141, Y = 524.185},
			FigureLookAtDirection {Tag = "KorEndFight", Direction = 9.786},
			FigureTeleport {Tag = "KazizEndFight", X = 434.733, Y = 521.47},
			FigureLookAtDirection {Tag = "KazizEndFight", Direction = 188.113},
			-- Hate wird gelöscht
			FigureHateClear	{Tag = "KorEndFight"},
			FigureHateClear	{Tag = "KazizEndFight"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02a",
	},
};

State
{
	StateName = "Cutscene02a",
	OnOneTimeEvent	-- TothLar: PortalFight01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "PortalFight01", Tag = "TothLarEndFight"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02b",
	},
};

State
{
	StateName = "Cutscene02b",
	OnOneTimeEvent	-- Kaziz holt zum finalen Schlag aus
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			-- Timer muss bleiben da die Figuren sonst in der War-Pose hängen bleiben
			-- und die Animationen nicht sauber abgespielt werden... Dolles System!
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "KazizEndFight", File = "base/gfx/figures/hero/figure_hero_male_attack_1h_right_1.ska"}, -- 1.42s
			-- Figuren werden zusätzlich gestoppt
			FigureStop {Tag = "KorEndFight"},
			FigureStop {Tag = "KazizEndFight"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03a",
	},
};

State
{
	StateName = "Cutscene03a",
	OnOneTimeEvent	-- SOUND: Kaziz Attack
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.7},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P307_The_Needle_03_SOUND_Play_Kaziz_Attack"},
		},
		GotoState = "Cutscene03b",
	},
};

State
{
	StateName = "Cutscene03b",
	OnOneTimeEvent	-- Kor geht zu Boden
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.75},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_03_DieAnim_Kor_Start"},
			-- SOUND: Kor Scream
			MapFlagSetTrue {Name = "mf_P307_The_Needle_03_SOUND_Play_Kor_Scream"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04a",
	},
};

State
{
	StateName = "Cutscene04a",
	OnOneTimeEvent	-- SOUND: Kor Groundhit
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.6},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P307_The_Needle_03_SOUND_Play_Kor_Groundhit"},
		},
		GotoState = "Cutscene04b",
	},
};

State
{
	StateName = "Cutscene04b",
	OnOneTimeEvent	-- Kamera auf Avatar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- TothLar: PortalFight02
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "PortalFight02", Tag = "TothLarEndFight"},
			FigureLookAtEntity	{Tag = "KazizEndFight", TargetTag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- TothLar: PortalFight03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take04a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "PortalFight03", Tag = "TothLarEndFight"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- TothLar läuft zum Portal
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "TothLarEndFight", X = 423.937, Y = 520.187},
			-- nur ein Testwalk: FigureSimpleWalk {Tag = "TothLarEndFight", X = 411.6, Y = 516.6},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Kaziz verschwindet
	{
		Conditions =
		{
			FigureIsIdle {Tag = "TothLarEndFight"},
		},
		Actions =
		{
			FigureVanish {Tag = "TothLarEndFight"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Avatar und Helden laufen in Richtung Kaziz
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 447.96, Y = 525.606},
			FigureSimpleWalk {Tag = "pl_HumanHeroBor", X = 449.917, Y = 525.043},
			FigureSimpleWalk {Tag = "pl_HumanHeroLya", X = 451.342, Y = 524.192},
			FigureSimpleWalk {Tag = "pl_HumanHeroJared", X = 448.912, Y = 528.009},
			FigureSimpleWalk {Tag = "pl_HumanHeroShae", X = 450.838, Y = 527.699},
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 446.921, Y = 527.53},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Tor wird geschlossen
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			GateSetClosed {Tag = "Rampart_Gate01"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Kaziz läuft in Richtung Avatar und Helden
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			FigureSimpleRun {Tag = "KazizEndFight", X = 444.186, Y = 525.143},
			-- Kor und Kaziz wird Immortal wieder abgenommen(Immortal wird in den Scripten
			-- der Figuren direkt gesetzt)
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "KorEndFight"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "KazizEndFight"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Avatar und Helden werden zur Sicherheit nochmal an ihre finalen Positionen teleportiert
			FigureTeleport {Tag = "pl_HumanAvatar", X = 447.96, Y = 525.606},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 449.917, Y = 525.043},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 451.342, Y = 524.192},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 448.912, Y = 528.009},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 450.838, Y = 527.699},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 270},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 446.921, Y = 527.53},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 270},
			-- Effekt von Portal löschen
			EffectStop {Tag = "WayToIF"},
			-- Kaziz Teamchange durch die Flag und greift den Spieler an
			AvatarFlagSetTrue {Name = "af_P307_CS03Finished"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};