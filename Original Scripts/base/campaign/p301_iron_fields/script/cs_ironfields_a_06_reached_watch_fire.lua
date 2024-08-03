--************************************************************
--**														**
--**		Iron Fields A Reached Watch Fire				**
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
		"'pl_HumanNightsong'",
		--"'Attacker'",
		"'LastTuztorialArmy1'",
		--"'LastTuztorialArmy2'",
		"'LastTuztorialArmy3'",
		"'LastTuztorialArmy4'",
		--"'LastTuztorialArmy5'",
		--"'LastTuztorialArmy6'",
		"'Peasant1'",
		"'Peasant2'",
		"'Peasant3'",
		"'Peasant4'",
		"'Peasant5'",
		"'Peasant6'",
		"'Peasant7'",
		"'Peasant8'",
		"'VillageAttack1'",
		"'VillageAttack2'",
		"'VillageAttack3'",
		"'Cutscene_Villager001'",
		"'Cutscene_Villager002'",
		"'Cutscene_Villager003'",
		"'Cutscene_Villager004'",
		"'Cutscene_Villager005'",
		"'Cutscene_Villager006'",
		"'Cutscene_Villager007'",
		"'Cutscene_Villager008'",
		"'Cutscene_Villager009'",
		"'Cutscene_Villager010'",
		"'Cutscene_Villager011'",
		"'Cutscene_Villager012'",
		"'Cutscene_Villager013'",
		"'Cutscene_Villager014'",
		"'Cutscene_Villager015'",
		"'Cutscene_Villager016'",
		"'Cutscene_Villager017'",
		"'Cutscene_Villager018'",
		"'Cutscene_Villager019'",
		"'Cutscene_Villager020'",
		"'Cutscene_Villager021'",
		"'Cutscene_Villager022'",
		"'Cutscene_Villager023'",
		"'Cutscene_Villager024'",
		"'Cutscene_Villager025'",
		"'Cutscene_Villager026'",
		"'Cutscene_Villager027'",
		"'Cutscene_Villager028'",
		"'Cutscene_Villager029'",
		"'Cutscene_Villager030'",
	}
}

State
{
	StateName = "INIT",
	OnOneTimeEvent	-- Timer, damit der Schalter komplett umgelegt wird, bevor die Cutscene loslegt
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneA06"},
				AND
				{
					MapFlagIsTrue {Name = "mf_P301_SignalFireCutscene"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
				},
			},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CSStartTimer"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kamera auf das eingekesselte Dorf
	{
		AllowCombat = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CSStartTimer", Seconds = 2},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
			FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_06_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 402.817, Y = 477.233},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 182.383},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 400.893, Y = 474.843},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 174.179},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 407.57, Y = 475.535},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 211.031},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 405.178, Y = 477.437},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 190.978},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroBor"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroLya"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			-- Waffen Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			-- zusätzliche Einheiten werden gespawnt, für eine Kameraeinstellung, und am Ende wieder gelöscht
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_A_06_DarkelfDummy01", Level = 1, UnitId = 336, X = 387.749, Y = 624.953, Team = "tm_CutsceneRed"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_A_06_DarkelfDummy02", Level = 1, UnitId = 336, X = 388.632, Y = 626.991, Team = "tm_CutsceneRed"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_A_06_DarkelfDummy03", Level = 1, UnitId = 336, X = 388.078, Y = 628.426, Team = "tm_CutsceneRed"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_A_06_DarkelfDummy04", Level = 1, UnitId = 338, X = 386.043, Y = 628.908, Team = "tm_CutsceneRed"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_A_06_DarkelfDummy05", Level = 1, UnitId = 337, X = 385.261, Y = 625.202, Team = "tm_CutsceneRed"},},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};

State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- Ausrichten der Dummies
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureLookAtDirection {Tag = "CS_A_06_DarkelfDummy01", Direction = 90},
			FigureLookAtDirection {Tag = "CS_A_06_DarkelfDummy02", Direction = 90},
			FigureLookAtDirection {Tag = "CS_A_06_DarkelfDummy03", Direction = 90},
			FigureLookAtDirection {Tag = "CS_A_06_DarkelfDummy04", Direction = 90},
			FigureLookAtDirection {Tag = "CS_A_06_DarkelfDummy05", Direction = 90},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- NightSong4
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6}, -- erst nach 6 Sekunden wegen Kamera(Jumpcuts)
		},
		Actions =
		{
			CutsceneSay {TextTag = "NightSong4", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar6
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_06_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar6", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- NightSong5
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_06_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSong5", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Avatar7
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_06_Take04", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_A_06_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar7", Tag = "pl_HumanAvatar"},
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
			-- Timer bleibt damit die Kamerfahrt bis zum Grenzposten auch komplett gesehen wird
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8},
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
			EntityTimerStop {Name = "et_CSStartTimer"},
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
			FigureStop {Tag = "pl_HumanNightsong"},			
			-- Waffen Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			-- Dummies werden wieder gelöscht
			FigureVanish {Tag = "CS_A_06_DarkelfDummy01"},
			FigureVanish {Tag = "CS_A_06_DarkelfDummy02"},
			FigureVanish {Tag = "CS_A_06_DarkelfDummy03"},
			FigureVanish {Tag = "CS_A_06_DarkelfDummy04"},
			FigureVanish {Tag = "CS_A_06_DarkelfDummy05"},
			-- Spyglass wird aktiviert
			LeverSetEnabled	{Tag = "Spyglass_01"},
			-- Scriptingkram für die Karte
			QuestSetActive {Quest = "TalkToPaladins"},
			QuestSetSolved {Quest = "IgniteAlarmFire"},
			MapFlagSetTrue {Name = "mf_P301_SignalFireCutsceneShown"},
			FogOfWarRevealAtEntity {Tag = "Wulfger", Range = 7, FogOfWarId = 1}
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};