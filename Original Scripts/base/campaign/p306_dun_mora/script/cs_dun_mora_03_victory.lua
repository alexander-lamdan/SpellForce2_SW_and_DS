--************************************************************
--**														**
--**		Dun Mora Victory								**
--**														**
--************************************************************
-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Sansha'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf Avatar und Sansha
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene03"},
				AND
				{
					MapFlagIsTrue {Name = "mf_IoGone"},
					MapFlagIsTrue {Name = "mf_CutsceneSanshaInit"},
					FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Sansha", Range = 10},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible	{},
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
			FigureTeleport {Tag = "pl_HumanAvatar", X = 318.508, Y = 377.574},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "Sansha", X = 316.014, Y = 377.574},
			FigureLookAtDirection {Tag = "Sansha", Direction = 90},
			FigureTeleport {Tag = "ElvenGuard03", X = 319.763, Y = 374.626},
			FigureLookAtDirection {Tag = "ElvenGuard03", Direction = 84.981},
			FigureTeleport {Tag = "ElvenGuard04", X = 317.852, Y = 375.264},
			FigureLookAtDirection {Tag = "ElvenGuard04", Direction = 126.051},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Sansha"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Sansha"},
			-- IdleGoHome für Io wird deaktiviert(nehme ich an)
			MapFlagSetTrue {Name = "mf_P306_IoNoIdleGoHome"},
			-- Portaleffekt starten
			EffectStart {Tag = "Portal_Start", File = "Effect_Spawn_Gate"},
			-- Io wird gelöscht, falls da, was sie aber eigentlich nicht sein sollte
			FigureVanish {Tag = "Io"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};

State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- Avatar: Avatar4
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar4b", Tag = "pl_HumanAvatar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Sansha: Sansha1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sansha1", Tag = "Sansha"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Sansha: Sansha2
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
			CutsceneSay {TextTag = "Sansha2", Tag = "Sansha"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Kamera auf Portal
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
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Io spawnt im Portal,Spawn der Arbeiter 03 bis 10 in der Nähe von Sansha
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_IoIntoCutscene"},
			MapFlagSetTrue	{Name = "mf_CS_03_Worker03_10_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Io geht aus Portal
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Io", X = 404.756, Y = 418.485},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Worker01 erscheint im Portal, und geht kurz darauf aus dem Portal(Walkbefehl im Worker-Script)
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_03_Worker01_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Worker02 erscheint im Portal, und geht kurz darauf aus dem Portal(Walkbefehl im Worker-Script)
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_03_Worker02_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		--GotoState = "Cutscene08",
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Umtelepotieren von Io und den Workern(hinter der Kamera)
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureTeleport {Tag = "Io", X = 336.315, Y = 377.574},
			FigureLookAtDirection {Tag = "Io", Direction = 270},
			FigureTeleport {Tag = "CS_03_Worker01", X = 337.686, Y = 376.507},
			FigureLookAtDirection {Tag = "CS_03_Worker01", Direction = 270},
			FigureTeleport {Tag = "CS_03_Worker02", X = 338.282, Y = 378.259},
			FigureLookAtDirection {Tag = "CS_03_Worker02", Direction = 270},
			FigureTeleport {Tag = "CS_03_Worker03", X = 339.162, Y = 377.453},
			FigureLookAtDirection {Tag = "CS_03_Worker03", Direction = 270},
			-- Io geht in Richtung der Königin, Arbeiter 04/08 gehen zur Königin
			FigureSimpleWalk {Tag = "Io", X = 322.891, Y = 377.574},
			FigureSimpleWalk {Tag = "CS_03_Worker04", X = 326.567, Y = 376.474},
			FigureSimpleWalk {Tag = "CS_03_Worker08", X = 328.858, Y = 378.632},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

-- BLEEEEEENNNNNNDEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE!!!!!!!!!!!!!!!!! :-)

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Worker01/05/09 gehen in Richtung der Königin
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "CS_03_Worker01", X = 324.195, Y = 376.507},
			FigureSimpleWalk {Tag = "CS_03_Worker05", X = 327.251, Y = 377.859},
			FigureSimpleWalk {Tag = "CS_03_Worker09", X = 329.597, Y = 377.478},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Worker02/06/10 gehen in Richtung der Königin
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "CS_03_Worker02", X = 324.85, Y = 378.259},
			FigureSimpleWalk {Tag = "CS_03_Worker06", X = 326.388, Y = 378.918},
			FigureSimpleWalk {Tag = "CS_03_Worker10", X = 330.683, Y = 378.732},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Kamera auf Avatar und Sansha & Worker03/07 gehen in Richtung der Königin
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "CS_03_Worker03", X = 325.758, Y = 377.453},
			FigureSimpleWalk {Tag = "CS_03_Worker07", X = 328.346, Y = 376.865},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Io: Io1
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Io"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Io1", Tag = "Io"},
			-- Talkjob
			FigureCutsceneTalkJobSet {Tag = "Io"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Avatar: Avatar5
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar5", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Sansha: Sansha3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sansha3", Tag = "Sansha"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Sansha4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay {TextTag = "Sansha4", Tag = "Sansha"},
			EntityTimerStart {Name = "et_CStimerA"},
			EntityTimerStart {Name = "et_CStimer"},
		},
	},
	OnOneTimeEvent	-- Kamerawechsel
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			EntityTimerStop {Name = "et_CStimer"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- kurze Pause nach CutsceneSay
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
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
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
			FigureStop {Tag = "Sansha"},
			FigureStop {Tag = "Io"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Sansha"},
			CutsceneFigureWeaponsShow {Tag = "Io"},
			-- Effekt auf Portal wird gestoppt
			EffectStop {Tag = "Portal_Start"},
			-- IdleGoHome von Io greift wieder(nehme ich an)
			MapFlagSetFalse {Name = "mf_P306_IoNoIdleGoHome"},
			-- Richtiger Arbeiter werden gespawnt
			NoSpawnEffect {Spawn = FigureRtsKitSpawn {UnitId = 69, Level = 7, X = 322.164, Y = 380.78, PlayerKit = "pk_Reinforcement"},},
			NoSpawnEffect {Spawn = FigureRtsKitSpawn {UnitId = 69, Level = 7, X = 323.353, Y = 380.5, PlayerKit = "pk_Reinforcement"},},
			NoSpawnEffect {Spawn = FigureRtsKitSpawn {UnitId = 69, Level = 7, X = 324.775, Y = 380.627, PlayerKit = "pk_Reinforcement"},},
			NoSpawnEffect {Spawn = FigureRtsKitSpawn {UnitId = 69, Level = 7, X = 326.194, Y = 380.699, PlayerKit = "pk_Reinforcement"},},
			NoSpawnEffect {Spawn = FigureRtsKitSpawn {UnitId = 69, Level = 7, X = 327.493, Y = 380.682, PlayerKit = "pk_Reinforcement"},},
			NoSpawnEffect {Spawn = FigureRtsKitSpawn {UnitId = 69, Level = 7, X = 328.973, Y = 380.745, PlayerKit = "pk_Reinforcement"},},
			NoSpawnEffect {Spawn = FigureRtsKitSpawn {UnitId = 69, Level = 7, X = 330.333, Y = 380.708, PlayerKit = "pk_Reinforcement"},},
			NoSpawnEffect {Spawn = FigureRtsKitSpawn {UnitId = 69, Level = 7, X = 331.797, Y = 380.492, PlayerKit = "pk_Reinforcement"},},
			-- Cutscene Arbeiter werden gelöscht
			FigureVanish {Tag = "CS_03_Worker01"},
			FigureVanish {Tag = "CS_03_Worker02"},
			FigureVanish {Tag = "CS_03_Worker03"},
			FigureVanish {Tag = "CS_03_Worker04"},
			FigureVanish {Tag = "CS_03_Worker05"},
			FigureVanish {Tag = "CS_03_Worker06"},
			FigureVanish {Tag = "CS_03_Worker07"},
			FigureVanish {Tag = "CS_03_Worker08"},
			FigureVanish {Tag = "CS_03_Worker09"},
			FigureVanish {Tag = "CS_03_Worker10"},
			-- Scriptingkram für die Karte
			PlayerKitTransfer	{PlayerKit = "pk_Reinforcement"}, --Arbeiter uebergeben
			MapFlagSetTrue {Name = "mf_TechtreeFree"},
			MapFlagSetTrue	{Name = "mf_CutsceneSanshaDone"}, 
			--MapFlagSetTrue	{Name = "mf_PlayerTalkedToSansha2"}, --Flag fuer RewardScript
			QuestSetSolved	{Player = "default", Quest = "ReturnToSansha"},
			QuestSetActive	{Player = "default", Quest = "DefendAgainstDemons2"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};