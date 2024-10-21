--************************************************************
--**
--**		Sevenkeeps Riddengard
--**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "Riddengard"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Caine'",
		"'Mordecay'",
		"'Riddengards_Gang01'",
		"'Riddengards_Gang02'",
		"'Riddengards_Gang03'",
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
			-- Cutscene Vanish
			FigureVanish {Tag = "Dummy_CS_04_Riddengard01"},
			FigureVanish {Tag = "Dummy_CS_04_Mordecay01"},
			FigureVanish {Tag = "Dummy_CS_04_Caine01"},
			FigureVanish {Tag = "Dummy_CS_04_Gang01"},
			FigureVanish {Tag = "Dummy_CS_04_Gang02"},
			FigureVanish {Tag = "Dummy_CS_04_Gang03"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_04"},
				AND
				{
					-- hier korrekte Startbedingungen eintragen
					MapFlagIsTrue {Name = "mf_P403_RiddengardCS"},
					-- Avatar führt keine Dialog und die UI ist sichtbar
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
				},
			},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "Riddengard", X = 272.647, Y = 389.383},
			FigureLookAtDirection {Tag = "Riddengard", Direction = 0},
			CutsceneFigureTeleport {Tag = "Caine", X = 272.513, Y = 386.124},
			FigureLookAtDirection {Tag = "Caine", Direction = 180},
			CutsceneFigureTeleport {Tag = "Mordecay", X = 269.293, Y = 388.209},
			FigureLookAtDirection {Tag = "Mordecay", Direction = 70},
			CutsceneFigureTeleport {Tag = "Riddengards_Gang01", X = 270.265, Y = 390.919},
			FigureLookAtDirection {Tag = "Riddengards_Gang01", Direction = 29},
			CutsceneFigureTeleport {Tag = "Riddengards_Gang02", X = 276.076, Y = 389.723},
			FigureLookAtDirection {Tag = "Riddengards_Gang02", Direction = 315},
			CutsceneFigureTeleport {Tag = "Riddengards_Gang03", X = 274.707, Y = 390.813},
			FigureLookAtDirection {Tag = "Riddengards_Gang03", Direction = 350},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "Riddengard"},
			CutsceneFigureWeaponsHide {Tag = "Caine"},
			CutsceneFigureWeaponsHide {Tag = "Mordecay"},
			CutsceneFigureWeaponsHide {Tag = "Riddengards_Gang01"},
			CutsceneFigureWeaponsHide {Tag = "Riddengards_Gang02"},
			CutsceneFigureWeaponsHide {Tag = "Riddengards_Gang03"},
			-- Talkjobs werden gesetzt
			FigureCutsceneTalkJobSet {Tag = "Riddengard"},
			FigureCutsceneTalkJobSet {Tag = "Caine"},
			FigureCutsceneTalkJobSet {Tag = "Mordecay"},
			FigureCutsceneTalkJobSet {Tag = "Riddengards_Gang01"},
			FigureCutsceneTalkJobSet {Tag = "Riddengards_Gang02"},
			FigureCutsceneTalkJobSet {Tag = "Riddengards_Gang03"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Riddengard06
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Riddengard06", Tag = "Riddengard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Riddengard07
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Riddengard07", Tag = "Riddengard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Kamera auf Caine, Caine nickt
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "Caine", File = "base/gfx/figures/hero/figure_hero_male_emote_yes.ska"}, -- 1.7
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kamera zeigt Caine und Riddengard, Ridden gar spielt Anim ab
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "Riddengard", File = "base/gfx/figures/hero/figure_hero_male_resolve_enemy.ska"}, -- 1s
			EffectStartAtEntityPosition	{Tag = "Caine", File = "Effect_ShadowDestroyer_ML_Initial"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Caine verschwindet
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.3},
		},
		Actions =
		{
			FigureVanish {Tag = "Caine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			-- Kameras werden gestoppt, Balken verschwinden, UI wird eingeblendet
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Talkjobs werden durch den Event direkt beendet
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Waffen werden wieder eingeblendet
			CutsceneFigureWeaponsShow {Tag = "Riddengard"},
			CutsceneFigureWeaponsShow {Tag = "Mordecay"},
			CutsceneFigureWeaponsShow {Tag = "Riddengards_Gang01"},
			CutsceneFigureWeaponsShow {Tag = "Riddengards_Gang02"},
			CutsceneFigureWeaponsShow {Tag = "Riddengards_Gang03"},
			-- Akteure werden an ihre Position vor der Cutscene zurückteleportiert
			CutsceneFigureTeleportBack	{Tag = "Riddengard"},
			CutsceneFigureTeleportBack	{Tag = "Mordecay"},
			CutsceneFigureTeleportBack	{Tag = "Riddengards_Gang01"},
			CutsceneFigureTeleportBack	{Tag = "Riddengards_Gang02"},
			CutsceneFigureTeleportBack	{Tag = "Riddengards_Gang03"},			
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_EndRiddengardCS"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};