--************************************************************
--**														**
--**		Cutscene Gate of Swords Clans Camp				**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanNightsong'",
		"'HomeCrew3'",
		"'HomeCrew4'",
		"'HomeCrew5'",
		"'HomeCrew6'",
		"'HomeCrew7'",
		"'HomeCrew8'",
		"'Kor'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene02"},
				AND
				{
					FigureIsInRange	{Range = 8, X = 277, Y = 626, Tag = "pl_HumanAvatar"},
					--!!! Kaputt !!!
					PlayerFigureIsNotInRange	{Range = 30, X = 307, Y = 638, Player = "pl_EnemyPact"},
					PlayerFigureIsNotInRange	{Range = 30, X = 268, Y = 611, Player = "pl_EnemyPact"},
				},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 279.015, Y = 628.938},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 325},
			FigureTeleport {Tag = "pl_HumanNightSong", X = 281.297, Y = 626.951},
			FigureLookAtDirection {Tag = "pl_HumanNightSong", Direction = 317},
			FigureTeleport {Tag = "Kor", X = 269.183, Y = 615.916},
			FigureLookAtDirection {Tag = "Kor", Direction = 137.51},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Kor"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightSong"},
			CutsceneFigureWeaponsHide {Tag = "Kor"},
			-- Avatar und Schattenlied gehen zu Kor
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 270.428, Y = 619.53},
			FigureSimpleWalk {Tag = "pl_HumanNightSong", X = 272.941, Y = 617.559},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	}
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Kor: Kor1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Kor1", Tag = "Kor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar: Avatar1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			FigureIsIdle {Tag = "pl_HumanAvatar"},
			FigureIsIdle {Tag = "pl_HumanNightsong"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar1", Tag = "pl_HumanAvatar"},
			-- Ausrichten der Akteure
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 346.249},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 298.121},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Kor: Kor2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Kor2", Tag = "Kor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kor: Kor3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Kor3", Tag = "Kor"},
			EntityTimerStart {Name = "et_CStimer"},
			EntityTimerStart {Name = "et_CStimerA"},
		},
	},
	OnOneTimeEvent	-- Kamera zeigt das Gate of Swords
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStop {Name = "et_CStimerA"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Kor: Kor4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Kor4", Tag = "Kor"},
			EntityTimerStart {Name = "et_CStimer"},
			EntityTimerStart {Name = "et_CStimerA"},
		},
	},
	OnOneTimeEvent	-- Kamera wieder auf Kor
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStop {Name = "et_CStimerA"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
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
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
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
			FigureStop {Tag = "pl_HumanNightsong"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightSong"},
			CutsceneFigureWeaponsShow {Tag = "Kor"},			
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P309_CutsceneKorEnd"},
			PlayerActivate	{Player = "pl_EnemyPact"},
			PlayerKitTransfer {PlayerKit = "pk_Kor"},
			QuestSetSolved {Quest = "ReachKor"},
			QuestSetActive {Quest = "ThroughTheGate"},
			-- Dem Spieler noch die "Baupläne" geben
			-- Bauernhof
			PlayerBuildingAdd {Player = "pl_Human", BuildingId = 162},
			-- Haupthaus
			PlayerBuildingAdd {Player = "pl_Human", BuildingId = 163},
			-- Heldenhalle
			PlayerBuildingAdd {Player = "pl_Human", BuildingId = 156},
			--  Bogenmacher
			PlayerBuildingAdd {Player = "pl_Human", BuildingId = 161},
			---- Orks Hauptquartierupdate
			--PlayerBuildingUpgradeAdd {Player = "pl_Human", UpgradeId = 029},
			--
			-- Clans Armory
			PlayerBuildingUpgradeAdd {Player = "pl_Human", UpgradeId = 027},
			FigureVanish {Tag = "Kor"},
			PlayerHeroAdd {Player = "pl_Human", HeroId = 26},
			-- Systemnachricht, für Korübergabe
			FigureOutcry {TextTag = "System1", Tag = "System_Npc"}, --SYSTEM-OC: sie haben den Kor
			NoSpawnEffect {Spawn = FigureHeroSpawn {Player = "default", Tag = "Kor", X = 269.183, Y = 615.916, Direction = 137.51},},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};