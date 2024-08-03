--************************************************************
--**														**
--**		Steel Shore Extro								**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanNightsong'",
		"'Extro_Sorvina'",
	}
}

-- Figuren die gerendert werden
local _tRenderList2 = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList2.tModFuncs =
{
	Add =
	{
		"'pl_HumanNightsong'",
		"'Extro_Sorvina'",
		"'Extro_Malacay'",
	}
}

State
{
	StateName = "INIT",	
	OnOneTimeEvent	-- Wenn Sorvina tot ist wird ein Timer gestartet
	{
		Conditions =
		{
			FigureIsDead {Tag = "Sorvina"}
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CSSorvinaDeadTimer"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kommentar
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene02"},
				AND
				{
					EntityTimerIsElapsed {Name = "et_CSSorvinaDeadTimer", Seconds = 5},
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
			FigureTeleport {Tag = "pl_HumanAvatar", X = 177.8, Y = 644},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 175.4, Y = 637},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 180},
			FigureTeleport {Tag = "Extro_Malacay", X = 177.8, Y = 651},
			FigureLookAtDirection {Tag = "Extro_Malacay", Direction = 0},
			FigureTeleport {Tag = "Extro_Sorvina", X = 177.8, Y = 648.2},
			FigureLookAtDirection {Tag = "Extro_Sorvina", Direction = 0},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			-- Sorvina und Malacay starten ihre Animation
			MapFlagSetTrue {Name = "mf_P320_Extro_Actor_AnimPlay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};

State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- Kamerawechsel
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7.3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- SOUND: Sorvina Scream
			MapFlagSetTrue {Name = "mf_P320_Steel_Shore_02_SOUND_Play_Sorvina_Scream"},					
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Malacay wird sichtbar durch neue Renderliste
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8.4},
		},
		Actions =
		{
			-- zweite Renderliste wird gestaret, Malacay wird sichtbar
			_tRenderList2,
	
		},
		GotoState = "Cutscene02a",
	},
};

State
{
	StateName = "Cutscene02a",
	OnOneTimeEvent	-- Kamerawechsel
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8.7},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take02a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},	
		},
		GotoState = "Cutscene02b",
	},
};

State
{
	StateName = "Cutscene02b",
	OnOneTimeEvent	-- Kamerawechsel
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
		},
		GotoState = "Cutscene03a",
	},
};

State
{
	StateName = "Cutscene03a",
	OnOneTimeEvent	-- Malacays Geist zerspringt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 12},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take03b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EffectStart {Tag = "CS_02_Ghost_Effect", File = "Effect_Misc_Ghost_Explosion"},
			-- SOUND: Malacay Vanish
			MapFlagSetTrue {Name = "mf_P320_Steel_Shore_02_SOUND_Play_Malacay_Vanish"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03b",
	},
};

State
{
	StateName = "Cutscene03b",
	OnOneTimeEvent	-- Kamera nochmal auf Sorvina
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take03c", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03c",
	},
};

State
{
	StateName = "Cutscene03c",
	OnOneTimeEvent	-- Nightsong kommt angelaufen
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Nightsong kommt angelaufen
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 175.4, Y = 642.6},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Nightsong: Extro03, Talkjob Nightsong
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanNightsong"},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Extro03", Tag = "pl_HumanNightsong"},
			-- Talkjob Nightsong
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Avatar: Extro04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Extro04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Avatar: Extro05, Ausrichten von Nightsong
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
			CutsceneSay {TextTag = "Extro05", Tag = "pl_HumanAvatar"},
			-- Ausrichten von Nightsong
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 140},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Nightsong: Extro06
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Extro06", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Avatar: Extro07
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Extro07", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Nightsong: Extro08
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Extro08", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Nightsong: Extro09, Ausrichten vom Avatar
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
			CutsceneSay {TextTag = "Extro09", Tag = "pl_HumanNightsong"},
			-- Ausrichten von Avatar
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 305},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Nightsong: Extro10
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Extro10", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Nightsong: Extro12
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Extro12", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Kamera auf Avatar, Nightsong und gleich erscheinenden ShadowWarrior
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Effekt auf FX-Marker dort wo ShadowWarrior gleich erscheinen wird
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			EffectStart {Tag = "CS_02_Shadowwarrior_Effect", File = "Effect_Misc_SpawnSpecial_01"},
			-- SOUND: ShadowWarrior Spawn
			MapFlagSetTrue {Name = "mf_P320_Steel_Shore_02_SOUND_Play_Shadowwarrior_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- ShadowWarrior erscheint, Talkjob wird direkt im SpawnScript gesetzt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P320_CS_02_ShadowWarrior_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- ShadowWarrior: Extro13, Ausrichten der Akteure
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Extro13", Tag = "ShadowWarrior"},
			-- Ausrichten der Akteure
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 245},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 185},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Nightsong: Extro14
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Extro14", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- ShadowWarrior: Extro15
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Extro15", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- ShadowWarrior: Extro16
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Extro16", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- ShadowWarrior: Extro17
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Extro17", Tag = "ShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent	-- Kurze Pause nach CutsceneSay, Kameraschwenk um die Szene
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
	OnOneTimeEvent	-- Nightsong: Extro18, Ausrichten von Nightsong
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take18", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Extro18", Tag = "ShadowWarrior"},
			-- Ausrichten von Nightsong
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 140},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	-- Avatar: Extro19
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take19", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Extro19", Tag = "pl_HumanAvatar"},
			-- Ausrichten des Avatar
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 305},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	-- Nightsong: Extro21
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take20", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Extro21", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
	OnOneTimeEvent	-- Kamera auf Kopf des Avatar
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take21", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene26",
	},
};

State
{
	StateName = "Cutscene26",
	OnOneTimeEvent	-- Kamerazoom auf Schattenlieds Gesicht
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{		
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take22", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene27",
	},
};

State
{
	StateName = "Cutscene27",
	OnCutsceneFigureDespawnEvent	-- SPIEL VORBEI
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			-- SPIEL GEWONNEN
			--PlayerGameEnds {},
			MapFlagSetTrue {Name = "mf_P320_ItsDone"},
			QuestSetSolved {Quest = "DefeatMalacay"},
			QuestSetSolved {Quest = "SteelShorePart2Endgame"},
			QuestSetSolved {Quest = "2_KapitelAkt3"},
			QuestSetSolved {Quest = "SF2_3_Akt"},
			
			PlayerHeroRemove {Tag = "NightSong"},
		
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};