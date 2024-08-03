--************************************************************
--**														**
--**		Dun Mora Extro									**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Io'",
		"'Sansha'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf Io, Sansha und Avatar
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene04"},
				AND
				{
					MapFlagIsTrue	{Name = "mf_CutsceneEndInit"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
					FigureIsNotInCombat {Tag = "Io"},
				},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 318.508, Y = 377.574},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "Io", X = 316.337, Y = 379.598},
			FigureLookAtDirection {Tag = "Io", Direction = 57.915},
			FigureTeleport {Tag = "Sansha", X = 316.014, Y = 377.574},
			FigureLookAtDirection {Tag = "Sansha", Direction = 90},
			FigureTeleport {Tag = "ElvenGuard03", X = 319.763, Y = 374.626},
			FigureLookAtDirection {Tag = "ElvenGuard03", Direction = 84.981},
			FigureTeleport {Tag = "ElvenGuard04", X = 317.852, Y = 375.264},
			FigureLookAtDirection {Tag = "ElvenGuard04", Direction = 126.051},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Io"},
			FigureCutsceneTalkJobSet {Tag = "Sansha"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Io"},
			CutsceneFigureWeaponsHide {Tag = "Sansha"},
			-- IdleGoHome für Io wird deaktiviert(nehme ich an)
			MapFlagSetTrue {Name = "mf_P306_IoNoIdleGoHome"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Io2
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Io2", Tag = "Io"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar6
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar6", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Io3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Io3", Tag = "Io"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Sansha5
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sansha5", Tag = "Sansha"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Sansha6
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sansha6", Tag = "Sansha"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Io4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Io4", Tag = "Io"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
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
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
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
			FigureStop {Tag = "Io"},
			FigureStop {Tag = "Sansha"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Io"},
			CutsceneFigureWeaponsShow {Tag = "Sansha"},
			-- Scriptingkram für die Karte
			MapFlagSetTrue {Name = "mf_GotTheElves"}, --Flag fuer RewardScript
			--QuestSetSolved	{Player = "default", Quest = "IoMustLiveDunMora"},
			QuestSetActive	{Player = "default", Quest = "ReturnToGF"},
			PlayerTravelEnable	{},
			PortalEnable	{Tag = "Portal_Start"},
			AvatarFlagSetTrue{Name = "af_P304_FirstReturnToGoldenFields"},
			AvatarFlagSetTrue{Name = "af_P304_SecondReturnToGoldenFields"},
			--- damit auf Golden Fields klar ist, daß der Spieler zum dritten Mal dorthin zurückkehrt 
			
			MapFlagSetTrue	{Name = "mf_EndOfMapGhostQuest"}, --falls geister nicht befreit, Questen loesen, Dialoge disablen;
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};