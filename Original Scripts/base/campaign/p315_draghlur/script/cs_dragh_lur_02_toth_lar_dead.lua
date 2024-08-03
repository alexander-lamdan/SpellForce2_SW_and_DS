--************************************************************
--**														**
--**		Dragh Lur TothLar Dead							**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanNightsong'",
		"'IronLord'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kommentar
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene02"},
				AND
				{
					MapTimerIsElapsed {Name = "mt_P315_TothLarDead", Seconds = 5},
					-- geht nur wenns auf der Karte auch Dialoge gibt:
					--AvatarIsNotTalking {}, GameInterfaceIsVisible {},
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
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 420.8, Y = 653.2},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 320},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 411.6, Y = 644},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 135},
			FigureTeleport {Tag = "IronLord", X = 418.6, Y = 653.8},
			FigureLookAtDirection {Tag = "IronLord", Direction = 350},
			-- Spawn der Akteure(zweiter Dunkelelf wird nicht mehr gespawnt, der die Figur so hinter
			-- Schattenlied steht, das es aussieht als hätte Schattenlied Flügel an den Ohren
			MapFlagSetTrue {Name = "mf_P315_CS_DarkElfSpawn"},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "IronLord"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsHide {Tag = "IronLord"},
			-- Effekt auf Portal
			EffectStart {Tag = "Portal_Shal", File = "Effect_Spawn_Gate"},
			-- Schattenlied geht zum Avatar(Dunkelelfen bekommen den Walkbefehl aus ihrem Script)
			FigureSimpleWalk {Tag = "pl_HumanNightsong", X = 417.2, Y = 649.6},
			EntityTimerStart {Name = "et_CStimer"}
		},
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};

State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- IronLord: IronLord4
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "IronLord4", Tag = "IronLord"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};



State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Nightsong: NightSong2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			FigureIsIdle {Tag = "pl_HumanNightsong"},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSong2", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Effekt auf die Dummies unter den Füßen des Schattenkriegers und seinen Schatten
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{-- kamera mit drehung
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EffectStart	{Tag = "CS_02_Shadowwarrior01_Effect", File = "Effect_Misc_SpawnSpecial_01"},
			EffectStart	{Tag = "CS_02_Shadow01_Effect", File = "Effect_Misc_SpawnSpecial_01"},
			EffectStart	{Tag = "CS_02_Shadow02_Effect", File = "Effect_Misc_SpawnSpecial_01"},
			EffectStart	{Tag = "CS_02_Shadow03_Effect", File = "Effect_Misc_SpawnSpecial_01"},
			-- SOUND: Shadow Spawn
			MapFlagSetTrue {Name = "mf_P315_DraghLur_04_SOUND_Play_Shadow_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Schattenkrieger und Schatten spawnen
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P315_ShadowSpawn"},
			MapFlagSetTrue {Name = "mf_P315_CS_ShadowSpawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Schattenkrieger:	ShadowWarrior
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ShadowWarrior", Tag = "Shadow"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- erster Schatten: Shadow1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Shadow1", Tag = "CS_02_Shadow01"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Nightsong: NightSong3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSong3", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Avatar: Avatar1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar1", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Avatar(Malacays Stimme): Avatar2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar2", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Avatar(Malacays Stimme): Avatar3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar3", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Effekt auf die Positionen der Schatten und Schattenkrieger
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			EffectStartAtEntityPosition	{Tag = "CS_02_Shadowwarrior01_Effect", File = "Effect_Misc_SpawnSpecial_01"},
			EffectStartAtEntityPosition	{Tag = "CS_02_Shadow01_Effect", File = "Effect_Misc_SpawnSpecial_01"},
			EffectStartAtEntityPosition	{Tag = "CS_02_Shadow02_Effect", File = "Effect_Misc_SpawnSpecial_01"},
			EffectStartAtEntityPosition	{Tag = "CS_02_Shadow03_Effect", File = "Effect_Misc_SpawnSpecial_01"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Schattenkrieger und Schatten verschwinden
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureVanish {Tag = "Shadow"},
			FigureVanish {Tag = "CS_02_Shadow01"},
			FigureVanish {Tag = "CS_02_Shadow02"},
			FigureVanish {Tag = "CS_02_Shadow03"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13a",
	},
};

State
{
	StateName = "Cutscene13a",
	OnOneTimeEvent	-- IronLord: IronLord5, Ausrichten von IronLord
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IronLord5", Tag = "IronLord"},
			-- Ausrichten von IronLord
			FigureLookAtDirection {Tag = "IronLord", Direction = 60},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13b",
	},
};

State
{
	StateName = "Cutscene13b",
	OnOneTimeEvent	-- Nightsong: NightSong4
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSong4", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Avatar geht zum Portal
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 420.8, Y = 663.7},
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
			FigureIsIdle {Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsShow {Tag = "IronLord"},
			CutsceneFigureWeaponsShow {Tag = "Shadow"},
			-- Löschen der Akteure
			FigureVanish {Tag = "CS_02_Darkelf01"},
			FigureVanish {Tag = "CS_02_Darkelf02"},
			FigureVanish {Tag = "CS_02_Darkelf03"},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P309_CutsceneExtroDragEnd"},
			PlayerHeroRemove {Tag = "Nightsong"},
			PlayerTravelEnable {},
			PortalDisable {Tag = "Portal_Shal"},
			PortalDisable {Tag = "Portal_Start"},
			-- Effekt auf Portal löschen
			EffectStop {Tag = "Portal_Shal"},			
			QuestSetSolved {Quest = "IronLordMustLive"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			PlayerMapTravel	{Player = "pl_Human", Map = "Campaign/P316_Shal", TargetTag = "ShalSued"},
		},
	},
};