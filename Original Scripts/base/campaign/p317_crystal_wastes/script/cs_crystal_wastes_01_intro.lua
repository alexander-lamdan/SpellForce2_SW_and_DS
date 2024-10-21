--************************************************************
--**														**
--**		Crystal Wastes Intro							**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanNightsong'",
		"'Sonnenspeer'",
		"'Arboghast'",
		"'Uthbrand'",
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
			FigureVanish {Tag = "CS_01_Shadowsong01"},
			FigureVanish {Tag = "CS_01_Sonnenspeer01"},
			FigureVanish {Tag = "CS_01_Arboghast01"},
			FigureVanish {Tag = "CS_01_Uthbrand01"},
			FigureVanish {Tag = "CS_01_Gruff01"},
			FigureVanish {Tag = "CS_01_Karn01"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Shadowsong01"},
			FigureVanish {Tag = "CS_02_Golem01"},
			FigureVanish {Tag = "CS_02_Golem02"},
			ObjectVanish {Tag = "CS_02_TowerOfFaces01"},
			FigureVanish {Tag = "CS_02_Avatar01"},
			FigureVanish {Tag = "CS_02_Bor01"},
			FigureVanish {Tag = "CS_02_Lya01"},
			FigureVanish {Tag = "CS_02_Jared01"},
			FigureVanish {Tag = "CS_02_Shae01"},
			FigureVanish {Tag = "CS_02_Mordecay01"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kamera auf Shadowsong
	{
		Conditions =
		{
			--MapFlagIsTrue {Name = "mf_Cutscene01"},
			AvatarFlagIsTrue{Name = "af_P301_CampaignStarted"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 32.9086, Y = 31.0635},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 148.178},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 31.4492, Y = 32.6565},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 127.552},
			FigureTeleport {Tag = "Sonnenspeer", X = 268, Y = 256.011},
			FigureLookAtDirection {Tag = "Sonnenspeer", Direction = 322.449},
			FigureTeleport {Tag = "Arboghast", X = 265.359, Y = 256.717},
			FigureLookAtDirection {Tag = "Arboghast", Direction = 342.503},
			FigureTeleport {Tag = "Uthbrand", X = 269.402, Y = 253.716},
			FigureLookAtDirection {Tag = "Uthbrand", Direction = 304.686},
			FigureTeleport {Tag = "Gruff", X = 262.21, Y = 256.975},
			FigureLookAtDirection {Tag = "Gruff", Direction = 345.676},
			FigureTeleport {Tag = "Karn", X = 272.76, Y = 252.094},
			FigureLookAtDirection {Tag = "Karn", Direction = 300.413},
			-- Helden wegteleportieren, und am Ende der Cutscene zurück
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 227.604, Y = 145.581},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 230.681, Y = 146.138},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 226.76, Y = 141.211},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 223.923, Y = 140.7},			
			FigureTeleport {Tag = "pl_HumanHeroMordecay", X = 230.334, Y = 141.522},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			FigureCutsceneTalkJobSet {Tag = "Sonnenspeer"},
			FigureCutsceneTalkJobSet {Tag = "Arboghast"},
			FigureCutsceneTalkJobSet {Tag = "Uthbrand"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsHide {Tag = "Sonnenspeer"},
			CutsceneFigureWeaponsHide {Tag = "Arboghast"},
			CutsceneFigureWeaponsHide {Tag = "Uthbrand"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Schattenlied: Entry_01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Entry_01", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Schattenlied: Entry_02 & Kamera auf Lager der Clans
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
			CameraTakeAddToTrack {File = "CS_01_Take02a", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_01_Take02b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay {TextTag = "Entry_02", Tag = "pl_HumanNightsong"},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Sonnenspeer: Entry_03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			-- Timer muss bleiben, damit die Kameras alles gezeigt haben
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			-- Ausblenden aller Figuren außer denen in der Liste ganz oben
			_tRenderList,
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Entry_03", Tag = "Sonnenspeer"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Arboghast: Entry_04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Entry_04", Tag = "Arboghast"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Uthbrand: Entry_05
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
			CutsceneSay {TextTag = "Entry_05", Tag = "Uthbrand"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Sonnenspeer: Entry_06
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Entry_06", Tag = "Sonnenspeer"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Sonnenspeer: Entry_07
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
			CutsceneSay {TextTag = "Entry_07", Tag = "Sonnenspeer"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Kamera wieder auf Schattenlied und Avatar
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Schattenlied: Entry_08
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Entry_08", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Schattenlied: Entry_09
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Entry_09", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Schattenlied: Entry_10
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
			CutsceneSay {TextTag = "Entry_10", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Schattenlied: Entry_11
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Entry_11", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
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
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
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
			FigureStop {Tag = "Sonnenspeer"},
			FigureStop {Tag = "Arboghast"},
			FigureStop {Tag = "Uthbrand"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsShow {Tag = "Sonnenspeer"},
			CutsceneFigureWeaponsShow {Tag = "Arboghast"},
			CutsceneFigureWeaponsShow {Tag = "Uthbrand"},
			-- Figuren wieder zurück da wo sie im Editor stehen
			CutsceneFigureTeleportBack {Tag = "Sonnenspeer"},
			CutsceneFigureTeleportBack {Tag = "Arboghast"},
			CutsceneFigureTeleportBack {Tag = "Uthbrand"},
			CutsceneFigureTeleportBack {Tag = "Gruff"},
			CutsceneFigureTeleportBack {Tag = "Karn"},
			-- Helden wieder an ihre ursprünglichen Positionen
			CutsceneFigureTeleportBack {Tag = "pl_HumanHeroBor"},
			CutsceneFigureTeleportBack {Tag = "pl_HumanHeroLya"},
			CutsceneFigureTeleportBack {Tag = "pl_HumanHeroJared"},
			CutsceneFigureTeleportBack {Tag = "pl_HumanHeroShae"},
			CutsceneFigureTeleportBack {Tag = "pl_HumanHeroMordecay"},
			-- für das Scripting der Karte
			AvatarFlagSetTrue {Name = "af_P317_CS01Finished"},
			MapTimerStart	{Name = "mt_EmpressOutcries"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};