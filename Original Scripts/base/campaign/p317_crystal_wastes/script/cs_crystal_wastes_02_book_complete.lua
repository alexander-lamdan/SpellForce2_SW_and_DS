--************************************************************
--**														**
--**		Crystal Wastes Book Complete					**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanNightsong"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		-- Golems werden in der Cutscene gespawnt
		"''",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf Schattenlied
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene02"},
				AND
				{
					AvatarFlagIsTrue {Name = "af_P317_Cutscene02Begin"},
					--AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsAlive {Tag = "pl_HumanAvatar"},
					FigureIsNotInCombat {Tag = "pl_HumanNightsong"},
				},
			},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureStop {Tag = "pl_HumanNightsong"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			ObjectSpawn	{ObjectId = 892, X = 308.263, Y = 203.286, Direction = 315, Tag = "CS_02_TowerOfFaces01"},
			FigureNpcSpawn	{Tag = "CS_02_Golem01", Level = 15, UnitId = 399, X = 306.65, Y = 207.151, Team = "tm_Neutral"},
			FigureLookAtDirection {Tag = "CS_02_Golem01", Direction = 285.516},
			FigureNpcSpawn	{Tag = "CS_02_Golem02", Level = 15, UnitId = 398, X = 306.17, Y = 200.507, Team = "tm_Neutral"},
			FigureLookAtDirection {Tag = "CS_02_Golem02", Direction = 279.786},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 249.558, Y = 167.41},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 0},
			-- Helden und Avatar werden in Sicherheit teleportiert, damit sie nicht sterben
			FigureTeleport {Tag = "pl_HumanAvatar", X = 223.83, Y = 144.74},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 227.604, Y = 145.581},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 230.681, Y = 146.138},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 226.76, Y = 141.211},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 223.923, Y = 140.7},
			FigureTeleport {Tag = "pl_HumanHeroMordecay", X = 230.334, Y = 141.522},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			-- Spawn der Book-Einheit, damit das Buch spricht
			FigureNpcSpawn {Tag = "Book", Level = 25, UnitId = 770, X = 225.4, Y = 137.2, Team = "tm_Neutral"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Schattenlied: Book_01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "Book_01", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Buch: Book_02
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
			CutsceneSay {TextTag = "Book_02", Tag = "Book"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Buch: Book_03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Book_03", Tag = "Book"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Schattenlied: Book_04
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
			CutsceneSay {TextTag = "Book_04", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
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
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
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
			-- Figuren zurück an ihre Ausgangsposition im Spiel
			CutsceneFigureTeleportBack {Tag = "pl_HumanAvatar"},
			CutsceneFigureTeleportBack {Tag = "pl_HumanNightsong"},
			CutsceneFigureTeleportBack {Tag = "pl_HumanHeroBor"},
			CutsceneFigureTeleportBack {Tag = "pl_HumanHeroLya"},
			CutsceneFigureTeleportBack {Tag = "pl_HumanHeroJared"},
			CutsceneFigureTeleportBack {Tag = "pl_HumanHeroShae"},
			CutsceneFigureTeleportBack {Tag = "pl_HumanHeroMordecay"},
			-- Talkjobs beenden
			FigureStop {Tag = "pl_HumanNightsong"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			-- Vanish der Cutscenefiguren die nur für Cutscene gespawnt wurden
			FigureVanish {Tag = "CS_02_Golem01"},
			FigureVanish {Tag = "CS_02_Golem02"},
			ObjectVanish {Tag = "CS_02_TowerOfFaces01"},
			-- Book wird gelöscht
			FigureVanish {Tag = "Book"},
			-- für das Scripting der Karte
			AvatarFlagSetTrue {Name = "af_P317_CS02Finished"},
			MapTimerStart	{Name = "mt_BookCompleteOutcries"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};