--************************************************************
--**														**
--**		Tuscari Wasteland First Realms Beaten			**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Torshak'",
		"'Eisenfuerst'",
		-- Feinde im Camp
		"'Reetho'",
		"'Sym'",
		"'OutpostChief'",
		"'OutpostGuy01'",
		"'OutpostGuy02'",
		"'OutpostGuy03'",
		"'OutpostGuy04'",
		"'OutpostGuy05'",
		"'OutpostGuy06'",
		"'OutpostGuy07'",
		"'OutpostGuy08'",
		"'OutpostGuy09'",
		"'OutpostGuy10'",
		"'OutpostGuy11'",
		"'OutpostGuy12'",
		"'OutpostGuy13'",
		"'OutpostGuy14'",
		"'OutpostGuy15'",
		"'OutpostGuy16'",
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
			-- erste Cutscene Vanish
			FigureVanish {Tag = "CS_01_Avatar01"},
			FigureVanish {Tag = "CS_01_Torshak01"},
			FigureVanish {Tag = "CS_01_IronLord01"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Avatar01"},
			FigureVanish {Tag = "CS_02_IronLord01"},
			FigureVanish {Tag = "CS_02_Reetho01"},
			FigureVanish {Tag = "CS_02_Reetho02"},
			FigureVanish {Tag = "CS_02_Orc01"},
			FigureVanish {Tag = "CS_02_Orc02"},
			-- dritte Cutscene Vanish
			FigureVanish {Tag = "CS_03_Greif01"},
			FigureVanish {Tag = "CS_03_Greif02"},
			FigureVanish {Tag = "CS_03_Greif03"},
			FigureVanish {Tag = "CS_03_Aramin01"},
			FigureVanish {Tag = "CS_03_Sorok01"},
		},
	},
	OnCutsceneFigureRespawnEvent
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene01"},
				AvatarFlagIsTrue {Name = "af_P314_Cutscene01Begin"},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "Torshak", X = 137.274, Y = 421.684},
			FigureLookAtDirection {Tag = "Torshak", Direction = 274.056},
			FigureTeleport {Tag = "Eisenfuerst", X = 134.822, Y = 420.289},
			FigureLookAtDirection {Tag = "Eisenfuerst", Direction = 97.403},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 134.497, Y = 422.319},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 91.673},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Torshak"},
			FigureCutsceneTalkJobSet {Tag = "Eisenfuerst"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "Torshak"},
			CutsceneFigureWeaponsHide {Tag = "Eisenfuerst"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	}
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Torshak: FirstVictory01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "FirstVictory01", Tag = "Torshak"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Torshak: FirstVictory02, Kamera auf das Lager und Sorok
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstVictory02", Tag = "Torshak"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Eisenfürst: FirstVictory03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FirstVictory03", Tag = "Eisenfuerst"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
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
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
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
			FigureStop {Tag = "Torshak"},
			FigureStop {Tag = "Eisenfuerst"},
			FigureStop {Tag = "pl_HumanAvatar"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "Torshak"},
			CutsceneFigureWeaponsShow {Tag = "Eisenfuerst"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			-- Orks werden zurück an ihre Positionen aus dem Editor teleportiert
			CutsceneFigureTeleportBack	{Tag = "Ork01"},
			CutsceneFigureTeleportBack	{Tag = "Ork02"},
			CutsceneFigureTeleportBack	{Tag = "Ork03"},
			CutsceneFigureTeleportBack	{Tag = "Ork04"},
			CutsceneFigureTeleportBack	{Tag = "Ork05"},
			CutsceneFigureTeleportBack	{Tag = "Ork06"},
			CutsceneFigureTeleportBack	{Tag = "Ork07"},
			CutsceneFigureTeleportBack	{Tag = "Ork08"},
			CutsceneFigureTeleportBack	{Tag = "Ork09"},
			CutsceneFigureTeleportBack	{Tag = "Ork10"},
			CutsceneFigureTeleportBack	{Tag = "Ork11"},
			CutsceneFigureTeleportBack	{Tag = "Ork12"},
			CutsceneFigureTeleportBack	{Tag = "Ork13"},
			CutsceneFigureTeleportBack	{Tag = "Ork14"},
			CutsceneFigureTeleportBack	{Tag = "Ork15"},
			CutsceneFigureTeleportBack	{Tag = "Ork16"},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P314_CS01Finished"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};