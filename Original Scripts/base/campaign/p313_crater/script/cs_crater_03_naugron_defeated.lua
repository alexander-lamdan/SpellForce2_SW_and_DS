--************************************************************
--**														**
--**		Crater Naugron Defeated							**
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
		--"'pl_HumanHeroJared'",
		--"'pl_HumanHeroShae'",
		--"'pl_HumanHeroMordecay'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf Spiegel
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene03"},
				AND
				{
					AvatarFlagIsTrue{Name = "af_P313_Cutscene03Begin"},
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
			CameraTakeAddToTrack {File = "CS_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Akteure Teleport
			FigureTeleport {Tag = "pl_HumanAvatar", X = 170.506, Y = 259.129},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},			
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 168.214, Y = 259.728},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 162.811},			
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 172.868, Y = 260.143},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 231.56},			
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 165.999, Y = 259.29},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 145.623},			
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 168.649, Y = 257.052},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 162.811},			
			FigureTeleport {Tag = "pl_HumanHeroMordecay", X = 172.72, Y = 257.293},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 214.377},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroBor"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroLya"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroJared"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroShae"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroMordecay"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroJared"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroShae"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroMordecay"},
			-- Knochenhaufen verschwindet, eventuell einen Effekt?
			-- Zum Testen aktivieren
			FigureVanish {Tag = "Naugron"},
			FigureVanish {Tag = "NaugronsServant01"},
			FigureVanish {Tag = "NaugronsServant02"},
			FigureVanish {Tag = "NaugronsServant03"},
			FigureVanish {Tag = "NaugronsServant04"},
			FigureVanish {Tag = "NaugronsServant05"},
			FigureVanish {Tag = "NaugronsServant06"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar: MirrorFree01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "MirrorFree01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02a",
	},
};

State
{
	StateName = "Cutscene02a",
	OnOneTimeEvent	-- Avatar geht zum Spiegel
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 170.506, Y = 261.209},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};



State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Avatar: MirrorFree02
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			CutsceneSay {TextTag = "MirrorFree02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Avatar: MirrorFree03
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
			CutsceneSay {TextTag = "MirrorFree03", Tag = "pl_HumanAvatar"},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 0},
			-- Vanish des Spiegels(landet nach der Cutscene im Inventar)
			ObjectVanish {Tag = "BlackMirror"},
			-- SOUND: Pick Up Mirror
			MapFlagSetTrue {Name = "mf_P313_Crater_03_SOUND_Play_Pick_Up_Mirror"},
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
			-- Talkjobs beenden
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "pl_HumanHeroBor"},
			FigureStop {Tag = "pl_HumanHeroLya"},
			FigureStop {Tag = "pl_HumanHeroJared"},
			FigureStop {Tag = "pl_HumanHeroShae"},
			FigureStop {Tag = "pl_HumanHeroMordecay"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroJared"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroShae"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroMordecay"},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue{Name = "af_P313_Cutscene03Ended"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};