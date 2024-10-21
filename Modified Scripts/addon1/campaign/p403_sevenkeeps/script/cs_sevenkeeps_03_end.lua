--************************************************************
--**
--**		Sevenkeeps End
--**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Redmund'",
		"'Ulf'",
		"'Halicos'",
		"'Riddengard'",
		"'Riddengards_Gang01'",
		"'Riddengards_Gang02'",
		"'Riddengards_Gang03'",
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
		"'Shaper_Cutscene'",
	}
}

-- Figuren die gerendert werden
local _tRenderListWithoutCaine = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderListWithoutCaine.tModFuncs =
{
	Add =
	{
		"'Redmund'",
		"'Ulf'",
		"'Halicos'",
		"'Riddengard'",
		"'Riddengards_Gang01'",
		"'Riddengards_Gang02'",
		"'Riddengards_Gang03'",
		"'Mordecay'",
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
		"'Shaper_Cutscene'",
	}
}

-- Figuren die gerendert werden
local _tRenderListWithCaine = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderListWithCaine.tModFuncs =
{
	Add =
	{
		"'Redmund'",
		"'Ulf'",
		"'Halicos'",
		"'Riddengard'",
		"'Riddengards_Gang01'",
		"'Riddengards_Gang02'",
		"'Riddengards_Gang03'",
		"'Mordecay'",
		"'Caine'",
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
		"'Shaper_Cutscene'",
	}
}

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
			-- Cutscene Vanish
			FigureVanish {Tag = "Dummy_CS_03_Avatar01"},
			FigureVanish {Tag = "Dummy_CS_03_Avatar02"},
			FigureVanish {Tag = "Dummy_CS_03_Redmund01"},
			FigureVanish {Tag = "Dummy_CS_03_Riddengard01"},
			FigureVanish {Tag = "Dummy_CS_03_Riddengard02"},
			FigureVanish {Tag = "Dummy_CS_03_Riddengard03"},
			FigureVanish {Tag = "Dummy_CS_03_Gang01"},
			FigureVanish {Tag = "Dummy_CS_03_Gang02"},
			FigureVanish {Tag = "Dummy_CS_03_Gang03"},
			FigureVanish {Tag = "Dummy_CS_03_Gang04"},
			FigureVanish {Tag = "Dummy_CS_03_Gang05"},
			FigureVanish {Tag = "Dummy_CS_03_Gang06"},
			FigureVanish {Tag = "Dummy_CS_03_Gang07"},
			FigureVanish {Tag = "Dummy_CS_03_Gang08"},
			FigureVanish {Tag = "Dummy_CS_03_Gang09"},
			FigureVanish {Tag = "Dummy_CS_03_Caine01"},
			FigureVanish {Tag = "Dummy_CS_03_Caine02"},
			FigureVanish {Tag = "Dummy_CS_03_Caine03"},
			FigureVanish {Tag = "Dummy_CS_03_Mordecay01"},
			FigureVanish {Tag = "Dummy_CS_03_Satras01"},
			FigureVanish {Tag = "Dummy_CS_03_Halicos01"},
			FigureVanish {Tag = "Dummy_CS_03_Halicos02"},
			FigureVanish {Tag = "Dummy_CS_03_Wisper01"},
			FigureVanish {Tag = "Dummy_CS_03_Wisper02"},
			FigureVanish {Tag = "Dummy_CS_03_Wind01"},
			FigureVanish {Tag = "Dummy_CS_03_Wind02"},
			FigureVanish {Tag = "Dummy_CS_03_Shaper01"},
			FigureVanish {Tag = "Dummy_CS_03_Shaper02"},
			FigureVanish {Tag = "Dummy_CS_03_Shaper03"},
			
			--Geweihte in Siebenburg werden gevanished
			
		},
	},
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_03"},
				AND
				{
					-- hier korrekte Startbedingungen eintragen
					MapFlagIsTrue {Name = "mf_P403_EndCS"},
					-- Avatar führt keine Dialog und die UI ist sichtbar
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
				},
			},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 439.997, Y = 319.043},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 175},
			CutsceneFigureTeleport {Tag = "Redmund", X = 442.2, Y = 318.8},
			FigureLookAtDirection {Tag = "Redmund", Direction = 195},
			CutsceneFigureTeleport {Tag = "Ulf", X = 441, Y = 323.4, },
			FigureLookAtDirection {Tag = "Ulf", Direction = 0},
			CutsceneFigureTeleport {Tag = "Riddengard", X = 438, Y = 320.8},
			FigureLookAtDirection {Tag = "Riddengard", Direction = 135},
			CutsceneFigureTeleport {Tag = "Halicos", X = 454.657, Y = 315.236},
			FigureLookAtDirection {Tag = "Halicos", Direction = 270},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 443.563, Y = 316.919},
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 200},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 444.948, Y = 317.811},
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 220},
			CutsceneFigureTeleport {Tag = "Shaper_Cutscene", X = 430, Y = 324, },
			FigureLookAtDirection {Tag = "Shaper_Cutscene", Direction = 60},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Redmund"},
			CutsceneFigureWeaponsHide {Tag = "Ulf"},
			CutsceneFigureWeaponsHide {Tag = "Halicos"},
			CutsceneFigureWeaponsHide {Tag = "Riddengard"},
			CutsceneFigureWeaponsHide {Tag = "Riddengards_Gang01"},
			CutsceneFigureWeaponsHide {Tag = "Riddengards_Gang02"},
			CutsceneFigureWeaponsHide {Tag = "Riddengards_Gang03"},
			-- Talkjobs werden gesetzt
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Redmund"},
			FigureCutsceneTalkJobSet {Tag = "Ulf"},
			FigureCutsceneTalkJobSet {Tag = "Riddengard"},
			-- Shaper wird getauscht für die Dauer der Cutscene
			FigureUnitChange {Tag = "Shaper_Cutscene", UnitId = 1216, Level = 1},
			-- Caine und Mordecay werden gespawnt
			MapFlagSetTrue {Name = "mf_Caine_Spawn"},
			MapFlagSetTrue {Name = "mf_Mordecay_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Redmund01
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			_tRenderListWithoutCaine,
			CutsceneSay {TextTag = "Redmund01", Tag = "Redmund"},
			CutsceneFigureTeleport {Tag = "Shaper_Cutscene", X = 430, Y = 324, },
			FigureLookAtDirection {Tag = "Shaper_Cutscene", Direction = 60},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Ulf02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Ulf02", Tag = "Ulf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Riddengard04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Riddengard04", Tag = "Riddengard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Riddengard05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Riddengard05", Tag = "Riddengard"},
			FigureLookAtDirection {Tag = "Riddengard", Direction = 260},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Riddengard und seine Gang gehen
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Riddengard", X = 439.6, Y = 309.4},
			FigureSimpleWalk {Tag = "Riddengards_Gang01", X = 439.6, Y = 309.4},
			FigureSimpleWalk {Tag = "Riddengards_Gang02", X = 439.6, Y = 305.2},
			FigureSimpleWalk {Tag = "Riddengards_Gang03", X = 436.8, Y = 302.4},
			FigureSimpleWalk {Tag = "Shaper_Cutscene", X = 435.4, Y = 305.2},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Kamera auf König Ulf & teleportieren von Caine, Riddengard und seiner Gang
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "Riddengard", X = 441, Y = 302.4},
			FigureLookAtDirection {Tag = "Riddengard", Direction = 0},
			CutsceneFigureTeleport {Tag = "Riddengards_Gang01", X = 442.4, Y = 305.2},
			FigureLookAtDirection {Tag = "Riddengards_Gang01", Direction = 0},
			CutsceneFigureTeleport {Tag = "Riddengards_Gang02", X = 441, Y = 306.6},
			FigureLookAtDirection {Tag = "Riddengards_Gang02", Direction = 0},
			CutsceneFigureTeleport {Tag = "Riddengards_Gang03", X = 439.6, Y = 305.2},
			FigureLookAtDirection {Tag = "Riddengards_Gang03", Direction = 0},
			CutsceneFigureTeleport {Tag = "Caine", X = 439.6, Y = 309.4},
			FigureLookAtDirection {Tag = "Caine", Direction = 0},
			CutsceneFigureTeleport {Tag = "Shaper_Cutscene", X = 438.7, Y = 307.47, },
			FigureLookAtDirection {Tag = "Shaper_Cutscene", Direction = 0},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Caine, Riddengard und seine Gang gehen weiter
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take05", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_03_Take06", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_03_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "Riddengard", X = 441, Y = 273},
			FigureSimpleWalk {Tag = "Riddengards_Gang01", X = 442.4, Y = 275.8},
			FigureSimpleWalk {Tag = "Riddengards_Gang02", X = 441, Y = 277.2},
			FigureSimpleWalk {Tag = "Riddengards_Gang03", X = 439.6, Y = 275.8},
			FigureSimpleWalk {Tag = "Caine", X = 439.6, Y = 280},
			FigureSimpleWalk {Tag = "Shaper_Cutscene", X = 438.7, Y = 278.07, },
			-- Avatar und Redmund neu ausrichten
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 15},
			FigureLookAtDirection {Tag = "Redmund", Direction = 355},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Effekt auf Caine
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			EffectStart {Tag = "Caine", File = "Effect_ShadowDestroyer_ML_Initial"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Caine wird sichtbar
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			_tRenderListWithCaine,
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Avatar11 & Caine, Riddengard und seine Gang werden wegteleportiert
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar11", Tag = "pl_HumanAvatar"},
			CutsceneFigureTeleport {Tag = "Riddengard", X = 278.6, Y = 393.4},
			FigureLookAtDirection {Tag = "Riddengard", Direction = 290},
			CutsceneFigureTeleport {Tag = "Riddengards_Gang01", X = 261.8, Y = 396.2},
			FigureLookAtDirection {Tag = "Riddengards_Gang01", Direction = 45},
			CutsceneFigureTeleport {Tag = "Riddengards_Gang02", X = 267.4, Y = 386.4},
			FigureLookAtDirection {Tag = "Riddengards_Gang02", Direction = 109},
			CutsceneFigureTeleport {Tag = "Riddengards_Gang03", X = 271.6, Y = 380.8},
			FigureLookAtDirection {Tag = "Riddengards_Gang03", Direction = 183},
			CutsceneFigureTeleport {Tag = "Caine", X = 261.8, Y = 379.4},
			FigureLookAtDirection {Tag = "Caine", Direction = 137},
			CutsceneFigureTeleport {Tag = "Shaper_Cutscene", X = 261.8, Y = 379.4},
			FigureLookAtDirection {Tag = "Shaper_Cutscene", Direction = 355},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Avatar rennt zu Mordecay, Wind und Whisper folgen ihm
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "pl_HumanAvatar", X = 441.891, Y = 303.506},
			FigureSimpleWalk {Tag = "pl_HumanHeroWind", X = 443.563, Y = 308.106},
			FigureSimpleWalk {Tag = "pl_HumanHeroWhisper", X = 444.948, Y = 307.939},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Avatar12
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "pl_HumanAvatar"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar12", Tag = "pl_HumanAvatar"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 45},
			FigureLookAtDirection {Tag = "Mordecay", Direction = 220},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Mordecay01
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Mordecay01", Tag = "Mordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Mordecay02 & Shaper_Cutscene wird umteleportiert
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take12a", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_03_Take12b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Mordecay02", Tag = "Mordecay"},
			CutsceneFigureTeleport {Tag = "Shaper_Cutscene", X = 438.6, Y = 288.47, },
			FigureLookAtDirection {Tag = "Shaper_Cutscene", Direction = 355},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Mordecay03, man sieht den Former seine Lippen zum Text bewegen
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take12c", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_03_Take12d", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Mordecay03", Tag = "Shaper_Cutscene"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Mordecay geht, Shaper_Cutscene auch
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "Mordecay", X = 439.6, Y = 280},
			FigureSimpleWalk {Tag = "Shaper_Cutscene", X = 438.7, Y = 278.07, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Kamera auf Avatar, Mordecay wird um teleportiert, Shaper wird gelöscht & Satras spawnt
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "Mordecay", X = 256.2, Y = 386.4},
			FigureLookAtDirection {Tag = "Mordecay", Direction = 75},
			FigureVanish {Tag = "Shaper_Cutscene"},
			MapFlagSetTrue {Name = "mf_Satras_Spawn"},	
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- Halicos und Satras kommen angelaufen
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{	
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "Halicos", X = 444.16, Y = 303.919},
			FigureSimpleWalk {Tag = "Satras_Cutscene", X = 442.8, Y = 300.905},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- Avatar13
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "Halicos"},
			FigureIsIdle {Tag = "Satras_Cutscene"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar13", Tag = "pl_HumanAvatar"},
			FigureLookAtDirection {Tag = "Halicos", Direction = 320},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 25},
			FigureLookAtDirection {Tag = "Satras_Cutscene", Direction = 200},
			FigureCutsceneTalkJobSet {Tag = "Satras_Cutscene"},
			FigureCutsceneTalkJobSet {Tag = "Halicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- Satras01
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Satras01", Tag = "Satras_Cutscene"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent	-- Satras02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Satras02", Tag = "Satras_Cutscene"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
	OnOneTimeEvent	-- Kamera auf Avatar
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take18", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_03_Take19", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	-- Satras03
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Satras03", Tag = "Satras_Cutscene"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	-- Satras04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take20", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Satras04", Tag = "Satras_Cutscene"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
	OnOneTimeEvent	-- Satras geht
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take22", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "Satras_Cutscene", X = 442.4, Y = 275.8},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene26",
	},
};

State
{
	StateName = "Cutscene26",
	OnOneTimeEvent	-- Halicos07 & Satras wird gelöscht
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take23", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Halicos07", Tag = "Halicos"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 90},
			FigureLookAtDirection {Tag = "Halicos", Direction = 305},
			FigureVanish {Tag = "Satras_Cutscene"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene27",
	},
};

State
{
	StateName = "Cutscene27",
	OnOneTimeEvent	-- Holycows08
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take24", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Halicos08", Tag = "Halicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene28",
	},
};

State
{
	StateName = "Cutscene28",
	OnOneTimeEvent	-- Avatar14
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar14", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene29",
	},
};

State
{
	StateName = "Cutscene29",
	OnOneTimeEvent	-- Wind01 & Ausrichtung des Avatar und Halicos
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take25", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Wind01", Tag = "pl_HumanHeroWind"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 155},
			FigureLookAtDirection {Tag = "Halicos", Direction = 195},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene30",
	},
};

State
{
	StateName = "Cutscene30",
	OnOneTimeEvent	-- Avatar15
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take26", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar15", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene31",
	},
};

State
{
	StateName = "Cutscene31",
	OnOneTimeEvent	-- Wind02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take27", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Wind02", Tag = "pl_HumanHeroWind"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene32",
	},
};

State
{
	StateName = "Cutscene32",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene33",
	},
};

State
{
	StateName = "Cutscene33",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			-- Kameras werden gestoppt, Balken verschwinden, UI wird eingeblendet
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Talkjobs werden durch den Event direkt beendet
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Waffen werden wieder dargestellt
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Redmund"},
			CutsceneFigureWeaponsShow {Tag = "Ulf"},
			CutsceneFigureWeaponsShow {Tag = "Halicos"},
			CutsceneFigureWeaponsShow {Tag = "Riddengard"},
			CutsceneFigureWeaponsShow {Tag = "Riddengards_Gang01"},
			CutsceneFigureWeaponsShow {Tag = "Riddengards_Gang02"},
			CutsceneFigureWeaponsShow {Tag = "Riddengards_Gang03"},
			-- Akteure werden gelöscht
			FigureVanish {Tag = "Shaper_Cutscene"},
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_Shaper_Cutscene_Spawn"},	
			MapFlagSetTrue {Name = "mf_EndEndeCS"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};