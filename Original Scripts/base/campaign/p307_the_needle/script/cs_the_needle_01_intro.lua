--************************************************************
--**														**
--**		The Needle Intro								**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Kaziz'",
		"'ChiefKor'",
		"'Karan'",
		"'Einar'",
		"'TothLar'",
		"'CS_01_Darkelf02'",
		"'CS_01_Darkelf04'",
		"'CS_01_Darkelf06'",
		"'CS_01_Darkelf08'",
		"'CS_01_Darkelf10'",
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
			FigureVanish {Tag = "CS_01_Kor01"},
			FigureVanish {Tag = "CS_01_Kaziz01"},
			FigureVanish {Tag = "CS_01_Darkelf01"},
			FigureVanish {Tag = "CS_01_Darkelf03"},
			FigureVanish {Tag = "CS_01_Darkelf05"},
			FigureVanish {Tag = "CS_01_Darkelf07"},
			FigureVanish {Tag = "CS_01_Darkelf09"},
			FigureVanish {Tag = "CS_01_Avatar01"},
			FigureVanish {Tag = "CS_01_Avatar02"},
			FigureVanish {Tag = "CS_01_Avatar03"},
			FigureVanish {Tag = "CS_01_Bor01"},
			FigureVanish {Tag = "CS_01_Lya01"},
			FigureVanish {Tag = "CS_01_Jared01"},
			FigureVanish {Tag = "CS_01_Shae01"},
			FigureVanish {Tag = "CS_01_Shadowsong01"},
			ObjectVanish {Tag = "BulwarkCorpse01"},
			ObjectVanish {Tag = "BulwarkCorpse02"},
			ObjectVanish {Tag = "BulwarkCorpse03"},
			ObjectVanish {Tag = "BulwarkCorpse04"},
			ObjectVanish {Tag = "BulwarkCorpse05"},
			ObjectVanish {Tag = "BulwarkCorpse06"},
			ObjectVanish {Tag = "BulwarkCorpse07"},
			ObjectVanish {Tag = "BulwarkCorpse08"},
			ObjectVanish {Tag = "BulwarkCorpse09"},
			ObjectVanish {Tag = "BulwarkCorpse10"},
			ObjectVanish {Tag = "BulwarkCorpse11"},
			ObjectVanish {Tag = "BulwarkCorpse12"},
			ObjectVanish {Tag = "BulwarkCorpse13"},
			ObjectVanish {Tag = "BulwarkCorpse14"},
			ObjectVanish {Tag = "BulwarkCorpse15"},
			ObjectVanish {Tag = "BulwarkCorpse16"},
			ObjectVanish {Tag = "BulwarkCorpse17"},
			ObjectVanish {Tag = "BulwarkCorpse18"},
			ObjectVanish {Tag = "BulwarkCorpse19"},
			ObjectVanish {Tag = "BulwarkCorpse20"},
			ObjectVanish {Tag = "BulwarkCorpse21"},
			ObjectVanish {Tag = "BulwarkCorpse22"},
			ObjectVanish {Tag = "BulwarkCorpse23"},
			ObjectVanish {Tag = "BulwarkCorpse24"},
			ObjectVanish {Tag = "BulwarkCorpse25"},
			ObjectVanish {Tag = "BulwarkCorpse26"},
			ObjectVanish {Tag = "BulwarkCorpse27"},
			ObjectVanish {Tag = "BulwarkCorpse28"},
			ObjectVanish {Tag = "BulwarkCorpse29"},
			ObjectVanish {Tag = "BulwarkCorpse30"},
			ObjectVanish {Tag = "BulwarkCorpse31"},
			ObjectVanish {Tag = "BulwarkCorpse32"},
			ObjectVanish {Tag = "BulwarkBlood01"},
			ObjectVanish {Tag = "BulwarkBlood02"},
			ObjectVanish {Tag = "BulwarkBlood03"},
			ObjectVanish {Tag = "BulwarkBlood04"},
			ObjectVanish {Tag = "BulwarkBlood05"},
			ObjectVanish {Tag = "BulwarkBlood06"},
			ObjectVanish {Tag = "BulwarkBlood07"},
			ObjectVanish {Tag = "BulwarkBlood08"},
			ObjectVanish {Tag = "BulwarkBlood09"},
			ObjectVanish {Tag = "BulwarkBlood10"},
			ObjectVanish {Tag = "BulwarkBlood11"},
			ObjectVanish {Tag = "BulwarkBlood12"},
			ObjectVanish {Tag = "BulwarkBlood13"},
			ObjectVanish {Tag = "BulwarkBlood14"},
			ObjectVanish {Tag = "BulwarkBlood15"},
			ObjectVanish {Tag = "BulwarkBlood16"},
			ObjectVanish {Tag = "BulwarkBlood17"},
			ObjectVanish {Tag = "BulwarkBlood18"},
			ObjectVanish {Tag = "BulwarkBlood19"},
			ObjectVanish {Tag = "BulwarkBlood20"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Avatar01"},
			FigureVanish {Tag = "CS_02_Matricus01"},
			FigureVanish {Tag = "CS_02_Einar01"},
			FigureVanish {Tag = "CS_02_Karan01"},
			ObjectVanish {Tag = "CS_02_Corpse_Spritist01"},
			-- dritte Cutscene Vanish
			FigureVanish {Tag = "CS_03_TothLar01"},
			FigureVanish {Tag = "CS_03_Kaziz01"},
			FigureVanish {Tag = "CS_03_Avatar01"},
			FigureVanish {Tag = "CS_03_Avatar02"},
			FigureVanish {Tag = "CS_03_Bor01"},
			FigureVanish {Tag = "CS_03_Bor02"},
			FigureVanish {Tag = "CS_03_Lya01"},
			FigureVanish {Tag = "CS_03_Lya02"},
			FigureVanish {Tag = "CS_03_Jared01"},
			FigureVanish {Tag = "CS_03_Jared02"},
			FigureVanish {Tag = "CS_03_Shae01"},
			FigureVanish {Tag = "CS_03_Shae02"},
			FigureVanish {Tag = "CS_03_Shadowsong01"},
			FigureVanish {Tag = "CS_03_Shadowsong02"},
			ObjectVanish {Tag = "CS_03_Corpse_Kor01"},
			ObjectVanish {Tag = "CS_03_Kor_FightingStaff01"},
			-- vierte Cutscene
			FigureVanish {Tag = "CS_04_Avatar01"},
			FigureVanish {Tag = "CS_04_Avatar02"},
			FigureVanish {Tag = "CS_04_Shadowsong01"},
			FigureVanish {Tag = "CS_04_Shadowsong02"},

		},
	},
	OnCutsceneFigureRespawnEvent	-- Figuren werden an ihr Positionen teleportiert
	{
		Conditions =
		{
			--MapFlagIsTrue {Name = "mf_Cutscene01"},
			AvatarFlagIsTrue {Name = "af_P307_Intro"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Akteure werden zu ihren Positionen teleportiert
			FigureTeleport {Tag = "TothLar", X = 549.945, Y = 459.616},
			FigureLookAtDirection	{Tag = "TothLar", Direction = 158.747},
			FigureTeleport {Tag = "Kaziz", X = 553.844, Y = 457.995},
			FigureLookAtDirection	{Tag = "Kaziz", Direction = 182.383},
			FigureTeleport {Tag = "ChiefKor", X = 553.882, Y = 461.937},
			FigureLookAtDirection	{Tag = "ChiefKor", Direction = 312.605},
			FigureTeleport {Tag = "Karan", X = 175.895, Y = 223.434},
			FigureLookAtDirection	{Tag = "Karan", Direction = 67.5055},
			FigureTeleport {Tag = "Einar", X = 178.419, Y = 224.845},
			FigureLookAtDirection	{Tag = "Einar", Direction = 11.2},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 197.134, Y = 218.399},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "TothLar"},
			FigureCutsceneTalkJobSet {Tag = "Kaziz"},
			FigureCutsceneTalkJobSet {Tag = "ChiefKor"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Karan"},
			FigureCutsceneTalkJobSet {Tag = "Einar"},
			-- Waffen Hide
			CutsceneFigureWeaponsHide {Tag = "Kaziz"},
			CutsceneFigureWeaponsHide {Tag = "ChiefKor"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Karan"},
			CutsceneFigureWeaponsHide {Tag = "Einar"},
			-- Effekt auf Portal
			EffectStart {Tag = "WayBack", File = "Effect_Spawn_Gate"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- TothLar: Intro01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "Intro01", Tag = "TothLar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- ChiefKor: Intro02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "Intro02", Tag = "ChiefKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- ChiefKor: Intro03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "Intro03", Tag = "ChiefKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kor geht weg
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "ChiefKor", X = 558.515, Y = 466.292},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- TothLar: Intro04
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "Intro04", Tag = "TothLar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- ChiefKor: Intro05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "Intro05", Tag = "ChiefKor"},
			FigureLookAtDirection {Tag = "ChiefKor", Direction = 310.725},
			FigureCutsceneTalkJobSet {Tag = "ChiefKor"},
			EntityTimerStart {Name = "et_CStimerA"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- TothLar: Intro06
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "Intro06", Tag = "TothLar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Kaziz geht zu Kor
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
			FigureSimpleWalk {Tag = "Kaziz", X = 556.995, Y = 464.026},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08a",
	},
};

State
{
	StateName = "Cutscene08a",
	OnOneTimeEvent	-- Erster Dunkelelf geht zu Kor
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "CS_01_Darkelf02", X = 555.661, Y = 466.529},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08b",
	},
};

State
{
	StateName = "Cutscene08b",
	OnOneTimeEvent	-- Zweiter Dunkelelf geht zu Kor
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "CS_01_Darkelf04", X = 557.308, Y = 468.087},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08c",
	},
};

State
{
	StateName = "Cutscene08c",
	OnOneTimeEvent	-- Dritter Dunkelelf geht zu Kor
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "CS_01_Darkelf06", X = 559.232, Y = 467.796},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08d",
	},
};

State
{
	StateName = "Cutscene08d",
	OnOneTimeEvent	-- Vierter Dunkelelf geht zu Kor
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "CS_01_Darkelf08", X = 560.718, Y = 465.956},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08e",
	},
};

State
{
	StateName = "Cutscene08e",
	OnOneTimeEvent	-- Fünfter Dunkelelf geht zu Kor
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "CS_01_Darkelf10", X = 559.556, Y = 464.08},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- TothLar: Intro07
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "Intro07", Tag = "TothLar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- ChiefKor: Intro08
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "Intro08", Tag = "ChiefKor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

-- hier noch ne Überblendung rein, wenn möglich

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Kamera auf Portal und Effekt auf Avatar
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
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	--  Effekt auf Avatar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EffectStart {Tag = "pl_HumanAvatar", File = "Effect_Spawn_Unit"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Avatar wird ins Portal teleportiert
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureTeleport {Tag = "pl_HumanAvatar", X = 180.234, Y = 218.202},
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 199.572},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Avatar geht aus dem Portal & Einar: Intro09
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 178.588, Y = 222.356},
			CutsceneSay	{TextTag = "Intro09", Tag = "Einar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Karan: Intro10
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanAvatar"},
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "Intro10", Tag = "Karan"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 210.458},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Einar: Intro11
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "Intro11", Tag = "Einar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Einar: Intro12
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "Intro12", Tag = "Einar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
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
			-- Löschen von Einheiten die nicht mehr gebraucht werden
			FigureVanish {Tag = "Kaziz"},
			FigureVanish {Tag = "CS_01_Darkelf02"},
			FigureVanish {Tag = "CS_01_Darkelf04"},
			FigureVanish {Tag = "CS_01_Darkelf06"},
			FigureVanish {Tag = "CS_01_Darkelf08"},
			FigureVanish {Tag = "CS_01_Darkelf10"},
			-- Talkjobs beenden
			FigureStop {Tag = "TothLar"},
			FigureStop {Tag = "Kaziz"},
			FigureStop {Tag = "ChiefKor"},
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "Karan"},
			FigureStop {Tag = "Einar"},
			-- Waffen Show
			CutsceneFigureWeaponsShow {Tag = "Kaziz"},
			CutsceneFigureWeaponsShow {Tag = "ChiefKor"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Karan"},
			CutsceneFigureWeaponsShow {Tag = "Einar"},
			-- Löschen der Einheiten aus dem Lager im Bulwark
			FigureVanish {Tag = "BulwarkDE01"},
			FigureVanish {Tag = "BulwarkDE02"},
			FigureVanish {Tag = "BulwarkDE03"},
			FigureVanish {Tag = "BulwarkDE04"},
			FigureVanish {Tag = "BulwarkDE05"},
			FigureVanish {Tag = "BulwarkDE06"},
			FigureVanish {Tag = "BulwarkDE07"},
			FigureVanish {Tag = "BulwarkDE08"},
			FigureVanish {Tag = "BulwarkDE09"},
			FigureVanish {Tag = "BulwarkDE10"},
			FigureVanish {Tag = "BulwarkDE11"},
			FigureVanish {Tag = "BulwarkDE12"},
			FigureVanish {Tag = "BulwarkDE13"},
			FigureVanish {Tag = "BulwarkDE14"},
			FigureVanish {Tag = "BulwarkDE15"},
			FigureVanish {Tag = "BulwarkOrc01"},
			FigureVanish {Tag = "BulwarkOrc02"},
			FigureVanish {Tag = "BulwarkOrc03"},
			FigureVanish {Tag = "BulwarkOrc04"},
			FigureVanish {Tag = "BulwarkOrc05"},
			FigureVanish {Tag = "BulwarkOrc06"},
			FigureVanish {Tag = "BulwarkOrc07"},
			FigureVanish {Tag = "BulwarkOrc08"},
			FigureVanish {Tag = "BulwarkOrc09"},
			FigureVanish {Tag = "BulwarkOrc10"},
			FigureVanish {Tag = "BulwarkOrc11"},
			FigureVanish {Tag = "BulwarkOrc12"},
			FigureVanish {Tag = "BulwarkOrc13"},
			FigureVanish {Tag = "BulwarkOrc14"},
			FigureVanish {Tag = "BulwarkOrc15"},
			FigureVanish {Tag = "BulwarkOrc16"},
			FigureVanish {Tag = "BulwarkOrc17"},
			-- Spawn der Leichen
			ObjectSpawn	{ObjectId = 853, X = 558.026, Y = 476.744, Direction = 213.042, Tag = "BulwarkCorpse01"},
			ObjectSpawn	{ObjectId = 853, X = 550.639, Y = 472.201, Direction = 39.4641, Tag = "BulwarkCorpse02"},
			ObjectSpawn	{ObjectId = 853, X = 563.774, Y = 459.563, Direction = 313.79, Tag = "BulwarkCorpse03"},
			ObjectSpawn	{ObjectId = 853, X = 566.472, Y = 472.817, Direction = 96.5728, Tag = "BulwarkCorpse04"},
			ObjectSpawn	{ObjectId = 853, X = 555.062, Y = 467.685, Direction = 149.342, Tag = "BulwarkCorpse05"},
			ObjectSpawn	{ObjectId = 852, X = 561.243, Y = 474.387, Direction = 279.6, Tag = "BulwarkCorpse06"},
			ObjectSpawn	{ObjectId = 852, X = 564.472, Y = 464.869, Direction = 122.128, Tag = "BulwarkCorpse07"},
			ObjectSpawn	{ObjectId = 852, X = 564.49, Y = 478.236, Direction = 204.583, Tag = "BulwarkCorpse08"},
			ObjectSpawn	{ObjectId = 852, X = 550.442, Y = 467.013, Direction = 160.493, Tag = "BulwarkCorpse09"},
			ObjectSpawn	{ObjectId = 852, X = 556.345, Y = 458.739, Direction = 163.163, Tag = "BulwarkCorpse10"},
			ObjectSpawn	{ObjectId = 854, X = 550.984, Y = 477.598, Direction = 75.819, Tag = "BulwarkCorpse11"},
			ObjectSpawn	{ObjectId = 854, X = 564.767, Y = 469.816, Direction = 20.7099, Tag = "BulwarkCorpse12"},
			ObjectSpawn	{ObjectId = 854, X = 565.543, Y = 457.948, Direction = 356.221, Tag = "BulwarkCorpse13"},
			ObjectSpawn	{ObjectId = 854, X = 557.296, Y = 462.206, Direction = 48.1655, Tag = "BulwarkCorpse14"},
			ObjectSpawn	{ObjectId = 854, X = 550.037, Y = 463.136, Direction = 91.1893, Tag = "BulwarkCorpse15"},
			ObjectSpawn	{ObjectId = 1153, X = 552.458, Y = 464.829, Direction = 249.024, Tag = "BulwarkCorpse16"},
			ObjectSpawn	{ObjectId = 1153, X = 557.517, Y = 475.366, Direction = 281.412, Tag = "BulwarkCorpse17"},
			ObjectSpawn	{ObjectId = 1153, X = 550.074, Y = 469.694, Direction = 352.463, Tag = "BulwarkCorpse18"},
			ObjectSpawn	{ObjectId = 1153, X = 559.286, Y = 457.961, Direction = 162.537, Tag = "BulwarkCorpse19"},
			ObjectSpawn	{ObjectId = 1153, X = 564.9, Y = 474.58, Direction = 327.007, Tag = "BulwarkCorpse20"},
			ObjectSpawn	{ObjectId = 1154, X = 564.679, Y = 466.944, Direction = 307.198, Tag = "BulwarkCorpse21"},
			ObjectSpawn	{ObjectId = 1154, X = 554.874, Y = 479.069, Direction = 57.3504, Tag = "BulwarkCorpse22"},
			ObjectSpawn	{ObjectId = 1154, X = 552.66, Y = 458.036, Direction = 91.1893, Tag = "BulwarkCorpse23"},
			ObjectSpawn	{ObjectId = 1152, X = 553.891, Y = 472.647, Direction = 175.347, Tag = "BulwarkCorpse24"},
			ObjectSpawn	{ObjectId = 1152, X = 547.722, Y = 464.583, Direction = 35.1354, Tag = "BulwarkCorpse25"},
			ObjectSpawn	{ObjectId = 1152, X = 559.187, Y = 470.941, Direction = 90.7718, Tag = "BulwarkCorpse26"},
			ObjectSpawn	{ObjectId = 1152, X = 556.57, Y = 454.096, Direction = 212.427, Tag = "BulwarkCorpse27"},
			ObjectSpawn	{ObjectId = 1152, X = 548.212, Y = 472.183, Direction = 123.985, Tag = "BulwarkCorpse28"},
			ObjectSpawn	{ObjectId = 1152, X = 553.103, Y = 481.443, Direction = 340.422, Tag = "BulwarkCorpse29"},
			ObjectSpawn	{ObjectId = 1152, X = 569.528, Y = 462.513, Direction = 182.379, Tag = "BulwarkCorpse30"},
			ObjectSpawn	{ObjectId = 1152, X = 568.928, Y = 475.301, Direction = 254.144, Tag = "BulwarkCorpse31"},
			ObjectSpawn	{ObjectId = 1152, X = 561.551, Y = 462.161, Direction = 115.162, Tag = "BulwarkCorpse32"},
			ObjectSpawn	{ObjectId = 546, X = 560.241, Y = 476.771, Direction = 275.919, Tag = "BulwarkBlood01"},
			ObjectSpawn	{ObjectId = 546, X = 555.625, Y = 467.842, Direction = 84.9928, Tag = "BulwarkBlood02"},
			ObjectSpawn	{ObjectId = 546, X = 564.568, Y = 468.551, Direction = 85.696, Tag = "BulwarkBlood03"},
			ObjectSpawn	{ObjectId = 546, X = 550.974, Y = 475.975, Direction = 71.3584, Tag = "BulwarkBlood04"},
			ObjectSpawn	{ObjectId = 546, X = 562.196, Y = 463.458, Direction = 136.729, Tag = "BulwarkBlood05"},
			ObjectSpawn	{ObjectId = 546, X = 554.606, Y = 481.634, Direction = 13.1291, Tag = "BulwarkBlood06"},
			ObjectSpawn	{ObjectId = 547, X = 565.511, Y = 474.53, Direction = 262.592, Tag = "BulwarkBlood07"},
			ObjectSpawn	{ObjectId = 547, X = 549.933, Y = 465.546, Direction = 96.364, Tag = "BulwarkBlood08"},
			ObjectSpawn	{ObjectId = 547, X = 549.148, Y = 471.38, Direction = 310.384, Tag = "BulwarkBlood09"},
			ObjectSpawn	{ObjectId = 547, X = 557.157, Y = 458.294, Direction = 194.343, Tag = "BulwarkBlood10"},
			ObjectSpawn	{ObjectId = 548, X = 555.768, Y = 473.894, Direction = 256.528, Tag = "BulwarkBlood11"},
			ObjectSpawn	{ObjectId = 548, X = 558.87, Y = 462.802, Direction = 124.644, Tag = "BulwarkBlood12"},
			ObjectSpawn	{ObjectId = 549, X = 564.697, Y = 478.029, Direction = 264.614, Tag = "BulwarkBlood13"},
			ObjectSpawn	{ObjectId = 549, X = 547.426, Y = 466.474, Direction = 50.3189, Tag = "BulwarkBlood14"},
			ObjectSpawn	{ObjectId = 549, X = 553.303, Y = 458.113, Direction = 148.122, Tag = "BulwarkBlood15"},
			ObjectSpawn	{ObjectId = 549, X = 570.002, Y = 461.311, Direction = 267.371, Tag = "BulwarkBlood16"},
			ObjectSpawn	{ObjectId = 546, X = 563.684, Y = 457.686, Direction = 311.219, Tag = "BulwarkBlood17"},
			ObjectSpawn	{ObjectId = 546, X = 570.735, Y = 474.668, Direction = 129.665, Tag = "BulwarkBlood18"},
			ObjectSpawn	{ObjectId = 547, X = 548.097, Y = 460.837, Direction = 96.4849, Tag = "BulwarkBlood19"},
			ObjectSpawn	{ObjectId = 547, X = 559.981, Y = 470.804, Direction = 2.66976, Tag = "BulwarkBlood20"},
			-- Effekt von Portal löschen
			EffectStop {Tag = "WayBack"},
			-- Scriptingkram für Karte
			AvatarFlagSetTrue {Name = "af_P307_CS01Finished"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};