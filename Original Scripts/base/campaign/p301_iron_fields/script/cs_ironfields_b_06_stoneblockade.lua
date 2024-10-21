--************************************************************
--**														**
--**		Iron Fields Part II Stoneblockade				**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"''",
	}
}

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		
		Conditions =
		{
			SetUpdateInterval {Steps = 10},
			FigureIsDead {Tag = "Blocking1"},
			FigureIsDead {Tag = "Blocking2"},
			FigureIsDead {Tag = "Blocking3"},
			FigureIsDead {Tag = "Blocking4"},
			FigureIsDead {Tag = "Blocking5"},
			FigureIsDead {Tag = "Blocking6"},
			FigureIsDead {Tag = "Blocking7"},
			FigureIsDead {Tag = "Blocking8"},
			FigureIsDead {Tag = "Blocking9"},
			FigureIsDead {Tag = "Blocking10"},
			FigureIsDead {Tag = "Blocking11"},
			FigureIsDead {Tag = "Blocking12"},
			FigureIsDead {Tag = "Blocking13"},
			FigureIsDead {Tag = "Blocking14"},
			FigureIsDead {Tag = "Blocking15"},
			FigureIsDead {Tag = "Blocking16"},
			FigureIsDead {Tag = "Blocking17"},
			FigureIsDead {Tag = "Blocking18"},
			FigureIsDead {Tag = "Blocking19"},
			FigureIsDead {Tag = "Blocking20"},
			FigureIsDead {Tag = "Blocking21"},
			QuestIsSolved {Quest = "AwakeTreants"},
			PlayerFigureIsInRange {Range = 30, X = 645, Y = 484},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P301_CutsceneDelay"}	
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kommentar
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneB06"},
				EntityTimerIsElapsed {Name = "et_P301_CutsceneDelay", Seconds = 10},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_06_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Spawn der Dummy-Bäume für die Cutscene
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_06_TreeAnt01", Level = 10, UnitId = 308, X = 636.6, Y = 478, Team = "tm_CutsceneFiguren"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_06_TreeAnt02", Level = 10, UnitId = 308, X = 640.8, Y = 475.8, Team = "tm_CutsceneFiguren"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_06_TreeAnt03", Level = 10, UnitId = 308, X = 645, Y = 474, Team = "tm_CutsceneFiguren"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_06_TreeAnt04", Level = 10, UnitId = 308, X = 647.8, Y = 474.8, Team = "tm_CutsceneFiguren"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_06_TreeAnt05", Level = 10, UnitId = 308, X = 650.6, Y = 477, Team = "tm_CutsceneFiguren"},},
			-- Ausrichtung der Akteure
			FigureLookAtDirection {Tag = "CS_B_06_TreeAnt01", Direction = 180},
			FigureLookAtDirection {Tag = "CS_B_06_TreeAnt02", Direction = 180},
			FigureLookAtDirection {Tag = "CS_B_06_TreeAnt03", Direction = 180},
			FigureLookAtDirection {Tag = "CS_B_06_TreeAnt04", Direction = 180},
			FigureLookAtDirection {Tag = "CS_B_06_TreeAnt05", Direction = 180},
			-- Teleport Avatar
			FigureTeleport {Tag = "pl_HumanAvatar", X = 654, Y = 477},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 200},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Erster Baum geht los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "CS_B_06_TreeAnt01", X = 636.6, Y = 487},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- zweiter Baum geht los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "CS_B_06_TreeAnt02", X = 640.8, Y = 487},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- dritter Baum geht los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "CS_B_06_TreeAnt03", X = 645, Y = 485.6},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- vierter Baum geht los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "CS_B_06_TreeAnt04", X = 647.8, Y = 485.6},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- fünfter Baum geht los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.1},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "CS_B_06_TreeAnt05", X = 650.6, Y = 488.4},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- erster Baum schlägt auf die Steine ein
	{
		Conditions =
		{
			FigureIsIdle {Tag = "CS_B_06_TreeAnt01"},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "CS_B_06_TreeAnt01", File = "base/gfx/figures/fraction_1/figure_elf_treant_attackleft.ska"},
			-- SOUND: Treant Attack1
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B06_SOUND_Play_Treant_Attack1"},
			EffectStart {Tag = "CS_B06_Effect01", File = "Effect_Misc_CrushingStoneBarrier"},
			
		},
	},
	OnOneTimeEvent	-- zweiter Baum schlägt auf die Steine ein
	{
		Conditions =
		{
			FigureIsIdle {Tag = "CS_B_06_TreeAnt02"},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "CS_B_06_TreeAnt02", File = "base/gfx/figures/fraction_1/figure_elf_treant_attackspecial.ska"},
			-- SOUND: Treant Attack2
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B06_SOUND_Play_Treant_Attack2"},
			EffectStart {Tag = "CS_B06_Effect02", File = "Effect_Misc_CrushingStoneBarrier"},
		},
	},
	OnOneTimeEvent	-- dritter Baum schlägt auf die Steine ein
	{
		Conditions =
		{
			FigureIsIdle {Tag = "CS_B_06_TreeAnt03"},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "CS_B_06_TreeAnt03", File = "base/gfx/figures/fraction_1/figure_elf_treant_attackleft.ska"},
			-- SOUND: Treant Attack3
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B06_SOUND_Play_Treant_Attack3"},
			EffectStart {Tag = "CS_B06_Effect03", File = "Effect_Misc_CrushingStoneBarrier"},
		},
	},
	OnOneTimeEvent	-- vierter Baum schlägt auf die Steine ein
	{
		Conditions =
		{
			FigureIsIdle {Tag = "CS_B_06_TreeAnt04"},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "CS_B_06_TreeAnt04", File = "base/gfx/figures/fraction_1/figure_elf_treant_attackspecial.ska"},
			-- SOUND: Treant Attack4
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B06_SOUND_Play_Treant_Attack4"},
			EffectStart {Tag = "CS_B06_Effect04", File = "Effect_Misc_CrushingStoneBarrier"},
		},
	},
	OnOneTimeEvent	-- fünfter Baum schlägt auf die Steine ein
	{
		Conditions =
		{
			FigureIsIdle {Tag = "CS_B_06_TreeAnt05"},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "CS_B_06_TreeAnt05", File = "base/gfx/figures/fraction_1/figure_elf_treant_attackright.ska"},
			-- SOUND: Treant Attack5
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B06_SOUND_Play_Treant_Attack5"},
			EffectStart {Tag = "CS_B06_Effect05", File = "Effect_Misc_CrushingStoneBarrier"},
		},
	},
	OnOneTimeEvent	-- 10 Sekunden nachdem die Bäume losgelaufen sind gehts in den nächsten State
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Kamerafahrt nach oben, so das die Steine und Treeants nicht mehr zu sehen sind
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_06_Take02", Tag = "default", TargetTag = "default"}, --7s
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Stoned"},
			FigureIsDead {Tag = "Tree1"},
			FigureIsDead {Tag = "Tree2"},
			FigureIsDead {Tag = "Tree3"},
			FigureIsDead {Tag = "Tree4"},
			FigureIsDead {Tag = "Tree5"},
			FigureIsDead {Tag = "Tree6"},
			FigureIsDead {Tag = "Tree7"},
			FigureIsDead {Tag = "Tree8"},
			FigureIsDead {Tag = "Grimrot"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_AddTree"}
		}
	},
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Bäume werden gelöscht
			FigureVanish {Tag = "CS_B_06_TreeAnt01"},
			FigureVanish {Tag = "CS_B_06_TreeAnt02"},
			FigureVanish {Tag = "CS_B_06_TreeAnt03"},
			FigureVanish {Tag = "CS_B_06_TreeAnt04"},
			FigureVanish {Tag = "CS_B_06_TreeAnt05"},
			-- SOUND: Treant Stop
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B06_SOUND_Stop_Treant_Stop"},
			-- Steinblockade wird gelöscht
			ObjectVanish {Tag = "DespawnBlocking"},
			-- Effekte werden gestoppt
			EffectStop {Tag = "CS_B06_Effect01"},
			EffectStop {Tag = "CS_B06_Effect02"},
			EffectStop {Tag = "CS_B06_Effect03"},
			EffectStop {Tag = "CS_B06_Effect04"},
			EffectStop {Tag = "CS_B06_Effect05"},
			-- Bäume werden zur Barrikade teleportiert
			FigureTeleport {Tag = "Grimrot", X = 645, Y = 485.6},
			FigureTeleport {Tag = "Tree1", X = 636.6, Y = 487},
			FigureTeleport {Tag = "Tree2", X = 640.8, Y = 487},
			FigureTeleport {Tag = "Tree3", X = 647.8, Y = 485.6},
			FigureTeleport {Tag = "Tree4", X = 650.6, Y = 488.4},
			FigureTeleport {Tag = "Tree5", X = 640.347, Y = 482.895},
			FigureTeleport {Tag = "Tree6", X = 645.317, Y = 480.913},
			FigureTeleport {Tag = "Tree7", X = 649.16, Y = 482.753},
			FigureTeleport {Tag = "Tree8", X = 643.415, Y = 477.286},
			-- Scriptingkram für die Karte
			MapTimerStart {Name = "mt_P301_OutcriesAfterDragonFight"},
			MapFlagSetTrue {Name = "mf_P301_Stoned"}
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};