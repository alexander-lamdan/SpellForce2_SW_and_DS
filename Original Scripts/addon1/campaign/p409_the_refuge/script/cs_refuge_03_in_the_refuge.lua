--************************************************************
--**
--**		Refuge In the Refuge
--**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroYasha'",
		"'pl_HumanHeroMordecay'",
		"'pl_HumanNightsong'",
		"'CS_03_Soulcarrier'",
		"'CS_03_Noradim'",
		"'CS_03_Drakling01'",
		"'CS_03_Drakling02'",
		"'CS_03_Drakling03'",
		"'CS_03_Drakling04'",
	}
}

local _tRenderList1 = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList1.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroYasha'",
		"'pl_HumanHeroMordecay'",
		"'pl_HumanNightsong'",
		"'CS_03_Soulcarrier'",
		"'CS_03_Noradim'",
		"'CS_03_Drakling01'",
		"'CS_03_Drakling02'",
		"'CS_03_Drakling03'",
		"'CS_03_Drakling04'",
		"'CS_03_CrystalDrakling'",
		"'CS_03_Beast01'",
		"'CS_03_Beast02'",
		"'CS_03_Beast03'",
		"'CS_03_Beast04'",
		"'CS_03_Beast05'",
		"'CS_03_Beast06'",
		"'CS_03_Beast07'",
		"'CS_03_Beast08'",
		"'CS_03_Beast09'",
		"'CS_03_Beast10'",
	}
}

local _tRenderList2 = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList2.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroYasha'",
		"'pl_HumanHeroMordecay'",
		"'pl_HumanNightsong'",
		"'CS_03_Soulcarrier'",
		"'CS_03_Noradim'",
		"'CS_03_Drakling01'",
		"'CS_03_Drakling02'",
		"'CS_03_Drakling03'",
		"'CS_03_Drakling04'",
		"'Riddengard'",
		"'Shaper'",
		"'CS_03_CrystalDrakling'",
		"'CS_03_Beast01'",
		"'CS_03_Beast02'",
		"'CS_03_Beast03'",
		"'CS_03_Beast04'",
		"'CS_03_Beast05'",
		"'CS_03_Beast06'",
		"'CS_03_Beast07'",
		"'CS_03_Beast08'",
		"'CS_03_Beast09'",
		"'CS_03_Beast10'",
	}
}

local _tRenderList3 = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList3.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroYasha'",
		"'pl_HumanHeroMordecay'",
		"'pl_HumanNightsong'",
		"'CS_03_Soulcarrier'",
		"'CS_03_Noradim'",
		"'CS_03_Drakling01'",
		"'CS_03_Drakling02'",
		"'CS_03_Drakling03'",
		"'CS_03_Drakling04'",
		"'Riddengard'",
		"'CS_03_CrystalDrakling'",
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
			FigureVanish {Tag = "Dummy_CS_03_Avatar01"},
			FigureVanish {Tag = "Dummy_CS_03_Avatar02"},
			FigureVanish {Tag = "Dummy_CS_03_Avatar03"},
			FigureVanish {Tag = "Dummy_CS_03_Wind01"},
			FigureVanish {Tag = "Dummy_CS_03_Wind02"},
			FigureVanish {Tag = "Dummy_CS_03_Wind03"},
			FigureVanish {Tag = "Dummy_CS_03_Whisper01"},
			FigureVanish {Tag = "Dummy_CS_03_Whisper02"},
			FigureVanish {Tag = "Dummy_CS_03_Whisper03"},
			FigureVanish {Tag = "Dummy_CS_03_Caine01"},
			FigureVanish {Tag = "Dummy_CS_03_Caine02"},
			FigureVanish {Tag = "Dummy_CS_03_Caine03"},
			FigureVanish {Tag = "Dummy_CS_03_Yasha01"},
			FigureVanish {Tag = "Dummy_CS_03_Yasha02"},
			FigureVanish {Tag = "Dummy_CS_03_Yasha03"},
			FigureVanish {Tag = "Dummy_CS_03_Mordecay01"},
			FigureVanish {Tag = "Dummy_CS_03_Mordecay02"},
			FigureVanish {Tag = "Dummy_CS_03_Mordecay03"},
			FigureVanish {Tag = "Dummy_CS_03_Nightsong01"},
			FigureVanish {Tag = "Dummy_CS_03_Nightsong02"},
			FigureVanish {Tag = "Dummy_CS_03_Nightsong03"},
			FigureVanish {Tag = "Dummy_CS_03_CrystalDrakling01"},
			FigureVanish {Tag = "Dummy_CS_03_Soulcarrier01"},
			FigureVanish {Tag = "Dummy_CS_03_Soulcarrier02"},
			FigureVanish {Tag = "Dummy_CS_03_Noradim01"},
			FigureVanish {Tag = "Dummy_CS_03_Noradim02"},
			FigureVanish {Tag = "Dummy_CS_03_Shaper01"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- 
	{
		AllowCombat = true,
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_03"},
				AND
				{
					-- hier korrekte Startbedingungen eintragen
					MapFlagIsTrue {Name = "mf_CS03Start"},
					-- Avatar führt keine Dialog und die UI ist sichtbar
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat	{Tag = "pl_HumanAvatar"},
					FigureIsNotInCombat	{Tag = "pl_HumanHeroWind"},
					FigureIsNotInCombat	{Tag = "pl_HumanHeroWhisper"},
					FigureIsNotInCombat	{Tag = "pl_HumanHeroCaine"},
					FigureIsNotInCombat	{Tag = "pl_HumanHeroYasha"},
					FigureIsNotInCombat	{Tag = "pl_HumanHeroMordecay"},
					FigureIsNotInCombat	{Tag = "pl_HumanNightsong"},
				},
			},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 167.501, Y = 469.76, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 169.533, Y = 468.272, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 270},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 168.663, Y = 471.463, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 270},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 171.456, Y = 467.674, },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 270},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 169.989, Y = 470.328, },
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 270},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 171.618, Y = 472.014, },
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 270},
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 172.632, Y = 469.84, },
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 270},
			-- Riddengard und Shaper spawnen
			MapFlagSetTrue {Name = "mf_CS_03_Actors_Spawn"},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroYasha"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroMordecay"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			-- Talkjobs werden gesetzt
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWind"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroWhisper"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroCaine"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroYasha"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroMordecay"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			FigureCutsceneTalkJobSet {Tag = "CS_03_Soulcarrier"},
			FigureCutsceneTalkJobSet {Tag = "CS_03_Noradim"},
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
	OnOneTimeEvent	-- Tor öffnet sich
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			GateSetOpen	{Tag = "Dragon_Residence_Gate"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar geht los
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			_tRenderList,
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 139.501, Y = 469.76, },
			CutsceneFigureTeleport {Tag = "Riddengard", X = 520.826, Y = 574.756, },
			FigureLookAtDirection {Tag = "Riddengard", Direction = 130},
			CutsceneFigureTeleport {Tag = "Shaper", X = 523.555, Y = 572.405, },
			FigureLookAtDirection {Tag = "Shaper", Direction = 150},
			CutsceneFigureWeaponsHide {Tag = "Riddengard"},
			CutsceneFigureWeaponsHide {Tag = "Shaper"},
			FigureCutsceneTalkJobSet {Tag = "Riddengard"},
			FigureCutsceneTalkJobSet {Tag = "Shaper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Wind geht los
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
			FigureSimpleWalk {Tag = "pl_HumanHeroWind", X = 139.501, Y = 469.76, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Yasha geht los
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroYasha", X = 141.989, Y = 470.328, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Whisper geht los
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.4},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroWhisper", X = 140.663, Y = 471.463, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Nightsong geht los
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
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 144.632, Y = 469.84, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Caine geht los
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
			FigureSimpleWalk {Tag = "pl_HumanHeroCaine", X = 143.456, Y = 467.674, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Mordecay geht los
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.25},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroMordecay", X = 143.618, Y = 472.014, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Kamera auf Drachen, Avatar und Helden werden umteleportiert
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			_tRenderList1,
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 123.2, Y = 519.4, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 135},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 120.605, Y = 520.779, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 125},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 123.841, Y = 516.175, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 145},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 117.583, Y = 519.357, },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 128},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 121.467, Y = 517.101, },
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 135},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 123.069, Y = 513.708, },
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 145},
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 119, Y = 516.6, },
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 135},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- CS03Soulcarrier01
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "CS03Soulcarrier01", Tag = "CS_03_Soulcarrier"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- CS03Avatar02
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
			CameraTakeAddToTrack {File = "CS_03_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS03Avatar02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- CS03Soulcarrier03
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
			CameraTakeAddToTrack {File = "CS_03_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay	{TextTag = "CS03Soulcarrier03", Tag = "CS_03_Soulcarrier"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- CS03Soulcarrier04
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
			CutsceneSay	{TextTag = "CS03Soulcarrier04", Tag = "CS_03_Soulcarrier"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- CS03Soulcarrier05
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
			CameraTakeAddToTrack {File = "CS_03_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay	{TextTag = "CS03Soulcarrier05", Tag = "CS_03_Soulcarrier"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- CS03Nightsong06
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
			CameraTakeAddToTrack {File = "CS_03_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay	{TextTag = "CS03Nightsong06", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Kamera auf Riddengards und Formers Position
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
			CameraTakeAddToTrack {File = "CS_03_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},	
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Effekte auf Positionen von Riddengard und Former
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EffectStartAtEntityPosition	{Tag = "Riddengard", File = "Effect_ShadowDestroyer_ML_Initial"},
			EffectStartAtEntityPosition	{Tag = "Shaper", File = "Effect_ShadowDestroyer_ML_Initial"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- Riddengard und Former werden sichtbar
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.4},
		},
		Actions =
		{
			_tRenderList2,
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- CS03Riddengard07
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
			CutsceneSay	{TextTag = "CS03Riddengard07", Tag = "Riddengard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- CS03Shaper08
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
			CutsceneSay	{TextTag = "CS03Shaper08", Tag = "Shaper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent	-- CS03Riddengard09
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
			CameraTakeAddToTrack {File = "CS_03_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS03Riddengard09", Tag = "Riddengard"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
	OnOneTimeEvent	-- CS03Shaper10
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
			CameraTakeAddToTrack {File = "CS_03_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS03Shaper10", Tag = "Shaper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	-- Kristalldrache im Refugium spawnt
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
			MapFlagSetTrue {Name = "mf_CS_03_CrystalDrakling_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	-- Kristalldrache fliegt los
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take11", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_03_Take11b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			FigureSimpleRun {Tag = "CS_03_CrystalDrakling", X = 119.043, Y = 505.212, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
	OnOneTimeEvent	-- CS03CrystalDrakeling11
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "CS_03_CrystalDrakling"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "CS03CrystalDrakeling11", Tag = "CS_03_CrystalDrakling"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene26",
	},
};

State
{
	StateName = "Cutscene26",
	OnOneTimeEvent	-- CS03Soulcarrier16
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
			CutsceneSay	{TextTag = "CS03Soulcarrier16", Tag = "CS_03_Soulcarrier"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene27",
	},
};

State
{
	StateName = "Cutscene27",
	OnOneTimeEvent	-- CS03Caine12
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
			CameraTakeAddToTrack {File = "CS_03_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS03Caine12", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene29",
	},
};

--State
--{
--	StateName = "Cutscene28",
--	OnOneTimeEvent	-- CS03Avatar13
--	{
--		Conditions =
--		{
--			CutsceneSayIsDone {},
--			--FigureIsIdle {Tag = ""},
--			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
--			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
--		},
--		Actions =
--		{
--			CutsceneSay	{TextTag = "CS03Avatar13", Tag = "pl_HumanAvatar"},
--			EntityTimerStart {Name = "et_CStimer"},
--		},
--		GotoState = "Cutscene29",
--	},
--};

State
{
	StateName = "Cutscene29",
	OnOneTimeEvent	-- CS03LordDragon15
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
			CameraTakeAddToTrack {File = "CS_03_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS03LordDragon15", Tag = "CS_03_Noradim"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene30",
	},
};

State
{
	StateName = "Cutscene30",
	OnOneTimeEvent	-- Former wird umteleportiert
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
			_tRenderList3,
			CutsceneFigureTeleport {Tag = "Shaper", X = 459.325, Y = 646.785, },
			FigureLookAtDirection {Tag = "Shaper", Direction = 280},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene31",
	},
};

State
{
	StateName = "Cutscene31",
	OnOneTimeEvent	-- Kamera auf Platz wo der Former steht, Meshs werden getauscht
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureUnitChange {Tag = "CS_03_Noradim", UnitId = 1599, Level = 30}, --1235
			FigureUnitChange {Tag = "CS_03_Soulcarrier", UnitId = 1600, Level = 30}, --1455
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene32",
	},
};

State
{
	StateName = "Cutscene32",
	OnOneTimeEvent	-- Seelenträger und Noradim werden um teleportiert, Former und Drachen immortal, Effekt auf Former
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneFigureTeleport {Tag = "CS_03_Noradim", X = 106, Y = 522, },
			FigureLookAtDirection {Tag = "CS_03_Noradim", Direction = 35},
			CutsceneFigureTeleport {Tag = "CS_03_Soulcarrier", X = 130, Y = 521, },
			FigureLookAtDirection {Tag = "CS_03_Soulcarrier", Direction = 350},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Shaper"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_03_Noradim"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_03_Soulcarrier"},
			EffectStartAtEntityPosition	{Tag = "Shaper", File = "Effect_ShadowDestroyer_ML_Initial"},
			FigureVanish {Tag = "CS_03_CrystalDrakling"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene33a",
	},
};

State
{
	StateName = "Cutscene33a",
	OnOneTimeEvent	-- Former wird sichtbar
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.4},
		},
		Actions =
		{
			_tRenderList2,
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene33b",
	},
};

State
{
	StateName = "Cutscene33b",
	OnOneTimeEvent	-- Drachen fliegen los
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureRun {Tag = "CS_03_Noradim", X = 123, Y = 456},
			FigureRun {Tag = "CS_03_Soulcarrier", X = 123, Y = 456},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene34",
	},
};

State
{
	StateName = "Cutscene34",
	OnOneTimeEvent	-- Kamera auf wegfliegende Drachen
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene35",
	},
};

State
{
	StateName = "Cutscene35",
	OnOneTimeEvent	-- Kamera auf Former, Drachen werden umteleportiert
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "CS_03_Noradim", X = 425.223, Y = 646.483, },
			FigureLookAtDirection {Tag = "CS_03_Noradim", Direction = 95},
			CutsceneFigureTeleport {Tag = "CS_03_Soulcarrier", X = 423.853, Y = 630.72, },
			FigureLookAtDirection {Tag = "CS_03_Soulcarrier", Direction = 105},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene36",
	},
};

State
{
	StateName = "Cutscene36",
	OnOneTimeEvent	-- Drachen fliegen los
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			FigureRun {Tag = "CS_03_Noradim", X = 450, Y = 649},
			FigureRun {Tag = "CS_03_Soulcarrier", X = 452, Y = 638},
		},
		GotoState = "Cutscene37",
	},
};

State
{
	StateName = "Cutscene37",
	OnOneTimeEvent	-- Drachen und Former wechseln ihre Teams und bekämpfen sich
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
			FigureTeamTransfer	{Tag = "CS_03_Noradim", Team = "tm_Dragons_Fight"},
			FigureTeamTransfer	{Tag = "CS_03_Soulcarrier", Team = "tm_Dragons_Fight"},
			FigureTeamTransfer	{Tag = "Shaper", Team = "tm_Shaper_Fight"},
		},
		GotoState = "Cutscene38",
	},
};

State
{
	StateName = "Cutscene38",
	OnOneTimeEvent	-- Kamerafahrt
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene39",
	},
};

State
{
	StateName = "Cutscene39",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene40",
	},
};

State
{
	StateName = "Cutscene40",
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
			-- Waffen werden wieder dargestellt
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroYasha"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroMordecay"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			-- Beasts werden gelöscht
			FigureVanish {Tag = "CS_03_Beast01"},
			FigureVanish {Tag = "CS_03_Beast02"},
			FigureVanish {Tag = "CS_03_Beast03"},
			FigureVanish {Tag = "CS_03_Beast04"},
			FigureVanish {Tag = "CS_03_Beast05"},
			FigureVanish {Tag = "CS_03_Beast06"},
			FigureVanish {Tag = "CS_03_Beast07"},
			FigureVanish {Tag = "CS_03_Beast08"},
			FigureVanish {Tag = "CS_03_Beast09"},
			FigureVanish {Tag = "CS_03_Beast10"},
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_CS03Ended"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};