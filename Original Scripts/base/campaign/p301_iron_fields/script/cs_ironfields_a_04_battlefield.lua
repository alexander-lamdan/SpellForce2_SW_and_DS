--************************************************************
--**														**
--**		Iron Fields A Battlefield						**
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
		"'NightSong_Fight'",
		"'DarkElfRanger'",
		"'NightSongEncounter2'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf kämpfende Dunkelelfen und Shadowsong
	{
		AllowCombat = true,
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneA04"},
				AND
				{
					MapFlagIsTrue {Name = "mf_P301_NightSongCutsceneStart"},
					MapFlagIsTrue {Name = "mf_P301_Tutorial"},
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
			CameraTakeAddToTrack {File = "CS_A_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 368.967, Y = 431.969},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 62.4524},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 366.933, Y = 431.139},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 79.6411},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 368.987, Y = 433.917},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 45.2637},
			-- Flag für Lyas Cutscene, falls Spieler die Uschi nicht zu sich ruft
			MapFlagSetTrue {Name = "mf_P301_CutsceeneBattlefieldStarted"},
			-- Animationen Stop
			MapFlagSetTrue {Name = "mf_CS_A_04_DarkelfRanger_Stop"},
			MapFlagSetTrue {Name = "mf_CS_A_04_NightsongEncounter_Stop"},
			MapFlagSetTrue {Name = "mf_CS_A_04_Nightsong_Fight_Stop"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	-- Sollte der Spieler die vorherige Cutscene umgangen haben müssen die Questen aufgeräumt werden
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "ReviveLya"},
			QuestIsActive {Quest = "IronFieldsPart1Lya"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "ReviveLya"},
			QuestSetSolved {Quest = "IronFieldsPart1Lya"},
			QuestSetActive {Quest = "IronFieldsPart2WarnFortress"},
		}
	},
	OnOneTimeEvent	-- DarkElfRanger1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "DarkElfRanger", Team = "tm_CutsceneRed"},
			FigureLookAtDirection {Tag = "DarkElfRanger", Direction = 224},			
			CutsceneSay {TextTag = "DarkElfRanger1", Tag = "DarkElfRanger"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- DarkElfRanger2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "DarkElfRanger2", Tag = "DarkElfRanger"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
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
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
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
			-- SOUND: Stop Schwerter
			MapFlagSetTrue {Name = "mf_P301_Tutorial_SOUND_Stop_Ambient_Old_HeroMonument"},
			-- Dunkelelfen wird Immortal weggenommen
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "DarkElfRanger"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "NightSongEncounter2"},
			-- Scriptingkram für die Karte
			FigureTeamTransfer	{Tag = "DarkElfRanger", Team = "tm_Team2"},
			FigureTeamTransfer	{Tag = "NightSongEncounter2", Team = "tm_Team2"},
			FigureTeamTransfer	{Tag = "NightSong_Fight", Team = "tm_NightsongFight"},
			QuestSetActive {Quest = "SaveNightsong"},
			--QuestSetActive {Quest = "ProtectNightsong"},
			MapFlagSetTrue {Name = "mf_P301_NightSongCutsceneShown"},
			-- !!! Kann erst ausgebaut werden, wenn Steady Companions technisch möglich sind
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};