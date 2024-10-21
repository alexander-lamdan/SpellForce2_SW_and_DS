--************************************************************
--**														**
--**		Iron Fields A Portal DraghLur					**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"''",
		--"'TothLar'",
		--"'Sorvina'",
		--"'CS_A_08_Darkelf01'",
		--"'CS_A_08_Darkelf02'",
		--"'CS_A_08_Darkelf03'",
		--"'CS_A_08_Darkelf04'",
		--"'CS_A_08_Darkelf05'",
		--"'CS_A_08_Darkelf06'",
		--"'CS_A_08_Darkelf07'",
		--"'CS_A_08_Darkelf08'",
		--"'CS_A_08_Darkelf09'",
		--"'CS_A_08_Darkelf10'",
		--"'CS_A_08_Darkelf11'",
		--"'CS_A_08_Darkelf12'",
		--"'CS_A_08_Darkelf13'",
		--"'CS_A_08_Darkelf14'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf Portal nach DraghLur
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneA08"},
				AND
				{
					FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "Portal_Norimar", Range = 10},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
					-- Die Cutscene darf nicht schon kommen, wenn der Spieler sich aus Versehen zum Portal verirrt, das wäre in der alten Version der Map nicht gegangen, jetzt aber
					MapFlagIsTrue {Name = "mf_P301_SecondUrCS"}
				},
			},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_08_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 168.308, Y = 638.334},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 169.547, Y = 636.813},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 169.803, Y = 640.158},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 270},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 171.648, Y = 637.89},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 270},
			-- Dunkelelfen vor Portal werden gespawnt
			MapFlagSetTrue {Name = "mf_CS_A_08_Darkelves_Spawn"},
			-- Effekt auf Portal, durch das Sorvina kommt
			EffectStart {Tag = "Portal_DraghLur", File = "Effect_Spawn_Gate"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Sorvina erscheint im Portal
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_A_08_Sorvina_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Sorvina läuft aus Portal
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Sorvina", X = 658.412, Y = 179.001},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- TothLar erscheint im Portal
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_A_08_TothLar_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- TothLar läuft aus Portal
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "TothLar", X = 656.183, Y = 180.718},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- TothLar: TothLar0
	{
		Conditions =
		{
			FigureIsIdle {Tag = "TothLar"},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_08_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TothLar0", Tag = "TothLar"},
			-- Akteure ausrichten
			FigureLookAtDirection {Tag = "Sorvina", Direction = 270},
			FigureLookAtDirection {Tag = "TothLar", Direction = 270},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "TothLar"},
			FigureCutsceneTalkJobSet {Tag = "Sorvina"},
			-- Effekt wird vom Portal entfernt
			EffectStop {Tag = "Portal_DraghLur"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- TothLar: TothLar0a
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_08_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TothLar0a", Tag = "TothLar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- TothLar: TothLar0b
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "TothLar0b", Tag = "TothLar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Sorvina: Sorvina0
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_08_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina0", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Sorvina spielt Cast-Animation ab, Devourer spawnt hier schon, 
	-- weil es keinen Spawneffekt für ihn gibt, steht er schon da, wenn die Kamera auf seine Position zeigt
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_08_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "Sorvina", File = "base/gfx/figures/boss/figure_boss_sorvina_special_cutscene_cast.ska"},
			-- Effekt auf Sorvina
			EffectStart	{Tag = "Sorvina", File = "Effect_Misc_Sorvina_CastResolve"},
			-- SOUND: Sorvina Cast
			MapFlagSetTrue {Name = "mf_P301_Tutorial_A08_SOUND_Play_Sorvina_Cast"},
			-- Devourer spawnt
			MapFlagSetTrue {Name = "mf_P301_Hydra_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Sound für Devourer-Spawning
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			-- SOUND: Spawn Devourer
			MapFlagSetTrue {Name = "mf_P301_Tutorial_A08_SOUND_Play_Devourer_Spawn"},
			-- hier eintragen
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Kamerawechsel
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_08_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Verschlinger spielt Animation ab
			FigureAnimPlayOnce	{Tag = "Hydra", File = "base/gfx/figures/boss/figure_boss_devourer_special_cutscene_cast.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- SOUND: Devourer Scream
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			-- SOUND: Devourer Scream
			MapFlagSetTrue {Name = "mf_P301_Tutorial_A08_SOUND_Play_Devourer_Scream"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
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
			FigureStop {Tag = "TothLar"},
			FigureStop {Tag = "Sorvina"},
			-- Scriptingkram für die Karte
			MapFlagSetTrue {Name = "mf_CS_A_08_Darkelves_Vanish"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};