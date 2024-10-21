--************************************************************
--**														**
--**		Dragh Lur Intro									**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'IronLord'",
		"'pl_HumanNightsong'",
		"'Sorvina'",
		"'TothLar'",
		"'CS_01_Shadow01'",
		"'CS_01_Shadow02'",
		"'CS_01_Shadow03'",
		"'CS_01_Shadow04'",
		"'CS_01_Shadow05'",
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
			FigureVanish {Tag = "CS_01_Orc01"},
			FigureVanish {Tag = "CS_01_Orc02"},
			FigureVanish {Tag = "CS_01_Orc05"},
			FigureVanish {Tag = "CS_01_Orc06"},
			FigureVanish {Tag = "CS_01_Orc07"},
			FigureVanish {Tag = "CS_01_Orc08"},
			FigureVanish {Tag = "CS_01_Darkelf01"},
			FigureVanish {Tag = "CS_01_Darkelf02"},
			FigureVanish {Tag = "CS_01_Darkelf05"},
			FigureVanish {Tag = "CS_01_Darkelf06"},
			FigureVanish {Tag = "CS_01_Darkelf07"},
			FigureVanish {Tag = "CS_01_Darkelf08"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Avatar01"},
			FigureVanish {Tag = "CS_02_IronLord01"},
			FigureVanish {Tag = "CS_02_IronLord02"},
			FigureVanish {Tag = "CS_02_Shadowsong01"},
			FigureVanish {Tag = "CS_02_Shadowsong02"},
			FigureVanish {Tag = "CS_02_Darkelf04"},
			FigureVanish {Tag = "CS_02_Darkelf05"},
			FigureVanish {Tag = "CS_02_Darkelf06"},
			ObjectVanish {Tag = "CS_02_Corpse_TothLar"},
			FigureVanish {Tag = "CS_02_Shadow04"},
			FigureVanish {Tag = "CS_02_Shadow05"},
			FigureVanish {Tag = "CS_02_Shadow06"},
			FigureVanish {Tag = "CS_02_Shadowwarrior01"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kommentar
	{
		AllowCombat = true,
		Conditions =
		{
			--MapFlagIsTrue	{Name = "mf_Cutscene01"},
		},
		Actions =
		{
			-- Ausblenden der Figuren geschieht in State Cutscene10
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 311.6, Y = 52},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 313.8, Y = 52.6},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 200},
			FigureTeleport {Tag = "IronLord", X = 309, Y = 52.6},
			FigureLookAtDirection {Tag = "IronLord", Direction = 165},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			FigureCutsceneTalkJobSet {Tag = "IronLord"},
			FigureCutsceneTalkJobSet {Tag = "Sorvina"},
			FigureCutsceneTalkJobSet {Tag = "Tothlar"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsHide {Tag = "IronLord"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- BattelRoyalA Animationen starten
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.1},
		},
		Actions =
		{
			--MapFlagSetTrue {Name = "mf_Cutscene01_BattleRoyalA"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- BattleRoyalB Animationen starten
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			--MapFlagSetTrue {Name = "mf_Cutscene01_BattleRoyalB"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- BattleRoyalC Animationen starten
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			--MapFlagSetTrue {Name = "mf_Cutscene01_BattleRoyalC"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Teleport der Akteure, Dunkelelfen locken Orks aus dem Kampf
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 9},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "CS_01_MercShown", X = 336.211, Y = 82.0859},
			FigureLookAtDirection {Tag = "CS_01_MercShown", Direction = 126.051},
			FigureTeleport {Tag = "CS_01_VeteranShown", X = 332.947, Y = 84.58},
			FigureLookAtDirection {Tag = "CS_01_VeteranShown", Direction = 124.332},
			FigureTeleport {Tag = "CS_01_NecroShown", X = 338.675, Y = 85.0481},
			FigureLookAtDirection {Tag = "CS_01_NecroShown", Direction = 150.688},
			FigureTeleport {Tag = "CS_01_SorceressShown", X = 336.6, Y = 87.4062},
			FigureLookAtDirection {Tag = "CS_01_SorceressShown", Direction = 148.969},
			-- Akteure laufen los
			FigureSimpleRun {Tag = "CS_01_MercShown", X = 354.57, Y = 98.5466},
			FigureSimpleRun {Tag = "CS_01_VeteranShown", X = 352.031, Y = 100.882},
			FigureSimpleRun {Tag = "CS_01_NecroShown", X = 357.686, Y = 101.488},
			FigureSimpleRun {Tag = "CS_01_SorceressShown", X = 355.539, Y = 103.451},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- IronLord: IronLord1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "IronLord1", Tag = "IronLord"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Dunkelelfen locken Orks durch das fallengespickte Durchgang
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Akteure laufen los
			FigureSimpleRun {Tag = "CS_01_Orc03", X = 409.128, Y = 108.373},
			FigureSimpleRun {Tag = "CS_01_Orc04", X = 406.491, Y = 110.074},
			FigureSimpleRun {Tag = "CS_01_Darkelf04", X = 412.368, Y = 120.261},
			FigureSimpleRun {Tag = "CS_01_Darkelf03", X = 410.568, Y = 121.318},
			-- alte Akteure werden gelöscht
			FigureVanish {Tag = "CS_01_MercShown"},
			FigureVanish {Tag = "CS_01_VeteranShown"},
			FigureVanish {Tag = "CS_01_NecroShown"},
			FigureVanish {Tag = "CS_01_SorceressShown"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Giftfalle für ersten Ork, Effekt Start für Falle
	{
		Conditions =
		{
			FigureIsInRange {Tag = "CS_01_Orc03", Range = 3, X = 405.454, Y = 102.534},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Effekt starten
			EffectStart {Tag = "CS_01_EffectDummy01", File = "Effect_Misc_TrapGas"},
			-- SOUND: Trap
			MapFlagSetTrue {Name = "mf_P315_DraghLur_04_SOUND_Play_Trap"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- erster Ork stirbt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureKill {Tag = "CS_01_Orc03"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09a",
	},
};

State
{
	StateName = "Cutscene09a",
	OnOneTimeEvent	-- zweiter Ork stirbt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			FigureKill {Tag = "CS_01_Orc04"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09b",
	},
};

State
{
	StateName = "Cutscene09b",
	OnOneTimeEvent	-- Nightsong: Nightsong1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.3},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSong1", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
	},
	OnOneTimeEvent	-- Pioniere wurden übergeben
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P314_PioneerTroopsGained"},
		},
		Actions =
		{
		},
		GotoState = "Cutscene11a",
	},
	OnOneTimeEvent	-- Keine Pioniere
	{
		Conditions =
		{
			AvatarFlagIsFalse {Name = "af_P314_PioneerTroopsGained"},
		},
		Actions =
		{
		},
		GotoState = "Cutscene11b",
	},
};	

State
{
	StateName = "Cutscene11a", -- Entweder dieser Satz, wenn noch Pioniere leben
	OnOneTimeEvent	-- IronLord: IronLord2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take06b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IronLord2", Tag = "IronLord"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene11b",	-- Oder diesen Satz, wenn kein Pionier mehr lebt
	OnOneTimeEvent	-- IronLord: IronLord3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take06b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IronLord3", Tag = "IronLord"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Kamera TothLar, Sorvina und einige Schatten
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Kämpfende Orks und Dunkelelfen werden gelöscht und durch Objekte ersetzt
			MapFlagSetTrue {Name = "mf_Cutscene01_BattleRoyal_Everyone_Is_Going_Down"},
			ObjectSpawn	{ObjectId = 852, X = 406.869, Y = 101.933, Direction = 34.3775, Tag = "ToterMerc"},
			ObjectSpawn	{ObjectId = 854, X = 403.259, Y = 101.413, Direction = 183.346, Tag = "ToterVeteran"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- TothLar: TothLar1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.6},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TothLar1", Tag = "TothLar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Effekte starten auf den Positionen der Schatten
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take08b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EffectStartAtEntityPosition	{Tag = "CS_01_Shadow01", File = "Effect_Misc_SpawnSpecial_01"},
			EffectStartAtEntityPosition	{Tag = "CS_01_Shadow02", File = "Effect_Misc_SpawnSpecial_01"},
			EffectStartAtEntityPosition	{Tag = "CS_01_Shadow03", File = "Effect_Misc_SpawnSpecial_01"},
			EffectStartAtEntityPosition	{Tag = "CS_01_Shadow04", File = "Effect_Misc_SpawnSpecial_01"},
			EffectStartAtEntityPosition	{Tag = "CS_01_Shadow05", File = "Effect_Misc_SpawnSpecial_01"},
			-- SOUND: Shadow Despawn
			MapFlagSetTrue {Name = "mf_P315_DraghLur_04_SOUND_Play_Shadow_Despawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Schatten verschwinden
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureVanish {Tag = "CS_01_Shadow01"},
			FigureVanish {Tag = "CS_01_Shadow02"},
			FigureVanish {Tag = "CS_01_Shadow03"},
			FigureVanish {Tag = "CS_01_Shadow04"},
			FigureVanish {Tag = "CS_01_Shadow05"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Sorvina: Sorvina1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{

			CutsceneSay {TextTag = "Sorvina1", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimerA"},
		},
	},
	OnOneTimeEvent	-- Kamera auf Sorvina
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStop {Name = "et_CStimerA"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- TothLar: TothLar2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TothLar2", Tag = "TothLar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- Effekt auf Position von Sorvina
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EffectStartAtEntityPosition	{Tag = "Sorvina", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Sorvina Despawn
			MapFlagSetTrue {Name = "mf_P315_DraghLur_04_SOUND_Play_Sorvina_Despawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- Sorvina verschwindet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureVanish {Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- TothLar:TothLar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TothLar3", Tag = "TothLar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent	-- TothLar: TothLar4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "TothLar4", Tag = "TothLar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
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
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
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
			-- Akteure werden gelöscht
			FigureVanish {Tag = "CS_01_Darkelf03"},
			FigureVanish {Tag = "CS_01_Darkelf04"},
			-- Talkjobs beenden
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "pl_HumanNightsong"},
			FigureStop {Tag = "IronLord"},
			FigureStop {Tag = "TothLar"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsShow {Tag = "IronLord"},
			-- Helden auf Avatar ausrichten
			FigureLookAtEntity	{Tag = "pl_HumanHeroBor", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroLya", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroJared", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroShae", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "pl_HumanAvatar"},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P309_CutsceneIntroDragEnd"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};