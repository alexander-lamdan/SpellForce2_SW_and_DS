--************************************************************
--**														**
--**		Iron Fields A Lyas Corpse						**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanHeroBor'",
		"'LyaCorpse'",
		-- Lya geht automatisch in die Renderliste wenn sie gespawnt wird
	}
}



State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Avatar und Bor gehen in Richtung des Hauses
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneA02"},
				AND
				{
					MapFlagIsTrue {Name = "mf_P301_CutsceneLyasHouse"},
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
			CameraTakeAddToTrack {File = "CS_A_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 258.992, Y = 410.129},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 135},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 259.079, Y = 407.395},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 135},
			-- Waffen Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsHide {Tag = "LyaCorpse"},
			-- Avatar und Bor gehen zu Lyas Haus
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 263.217, Y = 414.445},
			FigureSimpleWalk {Tag = "pl_HumanHeroBor", X = 263.228, Y = 411.644},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Bor5
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanHeroBor"},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Bor5", Tag = "pl_HumanHeroBor"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar und Bor laufen zum Zaun
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "pl_HumanAvatar", X = 271.431, Y = 411.46},
			FigureSimpleRun {Tag = "pl_HumanHeroBor", X = 269.587, Y = 409.41},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02a",
	},
};

State
{
	StateName = "Cutscene02a",
	OnOneTimeEvent	-- Avatar: Avatar2_1 & Kamera auf Avatar
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanAvatar"},
			FigureIsIdle {Tag = "pl_HumanHeroBor"},
			-- Timer wegen Kamerafahrt auf das Gesicht vom Avatar
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Ausrichten der Akteure
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 47.5555},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 63.5983},			
			-- Talkjobs neu setzen
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroBor"},			
			-- Avatar labert
			CutsceneSay {TextTag = "Avatar2_1", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Bor7 & Kamera auf Lya
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			-- Timer wegen Kamerafahrt auf das Gesicht vom Avatar
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_02_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Bor7", Tag = "pl_HumanHeroBor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};
State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kamera nochmal auf Avatar, wegen Lya Spawn und Kill
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Lya als Npc wird gelöscht
			FigureVanish {Tag = "LyaCorpse"},
			-- Lya wird als Held gespawnt
			PlayerHeroAdd {Player = "pl_Human", HeroId = 9},
			FigureOutcry {TextTag = "System2", Tag = "System_Npc"}, --SYSTEM-OC: sie haben den Realm bekommen
			NoSpawnEffect {Spawn = FigureHeroSpawn {Player = "default", Tag = "HeroLya", X = 284, Y = 399, Direction = 45},},
			-- Lya wird getötet
			FigureKill {Tag = "pl_HumanHeroLya"},
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
			-- Talkjobs beenden
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "pl_HumanHeroBor"},
			-- Waffen Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroBor"},
			-- Waffen Hide(Lya schonmal für nächste Cutscene)
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroLya"},
			-- Lya wird gekillt, geht noch nicht anders
			-- FigureKill	{Tag = "pl_HumanHeroLya"},
			-- Scriptingkram für die Karte
			QuestSetActive {Quest = "ReviveLya"},
			MapTimerStart {Name = "mt_P301CutsceneOneSafetyTimer"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};