--************************************************************
--**														**
--**		Uram Gor Truchsess								**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanKor'",
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
				MapFlagIsTrue	{Name = "mf_Cutscene02"},
				AND
				{
					MapFlagIsTrue	{Name = "mf_UramGorPart2"},
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
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 250.96, Y = 133.138},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureTeleport {Tag = "pl_HumanKor", X = 248.197, Y = 133.209},
			FigureLookAtDirection {Tag = "pl_HumanKor", Direction = 180},
			FigureTeleport {Tag = "Orc_Mercenary_01", X = 213.106, Y = 134.593},
			FigureLookAtDirection {Tag = "Orc_Mercenary_01", Direction = 63.025},
			FigureTeleport {Tag = "Orc_Mercenary_02", X = 213.274, Y = 130.963},
			FigureLookAtDirection {Tag = "Orc_Mercenary_02", Direction = 126.051},
			FigureTeleport {Tag = "OrkArbeiter01", X = 217.974, Y = 135.261},
			FigureLookAtDirection {Tag = "OrkArbeiter01", Direction = 80.214},
			FigureTeleport {Tag = "OrkArbeiter02", X = 216.053, Y = 136.081},
			FigureLookAtDirection {Tag = "OrkArbeiter02", Direction = 80.214},
			FigureTeleport {Tag = "OrkArbeiter03", X = 215.541, Y = 133.303},
			FigureLookAtDirection {Tag = "OrkArbeiter03", Direction = 80.214},
			FigureTeleport {Tag = "OrkArbeiter04", X = 217.892, Y = 132.069},
			FigureLookAtDirection {Tag = "OrkArbeiter04", Direction = 91.673},
			FigureTeleport {Tag = "OrkArbeiter05", X = 215.642, Y = 130.9},
			FigureLookAtDirection {Tag = "OrkArbeiter05", Direction = 120.321},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanKor"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Kor: Gate_Kor01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Gate_Kor01", Tag = "pl_HumanKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02a",
	},
};

State
{
	StateName = "Cutscene02a",
	OnOneTimeEvent	-- Effekt unter Position des Truchsess
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take01a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			EffectStart {Tag = "Truchsess_Effect", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Truchsess Spawn
			MapFlagSetTrue {Name = "mf_P310_Uram_Gor_01_SOUND_Play_Truchsess_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02b",
	},
};

State
{
	StateName = "Cutscene02b",
	OnOneTimeEvent	-- Truchsess in Orkgestalt erscheint
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			-- Truchsess in Orkgestalt spawnt
			MapFlagSetTrue {Name = "mf_TruchsessSpawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02c",
	},
};

State
{
	StateName = "Cutscene02c",
	OnOneTimeEvent	-- Truchsess: Gate_Truchsess01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Gate_Truchsess01", Tag = "Truchsess"},
			-- Talkjob
			FigureCutsceneTalkJobSet {Tag = "Truchsess"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Truchsess: Gate_Truchsess02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Gate_Truchsess02", Tag = "Truchsess"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04a",
	},
};

State
{
	StateName = "Cutscene04a",
	OnOneTimeEvent	-- Kor geht zum Stein
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "pl_HumanKor", X = 245.197, Y = 136.209},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04b",
	},
};

State
{
	StateName = "Cutscene04b",
	OnOneTimeEvent	-- Kor: Gate_Kor02
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanKor"},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Gate_Kor02", Tag = "pl_HumanKor"},
			-- Ausrichten der Akteure(Avatar für nächsten Take)
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 340},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Avatar: Gate_Avatar01
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
			CutsceneSay {TextTag = "Gate_Avatar01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Schlaganimation von Kor wird abgespielt, Animation von Avatar wird abgespielt
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Schlaganim von Kor
			FigureAnimPlayOnce	{Tag = "pl_HumanKor", File = "base/gfx/figures/fraction_2/figure_orc_mercenary_attacktwohand2.ska"},
			-- No-Anim von Avatar			
			MapFlagSetTrue {Name = "mf_CS_02_Sad_Avatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Effekt auf den Bannstein
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.3},
		},
		Actions =
		{
			EffectStart {Tag = "Bannstein_Stone", File = "Effect_DivineBolt_Impact"},
			-- SOUND: Destroy Stone
			MapFlagSetTrue {Name = "mf_P310_Uram_Gor_01_SOUND_Play_Destroy_Stone"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Bannstein verschwindet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			ObjectVanish {Tag = "Bannstein_Stone"},
			-- Tore öffnen sich
			GateSetOpen	{Tag = "DoorSpieler01"},
		 	GateSetOpen	{Tag = "DoorSpieler02"},
		 	GateSetOpen	{Tag = "DoorSpieler03"},
		 	GateSetOpen	{Tag = "DoorUndead01"},
		 	GateSetOpen	{Tag = "DoorUndead02"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Kamera auf das Tor, welches sich öffnet & Ausrichten der Akteure
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--Schutzkreiseffekte werden gestoppt
			ObjectChange	{Tag = "SafetyArea01", ObjectId = 1127, X = Schutzkreis01X, Y = Schutzkreis01Y, Direction = 60},
			ObjectChange	{Tag = "SafetyArea02", ObjectId = 1127, X = Schutzkreis02X, Y = Schutzkreis02Y, Direction = 0},
			ObjectChange	{Tag = "SafetyArea03", ObjectId = 1127, X = Schutzkreis03X, Y = Schutzkreis03Y, Direction = 225},
			ObjectChange	{Tag = "SafetyArea04", ObjectId = 1127, X = Schutzkreis04X, Y = Schutzkreis04Y, Direction = 45},
			ObjectChange	{Tag = "SafetyArea05", ObjectId = 1127, X = Schutzkreis05X, Y = Schutzkreis05Y, Direction = 20},
			EffectStop	{Tag = "SafetyArea01"},
			EffectStop	{Tag = "SafetyArea02"},
			EffectStop	{Tag = "SafetyArea03"},
			EffectStop	{Tag = "SafetyArea04"},
			EffectStop	{Tag = "SafetyArea05"},
			-- Ausrichten der Akteure
			FigureLookAtEntity	{Tag = "pl_HumanAvatar", TargetTag = "Truchsess"},
			FigureLookAtEntity	{Tag = "pl_HumanKor", TargetTag = "Truchsess"},
			-- SOUND: Open Gate
			MapFlagSetTrue {Name = "mf_P310_Uram_Gor_01_SOUND_Play_Open_Gate"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Truchsess: Gate_Truchsess03
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{	
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Gate_Truchsess03", Tag = "Truchsess"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Effekt Start auf Truchsess
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			EffectStart {Tag = "Truchsess_Effect", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Truchsess Transform
			MapFlagSetTrue {Name = "mf_P310_Uram_Gor_01_SOUND_Play_Truchsess_Transform"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Truchsess wechselt seine Gestalt von Ork in seine richtige Erscheinung
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Truchsess", UnitId = 358, Level = 30},			
			FigureLookAtDirection {Tag = "Truchsess", Direction = 180},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Truchsess: Gate_Truchsess04
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Gate_Truchsess04", Tag = "Truchsess"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Truchsess: Gate_Truchsess05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Gate_Truchsess05", Tag = "Truchsess"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Truchsess: Gate_Truchsess06
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Gate_Truchsess06", Tag = "Truchsess"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Effekt auf Position von Truchsess
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			EffectStart {Tag = "Truchsess", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Truchsess Despawn
			MapFlagSetTrue {Name = "mf_P310_Uram_Gor_01_SOUND_Play_Truchsess_Despawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- Truchsess verschwindet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureVanish {Tag = "Truchsess"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
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
			FigureStop {Tag = "pl_HumanKor"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			-- Scriptingkram für die Karte
			MapFlagSetTrue	{Name = "mf_CutsceneTorBeendet"},			
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};