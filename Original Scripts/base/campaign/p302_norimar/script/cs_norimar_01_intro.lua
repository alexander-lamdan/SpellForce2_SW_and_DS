--************************************************************
--**														**
--**		Norimar Intro									**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanNightsong'",
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
			-- Portal Disable
			PortalDisable {Tag = "NorimarSued"},
			-- erste Cutscene Vanish
			FigureVanish {Tag = "CS_01_PortalDummy"},
			FigureVanish {Tag = "CS_01_Avatar01"},
			FigureVanish {Tag = "CS_01_Avatar02"},
			FigureVanish {Tag = "CS_01_Shadowsong01"},
			FigureVanish {Tag = "CS_01_Shadowsong02"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Avatar01"},
			FigureVanish {Tag = "CS_02_Avatar02"},
			FigureVanish {Tag = "CS_02_Shadowsong01"},
			FigureVanish {Tag = "CS_02_Shadowsong02"},
			FigureVanish {Tag = "CS_02_Lya01"},
			FigureVanish {Tag = "CS_02_Lya02"},
			FigureVanish {Tag = "CS_02_Bor01"},
			FigureVanish {Tag = "CS_02_Bor02"},
			-- dritte Cutscene Vanish
			FigureVanish {Tag = "CS_03_Avatar01"},
			FigureVanish {Tag = "CS_03_Avatar02"},
			-- vierte Cutscene Vanish
			FigureVanish {Tag = "CS_04_Avatar01"},
			FigureVanish {Tag = "CS_04_Avatar02"},
			FigureVanish {Tag = "CS_04_Avatar03"},
			FigureVanish {Tag = "CS_04_Avatar04"},
			FigureVanish {Tag = "CS_04_Avatar05"},
			FigureVanish {Tag = "CS_04_Avatar06"},
			FigureVanish {Tag = "CS_04_Shadowsong01"},
			FigureVanish {Tag = "CS_04_Shadowsong02"},
			FigureVanish {Tag = "CS_04_Shadowsong03"},
			FigureVanish {Tag = "CS_04_Shadowsong04"},
			FigureVanish {Tag = "CS_04_Shadowsong05"},
			FigureVanish {Tag = "CS_04_Shadowsong06"},
			FigureVanish {Tag = "CS_04_Lya01"},
			FigureVanish {Tag = "CS_04_Lya02"},
			FigureVanish {Tag = "CS_04_Lya03"},
			FigureVanish {Tag = "CS_04_Lya04"},
			FigureVanish {Tag = "CS_04_Lya05"},
			FigureVanish {Tag = "CS_04_Bor01"},
			FigureVanish {Tag = "CS_04_Bor02"},
			FigureVanish {Tag = "CS_04_Bor03"},
			FigureVanish {Tag = "CS_04_Bor04"},
			FigureVanish {Tag = "CS_04_Bor05"},
			FigureVanish {Tag = "CS_04_Falkmar01"},
			FigureVanish {Tag = "CS_04_Soldier01"},
			FigureVanish {Tag = "CS_04_Soldier02"},
			FigureVanish {Tag = "CS_04_Rottguy01"},
			FigureVanish {Tag = "CS_04_Rottguy02"},
			FigureVanish {Tag = "CS_04_Rottguy03"},
			FigureVanish {Tag = "CS_04_Rottguy04"},
			FigureVanish {Tag = "CS_04_Rottguy05"},
			FigureVanish {Tag = "CS_04_Rottguy06"},
			FigureVanish {Tag = "CS_04_Horse01"},
			FigureVanish {Tag = "CS_04_Horse02"},
			FigureVanish {Tag = "CS_04_Horse03"},
			FigureVanish {Tag = "CS_04_Horse04"},
			FigureVanish {Tag = "CS_04_Horse05"},
			FigureVanish {Tag = "CS_04_Horse06"},
			FigureVanish {Tag = "CS_04_Horse07"},
			FigureVanish {Tag = "CS_04_Horse08"},
			-- fünfte Cutscene
			FigureVanish {Tag = "CS_05_Rottgar01"},
			FigureVanish {Tag = "CS_05_Rottgar02"},
			FigureVanish {Tag = "CS_05_Rottgar03"},
			FigureVanish {Tag = "CS_05_Rottgar04"},
			FigureVanish {Tag = "CS_05_Guard01"},
			FigureVanish {Tag = "CS_05_Guard02"},
			FigureVanish {Tag = "CS_05_Guard03"},
			FigureVanish {Tag = "CS_05_Guard04"},
			FigureVanish {Tag = "CS_05_Guard05"},
			FigureVanish {Tag = "CS_05_Guard06"},
			FigureVanish {Tag = "CS_05_Guard07"},
			FigureVanish {Tag = "CS_05_Guard08"},
			FigureVanish {Tag = "CS_05_Guard09"},
			FigureVanish {Tag = "CS_05_Guard10"},
			FigureVanish {Tag = "CS_05_Guard11"},
			FigureVanish {Tag = "CS_05_Guard12"},
			FigureVanish {Tag = "CS_05_Guard13"},
			FigureVanish {Tag = "CS_05_Guard14"},
			FigureVanish {Tag = "CS_05_Guard15"},
			FigureVanish {Tag = "CS_05_Guard16"},
			FigureVanish {Tag = "CS_05_Guard17"},
			FigureVanish {Tag = "CS_05_Guard18"},
			FigureVanish {Tag = "CS_05_Guard19"},
			FigureVanish {Tag = "CS_05_Guard20"},
		},
	},	
	OnCutsceneFigureRespawnEvent	-- Kamera auf Portal
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene01"},
				AvatarFlagIsTrue {Name = "af_P302_Cutscene_Intro"},
			},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Akteure werden wegteleportiert
			FigureTeleport {Tag = "pl_HumanAvatar", X = 369.26, Y = 28.1493},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 368.067, Y = 26.3867},
			-- Talkjobs werden hier nicht benötigt
			-- Wepaon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			-- Effekt wird auf Avatar gestartet
			EffectStart {Tag = "pl_HumanAvatar", File = "Effect_Spawn_Unit"},
			-- Effekt auf Portal
			EffectStart {Tag = "NorimarSued", File = "Effect_Spawn_Gate"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar wird ins Portal teleportiert
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			FigureTeleport {Tag = "pl_HumanAvatar", X = 385.359, Y = 44.4153},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 135},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar geht aus dem Portal & Effekt auf Schattenlied
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 389.538, Y = 49.5613},
			EffectStart {Tag = "pl_HumanNightsong", File = "Effect_Spawn_Unit"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Nightsong wird ins Portal teleportiert
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			FigureTeleport {Tag = "pl_HumanNightsong", X = 385.359, Y = 44.4153},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 135},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Schattenlied geht aus dem Portal
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 390.999, Y = 48.2238},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Avatar: Avatar1
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanNightsong"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar1", Tag = "pl_HumanAvatar"},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},			
			-- Akteure werden ausgerichtet
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 126.051},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 148.969},
			-- Effekt auf Portal deaktivieren
			EffectStop {Tag = "NorimarSued"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Avatar: Avatar2
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
			CutsceneSay {TextTag = "Avatar2", Tag = "pl_HumanAvatar"},
			-- SOUND: Play Waterfall
			MapFlagSetTrue {Name = "mf_P302_Norimar_01_SOUND_Play_Waterfall"},
			EntityTimerStart {Name = "et_CStimer"},
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
			FigureStop {Tag = "pl_HumanNightsong"},
			-- WeaponShow
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			-- SOUND: Stop
			MapFlagSetTrue {Name = "mf_P302_Norimar_01_SOUND_Stop_Waterfall"},		
			-- Helden werden auf Avatar ausgerichtet
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 125},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 125},
			-- Scriptingkram für die Karte
			MapFlagSetTrue {Name = "mf_CS_norimar_intro_end"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};