--************************************************************
--**														**
--**		Iron Fields Part II Intro						**
--**														**
--************************************************************

-- zum testen vorher achte Cutscene von Part I starten und den Mission Part starten
-- MapFlagSetTrue {Name = "mf_CutsceneA08"},
-- MapFlagSetTrue {Name = "mf_P301_Mission"},
-- gilt für alle Cutscenes des zweiten Teils

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanNightsong'",
		"'FalkmarMission'",
		"'IoMission'",
		"'Sorvina'",
		"'TothLar'",
		"'Hydra'",
		"'Ur'",
		"'CS_B_01_Worker_01'",
		"'CS_B_01_Worker_02'",
		"'CS_B_01_Worker_03'",
		"'CS_B_01_Worker_05'",
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
			FigureVanish {Tag = "CS_B_01_Ur01"},
			FigureVanish {Tag = "CS_B_01_Sorvina01"},
			FigureVanish {Tag = "CS_B_01_TothLar01"},
			FigureVanish {Tag = "CS_B_01_TothLar02"},
			FigureVanish {Tag = "CS_B_01_Avatar01"},
			FigureVanish {Tag = "CS_B_01_Shadowsong01"},
			FigureVanish {Tag = "CS_B_01_Shadow01"},
			FigureVanish {Tag = "CS_B_01_Shadow02"},
			FigureVanish {Tag = "CS_B_Portal_Dummy"},
			FigureVanish {Tag = "CS_B_Portal_WalkTo"},
			FigureVanish {Tag = "CS_B_02_Realm01"},
			FigureVanish {Tag = "CS_B_02_Realm02"},
			FigureVanish {Tag = "CS_B_02_Realm03"},
			FigureVanish {Tag = "CS_B_02_Realm04"},
			FigureVanish {Tag = "CS_B_02_Realm05"},
			FigureVanish {Tag = "CS_B_02_Realm06"},
			ObjectVanish {Tag = "CS_B_01_MagicBarrier"},
			-- (vormals)zweite Cutscene Vanish
			FigureVanish {Tag = "CS_B_02_Ur_Wounded01"},
			FigureVanish {Tag = "CS_B_02_Devourer01"},
			FigureVanish {Tag = "CS_B_02_Devourer02"},
			FigureVanish {Tag = "CS_B_02_Sorvina01"},
			FigureVanish {Tag = "CS_B_02_Sorvina02"},
			FigureVanish {Tag = "CS_B_02_TothLar01"},
			FigureVanish {Tag = "CS_B_02_Shaikan01"},
			FigureVanish {Tag = "CS_B_02_Shaikan02"},
			FigureVanish {Tag = "CS_B_02_Shaikan03"},
			FigureVanish {Tag = "CS_B_02_Shaikan04"},
			ObjectVanish {Tag = "CS_B_02_Cage01"},
			ObjectVanish {Tag = "CS_B_02_Cage02"},
			ObjectVanish {Tag = "CS_B_02_Cage03"},
			ObjectVanish {Tag = "CS_B_02_Cage04"},
			ObjectVanish {Tag = "CS_Magic_Barrier"},
			ObjectVanish {Tag = "CS_Magic_Barrier_Blocker01"},
			ObjectVanish {Tag = "CS_Magic_Barrier_Blocker02"},
			ObjectVanish {Tag = "CS_Magic_Barrier_Blocker03"},
			ObjectVanish {Tag = "CS_Magic_Barrier_Blocker04"},
			-- dritte Cutscene Vanish
			FigureVanish {Tag = "CS_B_03_Avatar01"},
			FigureVanish {Tag = "CS_B_03_Grimrot01"},
			FigureVanish {Tag = "CS_B_03_Tree01"},
			FigureVanish {Tag = "CS_B_03_Tree02"},
			FigureVanish {Tag = "CS_B_03_Tree03"},
			FigureVanish {Tag = "CS_B_03_Tree04"},
			FigureVanish {Tag = "CS_B_03_Tree05"},
			FigureVanish {Tag = "CS_B_03_Tree06"},
			FigureVanish {Tag = "CS_B_03_Tree07"},
			FigureVanish {Tag = "CS_B_03_Tree08"},
			FigureVanish {Tag = "CS_B_03_Shadow01"},
			FigureVanish {Tag = "CS_B_03_Shadow02"},
			-- vierte Cutscene Vanish
			ObjectVanish {Tag = "CS_B_04_BloodDecal01"},
			ObjectVanish {Tag = "CS_B_04_BloodDecal02"},
			ObjectVanish {Tag = "CS_B_04_BloodDecal03"},
			ObjectVanish {Tag = "CS_B_04_BloodDecal04"},
			ObjectVanish {Tag = "CS_B_04_BloodDecal05"},
			ObjectVanish {Tag = "CS_B_04_BloodDecal06"},
			ObjectVanish {Tag = "CS_B_04_BloodDecal07"},
			ObjectVanish {Tag = "CS_B_04_BloodDecal08"},
			ObjectVanish {Tag = "CS_B_04_BloodDecal09"},
			ObjectVanish {Tag = "CS_B_04_BloodDecal10"},
			ObjectVanish {Tag = "CS_B_04_BloodDecal11"},
			ObjectVanish {Tag = "CS_B_04_ShaikanDead01"},
			ObjectVanish {Tag = "CS_B_04_ShaikanDead02"},
			ObjectVanish {Tag = "CS_B_04_ShaikanDead03"},
			ObjectVanish {Tag = "CS_B_04_ShaikanDead04"},
			FigureVanish {Tag = "CS_B_04_Avatar01"},
			FigureVanish {Tag = "CS_B_04_Bor01"},
			FigureVanish {Tag = "CS_B_04_Lya01"},
			FigureVanish {Tag = "CS_B_04_Jared01"},
			FigureVanish {Tag = "CS_B_04_Shae01"},
			FigureVanish {Tag = "CS_B_04_Shadowsong01"},
			FigureVanish {Tag = "CS_B_04_Hydra01"},
			-- fünfte Cutscene Vanish
			FigureVanish {Tag = "CS_B_05_Avatar01"},
			FigureVanish {Tag = "CS_B_05_Avatar02"},
			FigureVanish {Tag = "CS_B_05_Avatar03"},
			FigureVanish {Tag = "CS_B_05_Shadowsong01"},
			FigureVanish {Tag = "CS_B_05_Schattenlied01"},
			FigureVanish {Tag = "CS_B_05_Schattenlied02"},
			FigureVanish {Tag = "CS_B_05_Schattenlied03"},
			FigureVanish {Tag = "CS_B_05_Falkmar01"},
			FigureVanish {Tag = "CS_B_05_Io01"},
			-- sechste Cutscene Vanish
			FigureVanish {Tag = "CS_B_05_Tree01"},
			FigureVanish {Tag = "CS_B_05_Tree02"},
			FigureVanish {Tag = "CS_B_05_Tree03"},
			FigureVanish {Tag = "CS_B_05_Tree04"},
			FigureVanish {Tag = "CS_B_05_Tree05"},
			FigureVanish {Tag = "CS_B_05_Tree06"},
			FigureVanish {Tag = "CS_B_05_Tree07"},
			FigureVanish {Tag = "CS_B_05_Tree08"},
			FigureVanish {Tag = "CS_B_05_Tree09"},
			FigureVanish {Tag = "CS_B_05_Tree10"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Ur kämpft gegen den Verschlinger aka Hässlicher Vogel mit zwei Mäulern
	{
		AllowCombat = true,
		Conditions =
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_CutsceneB01"},
				QuestIsActive {Quest = "IronFieldsPart21EnterTheShadows"},
			},
		},
		Actions =
		{
			-- Ausblenden der Figuren(siehe Liste, nur die werden angezeigt)
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {}, -- Kamera auf die Stadt um die Ruckler vor der eigentlichen Cutscene zu haben
			CameraTakeAddToTrack {File = "CS_B_01_Take00", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure(hinter Festung)
			FigureTeleport {Tag = "Ur", X = 82.6, Y = 633.8},
			FigureLookAtDirection {Tag = "Ur", Direction = 310},
			FigureTeleport {Tag = "Sorvina", X = 106.4, Y = 635.6},
			FigureLookAtDirection {Tag = "Sorvina", Direction = 308.434},
			FigureTeleport {Tag = "Hydra", X = 65.933, Y = 623.602},
			FigureLookAtDirection {Tag = "Hydra", Direction = 110},
			-- Tothlar wird außerhalb des Sichtfeldes teleportiert
			FigureTeleport {Tag = "TothLar", X = 104.139, Y = 670.392},
			FigureLookAtDirection {Tag = "TothLar", Direction = 135},
			-- Teleport der Akteure(Portal)
			FigureTeleport {Tag = "pl_HumanAvatar", X = 288.795, Y = 34.6853},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 342.811},
			FigureTeleport {Tag = "pl_HumanNightsong", X = 286.475, Y = 34.7599},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 27.6847},
			FigureTeleport {Tag = "FalkmarMission", X = 286.089, Y = 30.2406},
			FigureLookAtDirection {Tag = "FalkmarMission", Direction = 145.532},
			FigureTeleport {Tag = "IoMission", X = 288.538, Y = 29.9865},
			FigureLookAtDirection {Tag = "IoMission", Direction = 177.641},
			-- Käfige und Gefangene werden gespawnt(hinter Festung, in Urs Residenz)
			ObjectSpawn	{ObjectId = 925, X = 65.7544, Y = 653.753, Direction = 256.868, Tag = "CS_B_02_Cage01"},
			NoSpawnEffect {Spawn = FigureNpcSpawn	{Tag = "CS_B_02_Shaikan01", Level = 1, UnitId = 1022, X = 65.605, Y = 653.829, Team = "tm_Neutral"},},
			ObjectSpawn	{ObjectId = 925, X = 71.136, Y = 656.458, Direction = 335.408, Tag = "CS_B_02_Cage02"},
			NoSpawnEffect {Spawn = FigureNpcSpawn	{Tag = "CS_B_02_Shaikan02", Level = 1, UnitId = 1023, X = 71.105, Y = 656.461, Team = "tm_Neutral"},},
			ObjectSpawn	{ObjectId = 925, X = 75.807, Y = 653.129, Direction = 82.597, Tag = "CS_B_02_Cage03"},
			NoSpawnEffect {Spawn = FigureNpcSpawn	{Tag = "CS_B_02_Shaikan03", Level = 1, UnitId = 1024, X = 76.071, Y = 653.22, Team = "tm_Neutral"},},
			ObjectSpawn	{ObjectId = 925, X = 59.594, Y = 653.004, Direction = 206.975, Tag = "CS_B_02_Cage04"},
			NoSpawnEffect {Spawn = FigureNpcSpawn	{Tag = "CS_B_02_Shaikan04", Level = 1, UnitId = 1022, X = 59.401, Y = 653.114, Team = "tm_Neutral"},},
			-- RealmSoldaten vor Verschlinger werden gespawnt
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_02_RealmSoldier01", Level = 1, UnitId = 311, X = 72.82, Y = 626.73, Team = "tm_Neutral"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_02_RealmSoldier02", Level = 1, UnitId = 304, X = 74.902, Y = 629.396, Team = "tm_Neutral"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_02_RealmSoldier03", Level = 1, UnitId = 311, X = 72.728, Y = 629.359, Team = "tm_Neutral"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_02_RealmSoldier04", Level = 1, UnitId = 311, X = 70.458, Y = 629.675, Team = "tm_Neutral"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_02_RealmSoldier05", Level = 1, UnitId = 304, X = 70.295, Y = 632.27, Team = "tm_Neutral"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_02_RealmSoldier06", Level = 1, UnitId = 311, X = 68.484, Y = 631.437, Team = "tm_Neutral"},},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanNightsong"},
			FigureCutsceneTalkJobSet {Tag = "FalkmarMission"},
			FigureCutsceneTalkJobSet {Tag = "IoMission"},
			FigureCutsceneTalkJobSet {Tag = "Sorvina"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsHide {Tag = "FalkmarMission"},
			CutsceneFigureWeaponsHide {Tag = "IoMission"},
			CutsceneFigureWeaponsHide {Tag = "Sorvina"},
			-- Ausrichten der Realm Soldaten
			FigureLookAtDirection {Tag = "CS_B_02_RealmSoldier01", Direction = 291.245},
			FigureLookAtDirection {Tag = "CS_B_02_RealmSoldier02", Direction = 337.081},
			FigureLookAtDirection {Tag = "CS_B_02_RealmSoldier03", Direction = 331.352},
			FigureLookAtDirection {Tag = "CS_B_02_RealmSoldier04", Direction = 331.352},
			FigureLookAtDirection {Tag = "CS_B_02_RealmSoldier05", Direction = 11.459},
			FigureLookAtDirection {Tag = "CS_B_02_RealmSoldier06", Direction = 342.812},
			-- Dem Spieler wird erst mal der alte Aufbau im Nördlichen Teil weggenommen
			PlayerBuildingTeamTransfer {Team = "tm_Team1"},
			-- Cutscene Fighter werden gespawnt
			MapFlagSetTrue {Name = "mf_CS_B_02_Fighter_Group_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};

State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- Kommentar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Anim von Ur und Verschlinger abspielen abspielen
			MapFlagSetTrue {Name = "mf_CS_B_01_Ur_Devourer_Fight_Anim"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene00aa",
	},
};

State
{
	StateName = "Cutscene00aa",
	OnOneTimeEvent	-- SOUND: Devourer Attack
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.2},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Devourer_Attack"},
		},
		GotoState = "Cutscene00a",
	},
};

State
{
	StateName = "Cutscene00a",
	OnOneTimeEvent	-- RealmSoldier01 stirbt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.85},
		},
		Actions =
		{
			FigureKill {Tag = "CS_B_02_RealmSoldier01"},
		},
		GotoState = "Cutscene00b",
	},
};

State
{
	StateName = "Cutscene00b",
	OnOneTimeEvent	-- RealmSoldier02 stirbt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.95},
		},
		Actions =
		{
			FigureKill {Tag = "CS_B_02_RealmSoldier02"},
		},
		GotoState = "Cutscene00c",
	},
};

State
{
	StateName = "Cutscene00c",
	OnOneTimeEvent	-- RealmSoldier03 stirbt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.05},
		},
		Actions =
		{
			FigureKill {Tag = "CS_B_02_RealmSoldier03"},
		},
		GotoState = "Cutscene00d",
	},
};

State
{
	StateName = "Cutscene00d",
	OnOneTimeEvent	-- RealmSoldier04 stirbt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.15},
		},
		Actions =
		{
			FigureKill {Tag = "CS_B_02_RealmSoldier04"},
		},
		GotoState = "Cutscene00e",
	},
};

State
{
	StateName = "Cutscene00e",
	OnOneTimeEvent	-- RealmSoldier05 stirbt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.25},
		},
		Actions =
		{
			FigureKill {Tag = "CS_B_02_RealmSoldier05"},
		},
		GotoState = "Cutscene00f",
	},
};

State
{
	StateName = "Cutscene00f",
	OnOneTimeEvent	-- RealmSoldier06 stirbt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.35},
		},
		Actions =
		{
			FigureKill {Tag = "CS_B_02_RealmSoldier06"},
		},
		GotoState = "Cutscene00g",
	},
};



State
{
	StateName = "Cutscene00g",
	OnOneTimeEvent	-- Kamera auf Sorvina, Ur fliegt über sie drüber
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take02a", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_B_01_Take02b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
		},
		GotoState = "Cutscene00ha",
	},
};

State
{
	StateName = "Cutscene00ha",
	OnOneTimeEvent	-- SOUND: Ur Nearby
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Ur_Nearby"},
		},
		GotoState = "Cutscene00hb",
	},
};

State
{
	StateName = "Cutscene00hb",
	OnOneTimeEvent	-- Kamera auf Ur und Verschlinger
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
		},
		GotoState = "Cutscene00ia",
	},
};

State
{
	StateName = "Cutscene00ia",
	OnOneTimeEvent	-- SOUND: Devourer Weapon Ground
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8.7},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Weapon_Ground"},
		},
		GotoState = "Cutscene00i",
	},
};

State
{
	StateName = "Cutscene00i",
	OnOneTimeEvent	-- Kamera auf Ur und Verschlinger
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 9.2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
		},
		GotoState = "Cutscene00ka",
	},
};

State
{
	StateName = "Cutscene00ka",
	OnOneTimeEvent	-- SOUND: Ur Firebreath
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Ur_Firebreath"},
		},
		GotoState = "Cutscene00kb",
	},
};

State
{
	StateName = "Cutscene00kb",
	OnOneTimeEvent	-- Sorvina1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 12},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina1", Tag = "Sorvina"},
		},
		GotoState = "Cutscene00ma",
	},
};

State
{
	StateName = "Cutscene00ma",
	OnOneTimeEvent	-- SOUND: Ur Firebreath2
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 13},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Ur_Firebreath2"},
		},
		GotoState = "Cutscene00m",
	},
};

State
{
	StateName = "Cutscene00m",
	OnOneTimeEvent	-- Kamera auf Ur und Verschlinger
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 15},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take05a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
		},
		GotoState = "Cutscene00n",
	},
};

State
{
	StateName = "Cutscene00n",
	OnOneTimeEvent	-- Kamera auf Ur und Verschlinger
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 17.2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take05b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- SOUND: Devourer Attack2
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Devourer_Attack2"},
			-- SOUND: Ur Hit
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Ur_Hit"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- TothLar Teleport und kommt angeritten, Mesh von Ur wird getauscht
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 19},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- TothLar Teleport
			FigureTeleport {Tag = "TothLar", X = 98, Y = 627.2},
			FigureLookAtDirection {Tag = "TothLar", Direction = 135},
			-- TothLar kommt angeritten
			FigureSimpleRun {Tag = "TothLar", X = 103.6, Y = 632.8},
			-- Urs Mesh wird in Ur_Wounded getauscht und teleportiert
			FigureUnitChange {Tag = "Ur", UnitId = 544, Level = 15},
			--FigureTeleport {Tag = "Ur", X = , Y = },
			--FigureLookAtDirection {Tag = "Ur", Direction = 0},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- TothLar1
	{
		Conditions =
		{
			FigureIsIdle {Tag = "TothLar"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take06a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TothLar1", Tag = "TothLar"},
			-- Talkjob TothLar
			FigureCutsceneTalkJobSet {Tag = "TothLar"},
			EntityTimerStart {Name = "et_CStimer"},
			-- SOUND: Ur Hit2
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Ur_Hit2"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Sorvina2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take06b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina2", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
			-- SOUND: Devourer Hit
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Devourer_Hit"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Sorvina2a
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Sorvina2a", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimerA"},
		},
	},
	OnOneTimeEvent	-- Kamera auf die Barriere
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take06c", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Magische Barriere entsteht
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			-- Barriere wird gespawnt
			ObjectSpawn	{ObjectId = 1993, X = 360.905, Y = 289.206, Direction = 45, Tag = "Magic_Barrier"},
			-- SOUND: Barrier
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Barrier"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Sorvina3
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina3", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene01",
	},
};

-------------------------------------------------------
-- Hier kommt jetzt die vormals zweite Cutscene rein --
-------------------------------------------------------

State
{
	StateName = "NewCutscene01",
	OnOneTimeEvent	-- Kamerafahrt über die Festung, Teleport der Akteure, Mesh von Ur wird getauscht
					-- Kämpfer werden über CS_B_02_FighterGroup.lua gespawnt zu Beginn der Cutscene
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Mesh von Ur wird getauscht, in das Wounded Ur Mesh
			FigureUnitChange {Tag = "Ur", UnitId = 544, Level = 1},
			-- Teleport der Akteure
			FigureTeleport {Tag = "Ur", X = 91.5, Y = 633.2},
			FigureLookAtDirection {Tag = "Ur", Direction = 190},
			FigureTeleport {Tag = "Hydra", X = 79.8, Y = 634.2},
			FigureLookAtDirection {Tag = "Hydra", Direction = 90},
			FigureTeleport {Tag = "Sorvina", X = 71.4, Y = 623},
			FigureLookAtDirection {Tag = "Sorvina", Direction = 135},
			FigureTeleport {Tag = "TothLar", X = 77, Y = 620.2},
			FigureLookAtDirection {Tag = "TothLar", Direction = 180},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Sorvina"},
			FigureCutsceneTalkJobSet {Tag = "Hydra"},
			FigureCutsceneTalkJobSet {Tag = "TothLar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene02",
	},
};

State
{
	StateName = "NewCutscene02",
	OnOneTimeEvent	-- Sorvina: Sorvina4
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina4", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene03",
	},
};

State
{
	StateName = "NewCutscene03",
	OnOneTimeEvent	-- Sorvina: Sorvina5, Ausrichten der Akteure
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina5", Tag = "Sorvina"},
			-- Ausrichten des Verschlingers
			FigureLookAtDirection {Tag = "Hydra", Direction = 315},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene04",
	},
};

State
{
	StateName = "NewCutscene04",
	OnOneTimeEvent	-- Verschlinger: Hydra1, Ausrichten der Akteure
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_02_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Hydra1", Tag = "Hydra"},
			-- Ausrichten von Sorvina
			FigureLookAtDirection {Tag = "Sorvina", Direction = 180},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene05",
	},
};

State
{
	StateName = "NewCutscene05",
	OnOneTimeEvent	-- Sorvina: Sorvina6
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_B_02_Take06", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_B_02_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina6", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene06",
	},
};

State
{
	StateName = "NewCutscene06",
	OnOneTimeEvent	-- Ausrichten der Akteure
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureLookAtDirection {Tag = "Hydra", Direction = 205},
			FigureLookAtDirection {Tag = "Sorvina", Direction = 135},
			-- SOUND: Devourer Scream2
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Devourer_Scream2"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene07",
	},
};

State
{
	StateName = "NewCutscene07",
	OnOneTimeEvent	-- Verschlinger geht zu den gefangenen Shaikan
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_02_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Verschlinger geht zu den gefangenen Shaikan
			FigureSimpleRun {Tag = "Hydra", X = 70, Y = 646.8},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene08",
	},
};

State
{
	StateName = "NewCutscene08",
	OnOneTimeEvent	-- Sorvina geht zu Ur
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Hydra"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_02_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Sorvina geht zu Ur
			FigureSimpleRun {Tag = "Sorvina", X = 85.4, Y = 637},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene09a",
	},
};

State
{
	StateName = "NewCutscene09a",
	OnOneTimeEvent	-- SOUND: Devourer Scream
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Devourer_Attack3"},
		},
		GotoState = "NewCutscene09b",
	},
};

State
{
	StateName = "NewCutscene09b",
	OnOneTimeEvent	-- SOUND: Shaikan Scream1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.3},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Shaikan_Scream1"},
		},
		GotoState = "NewCutscene09c",
	},
};

State
{
	StateName = "NewCutscene09c",
	OnOneTimeEvent	-- SOUND: Shaikan Scream2
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.8},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Shaikan_Scream2"},
		},
		GotoState = "NewCutscene09d",
	},
};

State
{
	StateName = "NewCutscene09d",
	OnOneTimeEvent	-- Sorvina: Sorvina7, Ausrichten der Akteure, Talkjob
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Sorvina"},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Sorvina7", Tag = "Sorvina"},
			-- Talkjobs Sorvina
			FigureCutsceneTalkJobSet {Tag = "Sorvina"},
			-- Ausrichten von TothLar
			FigureLookAtDirection {Tag = "TothLar", Direction = 160},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene10",
	},
};

State
{
	StateName = "NewCutscene10",
	OnOneTimeEvent	-- TothLar: Tothlar1a, Ausrichten der Akteure
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_02_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TothLar1a", Tag = "TothLar"},
			-- Ausrichten von Sorvina
			FigureLookAtDirection {Tag = "Sorvina", Direction = 335},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene11",
	},
};

State
{
	StateName = "NewCutscene11",
	OnOneTimeEvent	-- Sorvina: Sorvina8
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_02_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina8", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene12",
	},
};

State
{
	StateName = "NewCutscene12",
	OnOneTimeEvent	-- TothLar: TothLar2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_02_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "TothLar2", Tag = "TothLar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene13",
	},
};

State
{
	StateName = "NewCutscene13",
	OnOneTimeEvent	-- Sorvina: Sorvina9
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_02_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina9", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene14",
	},
};

State
{
	StateName = "NewCutscene14",
	OnOneTimeEvent	-- Kamera auf Sorvina und Ur, Sorvina neu ausrichten
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_02_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureLookAtDirection {Tag = "Sorvina", Direction = 110},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene15",
	},
};

State
{
	StateName = "NewCutscene15",
	OnOneTimeEvent	-- Sorvinas spielt Cast-Animation ab
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_02_Take15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce	{Tag = "Sorvina", File = "base/gfx/figures/boss/figure_boss_sorvina_special_cutscene_cast.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene16a",
	},
};

State
{
	StateName = "NewCutscene16a",
	OnOneTimeEvent	-- SOUND: Ur Despawn
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Ur_Despawn"},
		},
		GotoState = "NewCutscene16b",
	},
};

State
{
	StateName = "NewCutscene16b",
	OnOneTimeEvent	-- Ur verschwindet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.1},
		},
		Actions =
		{
			FigureVanish {Tag = "Ur"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene17",
	},
};

State
{
	StateName = "NewCutscene17",
	OnOneTimeEvent	-- Effekt auf Sorvinas Position startet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EffectStartAtEntityPosition	{Tag = "Sorvina", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Sorvina Despawn
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Sorvina_Despawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "NewCutscene18",
	},
};

State
{
	StateName = "NewCutscene18",
	OnOneTimeEvent	-- Sorvina verschwindet,
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			FigureVanish {Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

---------------------------------------------
-- Hier der Rest der alten ersten Cutscene --
---------------------------------------------

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Kamera Nähe Portal nach Needle, Falkmar & Verstärkung kommen, Arbeiter spiele Build-Animation ab
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Soldat läuft aus Portal, immer und immer wieder
			MapFlagSetTrue {Name = "mf_P301_B_Portal_Army"},
			-- Arbeiter spielen Build-Animation ab
			MapFlagSetTrue {Name = "mf_P301_B_Worker_Build_Anim_Start"},
			-- Dunkelelfen vor der Festung werden gespawnt
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_01_Pact01", Level = 16, UnitId = 338, X = 271.086, Y = 638.185, Team = "tm_CutsceneRed"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_01_Pact02", Level = 16, UnitId = 336, X = 271.077, Y = 645.776, Team = "tm_CutsceneRed"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_01_Pact03", Level = 16, UnitId = 890, X = 268.874, Y = 641.824, Team = "tm_CutsceneRed"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_01_Pact04", Level = 16, UnitId = 901, X = 277.543, Y = 642.681, Team = "tm_CutsceneRed"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "CS_B_01_Pact05", Level = 16, UnitId = 337, X = 280.515, Y = 642.057, Team = "tm_CutsceneRed"},},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Falkmar1, Ausrichten der Pact-Einheiten
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Falkmar1", Tag = "FalkmarMission"},
			-- Ausrichten der Akteure
			FigureLookAtDirection {Tag = "CS_B_01_Pact01", Direction = 33},
			FigureLookAtDirection {Tag = "CS_B_01_Pact02", Direction = 66},
			FigureLookAtDirection {Tag = "CS_B_01_Pact03", Direction = 99},
			FigureLookAtDirection {Tag = "CS_B_01_Pact04", Direction = 133},
			FigureLookAtDirection {Tag = "CS_B_01_Pact05", Direction = 178},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09a",
	},
};

State
{
	StateName = "Cutscene09a",
	OnOneTimeEvent	-- Kameraeinstellung auf das Haupthaus
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take08a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- SOUND: Play Working Worker
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Working_Worker"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09b",
	},
};

State
{
	StateName = "Cutscene09b",
	OnOneTimeEvent	-- Avatar14a, Kamera auf Festung
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar14a", Tag = "pl_HumanAvatar"},
			-- SOUND: Stop Working Worker
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Stop_Working_Worker"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Avatar15 & Stoppen des ArmeePortalspawning
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar15", Tag = "pl_HumanAvatar"},
			-- Spawning wird gestoppt
			MapFlagSetTrue {Name = "mf_P301_B_Portal_Army_Stop"},
			-- SOUND: Play Barrier Glow
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Barrier_Glow"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Kamera auf spawnende Schatten & Io: Io1
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Io1", Tag = "IoMission"},
			-- Schatten werden gespawnt
			MapFlagSetTrue {Name = "mf_CS_Shadow_Spawn"},
			-- Akteure werden auf die Schatten ausgerichtet
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 63},
			FigureLookAtDirection {Tag = "pl_HumanNightsong", Direction = 74},
			FigureLookAtDirection {Tag = "FalkmarMission", Direction = 88},
			FigureLookAtDirection {Tag = "IoMission", Direction = 86},
			-- Talkjobs beenden, sieht sicher besser aus, wenn die die Waffen gezückt haben,
			-- wenn da gerade Schatten angerannt kommen
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "pl_HumanNightsong"},
			FigureStop {Tag = "FalkmarMission"},
			FigureStop {Tag = "IoMission"},
			-- SOUND: Stop Barrier Glow
			MapFlagSetTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Stop_Barrier_Glow"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12a",
	},
};

State
{
	StateName = "Cutscene12a",
	OnOneTimeEvent	-- Schatten01 kommt angerannt
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_B_01_Take12", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_B_01_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Shadow01 rennt los
			FigureSimpleRun {Tag = "Shadow01", X = 301.069, Y = 27.996},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12b",
	},
};

State
{
	StateName = "Cutscene12b",
	OnOneTimeEvent	-- Schatten02 kommt angerannt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleRun {Tag = "Shadow02", X = 302.069, Y = 30.42},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Shadow01 verschwindet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.5},
		},
		Actions =
		{
			FigureVanish {Tag = "Shadow01"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Shadow02 verschwindet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.25},
		},
		Actions =
		{
			FigureVanish {Tag = "Shadow02"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- NightSong9b
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "NightSong9b", Tag = "pl_HumanNightsong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Schatten spawnen
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_Shadow_Spawn_Attack"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
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
			FigureStop {Tag = "pl_HumanNightsong"},
			FigureStop {Tag = "FalkmarMission"},
			FigureStop {Tag = "IoMission"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanNightsong"},
			CutsceneFigureWeaponsShow {Tag = "FalkmarMission"},
			CutsceneFigureWeaponsShow {Tag = "IoMission"},
			-- Talkjobs wurden bereits in State: Cutscene11 beendet
			-- Vanish der Figuren aus dem Tutorial
			FigureVanish {Tag = "CS_A_01_Bor01"},
			FigureVanish {Tag = "CS_A_01_Bor03"},
			FigureVanish {Tag = "CS_A_01_Bor05"},
			-- Pact-Einheiten vor der Festung werden gelöscht
			FigureVanish {Tag = "CS_B_01_Pact01"},
			FigureVanish {Tag = "CS_B_01_Pact02"},
			FigureVanish {Tag = "CS_B_01_Pact03"},
			FigureVanish {Tag = "CS_B_01_Pact04"},
			FigureVanish {Tag = "CS_B_01_Pact05"},
			-- (anim abspielende) Arbeiter werden gelöscht
			MapFlagSetTrue {Name = "mf_P301_B_Worker_Build_Anim_Vanish"},
			-- (in der Festunge kämpfende) Kämpfer werden gelöscht
			MapFlagSetTrue {Name = "mf_CS_B_02_Fighter_Vanish"},
			-- Vorbereitung auf vierte Cutscene, damit die Objekte da nicht plötzlich
			-- auftauchen obwohl vorher nix dort war
			FigureVanish {Tag = "CS_B_02_Shaikan01"},
			FigureVanish {Tag = "CS_B_02_Shaikan02"},
			FigureVanish {Tag = "CS_B_02_Shaikan03"},
			FigureVanish {Tag = "CS_B_02_Shaikan04"},
			-- kaputte Käfige werden getauscht
			ObjectChange {Tag = "CS_B_02_Cage01", ObjectId = 479, X = 65.754, Y = 653.753, Direction = 0},
			ObjectChange {Tag = "CS_B_02_Cage02", ObjectId = 480, X = 71.136, Y = 656.458, Direction = 90},
			ObjectChange {Tag = "CS_B_02_Cage03", ObjectId = 479, X = 75.807, Y = 653.129, Direction = 180},
			ObjectChange {Tag = "CS_B_02_Cage04", ObjectId = 480, X = 59.594, Y = 653.004, Direction = 270},
			-- Leichen und Blut werden gespawnt
			ObjectSpawn	{ObjectId = 546, X = 60.98, Y = 652.443, Direction = 31, Tag = "BloodDecal01"},
			ObjectSpawn	{ObjectId = 546, X = 75.439, Y = 652.286, Direction = 249, Tag = "BloodDecal02"},
			ObjectSpawn	{ObjectId = 546, X = 69.977, Y = 657.858, Direction = 291, Tag = "BloodDecal03"},
			ObjectSpawn	{ObjectId = 547, X = 70.293, Y = 653.321, Direction = 345, Tag = "BloodDecal04"},
			ObjectSpawn	{ObjectId = 547, X = 59.687, Y = 647.831, Direction = 167, Tag = "BloodDecal05"},
			ObjectSpawn	{ObjectId = 547, X = 65.152, Y = 650.992, Direction = 282, Tag = "BloodDecal06"},
			ObjectSpawn	{ObjectId = 548, X = 65.391, Y = 650.094, Direction = 350, Tag = "BloodDecal07"},
			ObjectSpawn	{ObjectId = 549, X = 72.073, Y = 648.971, Direction = 240, Tag = "BloodDecal08"},
			ObjectSpawn	{ObjectId = 549, X = 64.138, Y = 648.192, Direction = 50, Tag = "BloodDecal09"},
			ObjectSpawn	{ObjectId = 549, X = 69.624, Y = 646.876, Direction = 10, Tag = "BloodDecal10"},
			ObjectSpawn	{ObjectId = 549, X = 73.151, Y = 655.419, Direction = 110, Tag = "BloodDecal11"},
			ObjectSpawn	{ObjectId = 84, X = 63.564, Y = 651.288, Direction = 6, Tag = "ShaikanDead01"},
			ObjectSpawn	{ObjectId = 83, X = 69.51, Y = 651.25, Direction = 165, Tag = "ShaikanDead02"},
			ObjectSpawn	{ObjectId = 80, X = 60.901, Y = 651.05, Direction = 343, Tag = "ShaikanDead03"},
			ObjectSpawn	{ObjectId = 82, X = 70.887, Y = 651.81, Direction = 245, Tag = "ShaikanDead04"},
			-- Blocker für die Barriere werden gespawnt
			ObjectSpawn	{ObjectId = 2067, X = 369.702, Y = 297.47, Direction = 45, Tag = "Magic_Barrier_Blocker01"},
			ObjectSpawn	{ObjectId = 2067, X = 360.602, Y = 288.407, Direction = 45, Tag = "Magic_Barrier_Blocker02"},
			ObjectSpawn	{ObjectId = 2067, X = 359.158, Y = 289.438, Direction = 225, Tag = "Magic_Barrier_Blocker03"},
			ObjectSpawn	{ObjectId = 2067, X = 350.33, Y = 280.51, Direction = 225, Tag = "Magic_Barrier_Blocker04"},
			-- TothLar wird in die Festung teleportiert
			FigureTeleport {X = 203, Y = 616, Tag = "TothLar"},
			-- Scriptingkram für die Karte
			MapTimerStart {Name = "mt_P301_OutcriesAfterShadowFight"},
			MapTimerStart {Name = "mt_P301_OutcriesAfterDragonFight"},
			PlayerKitTransfer {PlayerKit = "pk_ihatebe"},
			PlayerKitTransfer {PlayerKit = "pk_kit1"},
			MapFlagSetTrue {Name = "mf_P301_Mission"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};