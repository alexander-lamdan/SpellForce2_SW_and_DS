--************************************************************
--**														**
--**		Golden Fields Part I Palace Reached				**
--**														**
--************************************************************

-- Zum Testen vor das Schloß laufen

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Ylia'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Avatar und Königin laufen in Richtung Elfenhain
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneB02"},
				AND
				{
					AvatarValueIsEqual {Name = "av_P304_TalkWithYlia", Value = 1 },
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
			CameraTakeAddToTrack {File = "CS_B_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 278, Y = 688.8},
			FigureLookAtDirection {Tag = "pl_HumanAVatar", Direction = 320},
			FigureTeleport {Tag = "Ylia", X = 276.801, Y = 687.373},
			FigureLookAtDirection {Tag = "Ylia", Direction = 90},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Ylia"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};

State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- Ylia läuft los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Ylia",X = 289, Y = 687.373},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar läuft auch los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 289, Y = 688.8},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Akteure werden umteleportiert und gehen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			FigureTeleport {Tag = "pl_HumanAvatar", X = 161, Y = 418.6},
			FigureLookAtDirection {Tag = "pl_HumanAVatar", Direction = 90},
			FigureTeleport {Tag = "Ylia", X = 165.2, Y = 420},
			FigureLookAtDirection {Tag = "Ylia", Direction = 90},
			-- Akteure laufen los
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 177.8, Y = 418.6},
			FigureSimpleWalk {Tag = "Ylia", X = 182, Y = 420},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Kamera auf Akteure
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
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
			FigureIsIdle {Tag = "Ylia"},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Ylia wird auf den Avatar ausgerichtet
			FigureLookAtEntity	{Tag = "Ylia", TargetTag = "pl_HumanAvatar"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Ylia"},
			-- Scriptingkram für die Karte
			-- bitte hierher
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};