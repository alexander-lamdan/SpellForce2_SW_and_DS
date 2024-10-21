--************************************************************
--**
--**		Refuge Arrival
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
	}
}

-- Figuren die gerendert werden
local _tRenderListWithDragons = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderListWithDragons.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroWind'",
		"'pl_HumanHeroWhisper'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroYasha'",
		"'pl_HumanHeroMordecay'",
		"'pl_HumanNightsong'",
		"'CS_01_Wyrm_01'",
		"'CS_01_Wyrm_02'",
		"'CS_01_Dragon'",
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
			FigureVanish {Tag = "Dummy_CS_01_Avatar01"},
			FigureVanish {Tag = "Dummy_CS_01_Avatar02"},
			FigureVanish {Tag = "Dummy_CS_01_Wind01"},
			FigureVanish {Tag = "Dummy_CS_01_Wind02"},
			FigureVanish {Tag = "Dummy_CS_01_Whisper01"},
			FigureVanish {Tag = "Dummy_CS_01_Whisper02"},
			FigureVanish {Tag = "Dummy_CS_01_Caine01"},
			FigureVanish {Tag = "Dummy_CS_01_Caine02"},
			FigureVanish {Tag = "Dummy_CS_01_Yasha01"},
			FigureVanish {Tag = "Dummy_CS_01_Yasha02"},
			FigureVanish {Tag = "Dummy_CS_01_Mordecay01"},
			FigureVanish {Tag = "Dummy_CS_01_Mordecay02"},
			FigureVanish {Tag = "Dummy_CS_01_Nightsong01"},
			FigureVanish {Tag = "Dummy_CS_01_Nightsong02"},
			FigureVanish {Tag = "CS_01_Dragon01"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- 
	{
		AllowCombat = true,
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene_01"},
				AND
				{
					-- hier korrekte Startbedingungen eintragen
					MapFlagIsTrue {Name = "mf_CS01Start"},
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
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 606.4, Y = 87.8, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 609.806, Y = 86.909, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 270},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 607.8, Y = 85, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 270},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 608, Y = 90.2, },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 270},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 611.12, Y = 84.3571, },
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 270},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 611.525, Y = 88.5191, },
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 270},
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 611.012, Y = 90.6724, },
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 270},
			CutsceneFigureTeleport {Tag = "CS_01_Wyrm_01", X = 581.912, Y = 85, },
			FigureLookAtDirection {Tag = "CS_01_Wyrm_01", Direction = 90},
			CutsceneFigureTeleport {Tag = "CS_01_Wyrm_02", X = 583.791, Y = 90.2, },
			FigureLookAtDirection {Tag = "CS_01_Wyrm_02", Direction = 90},
			CutsceneFigureTeleport {Tag = "CS_01_Dragon", X = 573, Y = 87.8, },
			FigureLookAtDirection {Tag = "CS_01_Dragon", Direction = 87.8},
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
			-- Avatar und Helden werden Immortal
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "pl_HumanAvatar"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "pl_HumanHeroWind"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "pl_HumanHeroWhisper"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "pl_HumanHeroCaine"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "pl_HumanHeroYasha"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "pl_HumanHeroMordecay"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "pl_HumanNightsong"},
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
	OnOneTimeEvent	-- CS01Wind01
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

			CutsceneSay	{TextTag = "CS01Wind01", Tag = "pl_HumanHeroWind"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- CS01Nightsong02
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS01Nightsong02", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- CS01Nightsong03
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
			CameraTakeAddToTrack {File = "CS_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS01Nightsong03", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- CS01Avatar04
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
			_tRenderListWithDragons,
			CutsceneSay	{TextTag = "CS01Avatar04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- CS01Whisper05 & Drachen werden gezeigt
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
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS01Whisper05", Tag = "pl_HumanHeroWhisper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Avatar tritt vor
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 601, Y = 87.8, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Drache kommt angeflogen und greift an
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "pl_HumanAvatar"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_01_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--FigureAttackEntity	{Tag = "CS_01_Dragon", TargetTag = "pl_HumanAvatar"},
			FigureSimpleRun {Tag = "CS_01_Dragon", X = 599.6, Y = 87.8, },
			MapFlagSetTrue {Name = "mf_CS_01_Effect_Fire_Start"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08a",
	},
};

State
{
	StateName = "Cutscene08a",
	OnOneTimeEvent	-- CS01Avatar06
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
			CutsceneSay	{TextTag = "CS01Avatar06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08b",
	},
};

State
{
	StateName = "Cutscene08b",
	OnOneTimeEvent	--Kamera hinter Wind, Wind spielt Animation ab
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroWind", File = "base/gfx/figures/hero/figure_hero_female_cast_65degree.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Wind spielt Animation ab
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.6},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "pl_HumanHeroWind", File = "base/gfx/figures/hero/figure_hero_female_resolve_enemy_65degree.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Wind schleudert Blitz in Richtung des Drachens
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
			FigureCastSpellToEntity	{Tag = "pl_HumanHeroWind", Spell = 13, Power = 30000, TargetTag = "CS_01_Dragon"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Kamera fährt auf Wyrms zu
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Wyrm greifen an, Waffen der Helden und des Avatar werden wieder eingeblendet
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			FigureSimpleRun {Tag = "CS_01_Wyrm_01", X = 601, Y = 87.8, },
			FigureSimpleRun {Tag = "CS_01_Wyrm_02", X = 601, Y = 87.8, },
			-- Waffen werden wieder dargestellt
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroYasha"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroMordecay"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Kamera auf Helden und Wyrms, Helden laufen los
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureRun {Tag = "pl_HumanHeroWind", X = 601, Y = 86.909, },
			FigureRun {Tag = "pl_HumanHeroWhisper", X = 601, Y = 85, },
			FigureRun {Tag = "pl_HumanHeroCaine", X = 601, Y = 90.2, },
			FigureRun {Tag = "pl_HumanHeroYasha", X = 601, Y = 84.3571, },
			FigureRun {Tag = "pl_HumanHeroMordecay", X = 601, Y = 88.5191, },
			FigureRun {Tag = "pl_HumanNightsong", X = 601, Y = 90.6724, },			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Wyrms wechseln das Team damit sie mit den Helden kämpfen
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.7},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "CS_01_Wyrm_01", Team = "tm_CS_01_aggro"},
			FigureTeamTransfer	{Tag = "CS_01_Wyrm_02", Team = "tm_CS_01_aggro"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
			FigureIsDead {Tag = "CS_01_Wyrm_01"},
			FigureIsDead {Tag = "CS_01_Wyrm_02"},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.5},
		},
		Actions =
		{
			_tRenderList,
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 601, Y = 87.8, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWind", X = 599.84, Y = 84.73, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWind", Direction = 190},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroWhisper", X = 602.12, Y = 86.42, },
			FigureLookAtDirection {Tag = "pl_HumanHeroWhisper", Direction = 256},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 601.6, Y = 89.96, },
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 303},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroYasha", X = 597.68, Y = 90.77, },
			FigureLookAtDirection {Tag = "pl_HumanHeroYasha", Direction = 35},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroMordecay", X = 601.91, Y = 84.41, },
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 234},
			CutsceneFigureTeleport {Tag = "pl_HumanNightsong", X = 598, Y = 88, },
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 88},
			-- Waffen werden wieder nicht dargestellt
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
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- CS01Nightsong07
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
			_tRenderList,
			CutsceneSay	{TextTag = "CS01Nightsong07", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- 
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
			CameraTakeAddToTrack {File = "CS_01_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS01Avatar08", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- CS01Caine09
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
			CameraTakeAddToTrack {File = "CS_01_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay	{TextTag = "CS01Caine09", Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- 
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
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
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
			-- Waffen werden wieder einblendet
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroWind"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroWhisper"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroYasha"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroMordecay"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			-- Avatar und Helden wird Immortal wieder weggenommen
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "pl_HumanAvatar"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "pl_HumanHeroWind"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "pl_HumanHeroWhisper"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "pl_HumanHeroCaine"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "pl_HumanHeroYasha"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "pl_HumanHeroMordecay"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "pl_HumanNightsong"},
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_CS01Ended"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};