--************************************************************
--**														**
--**		Iron Fields A Intro								**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'Bor'",
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
			-- Cutscene für Part 1
			-- erste Cutscene Vanish
			FigureVanish {Tag = "CS_A_01_Bor01"},
			FigureVanish {Tag = "CS_A_01_Bor02"},
			FigureVanish {Tag = "CS_A_01_Bor03"},
			FigureVanish {Tag = "CS_A_01_Bor04"},
			FigureVanish {Tag = "CS_A_01_Bor05"},
			FigureVanish {Tag = "CS_A_01_Bor06"},
			FigureVanish {Tag = "CS_A_01_Bor07"},
			FigureVanish {Tag = "CS_A_01_Bor08"},
			FigureVanish {Tag = "CS_A_01_Wolf01"},
			FigureVanish {Tag = "CS_A_01_Wolf02"},
			FigureVanish {Tag = "CS_A_01_Wolf03"},
			FigureVanish {Tag = "CS_A_01_Wolf04"},
			FigureVanish {Tag = "CS_A_01_Avatar01"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_A_02_Avatar01"},
			FigureVanish {Tag = "CS_A_02_Avatar02"},
			FigureVanish {Tag = "CS_A_02_Avatar03"},
			FigureVanish {Tag = "CS_A_02_Bor01"},
			FigureVanish {Tag = "CS_A_02_Bor02"},
			FigureVanish {Tag = "CS_A_02_Bor03"},
			-- dritte Cutscene Vanish		
			FigureVanish {Tag = "CS_A_03_Lya01"},
			-- vierte Cutscene Vanish
			FigureVanish {Tag = "CS_A_04_Shadowsong01"},
			FigureVanish {Tag = "CS_A_04_Shadowblade01"},
			FigureVanish {Tag = "CS_A_04_Shadowblade02"},
			FigureVanish {Tag = "CS_A_04_Avatar01"},
			FigureVanish {Tag = "CS_A_04_Bor01"},
			FigureVanish {Tag = "CS_A_04_Lya01"},
			-- fünfte Cutscene Vanish
			FigureVanish {Tag = "CS_A_05_Avatar01"},
			FigureVanish {Tag = "CS_A_05_Avatar02"},
			FigureVanish {Tag = "CS_A_05_Bor01"},
			FigureVanish {Tag = "CS_A_05_Lya01"},
			FigureVanish {Tag = "CS_A_05_Shadowsong01"},
			ObjectVanish {Tag = "CS_A_05_ShadowsongDead01"},
			ObjectVanish {Tag = "CS_A_05_ShadowbladeDead01"},
			ObjectVanish {Tag = "CS_A_05_ShadowbladeDead02"},
			-- sechste Cutscene Vanish
			FigureVanish {Tag = "CS_A_06_Avatar01"},
			FigureVanish {Tag = "CS_A_06_Bor01"},
			FigureVanish {Tag = "CS_A_06_Lya01"},
			FigureVanish {Tag = "CS_A_06_Shadowsong01"},
			-- siebte Cutscene Vanish
			FigureVanish {Tag = "CS_A_07_Avatar01"},
			FigureVanish {Tag = "CS_A_07_Shadowsong01"},
			-- achte Cutscene Vanish
			FigureVanish {Tag = "CS_A_08_Avatar01"},
			FigureVanish {Tag = "CS_A_08_Bor01"},
			FigureVanish {Tag = "CS_A_08_Lya01"},
			FigureVanish {Tag = "CS_A_08_Shadowsong01"},
			FigureVanish {Tag = "CS_A_08_TothLar01"},
			FigureVanish {Tag = "CS_A_08_Sorvina01"},
			FigureVanish {Tag = "CS_A_08_PortalDraghLurDummy"},
			FigureVanish {Tag = "CS_A_08_Devourer01"},
			-- neunte Cutscene Vanish
			FigureVanish {Tag = "CS_A_09_Avatar01"},
			FigureVanish {Tag = "CS_A_09_Thora01"},
			FigureVanish {Tag = "CS_A_09_Shadowsong01"},
			
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kamera auf Wasserfall
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneA01"},
				AND
				{
					-- !!! Fake, eigentlich beginnt die Cutscene direkt
					-- Testfake raus für Presse
					MapFlagIsTrue {Name = "mf_P301_Tutorial"},
					--MapTimerIsElapsed {Name = "mt_P301_IronFieldsTutorial", Seconds = 10},
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
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_A_01_Take01", Tag = "default", TargetTag = "default"}, --3s
			--CameraTrackPlay {},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take06", Tag = "default", TargetTag = "default"}, --10s
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 171.311, Y = 318.192},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 155},			
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			-- Waffen Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Bor"},
			-- Bor wird ins Team Neutral gesteckt, wegen dem Aggro auf den Wolf
			FigureTeamTransfer {Tag = "Bor", Team = "tm_Neutral"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		--GotoState = "Cutscene01",
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Bor läuft vor Wasserfall
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.8},
		},
		Actions =
		{
			FigureSimpleRun {Tag = "CS_A_01_Bor01", X = 241.409, Y = 158.428},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Kamera dazu
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take02", Tag = "default", TargetTag = "default"}, --6s
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Bor rennt durch den Wald
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			FigureSimpleRun {Tag = "CS_A_01_Bor03", X = 461.065, Y = 281.629},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kamera dazu
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.1},
		},
		Actions =
		{
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take03", Tag = "default", TargetTag = "default"}, --
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Wolf01 rennt los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.4},
		},
		Actions =
		{
			FigureSimpleRun {Tag = "CS_A_01_Wolf01", X = 625.098, Y = 116.871},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Wolf02 rennt los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleRun {Tag = "CS_A_01_Wolf02", X = 622.361, Y = 118.783},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Kamera zu den Wölfen
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.6},
		},
		Actions =
		{
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take04", Tag = "default", TargetTag = "default"}, --6s
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Bor läuft den Weg zum Monument entlang
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			FigureSimpleRun {Tag = "CS_A_01_Bor05", X = 166.875, Y = 306.67},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Kamera dazu
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take05", Tag = "default", TargetTag = "default"}, --4s
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Kamera dreht sich um das Monument
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.5},
		},
		Actions =
		{
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take06", Tag = "default", TargetTag = "default"}, --10s
			CameraTrackPlay {},
			FigureVanish {Tag = "CS_A_01_Bor05"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Bor geht zum Avatar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureTeleport {Tag = "Bor", X = 168.453, Y = 309.156},
			FigureLookAtDirection {Tag = "Bor", Direction = 153.735},						
			FigureSimpleWalk {Tag = "Bor", X = 172.766, Y = 317.342},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Bor0
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 9.9},
		},
		Actions =
		{
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take07", Tag = "default", TargetTag = "default"}, --10s
			CameraTrackPlay {},
			FigureLookAtDirection {Tag = "Bor", Direction = 165.195},
			FigureCutsceneTalkJobSet {Tag = "Bor"},			
			CutsceneSay {TextTag = "Bor0", Tag = "Bor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Avatar1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar1", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Bor1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Bor1", Tag = "Bor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Avatar2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar2", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Bor2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
 			CutsceneSay {TextTag = "Bor2", Tag = "Bor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Bor3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
 			CutsceneSay {TextTag = "Bor3", Tag = "Bor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- Bor4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_01_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
 			CutsceneSay {TextTag = "Bor4", Tag = "Bor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
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
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
			MapFlagIsTrue {Name = "mf_P301_NoTutorial"}
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- TalkJobStop
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "Bor"},
			-- Waffen Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Bor"},
			-- Vanish der Cutscenefiguren
			FigureVanish {Tag = "CS_A_01_Wolf01"},
			FigureVanish {Tag = "CS_A_01_Wolf02"},
			FigureVanish {Tag = "CS_A_01_Bor01"},
			FigureVanish {Tag = "CS_A_01_Bor03"},
			MapFlagSetTrue {Name = "mf_P301_Cutscene1End"},
			MapTimerStart {Name = "mt_P301_TutorialTimer"},
			-- Held tauschen für Cutscene muss noch Npc da sein
			FigureVanish {Tag = "Bor"},
			PlayerHeroAdd {Player = "pl_Human", HeroId = 8},
			FigureOutcry {TextTag = "System2", Tag = "System_Npc"}, --SYSTEM-OC: sie haben den Realm bekommen
			NoSpawnEffect {Spawn = FigureHeroSpawn {Player = "default", Tag = "HeroBor", X = 172.766, Y = 317.342, Direction = 90},},
		},
		GotoState = "CutsceneEnd",
	},
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
			OR
			{
				MapFlagIsTrue {Name = "mf_P301_MoreTutorial"},
				MapFlagIsTrue {Name = "mf_P301_LessTutorial"}
			}
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- TalkJobStop
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "Bor"},
			-- Waffen Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Bor"},
			-- Scriptingkram für die Karte
			MapFlagSetTrue {Name = "mf_P301_Cutscene1End"},
			MapTimerStart {Name = "mt_P301_TutorialTimer"},
			-- Bor wird zurück ins Team, was im Editor eingestellt ist, gesteckt
			FigureTeamTransfer {Tag = "Bor", Team = "tm_Team1"},
			-- Kamera hier schon Fix machen, weil es im Spiel zu lange gedauert hat und zu einem Blocker führte
			TutorialCameraCenterOnEntity {Tag = "pl_HumanAvatar"},
			TutorialCameraSetZoom {Zoom = 1},
			TutorialStateSet	{TutorialState = FreezeIsoCameraPosition},
			
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};