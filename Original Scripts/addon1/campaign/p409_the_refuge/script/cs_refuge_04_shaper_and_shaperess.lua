--************************************************************
--**
--**		Refuge Shaper and Shaperess
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
		"'Shaper'",
		"'Shaperess'",
		"'Riddengard'",
	}
}

-- Figuren die gerendert werden
local _tRenderList2 = CutsceneFigureRenderList{Tag = "Shaper"}
_tRenderList2.tModFuncs =
{
	Add =
	{
		"'Shaperess'",
		"'Riddengard'",
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
			FigureVanish {Tag = "Dummy_CS_04_Shaper01"},
			FigureVanish {Tag = "Dummy_CS_04_Shaper02"},
			FigureVanish {Tag = "Dummy_CS_04_Shaperess01"},
			FigureVanish {Tag = "Dummy_CS_04_Shaperess02"},
			FigureVanish {Tag = "Dummy_CS_04_Riddengard01"},
			FigureVanish {Tag = "Dummy_CS_04_Riddengard02"},
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
					MapFlagIsTrue {Name = "mf_CS04Start"},
					-- Avatar führt keine Dialog und die UI ist sichtbar
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
				},
			},
		},
		Actions =
		{
			_tRenderList2,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "Shaper", X = 453.6, Y = 646.8, },
			FigureLookAtDirection {Tag = "Shaper", Direction = 90},
			CutsceneFigureTeleport {Tag = "Shaperess", X = 441, Y = 646.8, },
			FigureLookAtDirection {Tag = "Shaperess", Direction = 90},
			CutsceneFigureTeleport {Tag = "Riddengard", X = 439.6, Y = 634.2, },
			FigureLookAtDirection {Tag = "Riddengard", Direction = 90},
			-- Team vom Shaper wird gewechselt
			FigureTeamTransfer	{Tag = "Shaper", Team = "tm_Neutral"},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "Shaper"},
			CutsceneFigureWeaponsHide {Tag = "Shaperess"},
			CutsceneFigureWeaponsHide {Tag = "Riddengard"},
			-- Formerin wird Immortal
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Shaperess"},
			-- Talkjobs werden gesetzt
			FigureCutsceneTalkJobSet {Tag = "Shaper"},
			-- alte Drachen werden gelöscht
			FigureVanish {Tag = "CS_03_Noradim"},
			FigureVanish {Tag = "CS_03_Soulcarrier"},
			-- neue Drachen werden gespawnt
			MapFlagSetTrue {Name = "mf_CS_04_Actors_Spawn"},
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
	OnOneTimeEvent	-- CS04Shaper01
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "CS04Shaper01", Tag = "Shaper"},
			CutsceneFigureTeleport {Tag = "Shaperess", X = 441, Y = 646.8, },
			FigureLookAtDirection {Tag = "Shaperess", Direction = 90},
			CutsceneFigureTeleport {Tag = "Riddengard", X = 439.6, Y = 634.2, },
			FigureLookAtDirection {Tag = "Riddengard", Direction = 90},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Formerin kommt angelaufen
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
			FigureSimpleWalk {Tag = "Shaperess", X = 449.4, Y = 646.8, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- CS04Shaper02
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "Shaperess"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS04Shaper02", Tag = "Shaper"},
			FigureCutsceneTalkJobSet {Tag = "Shaperess"},
			FigureLookAtDirection {Tag = "Shaper", Direction = 270},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- CS04Shaper03
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
			CutsceneSay	{TextTag = "CS04Shaper03", Tag = "Shaper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Formerin spielt Anim ab
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
			CameraTakeAddToTrack {File = "CS_04_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "Shaperess", File = "base/gfx/figures/hero/figure_hero_female_resolve_enemy.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Formerin zaubert 
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
			FigureCastSpellToEntity	{Tag = "Shaperess", Spell = 13, Power = 30000, TargetTag = "Shaper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- CS04Shaper04
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
			CutsceneSay	{TextTag = "CS04Shaper04", Tag = "Shaper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- CS04Shaperess05
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
			CameraTakeAddToTrack {File = "CS_04_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS04Shaperess05", Tag = "Shaperess"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- CS04Shaperess06
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
			CameraTakeAddToTrack {File = "CS_04_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS04Shaperess06", Tag = "Shaperess"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Formerin spielt Anim ab
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
			FigureAnimPlayOnce {Tag = "Shaperess", File = "base/gfx/figures/hero/figure_hero_female_cast.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- CS04Shaper07
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
			CameraTakeAddToTrack {File = "CS_04_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS04Shaper07", Tag = "Shaper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12a",
	},
};

State
{
	StateName = "Cutscene12a",
	OnOneTimeEvent	-- Former spielt Cast-Animation ab
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
			CameraTakeAddToTrack {File = "CS_04_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "Shaper", File = "base/gfx/figures/hero/figure_hero_male_resolve_enemy.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12b",
	},
};

State
{
	StateName = "Cutscene12b",
	OnOneTimeEvent	-- Former castet
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
			FigureCastSpellToEntity	{Tag = "Shaper", Spell = 13, Power = 30000, TargetTag = "Shaperess"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- CS04Shaperess08 & Formerin bricht zusammen
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
			MapFlagSetTrue {Name = "mf_CS_04_Shaperess_Dead_Anim_Play"},			
			CutsceneSay	{TextTag = "CS04Shaperess08", Tag = "Shaperess"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Former rennt zur Formerin
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "Shaper", X = 451.8, Y = 646.8, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Former hockt sich hin
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "Shaper"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_04_Shaper_Kneel_Down_Anim_Play"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- CS04Shaper09
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
			CutsceneSay	{TextTag = "CS04Shaper09", Tag = "Shaper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Riddengard kommt angerannt
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
			CameraTakeAddToTrack {File = "CS_04_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "Riddengard", X = 449.4, Y = 644, },
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- CS04Riddengard10 & Former steht auf
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			FigureIsIdle {Tag = "Riddengard"},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "CS04Riddengard10", Tag = "Riddengard"},
			MapFlagSetTrue {Name = "mf_CS_04_Shaper_Kneel_Up_Anim_Play"},
			FigureCutsceneTalkJobSet {Tag = "Riddengard"},			
			FigureLookAtDirection {Tag = "Riddengard", Direction = 150},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- CS04Shaper11 & Former dreht sich
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "CS04Shaper11", Tag = "Shaper"},
			FigureLookAtDirection {Tag = "Shaper", Direction = 320},
			FigureCutsceneTalkJobSet {Tag = "Shaper"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- Former dreht sich zu den Drachen
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
			CameraTakeAddToTrack {File = "CS_04_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureLookAtDirection {Tag = "Shaper", Direction = 135},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent	-- CS04Shaper12
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
			CutsceneSay	{TextTag = "CS04Shaper12", Tag = "Shaper"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	-- Kamera auf Drachen, Riddengard, Former und Formerin
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
			CameraTakeAddToTrack {File = "CS_04_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	-- Effekte auf Former und Formerin
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
			EffectStartAtEntityPosition	{Tag = "Shaper", File = "Effect_ShadowDestroyer_ML_Initial"},
			EffectStartAtEntityPosition	{Tag = "Shaperess", File = "Effect_ShadowDestroyer_ML_Initial"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
	OnOneTimeEvent	-- Former und Formerin verschwinden
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--FigureIsIdle {Tag = ""},
			--FigureIsInRange--{Tag = "", Range = , X = , Y = },
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.35},
		},
		Actions =
		{
			FigureVanish {Tag = "Shaper"},
			FigureVanish {Tag = "Shaperess"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene26",
	},
};

State
{
	StateName = "Cutscene26",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
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
			CutsceneFigureWeaponsShow {Tag = "Riddengard"},
			-- Riddengard wird zurückteleportier
			CutsceneFigureTeleport {Tag = "Riddengard", X = 520.826, Y = 574.756, },
			FigureLookAtDirection {Tag = "Riddengard", Direction = 130},			
			-- Drachen werden wieder besiegbar
			FigureAbilityRemove	{Tag = "CS_03_Noradim", AbilityId = Ability.Immortal},
			FigureAbilityRemove	{Tag = "CS_03_Soulcarrier", AbilityId = Ability.Immortal},
			-- scriptingrelevante Flags
			MapFlagSetTrue {Name = "mf_CS04Ended"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};