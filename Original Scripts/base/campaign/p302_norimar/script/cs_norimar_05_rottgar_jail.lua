--************************************************************
--**														**
--**		Norimar Rottgar Jail							**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "Rottgar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Rottgar_Jail_Guard01'",
		"'Rottgar_Jail_Guard02'",
		"'Rottgar_Jail_Guard03'",
		"'Rottgar_Jail_Guard04'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kommentar
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene05"},
				AND
				{
					MapFlagIsTrue {Name = "mf_P302_Rottgar_Geht_In_Das_Gefaengnis_Und_Geht_Nicht_Ueber_Los"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
				},
			},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "Rottgar", X = 442.319, Y = 616.533},
			FigureLookAtDirection {Tag = "Rottgar", Direction = 285.516},
			FigureTeleport {Tag = "Rottgar_Jail_Guard01", X = 428.4, Y = 613.2},
			FigureLookAtDirection {Tag = "Rottgar_Jail_Guard01", Direction = 90},
			FigureTeleport {Tag = "Rottgar_Jail_Guard02", X = 428.4, Y = 611.8},
			FigureLookAtDirection {Tag = "Rottgar_Jail_Guard02", Direction = 90},
			FigureTeleport {Tag = "Rottgar_Jail_Guard03", X = 429.8, Y = 613.2},
			FigureLookAtDirection {Tag = "Rottgar_Jail_Guard03", Direction = 90},
			FigureTeleport {Tag = "Rottgar_Jail_Guard04", X = 429.8, Y = 611.8},
			FigureLookAtDirection {Tag = "Rottgar_Jail_Guard04", Direction = 90},
			-- Wachen gehen zu Rottgar
			FigureSimpleWalk {Tag = "Rottgar_Jail_Guard01", X = 435.4, Y = 613.2},
			FigureSimpleWalk {Tag = "Rottgar_Jail_Guard02", X = 435.4, Y = 611.8},
			FigureSimpleWalk {Tag = "Rottgar_Jail_Guard03", X = 436.8, Y = 613.2},
			FigureSimpleWalk {Tag = "Rottgar_Jail_Guard04", X = 436.8, Y = 611.8},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "Rottgar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Wachen geleiten Rottgar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "Rottgar", X = 420.087, Y = 601.219},
			FigureLookAtDirection {Tag = "Rottgar", Direction = 0},
			FigureTeleport {Tag = "Rottgar_Jail_Guard01", X = 420.755, Y = 602.647},
			FigureLookAtDirection {Tag = "Rottgar_Jail_Guard01", Direction = 0},
			FigureTeleport {Tag = "Rottgar_Jail_Guard02", X = 419.355, Y = 602.647},
			FigureLookAtDirection {Tag = "Rottgar_Jail_Guard02", Direction = 0},
			FigureTeleport {Tag = "Rottgar_Jail_Guard03", X = 420.755, Y = 599.847},
			FigureLookAtDirection {Tag = "Rottgar_Jail_Guard03", Direction = 0},
			FigureTeleport {Tag = "Rottgar_Jail_Guard04", X = 419.355, Y = 599.847},
			FigureLookAtDirection {Tag = "Rottgar_Jail_Guard04", Direction = 0},
			-- Akteure gehen
			FigureSimpleWalk {Tag = "Rottgar", X = 420.087, Y = 588.651},
			FigureSimpleWalk {Tag = "Rottgar_Jail_Guard01", X = 420.755, Y = 590.047},
			FigureSimpleWalk {Tag = "Rottgar_Jail_Guard02", X = 419.355, Y = 590.047},
			FigureSimpleWalk {Tag = "Rottgar_Jail_Guard03", X = 420.755, Y = 587.247},
			FigureSimpleWalk {Tag = "Rottgar_Jail_Guard04", X = 419.355, Y = 587.247},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Rottgar geht in das Gefängnis
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "Rottgar", X = 457.076, Y = 595.288},
			FigureLookAtDirection {Tag = "Rottgar", Direction = 180},
			FigureTeleport {Tag = "Rottgar_Jail_Guard01", X = 455.189, Y = 598.071},
			FigureLookAtDirection {Tag = "Rottgar_Jail_Guard01", Direction = 90},
			FigureTeleport {Tag = "Rottgar_Jail_Guard02", X = 455.331, Y = 595.239},
			FigureLookAtDirection {Tag = "Rottgar_Jail_Guard02", Direction = 90},
			FigureTeleport {Tag = "Rottgar_Jail_Guard03", X = 458.555, Y = 598.059},
			FigureLookAtDirection {Tag = "Rottgar_Jail_Guard03", Direction = 270},
			FigureTeleport {Tag = "Rottgar_Jail_Guard04", X = 458.638, Y = 595.255},
			FigureLookAtDirection {Tag = "Rottgar_Jail_Guard04", Direction = 270},
			-- Rottgar geht ins Gefängnis
			FigureSimpleWalk {Tag = "Rottgar", X = 456.935, Y = 598.733},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- SOUND: Play Jail Door
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P302_Norimar_01_SOUND_Play_Jail_Door"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.2},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Rottgar wird gelöscht
			FigureVanish {Tag = "Rottgar"},
			-- Wachen werden zurück gesetzt
			CutsceneFigureTeleportBack {Tag = "Rottgar_Jail_Guard01"},
			CutsceneFigureTeleportBack {Tag = "Rottgar_Jail_Guard02"},
			CutsceneFigureTeleportBack {Tag = "Rottgar_Jail_Guard03"},
			CutsceneFigureTeleportBack {Tag = "Rottgar_Jail_Guard04"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};

