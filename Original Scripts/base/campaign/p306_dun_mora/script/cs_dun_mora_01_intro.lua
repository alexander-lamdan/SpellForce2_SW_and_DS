--************************************************************
--**														**
--**		Dun Mora Intro									**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Shae'",
		"'CS_01_Demon01'",
		"'CS_01_Demon02'",
		"'CS_01_DepressedElf01'",
		"'CS_01_DepressedElf02'",
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
			-- erste Cutscene Vanish
			FigureVanish {Tag = "CS_01_Avatar01"},
			FigureVanish {Tag = "CS_01_Avatar02"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Avatar01"},
			-- dritte Cutscene Vanish
			FigureVanish {Tag = "CS_03_TeleportDummy"},
			FigureVanish {Tag = "CS_03_TeleportGoto"},
			FigureVanish {Tag = "CS_03_Avatar01"},
			FigureVanish {Tag = "CS_03_Io01"},
			FigureVanish {Tag = "CS_03_Io02"},
			FigureVanish {Tag = "CS_03_Worker01a"},
			FigureVanish {Tag = "CS_03_Worker01b"},
			FigureVanish {Tag = "CS_03_Worker02a"},
			FigureVanish {Tag = "CS_03_Worker02b"},
			FigureVanish {Tag = "CS_03_Worker03a"},
			FigureVanish {Tag = "CS_03_Worker03b"},
			FigureVanish {Tag = "CS_03_Worker04b"},
			FigureVanish {Tag = "CS_03_Worker05b"},
			FigureVanish {Tag = "CS_03_Worker06b"},
			FigureVanish {Tag = "CS_03_Worker07b"},
			FigureVanish {Tag = "CS_03_Worker08b"},
			FigureVanish {Tag = "CS_03_Worker09b"},
			FigureVanish {Tag = "CS_03_Worker10b"},
			-- vierte Cutscene Vanish
			FigureVanish {Tag = "CS_04_Io01"},
		},
	},
	OnCutsceneFigureRespawnEvent
	{
		AllowCombat = true,
		Conditions =
		{
			--MapFlagIsTrue	{Name = "mf_Cutscene01"},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 417.193, Y = 419.062},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "Shae", X = 420.052, Y = 426.097},
			FigureLookAtDirection {Tag = "Shae", Direction = 320.189},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Shae"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Shae"},
			-- sichtbare Indikatorenpflanzen werden aktiviert
			ObjectChange{Tag = "DemonIndicator24", ObjectId = 1580, X = 417.644, Y = 430.782, Direction = 314.163},
			ObjectChange{Tag = "DemonIndicator21", ObjectId = 1580, X = 410.907, Y = 476.007, Direction = 353.307},
			ObjectChange{Tag = "DemonIndicator23", ObjectId = 1580, X = 409.647, Y = 477.538, Direction = 314.163},
			-- Elfen werden auf Immortal gesetzt, damit sie nicht sterben können durch den Lifetap
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_DepressedElf01"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_DepressedElf02"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01a",
	},
};

State
{
	StateName = "Cutscene01a",
	OnOneTimeEvent	-- Shae: Shae1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{	
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Shae1", Tag = "Shae"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01b",
	},
};

State
{
	StateName = "Cutscene01b",
	OnOneTimeEvent	-- Kamera auf Dämonen und Elfen, Dämonen saugen Elfen aus
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--FigureAttackEntity {Tag = "CS_01_Demon01", TargetTag = "CS_01_DepressedElf02"},
			FigureAttackEntity {Tag = "CS_01_Demon02", TargetTag = "CS_01_DepressedElf01"},
			-- Portal wird deaktiviert
			PortalDisable	{Tag = "Portal_Start"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar läuft zu Shae, Dämonen Teamwechsel
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "pl_HumanAvatar", X = 418.716, Y = 424.256},
			-- Dämonen werden in das Cutscene_Elf-Team gesteckt, damit sie nicht mehr casten
			FigureTeamTransfer	{Tag = "CS_01_Demon01", Team = "tm_Cutscene_Elf"},
			FigureTeamTransfer	{Tag = "CS_01_Demon02", Team = "tm_Cutscene_Elf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Avatar: Avatar1
	{
		Conditions =
		{
			FigureIsIdle {Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar1", Tag = "pl_HumanAvatar"},
			-- Ausrichten der Akteure
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 160.427},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Shae: Shae2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Shae2", Tag = "Shae"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Avatar: Avatar2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar2", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Shae: Shae3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Shae3", Tag = "Shae"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Shae: Shae4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Shae4", Tag = "Shae"},	
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Avatar3 & Dämonen fliegen weg
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar3", Tag = "pl_HumanAvatar"},
			-- erster Dämonen fliegt weg
			FigureSimpleWalk {Tag = "CS_01_Demon01", X = 414, Y = 573},
			EntityTimerStart {Name = "et_CStimerA"},
			EntityTimerStart {Name = "et_CStimer"},
		},
	},
	OnOneTimeEvent	-- zweiter Dämon fliegt weg
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 0.25},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "CS_01_Demon02", X = 419, Y = 583},
		},
	},
	OnOneTimeEvent	-- Erste Indikatorpflanze wird deaktiviert
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 2},
		},
		Actions =
		{
			ObjectChange{Tag = "DemonIndicator24", ObjectId = 1083, X = 417.644, Y = 430.782, Direction = 314.163},
			EntityTimerStop {Name = "et_CStimerA"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Shae: Shae5
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			-- Timmer bleibt drin, damit man die wegfliegenden Dämonen lang genug sieht
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Shae5", Tag = "Shae"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Avatar: Avatar4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar4", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Shae: Shae6
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Shae6", Tag = "Shae"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Shae: Shae7
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Shae7", Tag = "Shae"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- kurze Pause nach CutsceneSay
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
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
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
			FigureStop {Tag = "Shae"},
			FigureStop {Tag = "pl_HumanAvatar"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Shae"},
			-- Akteure werden gelöscht
			FigureVanish {Tag = "CS_01_DepressedElf01"},
			FigureVanish {Tag = "CS_01_DepressedElf02"},
			FigureVanish {Tag = "CS_01_Demon01"},
			FigureVanish {Tag = "CS_01_Demon02"},
			-- Helden werden auf Avatar ausgerichtet
			FigureLookAtEntity	{Tag = "pl_HumanHeroBor", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroLya", TargetTag = "pl_HumanAvatar"},
			FigureLookAtEntity	{Tag = "pl_HumanHeroJared", TargetTag = "pl_HumanAvatar"},
			-- restliche Indikatorpflanzen werden deaktiviert
			ObjectChange{Tag = "DemonIndicator23", ObjectId = 1083, X = 417.644, Y = 430.782, Direction = 314.163},
			ObjectChange{Tag = "DemonIndicator21", ObjectId = 1083, X = 410.907, Y = 476.007, Direction = 353.307},
			-- Scriptinkram für die Karte
			MapFlagSetTrue	{Name = "mf_CS_IntroDone"},		
			--MapTimerStart	{Name = "mt_DemonAttack1_01"}, --Timer fuer Daemonenangriff
			QuestSetActive	{Player = "default", Quest = "DunMorapart1"},
			QuestSetActive	{Player = "default", Quest = "TalkToSansha"},
			
			PlayerTravelDisable	{},
			-- Portal wird in State Cutscene01b deaktiviert
			--QuestSetActive	{Player = "default", Quest = "DunMoraPart2"},
			--QuestSetActive	{Player = "default", Quest = "DemonTime"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};