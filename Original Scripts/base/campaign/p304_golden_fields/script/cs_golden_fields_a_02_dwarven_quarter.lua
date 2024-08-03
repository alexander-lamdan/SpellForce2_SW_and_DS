--************************************************************
--**														**
--**		Golden Fields Part I Dwarven Quarter			**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Windhammer'",
		"'Jared'",
		"'Asha'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Avatar läuft zu Windhammer
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneA02"},
				AND
				{
					AvatarFlagIsTrue {Name = "af_P304_JandrimArrival"}, -- Range 10 um Windhammer
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
			CameraTakeAddToTrack {File = "CS_A_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 478.294, Y = 603.464},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureTeleport {Tag = "Windhammer", X = 478.422, Y = 612.212},
			FigureLookAtDirection {Tag = "Windhammer", Direction = 25},			
			FigureTeleport {Tag = "Jared", X = 474.269, Y = 619.473},
			FigureLookAtDirection {Tag = "Jared", Direction = 20},
			FigureTeleport {Tag = "Asha", X = 487.235, Y = 611.527},
			FigureLookAtDirection {Tag = "Asha", Direction = 305},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Windhammer"},
			FigureCutsceneTalkJobSet {Tag = "Jared"},
			FigureCutsceneTalkJobSet {Tag = "Asha"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Windhammer"},
			CutsceneFigureWeaponsHide {Tag = "Asha"},
			CutsceneFigureWeaponsHide {Tag = "Jared"},			
			-- Avatar geht zu Jandrim Windhammer
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 478.294, Y = 609.114},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};



State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar: JandrimCS_01
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "JandrimCS_01", Tag = "pl_HumanAvatar"},
			-- Talkjob
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			-- Avatar wird auf Windhammer ausgerichtet
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Jandrim fällt um
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			MapFlagSetTrue {Name = "mf_P304_Windhammer_Dead_Anim_Play"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03a",
	},
};

State
{
	StateName = "Cutscene03a",
	OnOneTimeEvent	-- SOUND: Dwarf Fall
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.1},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P304_Golden_Fields_A02_SOUND_Play_Dwarf_Fall"},
		},
		GotoState = "Cutscene03b",
	},
};

State
{
	StateName = "Cutscene03b",
	OnOneTimeEvent	-- Avatar: JandrimCS_03
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "JandrimCS_03", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Jared kommt angerannt
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_02_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			FigureSimpleRun {Tag = "Jared", X = 476.503, Y = 612.632},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04a",
	},
};



State
{
	StateName = "Cutscene04a",
	OnOneTimeEvent	-- Jared: JandrimCS_04
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Jared"},
		},
		Actions =
		{
			CutsceneSay {TextTag = "JandrimCS_04", Tag = "Jared"},
			-- Talkjob
			FigureCutsceneTalkJobSet {Tag = "Jared"},
			-- Ausrichten von Jared auf Avatar
			FigureLookAtDirection {Tag = "Jared", Direction = 35},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Avatar: JandrimCS_05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "JandrimCS_05", Tag = "pl_HumanAvatar"},
			-- Ausrichten von Avatar auf Jared
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 210},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Jared: JandrimCS_06
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_02_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "JandrimCS_06", Tag = "Jared"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Jared: JandrimCS_07
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "JandrimCS_07", Tag = "Jared"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Asha kommt angelaufen
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_02_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Asha läuft los
			FigureSimpleWalk {Tag = "Asha", X = 479.904, Y = 611.527},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Asha: JandrimCS_08
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Asha"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_02_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay {TextTag = "JandrimCS_08", Tag = "Asha"},
			-- Talkjob
			FigureCutsceneTalkJobSet {Tag = "Asha"},
			-- Asha wird auf Jared ausgerichtet
			FigureLookAtDirection {Tag = "Asha", Direction = 275},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Jared: JandrimCS_09
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_02_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "JandrimCS_09", Tag = "Jared"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Kurze Pause nach CutsceneSay
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{

			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
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
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "Jared"},
			FigureStop {Tag = "Asha"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			--CutsceneFigureWeaponsShow {Tag = "Windhammer"},
			CutsceneFigureWeaponsShow {Tag = "Asha"},
			CutsceneFigureWeaponsShow {Tag = "Jared"},		
			-- Animation von Windhammer wird abgespielt, damit er durch den Stop nicht aufsteht
			FigureAnimPlayLooped {Tag = "Windhammer", File = "base/gfx/figures/npc/figure_npc_dwarf_dead.ska"}, -- 0.08s
			AvatarFlagSetTrue {Name = "af_P304_CS02Finished"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};