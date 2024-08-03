--************************************************************
--**														**
--**		Underhall Icequeen Defeated						**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanHeroBor'",
		"'pl_HumanHeroLya'",
		"'pl_HumanHeroJared'",
		"'Jandrim'",
		"'Thane'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Teleport der Akteure und Spawn der Leiche
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene03"},
				AND
				{
					MapFlagIsTrue {Name = "mf_CutsceneEndStart"},
					QuestIsSolved {Quest = "SaveThane"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
				},
			},
		},
		Actions =
		{
			_tRenderList,
			DialogSetDisabled	{Tag = "Jandrim"},
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--ObjectSpawn	{ObjectId = 847, X = 246.477, Y = 487.464, Direction = 73.5218, Tag = "Icequeen_Corpse"},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 210.037, Y = 506.048},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 342.238},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 214.666, Y = 503.978},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 274.056},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 216.296, Y = 505.151},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 279.786},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 215.672, Y = 502.293},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 262.597},
			FigureTeleport {Tag = "Jandrim", X = 207.628, Y = 506.242},
			FigureLookAtDirection {Tag = "Jandrim", Direction = 36.096},
			FigureTeleport {Tag = "Thane", X = 208.438, Y = 502.975},
			FigureLookAtDirection {Tag = "Thane", Direction = 171.497},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroBor"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroLya"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroJared"},
			FigureCutsceneTalkJobSet {Tag = "Jandrim"},
			FigureCutsceneTalkJobSet {Tag = "Thane"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroJared"},
			CutsceneFigureWeaponsHide {Tag = "Jandrim"},
			CutsceneFigureWeaponsHide {Tag = "Thane"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Thane: Thane_Wulfgar01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Thane_Wulfgar01", Tag = "Thane"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar: Avatar02
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
			CutsceneSay {TextTag = "Avatar02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Avatar: Avatar03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar03", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Thane: Thane_Wulfgar02
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
			CutsceneSay {TextTag = "Thane_Wulfgar02", Tag = "Thane"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Thane: Thane_Wulfgar03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Thane_Wulfgar03", Tag = "Thane"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Avatar: Avatar04
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
			CutsceneSay {TextTag = "Avatar04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Avatar: Avatar05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar05", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

--State    -- Fslscher Sprecher, also raus damit
--{
--	StateName = "Cutscene08",
--	OnOneTimeEvent	-- Jandrim: Jandrim06
--	{
--		Conditions =
--		{
--			CutsceneSayIsDone {},
--			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
--		},
--		Actions =
--		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_03_Take05", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
--			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 284.368},
--			FigureLookAtDirection {Tag = "Jandrim", Direction = 72.7656},			
--			CutsceneSay {TextTag = "Jandrim06", Tag = "Jandrim"},
--			EntityTimerStart {Name = "et_CStimer"},
--		},
--		GotoState = "Cutscene09",
--	},
--};

State
{
	StateName = "Cutscene08",
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
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
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
			-- Talkjobs werden beendet
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "pl_HumanHeroBor"},
			FigureStop {Tag = "pl_HumanHeroLya"},
			FigureStop {Tag = "pl_HumanHeroJared"},
			FigureStop {Tag = "Jandrim"},
			FigureStop {Tag = "Thane"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroJared"},
			CutsceneFigureWeaponsShow {Tag = "Jandrim"},
			CutsceneFigureWeaponsShow {Tag = "Thane"},
			-- Scriptingkram für die Karte
			MapFlagSetTrue	{Name = "mf_CutsceneIceQueenEnded"},
			AvatarItemMiscTake	{Player = "pl_Human", ItemId = 96, Amount = 1},			
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};