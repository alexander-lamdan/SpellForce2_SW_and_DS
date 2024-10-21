--************************************************************
--**														**
--**		Gate of Swords Stonegod							**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList_Nightsong_NoHero = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList_Nightsong_NoHero.tModFuncs =
{
	Add =
	{
		"'Hotchkiss'",
		-- Nightsong wird in CS als Heldin gespawnt
		"'IronLord'",
	}
}

-- Figuren die gerendert werden
local _tRenderList_Nightsong_Hero = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList_Nightsong_Hero.tModFuncs =
{
	Add =
	{
		"'Hotchkiss'",
		"'pl_HumanNightsong'", -- Nightsong ist bereits als Heldin vorhanden
		"'IronLord'",
	}
}

-- MapFlagSetTrue{Name = "mf_P309_StonedGodExposed"}, zum Testen per Flag aktivieren
-- Wenn die Cutscene direkt über Flags gestartet wird, dann ist die ShadowSongChange-Flag noch auf False,
-- da sie am ShadowSong Dialog hängt, obwohl sie am Anfang als Heldin auf der Karte auftaucht(sie wird
-- später dem Spieler weggenommen), sie wird also nicht zum Steingott teleportiert

State
{
	StateName = "INIT",
---------------------------------------------------------------------------------------------------------------------------
--	Wenn Nightsong NICHT als Heldin vorhanden ist, dann Spawn als Heldin und Renderliste "_tRenderList_Nightsong_NoHero" --
---------------------------------------------------------------------------------------------------------------------------
	OnCutsceneFigureRespawnEvent	-- Kamera auf Steingott
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapFlagIsTrue {Name = "mf_Cutscene09"},
					MapFlagIsFalse {Name = "mf_P309_ShadowSongChange"},
				},
				AND
				{
					MapFlagIsTrue {Name = "mf_P309_HotchKissTalked"},
					MapFlagIsFalse {Name = "mf_P309_ShadowSongChange"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
				},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList_Nightsong_NoHero,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_09_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Steingott Austauch
			ObjectChange {Tag = "StoneGod", ObjectId = 1671, X = 516.346, Y = 239.961, Direction = 0},
			-- Teleport der Akteure
			FigureTeleport {Tag = "Hotckiss", X = 512.041, Y = 239.865},
			FigureLookAtDirection {Tag = "Hotckiss", Direction = 245.362},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 510.455, Y = 241.709},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 41.826},
			FigureTeleport {Tag = "IronLord", X = 501.809, Y = 239.881},
			FigureLookAtDirection {Tag = "IronLord", Direction = 90},
			-- Nightsong wird als Heldin gespawnt
			PlayerHeroAdd {Player = "pl_Human", HeroId = 25},
			FigureOutcry {TextTag = "System1", Tag = "System_Npc"}, --SYSTEM-OC: sie haben die Schattenlise bekommen
			NoSpawnEffect {Spawn = FigureHeroSpawn {Player = "default", Tag = "Nightsong", X = 496.574, Y = 237.014, Direction = 90},},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Hotchkiss"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Hotchkiss"},
			CutsceneFigureWeaponsHide {Tag = "IronLord"},
			-- StonegodSpeaker wird gespawnt
			MapFlagSetTrue {Name = "mf_P309_Stonegod_Speaker_Spawn"},
			-- Flag damit Shadowsong als NPC nicht respawnt wird
			MapFlagSetTrue {Name = "mf_P309_Shadowsong_Dont_Respawn_Please"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList_Nightsong_NoHero,
		GotoState = "Cutscene01",
	},
-------------------------------------------------------------------------------------------------------------------------
--	Wenn Nightsong als Heldin vorhanden ist, dann Teleport von Nightsong und Renderliste "_tRenderList_Nightsong_Hero" --
-------------------------------------------------------------------------------------------------------------------------
	OnCutsceneFigureRespawnEvent	-- Kamera auf Steingott
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapFlagIsTrue {Name = "mf_Cutscene09"},
					MapFlagIsTrue {Name = "mf_P309_ShadowSongChange"},
				},
				AND
				{
					MapFlagIsTrue {Name = "mf_P309_HotchKissTalked"},
					MapFlagIsTrue {Name = "mf_P309_ShadowSongChange"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
				},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList_Nightsong_Hero,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_09_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Steingott Austauch
			ObjectChange {Tag = "StoneGod", ObjectId = 1671, X = 516.346, Y = 239.961, Direction = 0},
			-- Teleport der Akteure
			FigureTeleport {Tag = "Hotckiss", X = 512.041, Y = 239.865},
			FigureLookAtDirection {Tag = "Hotckiss", Direction = 245.362},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 510.455, Y = 241.709},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 41.826},
			FigureTeleport {Tag = "IronLord", X = 501.809, Y = 239.881},
			FigureLookAtDirection {Tag = "IronLord", Direction = 90},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 496.574, Y = 237.014},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 90},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Hotchkiss"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Hotchkiss"},
			CutsceneFigureWeaponsHide {Tag = "IronLord"},
			-- StonegodSpeaker wird gespawnt
			MapFlagSetTrue {Name = "mf_P309_Stonegod_Speaker_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList_Nightsong_Hero,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar: Avatar8
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar8", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Hotckiss geht in die Statue
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_09_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "Hotchkiss", X = 516.346, Y = 239.961},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Eisenfürst kommt angelaufen
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Hotchkiss"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_09_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "IronLord", X = 510.811, Y = 239.881},
			-- Hotchkiss wird gelöscht
			FigureVanish {Tag = "Hotchkiss"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Eisenfürst: IronLord6
	{
		Conditions =
		{
			FigureIsIdle {Tag = "IronLord"},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Ironlord6", Tag = "IronLord"},
			FigureCutsceneTalkJobSet {Tag = "IronLord"},
			-- Eisenfürsts Truppen A werden gespawnt
			MapFlagSetTrue {Name = "mf_P309_IronLord_Army_Spawn_A"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Stonegod: Stonegod1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_09_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "StoneGod1", Tag = "Stonegod_Speaker"},
			-- Eisenfürsts Truppen B werden gespawnt
			MapFlagSetTrue {Name = "mf_P309_IronLord_Army_Spawn_B"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Stonegod: Stonegod2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "StoneGod2", Tag = "Stonegod_Speaker"},
			-- Eisenfürsts Truppen C werden gespawnt
			MapFlagSetTrue {Name = "mf_P309_IronLord_Army_Spawn_C"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Stonegod: Stonegod3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_09_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "StoneGod3", Tag = "Stonegod_Speaker"},
			-- Eisenfürsts Truppen D werden gespawnt
			MapFlagSetTrue {Name = "mf_P309_IronLord_Army_Spawn_D"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Avatar: Avatar9
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_09_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar9", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Eisenfürst: IronLord7
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_09_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IronLord7", Tag = "IronLord"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Kurze Pause nach CutsceneSay
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
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
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
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "IronLord"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Hotchkiss"},
			CutsceneFigureWeaponsShow {Tag = "IronLord"},
			-- NPC Nightsong wird gelöscht, falls noch vorhanden
			FigureVanish {Tag = "Shadowsong"},
			-- Stonegod wird wieder getauscht
			ObjectChange {Tag = "StoneGod", ObjectId = 1116, X = 516.346, Y = 239.961, Direction = 0},
			-- StonegodSpeaker wird gelöscht
			MapFlagSetTrue {Name = "mf_P309_Stonegod_Speaker_Vanish"},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P309_CutsceneGateEndEnd"},
			--QuestSetActive {Quest = "NightsongMustLiveTilShal"},
			QuestSetActive {Quest = "IronLordMustLive"},
			QuestSetActive {Quest = "GoSPart9MarchToDraghLur"},

			GateSetOpen {Tag = "ToTuscari"},

			-- Schattenlied Dialog aus
			DialogSetDisabled {Tag = "Shadowsong"},
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
			-- Der Kampf mit Ragnar und seinem Trupp wird hier vorbereitet
				FigureTeamTransfer {Tag = "IronLord", Team = "tm_ClansFriends"},
				FigureWalk {Tag = "IronLord_Army01", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army02", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army03", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army04", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army05", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army06", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army07", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army08", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army09", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army10", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army11", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army12", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army13", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army14", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army15", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army16", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army17", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army18", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army19", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "IronLord_Army20", X = 536.2, Y = 145.6},

				FigureWalk {Tag = "LeutnantRagnar", X = 527.8, Y = 207.2},
				FigureWalk {Tag = "RagnarArmy1", X = 527.8, Y = 207.2},
				FigureWalk {Tag = "RagnarArmy2", X = 527.8, Y = 207.2},
				FigureWalk {Tag = "RagnarArmy3", X = 527.8, Y = 207.2},
				FigureWalk {Tag = "RagnarArmy4", X = 527.8, Y = 207.2},
				FigureWalk {Tag = "RagnarArmy5", X = 527.8, Y = 207.2},
				FigureWalk {Tag = "RagnarArmy6", X = 527.8, Y = 207.2},
				FigureWalk {Tag = "RagnarArmy7", X = 527.8, Y = 207.2},
				FigureWalk {Tag = "RagnarArmy8", X = 527.8, Y = 207.2},

				FigureWalk {Tag = "IronLord", X = 536.2, Y = 145.6},
				FigureWalk {Tag = "pl_HumanNightsong", X = 536.2, Y = 145.6},
		},
	},
};