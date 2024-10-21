--************************************************************
--**														**
--**		Norimar Reached Eyrie							**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList_With_RotGuys = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList_With_RotGuys.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanNightsong'",
		"'pl_HumanHeroBor'",
		"'pl_HumanHeroLya'",
		"'Ortbrand'",
		"'Falkmar'",
		"'EyrieSoldier'",
		"'HorseArcher1'",
		"'HorseArcher2'",
		"'HorseArcher3'",
		"'HorseArcher4'",
		"'HorseArcher5'",
		"'HorseArcher6'",
		"'HorseArcher7'",
		"'HorseArcher8'",
		"'RotGuy1'",
		"'RotGuy2'",
		"'GateGuard'",
		"'GateGuardTagForRenderlist1'",
		"'GateGuardTagForRenderlist2'",
		"'GateGuardTagForRenderlist3'",
	}
}

-- Figuren die gerendert werden
local _tRenderList_With_RotGuy1 = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList_With_RotGuy1.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanNightsong'",
		"'pl_HumanHeroBor'",
		"'pl_HumanHeroLya'",
		"'Ortbrand'",
		"'Falkmar'",
		"'EyrieSoldier'",
		"'HorseArcher1'",
		"'HorseArcher2'",
		"'HorseArcher3'",
		"'HorseArcher4'",
		"'HorseArcher5'",
		"'HorseArcher6'",
		"'HorseArcher7'",
		"'HorseArcher8'",
		"'RotGuy1'",
		"'GateGuard'",
		"'GateGuardTagForRenderlist1'",
		"'GateGuardTagForRenderlist2'",
		"'GateGuardTagForRenderlist3'",
	}
}

-- Figuren die gerendert werden
local _tRenderList_With_RotGuy2 = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList_With_RotGuy2.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanNightsong'",
		"'pl_HumanHeroBor'",
		"'pl_HumanHeroLya'",
		"'Ortbrand'",
		"'Falkmar'",
		"'EyrieSoldier'",
		"'HorseArcher1'",
		"'HorseArcher2'",
		"'HorseArcher3'",
		"'HorseArcher4'",
		"'HorseArcher5'",
		"'HorseArcher6'",
		"'HorseArcher7'",
		"'HorseArcher8'",
		"'RotGuy2'",
		"'GateGuard'",
		"'GateGuardTagForRenderlist1'",
		"'GateGuardTagForRenderlist2'",
		"'GateGuardTagForRenderlist3'",
	}
}

-- Figuren die gerendert werden
local _tRenderList_WithOut_RotGuys = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList_WithOut_RotGuys.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanNightsong'",
		"'pl_HumanHeroBor'",
		"'pl_HumanHeroLya'",
		"'Ortbrand'",
		"'Falkmar'",
		"'EyrieSoldier'",
		"'HorseArcher1'",
		"'HorseArcher2'",
		"'HorseArcher3'",
		"'HorseArcher4'",
		"'HorseArcher5'",
		"'HorseArcher6'",
		"'HorseArcher7'",
		"'HorseArcher8'",
		"'GateGuard'",
		"'GateGuardTagForRenderlist1'",
		"'GateGuardTagForRenderlist2'",
		"'GateGuardTagForRenderlist3'",
	}
}

State
{
	StateName = "INIT",
------------------------------
--	Keine RotGuys übergeben --
------------------------------
	OnCutsceneFigureRespawnEvent	-- Kamera auf das Tor und die durchlaufenden Helden
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapFlagIsTrue {Name = "mf_Cutscene04"},
					MapFlagIsFalse {Name = "mf_GotRottgarGuys"},
				},
				AND
				{
					QuestIsSolved {Quest = "NorimarWachfeuerRest"},
					MapFlagIsFalse {Name = "mf_GotRottgarGuys"},
					OR
					{
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanAvatar"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanNightsong"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanHeroBor"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanHeroLya"},
					},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
					FigureIsNotInCombat {Tag = "pl_HumanNightsong"},
					FigureIsNotInCombat {Tag = "pl_HumanHeroBor"},
					FigureIsNotInCombat {Tag = "pl_HumanHeroLya"},
				},
			},
		},
		Actions =
		{
			_tRenderList_WithOut_RotGuys,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Tor öffnet sich
			GateSetOpen	 {Tag = "FalconGateEast"},
			-- Akteure Teleport
			FigureTeleport {Tag = "pl_HumanAvatar", X = 485.839, Y = 574.06},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 486.932, Y = 572.646},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 487.478, Y = 575.488},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 488.224, Y = 573.627},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 270},
			FigureTeleport {Tag = "Ortbrand", X = 414.329, Y = 567.927},
			FigureLookAtDirection {Tag = "Ortbrand", Direction = 0},
			FigureTeleport {Tag = "Falkmar", X = 411.437, Y = 566.939},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 35},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Ortbrand"},
			FigureCutsceneTalkJobSet {Tag = "Falkmar"},
			-- Wepaon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsHide {Tag = "Ortbrand"},
			CutsceneFigureWeaponsHide {Tag = "Falkmar"},
			-- Avatar läuft in die Stadt
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 463.576, Y = 573.939},
			-- Dunkelelfen-Spawning A
			MapFlagSetTrue {Name = "mf_P302_CS_04_DarkelfSpawnA"},
			-- Scriptingkram
			MapFlagSetTrue {Name = "mf_CS_norimar_eyrie_cutscene_EyrieSoldier_no_onidlegohome"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList_WithOut_RotGuys,
		GotoState = "Cutscene01a",
	},
-----------------------------------------
-- RotGuys übergeben, RotGuy1 am leben --
-----------------------------------------
	OnCutsceneFigureRespawnEvent	-- Kamera auf das Tor und die durchlaufenden Helden
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapFlagIsTrue {Name = "mf_Cutscene04"},
					MapFlagIsTrue {Name = "mf_GotRottgarGuys"},
					FigureIsAlive {Tag = "RotGuy1"},
					FigureIsDead {Tag = "RotGuy2"},
				},
				AND
				{
					QuestIsSolved {Quest = "NorimarWachfeuerRest"},
					MapFlagIsTrue {Name = "mf_GotRottgarGuys"},
					FigureIsAlive {Tag = "RotGuy1"},
					FigureIsDead {Tag = "RotGuy2"},
					OR
					{
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanAvatar"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanNightsong"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanHeroBor"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanHeroLya"},
					},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
					FigureIsNotInCombat {Tag = "pl_HumanNightsong"},
					FigureIsNotInCombat {Tag = "pl_HumanHeroBor"},
					FigureIsNotInCombat {Tag = "pl_HumanHeroLya"},
				},
			},
		},
		Actions =
		{
			_tRenderList_With_RotGuy1,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Tor öffnet sich
			GateSetOpen	 {Tag = "FalconGateEast"},
			-- Akteure Teleport
			FigureTeleport {Tag = "pl_HumanAvatar", X = 485.839, Y = 574.06},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 486.932, Y = 572.646},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 487.478, Y = 575.488},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 488.224, Y = 573.627},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 270},
			FigureTeleport {Tag = "Ortbrand", X = 414.329, Y = 567.927},
			FigureLookAtDirection {Tag = "Ortbrand", Direction = 0},
			FigureTeleport {Tag = "Falkmar", X = 411.437, Y = 566.939},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 35},
			FigureTeleport {Tag = "RotGuy1", X = 490, Y = 572.6},
			FigureLookAtDirection {Tag = "RotGuy1", Direction = 270},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Ortbrand"},
			FigureCutsceneTalkJobSet {Tag = "Falkmar"},
			-- Wepaon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsHide {Tag = "Ortbrand"},
			CutsceneFigureWeaponsHide {Tag = "Falkmar"},
			-- Dunkelelfen-Spawning A
			MapFlagSetTrue {Name = "mf_P302_CS_04_DarkelfSpawnA"},
			-- Scriptingkram
			MapFlagSetTrue {Name = "mf_CS_norimar_eyrie_cutscene_EyrieSoldier_no_onidlegohome"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList_With_RotGuy1,
		GotoState = "Cutscene01a",
	},
-----------------------------------------
-- RotGuys übergeben, RotGuy2 am leben --
-----------------------------------------
	OnCutsceneFigureRespawnEvent	-- Kamera auf das Tor und die durchlaufenden Helden
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapFlagIsTrue {Name = "mf_Cutscene04"},
					MapFlagIsTrue {Name = "mf_GotRottgarGuys"},
					FigureIsDead {Tag = "RotGuy1"},
					FigureIsAlive {Tag = "RotGuy2"},
				},
				AND
				{
					QuestIsSolved {Quest = "NorimarWachfeuerRest"},
					MapFlagIsTrue {Name = "mf_GotRottgarGuys"},
					FigureIsDead {Tag = "RotGuy1"},
					FigureIsAlive {Tag = "RotGuy2"},
					OR
					{
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanAvatar"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanNightsong"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanHeroBor"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanHeroLya"},
					},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
					FigureIsNotInCombat {Tag = "pl_HumanNightsong"},
					FigureIsNotInCombat {Tag = "pl_HumanHeroBor"},
					FigureIsNotInCombat {Tag = "pl_HumanHeroLya"},
				},
			},
		},
		Actions =
		{
			_tRenderList_With_RotGuy2,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Tor öffnet sich
			GateSetOpen	 {Tag = "FalconGateEast"},
			-- Akteure Teleport
			FigureTeleport {Tag = "pl_HumanAvatar", X = 485.839, Y = 574.06},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 486.932, Y = 572.646},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 487.478, Y = 575.488},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 488.224, Y = 573.627},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 270},
			FigureTeleport {Tag = "Ortbrand", X = 414.329, Y = 567.927},
			FigureLookAtDirection {Tag = "Ortbrand", Direction = 0},
			FigureTeleport {Tag = "Falkmar", X = 411.437, Y = 566.939},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 35},
			FigureTeleport {Tag = "RotGuy2", X = 490, Y = 575.4},
			FigureLookAtDirection {Tag = "RotGuy2", Direction = 270},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Ortbrand"},
			FigureCutsceneTalkJobSet {Tag = "Falkmar"},
			-- Wepaon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsHide {Tag = "Ortbrand"},
			CutsceneFigureWeaponsHide {Tag = "Falkmar"},
			-- Dunkelelfen-Spawning A
			MapFlagSetTrue {Name = "mf_P302_CS_04_DarkelfSpawnA"},
			-- Scriptingkram
			MapFlagSetTrue {Name = "mf_CS_norimar_eyrie_cutscene_EyrieSoldier_no_onidlegohome"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList_With_RotGuy2,
		GotoState = "Cutscene01a",
	},
-----------------------------------------------
-- RotGuys übergeben, beide RotGuys am leben --
-----------------------------------------------
	OnCutsceneFigureRespawnEvent	-- Kamera auf das Tor und die durchlaufenden Helden
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapFlagIsTrue {Name = "mf_Cutscene04"},
					MapFlagIsTrue {Name = "mf_GotRottgarGuys"},
					FigureIsAlive {Tag = "RotGuy1"},
					FigureIsAlive {Tag = "RotGuy2"},
				},
				AND
				{
					QuestIsSolved {Quest = "NorimarWachfeuerRest"},
					MapFlagIsTrue {Name = "mf_GotRottgarGuys"},
					FigureIsAlive {Tag = "RotGuy1"},
					FigureIsAlive {Tag = "RotGuy2"},
					OR
					{
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanAvatar"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanNightsong"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanHeroBor"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanHeroLya"},
					},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
					FigureIsNotInCombat {Tag = "pl_HumanNightsong"},
					FigureIsNotInCombat {Tag = "pl_HumanHeroBor"},
					FigureIsNotInCombat {Tag = "pl_HumanHeroLya"},
				},
			},
		},
		Actions =
		{
			_tRenderList_With_RotGuys,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Tor öffnet sich
			GateSetOpen	 {Tag = "FalconGateEast"},
			-- Akteure Teleport
			FigureTeleport {Tag = "pl_HumanAvatar", X = 485.839, Y = 574.06},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 486.932, Y = 572.646},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 487.478, Y = 575.488},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 488.224, Y = 573.627},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 270},
			FigureTeleport {Tag = "Ortbrand", X = 414.329, Y = 567.927},
			FigureLookAtDirection {Tag = "Ortbrand", Direction = 0},
			FigureTeleport {Tag = "Falkmar", X = 411.437, Y = 566.939},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 35},
			FigureTeleport {Tag = "RotGuy1", X = 490, Y = 572.6},
			FigureLookAtDirection {Tag = "RotGuy1", Direction = 270},
			FigureTeleport {Tag = "RotGuy2", X = 490, Y = 575.4},
			FigureLookAtDirection {Tag = "RotGuy2", Direction = 270},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Ortbrand"},
			FigureCutsceneTalkJobSet {Tag = "Falkmar"},
			-- Wepaon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsHide {Tag = "Ortbrand"},
			CutsceneFigureWeaponsHide {Tag = "Falkmar"},
			-- Dunkelelfen-Spawning A
			MapFlagSetTrue {Name = "mf_P302_CS_04_DarkelfSpawnA"},
			-- Scriptingkram
			MapFlagSetTrue {Name = "mf_CS_norimar_eyrie_cutscene_EyrieSoldier_no_onidlegohome"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList_With_RotGuys,
		GotoState = "Cutscene01a",
	},
------------------------------------------
-- RotGuys übergeben, beide RotGuys tot --
------------------------------------------
	OnCutsceneFigureRespawnEvent	-- Kamera auf das Tor und die durchlaufenden Helden
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapFlagIsTrue {Name = "mf_Cutscene04"},
					MapFlagIsTrue {Name = "mf_GotRottgarGuys"},
					FigureIsDead {Tag = "RotGuy1"},
					FigureIsDead {Tag = "RotGuy2"},
				},
				AND
				{
					QuestIsSolved {Quest = "NorimarWachfeuerRest"},
					MapFlagIsTrue {Name = "mf_GotRottgarGuys"},
					FigureIsDead {Tag = "RotGuy1"},
					FigureIsDead {Tag = "RotGuy2"},
					OR
					{
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanAvatar"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanNightsong"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanHeroBor"},
						FigureIsInRange	{Range = 8, X = 491.4, Y = 572.6, Tag = "pl_HumanHeroLya"},
					},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
					FigureIsNotInCombat {Tag = "pl_HumanNightsong"},
					FigureIsNotInCombat {Tag = "pl_HumanHeroBor"},
					FigureIsNotInCombat {Tag = "pl_HumanHeroLya"},
				},
			},
		},
		Actions =
		{
			_tRenderList_WithOut_RotGuys,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Tor öffnet sich
			GateSetOpen	 {Tag = "FalconGateEast"},
			-- Akteure Teleport
			FigureTeleport {Tag = "pl_HumanAvatar", X = 485.839, Y = 574.06},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 486.932, Y = 572.646},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 487.478, Y = 575.488},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 270},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 488.224, Y = 573.627},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 270},
			FigureTeleport {Tag = "Ortbrand", X = 414.329, Y = 567.927},
			FigureLookAtDirection {Tag = "Ortbrand", Direction = 0},
			FigureTeleport {Tag = "Falkmar", X = 411.437, Y = 566.939},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 35},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Ortbrand"},
			FigureCutsceneTalkJobSet {Tag = "Falkmar"},
			-- Wepaon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsHide {Tag = "Ortbrand"},
			CutsceneFigureWeaponsHide {Tag = "Falkmar"},
			-- Dunkelelfen-Spawning A
			MapFlagSetTrue {Name = "mf_P302_CS_04_DarkelfSpawnA"},
			-- Scriptingkram
			MapFlagSetTrue {Name = "mf_CS_norimar_eyrie_cutscene_EyrieSoldier_no_onidlegohome"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList_WithOut_RotGuys,
		GotoState = "Cutscene01a",
	},
};

State
{
	StateName = "Cutscene01a",
	OnOneTimeEvent	-- Avatar und Schattenlied laufen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 463.576, Y = 573.939},
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 464.337, Y = 572.549},
		},
		GotoState = "Cutscene01b",
	},
};

State
{
	StateName = "Cutscene01b",
	OnOneTimeEvent	-- Bor läuft los, RotGuy1 auch
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.4},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroBor", X = 464.816, Y = 575.41},
			FigureSimpleWalk {Tag = "RotGuy1", X = 466.2, Y = 572.6},
		},
		GotoState = "Cutscene01c",
	},
};

State
{
	StateName = "Cutscene01c",
	OnOneTimeEvent	-- Lya läuft los, RotGuy2 auch
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.6},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanHeroLya", X = 465.481, Y = 573.496},
			FigureSimpleWalk {Tag = "RotGuy2", X = 466.2, Y = 575.4},
		},
		GotoState = "Cutscene01d",
	},
};

State
{
	StateName = "Cutscene01d",
	OnOneTimeEvent	-- Hier müsste ne Schwarzblende kommen
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			-- Blende
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01e",
	},
};

State
{
	StateName = "Cutscene01e",
	OnOneTimeEvent	-- Avatar und Helden werden zu Baron Ortbrand teleportiert, RotGuys in die Stadt
	{
		Conditions =
		{
			-- Timer je nachdem wie lange so ne Blende zum Einblenden braucht
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 414.226, Y = 564.622},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 416.142, Y = 564.95},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 215},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 403.68, Y = 557.333},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 125},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 403.617, Y = 562.36},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 90},
			FigureTeleport {Tag = "RotGuy1", X = 432.6, Y = 581},
			FigureLookAtDirection {Tag = "RotGuy1", Direction = 90},
			FigureTeleport {Tag = "RotGuy2", X = 431.2, Y = 582.4},
			FigureLookAtDirection {Tag = "RotGuy2", Direction = 180},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroBor"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroLya"},
			-- Dunkelelfen-Spawning B
			MapFlagSetTrue {Name = "mf_P302_CS_04_DarkelfSpawnB"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

--State
--{
--	StateName = "Cutscene02",
--	OnOneTimeEvent	-- Wieder einblenden und Kamera auf Ortbrand und Co
--	{
--		Conditions =
--		{
--			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
--		},
--		Actions =
--		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_04_Take02", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
--
--			EntityTimerStart {Name = "et_CStimer"},
--		},
--		GotoState = "Cutscene03",
--	},
--};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Avatar: Avatar4
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar4", Tag = "pl_HumanAvatar"},
			-- Dunkelelfen-Spawning C
			MapFlagSetTrue {Name = "mf_P302_CS_04_DarkelfSpawnC"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Avatar: Avatar5
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar5", Tag = "pl_HumanAvatar"},
			-- Dunkelelfen-Spawning D
			MapFlagSetTrue {Name = "mf_P302_CS_04_DarkelfSpawnD"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Schattenlied: Nightsong1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Nightsong1", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Falkmar: Falkmar1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Falkmar1", Tag = "Falkmar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Soldat stürmt herein und Teleport
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureTeleport {Tag = "EyrieSoldier", X = 397.456, Y = 557.719},
			FigureLookAtDirection {Tag = "EyrieSoldier", Direction = 110},
			FigureSimpleRun {Tag = "EyrieSoldier", X = 410.031, Y = 563.765},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Kamera auf anstürmenden Soldaten
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Soldat: EyrieSoldier1
	{
		Conditions =
		{
			FigureIsIdle {Tag = "EyrieSoldier"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureLookAtDirection {Tag = "EyrieSoldier", Direction = 135},
			CutsceneSay {TextTag = "EyrieSoldier1", Tag = "EyrieSoldier"},
			-- Dunkelelfen-Armee geht los
			EntityTimerStart {Name = "et_CStimerA"},
		},
	},
	OnOneTimeEvent	-- Dunkelelfen A gehen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 1.6},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_001", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_005", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_009", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_013", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_017", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_021", X = 500.969, Y = 80.5515},
		},
	},
	OnOneTimeEvent	-- Dunkelelfen B gehen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 1.7},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_002", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_006", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_010", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_014", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_018", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_022", X = 500.969, Y = 80.5515},
		},
	},
	OnOneTimeEvent	-- Dunkelelfen C gehen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 1.8},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_003", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_007", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_011", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_015", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_019", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_023", X = 500.969, Y = 80.5515},
		},
	},
	
	OnOneTimeEvent	-- Dunkelelfen D gehen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 1.9},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_004", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_008", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_012", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_016", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_020", X = 500.969, Y = 80.5515},
			FigureSimpleWalk {Tag = "Cutscene_Darkelf_024", X = 500.969, Y = 80.5515},
		},
	},
	OnOneTimeEvent	-- Kamera auf Dunkelelfen-Armee
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 2.1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStop {Name = "et_CStimerA"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},	
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Falkmar: Falkmar2, Soldat wird wegteleportiert
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			-- Timmer bleibt drin, damit man die Armee auch lang genug sieht
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Falkmar2", Tag = "Falkmar"},
			-- Soldat wird zurück an seine Editor-Position teleportiert
			FigureTeleport {Tag = "EyrieSoldier", X = 387.239, Y = 604.92},
			FigureLookAtDirection {Tag = "EyrieSoldier", Direction = 0},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Baron: Ortbrand1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Ortbrand1", Tag = "Ortbrand"},
			-- Falkmar beenden
			FigureStop {Tag = "Falkmar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		--GotoState = "Cutscene12a",
		GotoState = "Cutscene12b",
	},
};

--State
--{
--	StateName = "Cutscene12a",
--	OnOneTimeEvent	-- Falkmar salutiert
--	{
--		Conditions =
--		{
--			CutsceneSayIsDone {},
--			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
--		},
--		Actions =
--		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_04_Take10a", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
--			FigureAnimPlayOnce	{Tag = "Falkmar", File = "base/gfx/figures/hero/figure_hero_male_emote_military.ska"},			
--			EntityTimerStart {Name = "et_CStimer"},
--		},
--		GotoState = "Cutscene12b",
--	},
--};

State
{
	StateName = "Cutscene12b",
	OnOneTimeEvent	-- Falkmar rennt los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "Falkmar", X = 400.335, Y = 557.305},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Baron: Ortbrand2, Falkmar Teleport
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Ortbrand2", Tag = "Ortbrand"},
			-- Falkmar wird teleportiert
			FigureTeleport {Tag = "Falkmar", X = 490, Y = 568.4},
			FigureLookAtDirection {Tag = "Falkmar", Direction = 90},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Baron: Ortbrand3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Ortbrand3", Tag = "Ortbrand"},
			EntityTimerStart {Name = "et_CStimerA"},
		},
	},
	OnOneTimeEvent	-- Kamera auf das Horn
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStop {Name = "et_CStimerA"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Baron: Ortbrand4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Ortbrand4", Tag = "Ortbrand"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

-----------------------------------------
-- zusätzliches Rauslaufen der Akteure --
-----------------------------------------

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Avatar und Schattenlied laufen los
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "pl_HumanAvatar", X = 397.6, Y = 558.6},
			FigureSimpleRun {Tag = "pl_HumanNightsong", X = 397.6, Y = 557.2},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Teleport der Akteure
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			-- Teleport der Helden und Avatar
			FigureTeleport {Tag = "pl_HumanAvatar", X = 463.4, Y = 574, },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 90},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 462, Y = 572.6},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 90},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 460.6, Y = 574},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 90},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 462, Y = 575.4},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 90},
			-- Teleport der Reiter vor das Tor
			FigureTeleport {Tag = "HorseArcher1", X = 495.6, Y = 571.2},
			FigureLookAtDirection {Tag = "HorseArcher1", Direction = 90},
			FigureTeleport {Tag = "HorseArcher2", X = 498.4, Y = 574},
			FigureLookAtDirection {Tag = "HorseArcher2", Direction = 90},
			FigureTeleport {Tag = "HorseArcher3", X = 497, Y = 576.8},
			FigureLookAtDirection {Tag = "HorseArcher3", Direction = 90},
			FigureTeleport {Tag = "HorseArcher4", X = 501.2, Y = 572.6},
			FigureLookAtDirection {Tag = "HorseArcher4", Direction = 90},
			FigureTeleport {Tag = "HorseArcher5", X = 502.6, Y = 575.4},
			FigureLookAtDirection {Tag = "HorseArcher5", Direction = 90},
			FigureTeleport {Tag = "HorseArcher6", X = 501.2, Y = 578.2},
			FigureLookAtDirection {Tag = "HorseArcher6", Direction = 90},
			FigureTeleport {Tag = "HorseArcher7", X = 504, Y = 569.8},
			FigureLookAtDirection {Tag = "HorseArcher7", Direction = 90},
			FigureTeleport {Tag = "HorseArcher8", X = 499.8, Y = 568.4},
			FigureLookAtDirection {Tag = "HorseArcher8", Direction = 90},
			-- Helden und Avatar laufen vor das Tor
			FigureSimpleRun {Tag = "pl_HumanAvatar", X = 492.8, Y = 574},
			FigureSimpleRun {Tag = "pl_HumanHeroBor", X = 490, Y = 574},
			FigureSimpleRun {Tag = "pl_HumanHeroLya", X = 491.4, Y = 572.6},
			FigureSimpleRun {Tag = "pl_HumanNightsong", X = 491.4, Y = 575.4},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- Kamera auf das Tor
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take16", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_04_Take17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Armee wird gelöscht
			MapFlagSetTrue {Name = "mf_P302_CS_04_Darkelf_Vanish"},
			-- Talkjobs beenden
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "pl_HumanNightsong"},
			FigureStop {Tag = "pl_HumanHeroBor"},
			FigureStop {Tag = "pl_HumanHeroLya"},
			FigureStop {Tag = "Ortbrand"},
			FigureStop {Tag = "Falkmar"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsShow {Tag = "Ortbrand"},
			CutsceneFigureWeaponsShow {Tag = "Falkmar"},
			-- Scriptingkram für die Karte
			MapFlagSetTrue {Name = "mf_SpawnAdvanceGuard"},
			MapFlagSetTrue {Name = "mf_StartDarkElfAttack"},
			MapFlagSetTrue {Name = "mf_CS_norimar_eyrie_end"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};