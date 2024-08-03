--************************************************************
--**														**
--**		Rushwater Downs Helfdan							**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Matricus'",
		"'Helfdan'",
		"'Osal'",
		"'PrisonerGuard1'",
		"'PrisonerGuard2'",
		"'PrisonerGuard3'",
		"'PrisonerGuardBoss'",
		"'PrisonGuard1'",
		"'PrisonGuard2'",
		"'PrisonGuard3'",
		"'PrisonGuard4'",
		"'PrisonGuard5'",
		"'PrisonGuard6'",
		"'PrisonGuard7'",
		"'PrisonGuard8'",
		"'PrisonGuard9'",
		"'PrisonGuard10'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf Helfdan, welcher angerannt kommt
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene03"},
				AND
				{
					AvatarFlagIsTrue {Name = "af_P303_TalkedToMatricus"},
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
			CameraTakeAddToTrack {File = "CS_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 193.095, Y = 337.042},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 188.113},
			FigureTeleport {Tag = "Matricus", X = 190.838, Y = 337.433},
			FigureLookAtDirection {Tag = "Matricus", Direction = 148.969},
			FigureTeleport {Tag = "Helfdan", X = 200.925, Y = 353.232},
			FigureLookAtDirection {Tag = "Helfdan", Direction = 325.623},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Matricus"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Matricus"},
			-- Helfdan kommt angelaufen, hat aber eh keinen Talkjob, ist ja nur Helden-Mesh-Figur
			-- Helfdan kommt angelaufen
			FigureSimpleRun {Tag = "Helfdan", X = 193.203, Y = 340.783},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Helfdan: Helfdan1
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Helfdan"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
 			CutsceneSay {TextTag = "Helfdan1", Tag = "Helfdan"},
 			-- Talkjob Helfdan
 			FigureCutsceneTalkJobSet {Tag = "Helfdan"},
 			-- Ausrichten von Helfdan
			FigureLookAtDirection {Tag = "Helfdan", Direction = 337.082},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Helfdan: Helfdan2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
 			CutsceneSay {TextTag = "Helfdan2", Tag = "Helfdan"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Matricus: Matricus1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Matricus1", Tag = "Matricus"},
			-- Ausrichten von Matricus und Avatar
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 262.597},
			FigureLookAtDirection {Tag = "Matricus", Direction = 90},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Matricus: Matricus2
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
			CutsceneSay {TextTag = "Matricus2", Tag = "Matricus"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Matricus: Matricus3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {}, -- Take06 geht nur 4 Sekunden, damit Kamera(Take07) wieder auf Matricus geht
			CameraTakeAddToTrack {File = "CS_03_Take06", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_03_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Matricus3", Tag = "Matricus"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Matricus: Matricus4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Matricus4", Tag = "Matricus"},
			EntityTimerStart {Name = "et_CStimer"},
			EntityTimerStart {Name = "et_CStimerA"},
		},
	},
	OnOneTimeEvent	-- Kamera auf Dorf Connach
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
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
			FigureStop {Tag = "Matricus"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Matricus"},
			-- Helfdan läuft zurück zur Editorposition
			MapFlagSetTrue {Name = "mf_Cutscene03_Finished"},
			-- Scriptingkram für die Karte
			PlayerKitTransfer {PlayerKit = "pk_PlayerAllies", Player = "pl_Human"},
			PlayerActivate {Player = "pl_Clans"},
			GateSetOpen {Tag = "GateOrcs1"},
			GateSetOpen {Tag = "GateOrcs2"},
			GateSetOpen {Tag = "GateOrcs3"},
			GateSetOpen {Tag = "GateOrcs4"},
			QuestSetSolved {Quest = "RushwaterPart2SpeakToMatricus"},
			QuestSetActive {Quest = "RushwaterPart3FightOrcs"},
			QuestSetActive {Quest = "DefendLyraine"},
			QuestSetActive {Quest = "DestroyOrcCamps"},
			FogOfWarRevealAtEntity {Tag = "OrcCampBoss", Range = 15},
			FogOfWarRevealAtEntity {Tag = "Osal", Range = 7},
			AvatarFlagSetTrue {Name = "af_P303_CastleCutsceneEnd"},
			MapTimerStart {Name = "mt_P303_Brake"},
			-- Dem Spieler noch die "Baupläne" geben
			-- Ordenshaus
			PlayerBuildingAdd {Player = "pl_Human", BuildingId = 124},
			-- Turm
			PlayerBuildingAdd {Player = "pl_Human", BuildingId = 120},
			--  Alchemist
			PlayerBuildingAdd {Player = "pl_Human", BuildingId = 118},
			-- Menschen Turmupgrade
			PlayerBuildingUpgradeAdd {Player = "pl_Human", UpgradeId = 007},
			-- Menschen Headquaterupdate
			PlayerBuildingUpgradeAdd {Player = "pl_Human", UpgradeId = 011},


			-- Ab jetzt teilt der Spieler die Sicht mit der Stadt
			FogOfWarTeamAdd {Team = "tm_HumanPlayer"}
		},
	},
	OnOneTimeEvent	-- Helfdan läuft zurück zur Editorposition
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Cutscene03_Finished"},
		},
		Actions =
		{
			FigureWalk {Tag = "Helfdan", X = 254.382, Y = 341.912},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};