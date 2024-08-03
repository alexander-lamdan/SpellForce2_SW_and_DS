--************************************************************
--**														**
--**		Golden Fields Part II - Hagard					**
--**														**
--************************************************************

-- zum testen: MapFlagSetTrue {Name = "mf_CutsceneB01_Hagard_Spawn"},

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Hagard'",
		"'Ylia'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Hagard läuft zum Turm
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneB01"},
				AND
				{
					AvatarFlagIsTrue {Name = "af_P304_Cutscene04Start"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
				},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 248.144, Y = 621.581},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureTeleport {Tag = "Hagard", X = 248.103, Y = 624.153},
			FigureLookAtDirection {Tag = "Hagard", Direction = 0},
			FigureTeleport {Tag = "Ylia", X = 276.801, Y = 687.373},
			FigureLookAtDirection {Tag = "Ylia", Direction = 90},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Ylia"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Ylia"},
			CutsceneFigureWeaponsHide {Tag = "Hagard"},
			-- Hagrad läuft in Richtung des Turms
			FigureSimpleRun {Tag = "Hagard", X = 248.778, Y = 646.262},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Teleport Hagard auf neue Startposition zum Laufen
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_B_01_Take02a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureTeleport {Tag = "Hagard", X = 288.298, Y = 670.899},
			FigureLookAtDirection {Tag = "Hagard", Direction = 270},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Ylia: HagardBoohoo_01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "HagardBoohoo_01", Tag = "Ylia"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Hagard läuft weiter zum Turm
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "Hagard", X = 275.124, Y = 671.285},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Ylia: HagardBoohoo_02 & Teleport Hagard auf neue Startposition zum Laufen
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "HagardBoohoo_02", Tag = "Ylia"},
			FigureTeleport {Tag = "Hagard", X = 289.672, Y = 687.262},
			FigureLookAtDirection {Tag = "Hagard", Direction = 270},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Hagard läuft zu Ylia
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "Hagard", X = 280.061 , Y = 687.361},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06a",
	},
};

State
{
	StateName = "Cutscene06a",
	OnOneTimeEvent	-- Kamera auf Hagard und Ylia
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Hagard"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Talkjob
			FigureCutsceneTalkJobSet {Tag = "Hagard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06b",
	},
};

State
{
	StateName = "Cutscene06b",
	OnOneTimeEvent	-- Hagard spielt Cast-Anim ab
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			-- Hagard spielt Castanim ab
			FigureAnimPlayOnce	{Tag = "Hagard", File = "base/gfx/figures/hero/figure_hero_male_resolve_enemy.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06c",
	},
};

State
{
	StateName = "Cutscene06c",
	OnOneTimeEvent	-- Hagard castet Pain
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.35},
		},
		Actions =
		{
			FigureCastSpellToEntity	{Tag = "Hagard", Spell = 11, Power = 1, TargetTag = "Ylia"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Ylia: HagardBoohoo_03
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "HagardBoohoo_03", Tag = "Ylia"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08a",
	},
};

State
{
	StateName = "Cutscene08a",
	OnOneTimeEvent	-- Hagard spielt Cast-Anim
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{	
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Hagard spielt Cast-Anim
			FigureAnimPlayOnce	{Tag = "Hagard", File = "base/gfx/figures/hero/figure_hero_male_resolve_self.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08b",
	},
};

State
{
	StateName = "Cutscene08b",
	OnOneTimeEvent	-- Hagard friert Ylia ein
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.35},
		},
		Actions =
		{
			--FigureCastSpellToEntity	{Tag = "Hagard", Spell = 78, Power = 1, TargetTag = "Ylia"},
			FigureCastSpellToEntity	{Tag = "Hagard", Spell = 218, Power = 1, TargetTag = "Ylia"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Hagard: HagardBoohoo_04
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.7},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "HagardBoohoo_04", Tag = "Hagard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Kurze Pause nach CutsceneSay
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{

			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Talkjobs beenden
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "Ylia"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Ylia"},
			CutsceneFigureWeaponsShow {Tag = "Hagard"},
			-- Effekt wird von Ylia genommen
			--EffectStop {Tag = "Ylia"},
			-- Yalia behält den Talkjob, da sie gefroren sein sollte,
			-- und später gelöscht und neu gespawnt wird
			-- Respawn für Ylia wird gestartet, damit der Effekt verschwindet
			MapFlagSetTrue {Name = "mf_P304_CS_B_01_Respawn"},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue{Name ="af_P314_HagardSummonsSverants"},
			AvatarFlagSetTrue {Name = "af_P304_CS04Finished"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};