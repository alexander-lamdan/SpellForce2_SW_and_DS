--************************************************************
--**														**
--**		Gate of Swords City								**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanNightsong'",
		"'Kor'",
		"'IronLord'",
		"'Lokar'",
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
				MapFlagIsTrue	{Name = "mf_Cutscene04"},
				AND
				{
					FigureIsInRange	{Range = 8, X = 568, Y = 430, Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "Cs_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 569.089, Y = 428.084},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 301},
			FigureTeleport {Tag = "pl_HumanNightSong", X = 566.818, Y = 430.885},
			FigureLookAtDirection {Tag = "pl_HumanNightSong", Direction = 319},
			FigureTeleport {Tag = "Kor", X = 566.359, Y = 428.55},
			FigureLookAtDirection {Tag = "Kor", Direction = 297},
			FigureTeleport {Tag = "IronLord", X = 554.961, Y = 420.53},
			FigureLookAtDirection {Tag = "IronLord", Direction = 113},
			FigureTeleport {Tag = "Lokar", X = 554.036, Y = 423.817},
			FigureLookAtDirection {Tag = "Lokar", Direction = 90},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "IronLord"},
			FigureCutsceneTalkJobSet {Tag = "Lokar"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightSong"},
			CutsceneFigureWeaponsHide {Tag = "IronLord"},
			CutsceneFigureWeaponsHide {Tag = "Lokar"},
			-- Flag, damit Kor in der Cutscene seinen IdleGoHome verliert
			AvatarFlagSetTrue {Name = "af_P309_CutsceneIronLordStart"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};
State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- Avatar, Schattenlied und Kor laufen zum Eisenfürst
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 560.847, Y = 423.353},
			FigureSimpleWalk {Tag = "pl_HumanNightSong", X = 558.979, Y = 426.658},
			FigureSimpleWalk {Tag = "Kor", X = 558.092, Y = 423.749},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Kor: Kor5
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Kor"},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Kor5", Tag = "Kor"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightSong"},
			FigureCutsceneTalkJobSet {Tag = "Kor"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "Kor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Eisenfürst: Ironlord1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IronLord1", Tag = "IronLord"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Kor: Kor6
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Kor6", Tag = "Kor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Lokar: Lokar1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Lokar1", Tag = "Lokar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
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
			CameraTakeAddToTrack {File = "CS_04_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar2", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Avatar: Avatar3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar3", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Schattenlied: ShadowSong3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShadowSong3", Tag = "pl_HumanNightSong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Eisenfürst: IronLord2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IronLord2", Tag = "IronLord"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Eisenfürst: IronLord3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IronLord3", Tag = "IronLord"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Eisenfürst: IronLord4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "IronLord4", Tag = "IronLord"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Eisenfürst: IronLord5
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take09", Tag = "default", TargetTag = "default"}, -- 3s
			CameraTakeAddToTrack {File = "CS_04_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IronLord5", Tag = "IronLord"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
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
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
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
			FigureStop {Tag = "Kor"},
			FigureStop {Tag = "IronLord"},
			FigureStop {Tag = "Lokar"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightSong"},
			CutsceneFigureWeaponsShow {Tag = "Kor"},
			CutsceneFigureWeaponsShow {Tag = "IronLord"},
			CutsceneFigureWeaponsShow {Tag = "Lokar"},
			-- Kor bekommt seinen IdleGoHome wieder
			AvatarFlagSetTrue {Name = "af_P309_CutsceneIronLordEnd"},
			-- Scriptingkram für die Karte
			QuestSetSolved {Quest = "ToIronLord"},
			QuestSetSolved {Quest = "GoSPart1ToSwordwall"},
			QuestSetActive {Quest = "GoSPart2ShadowKnowledge"},
			QuestSetActive {Quest = "TalkToNightsongAboutShadows"},
			DialogTypeSetMainQuest {Tag = "pl_HumanNightSong"},
			DialogSetEnabled {Tag = "pl_HumanNightSong"},
    		PlayerHeroRemove {Player = "pl_Human", Tag = "NightSong"},
    		-- Weg ist die Schattenliesel
    		FigureOutcry {TextTag = "System2", Tag = "System_Npc"},
    		PortalEnable {Tag = "PortalStart"},
    		PortalEnable {Tag = "Needle"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};