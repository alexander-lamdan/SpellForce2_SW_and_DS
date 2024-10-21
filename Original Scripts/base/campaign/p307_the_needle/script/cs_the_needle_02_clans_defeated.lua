--************************************************************
--**														**
--**		The Needle Clans Defeated						**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'Einar'",
		"'Matricus'",
		"'CS_02_Camp01_Dummy01'",
		"'CS_02_Camp01_Dummy02'",
		"'CS_02_Camp01_Dummy03'",
		"'CS_02_Camp01_Dummy04'",
		"'CS_02_Camp01_Dummy05'",
		"'CS_02_Camp01_Dummy06'",
		"'CS_02_Camp01_Dummy07'",
		"'CS_02_Camp01_Dummy08'",
		"'CS_02_Camp01_Dummy09'",
		"'CS_02_Camp01_Dummy10'",
		"'CS_02_Camp02_Dummy01'",
		"'CS_02_Camp02_Dummy02'",
		"'CS_02_Camp02_Dummy03'",
		"'CS_02_Camp02_Dummy04'",
		"'CS_02_Camp02_Dummy05'",
		"'CS_02_Camp02_Dummy06'",
		"'CS_02_Camp02_Dummy07'",
		"'CS_02_Camp02_Dummy08'",
		"'CS_02_Camp02_Dummy03'",
		"'CS_02_Camp02_Dummy09'",
		"'CS_02_Camp02_Dummy10'",
		"'CS_02_Camp03_Dummy01'",
		"'CS_02_Camp03_Dummy02'",
		"'CS_02_Camp03_Dummy03'",
		"'CS_02_Camp03_Dummy04'",
		"'CS_02_Camp03_Dummy05'",
		"'CS_02_Camp03_Dummy06'",
		"'CS_02_Camp03_Dummy07'",
		"'CS_02_Camp03_Dummy08'",
		"'CS_02_Camp03_Dummy09'",
		"'CS_02_Camp03_Dummy10'",
	}
}

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene02"},
				AND
				{
					OR
					{
						MapFlagIsTrue	{Name = "mf_clans_defeated"},
						AvatarFlagIsTrue {Name = "af_P307_Cutscene02"},
					},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsAlive {Tag = "pl_HumanAvatar"},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
					FigureIsNotInCombat {Tag = "Einar"},
					FigureIsNotInCombat {Tag = "Matricus"},
				},
			},
		},
		Actions = 
		{
			-- Spawn von Einheiten in Lager 1
			FigureNpcSpawn	{Tag = "CS_02_Camp01_Dummy01", Level = 1, UnitId = 292, X = 189, Y = 483, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp01_Dummy02", Level = 1, UnitId = 293, X = 196, Y = 478, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp01_Dummy03", Level = 1, UnitId = 294, X = 192, Y = 487, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp01_Dummy04", Level = 1, UnitId = 292, X = 196, Y = 476, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp01_Dummy05", Level = 1, UnitId = 293, X = 198, Y = 487, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp01_Dummy06", Level = 1, UnitId = 293, X = 202, Y = 470, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp01_Dummy07", Level = 1, UnitId = 292, X = 184, Y = 478, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp01_Dummy08", Level = 1, UnitId = 294, X = 186, Y = 487, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp01_Dummy09", Level = 1, UnitId = 292, X = 190, Y = 492, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp01_Dummy10", Level = 1, UnitId = 292, X = 193, Y = 488, Team = "tm_Neutral"},
			-- Spawn von Einheiten in Lager 2
			FigureNpcSpawn	{Tag = "CS_02_Camp02_Dummy01", Level = 1, UnitId = 292, X = 452, Y = 159, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp02_Dummy02", Level = 1, UnitId = 293, X = 448, Y = 147, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp02_Dummy03", Level = 1, UnitId = 294, X = 445, Y = 148, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp02_Dummy04", Level = 1, UnitId = 292, X = 442, Y = 156, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp02_Dummy05", Level = 1, UnitId = 293, X = 436, Y = 147, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp02_Dummy06", Level = 1, UnitId = 293, X = 439, Y = 154, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp02_Dummy07", Level = 1, UnitId = 292, X = 442, Y = 156, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp02_Dummy08", Level = 1, UnitId = 294, X = 441, Y = 158, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp02_Dummy09", Level = 1, UnitId = 292, X = 452, Y = 145, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp02_Dummy10", Level = 1, UnitId = 292, X = 449, Y = 152, Team = "tm_Neutral"},
			-- Spawn von Einheiten in Lager 3
			FigureNpcSpawn	{Tag = "CS_02_Camp03_Dummy01", Level = 1, UnitId = 292, X = 427, Y = 327, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp03_Dummy02", Level = 1, UnitId = 293, X = 428, Y = 316, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp03_Dummy03", Level = 1, UnitId = 294, X = 442, Y = 317, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp03_Dummy04", Level = 1, UnitId = 292, X = 432, Y = 331, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp03_Dummy05", Level = 1, UnitId = 293, X = 431, Y = 309, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp03_Dummy06", Level = 1, UnitId = 293, X = 435, Y = 305, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp03_Dummy07", Level = 1, UnitId = 292, X = 420, Y = 319, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp03_Dummy08", Level = 1, UnitId = 294, X = 421, Y = 326, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp03_Dummy09", Level = 1, UnitId = 292, X = 443, Y = 323, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CS_02_Camp03_Dummy10", Level = 1, UnitId = 292, X = 439, Y = 330, Team = "tm_Neutral"},
			-- Flag zum Starten
			EntityFlagSetTrue {Name = "ef_CutsceneBegin"},
		},
	};
	OnCutsceneFigureRespawnEvent	-- Teleport der Akteure, Spawn der Leiche eines Ork Totems
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_CutsceneBegin"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Akteure werden zu ihren Positionen teleportiert
			FigureTeleport {Tag = "pl_HumanAvatar", X = 229.36, Y = 267.249},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 268.327},
			FigureTeleport {Tag = "Matricus", X = 228.608, Y = 269.672},
			FigureLookAtDirection {Tag = "Matricus", Direction = 293.535},
			FigureTeleport {Tag = "Einar", X = 224.49, Y = 267.225},
			FigureLookAtDirection {Tag = "Einar", Direction = 112.873},
			ObjectSpawn	{ObjectId = 1462, X = 227.2, Y = 268.043, Direction = 176.654, Tag = "DeadSpiritist"},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Matricus"},
			FigureCutsceneTalkJobSet {Tag = "Einar"},
			-- Waffen Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Matricus"},
			CutsceneFigureWeaponsHide {Tag = "Einar"},
			-- Ausrichten der Dummies in Lager 1
			FigureLookAtDirection {Tag = "CS_02_Camp01_Dummy01", Direction = 123},
			FigureLookAtDirection {Tag = "CS_02_Camp01_Dummy02", Direction = 176},
			FigureLookAtDirection {Tag = "CS_02_Camp01_Dummy03", Direction = 290},
			FigureLookAtDirection {Tag = "CS_02_Camp01_Dummy04", Direction = 27},
			FigureLookAtDirection {Tag = "CS_02_Camp01_Dummy05", Direction = 98},
			FigureLookAtDirection {Tag = "CS_02_Camp01_Dummy06", Direction = 167},
			FigureLookAtDirection {Tag = "CS_02_Camp01_Dummy07", Direction = 80},
			FigureLookAtDirection {Tag = "CS_02_Camp01_Dummy08", Direction = 53},
			FigureLookAtDirection {Tag = "CS_02_Camp01_Dummy09", Direction = 165},
			FigureLookAtDirection {Tag = "CS_02_Camp01_Dummy10", Direction = 249},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Einar: ClansDefeated01
	{
		Conditions =
		{			
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "ClansDefeated01", Tag = "Einar"},
			-- Ausrichten der Dummies in Lager 2
			FigureLookAtDirection {Tag = "CS_02_Camp02_Dummy01", Direction = 123},
			FigureLookAtDirection {Tag = "CS_02_Camp02_Dummy02", Direction = 176},
			FigureLookAtDirection {Tag = "CS_02_Camp02_Dummy03", Direction = 290},
			FigureLookAtDirection {Tag = "CS_02_Camp02_Dummy04", Direction = 27},
			FigureLookAtDirection {Tag = "CS_02_Camp02_Dummy05", Direction = 98},
			FigureLookAtDirection {Tag = "CS_02_Camp02_Dummy06", Direction = 167},
			FigureLookAtDirection {Tag = "CS_02_Camp02_Dummy07", Direction = 80},
			FigureLookAtDirection {Tag = "CS_02_Camp02_Dummy08", Direction = 53},
			FigureLookAtDirection {Tag = "CS_02_Camp02_Dummy09", Direction = 165},
			FigureLookAtDirection {Tag = "CS_02_Camp02_Dummy10", Direction = 249},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Einar: ClansDefeated02 
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay	{TextTag = "ClansDefeated02", Tag = "Einar"},
			-- Ausrichten der Dummies in Lager 3
			FigureLookAtDirection {Tag = "CS_02_Camp03_Dummy01", Direction = 123},
			FigureLookAtDirection {Tag = "CS_02_Camp03_Dummy02", Direction = 176},
			FigureLookAtDirection {Tag = "CS_02_Camp03_Dummy03", Direction = 290},
			FigureLookAtDirection {Tag = "CS_02_Camp03_Dummy04", Direction = 27},
			FigureLookAtDirection {Tag = "CS_02_Camp03_Dummy05", Direction = 98},
			FigureLookAtDirection {Tag = "CS_02_Camp03_Dummy06", Direction = 167},
			FigureLookAtDirection {Tag = "CS_02_Camp03_Dummy07", Direction = 80},
			FigureLookAtDirection {Tag = "CS_02_Camp03_Dummy08", Direction = 53},
			FigureLookAtDirection {Tag = "CS_02_Camp03_Dummy09", Direction = 165},
			FigureLookAtDirection {Tag = "CS_02_Camp03_Dummy10", Direction = 249},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Avatar: ClansDefeated03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay	{TextTag = "ClansDefeated03", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Matricus: ClansDefeated04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},		
			CutsceneSay	{TextTag = "ClansDefeated04", Tag = "Matricus"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Einar: ClansDefeated05
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take04a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},					
			CutsceneSay	{TextTag = "ClansDefeated05", Tag = "Einar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Einar: ClansDefeated06 & Kamera auf die drei Lager
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			-- Kameras auf Lager
			CameraTakeAddToTrack {File = "CS_02_Take05", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take06", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_02_Take07", Tag = "default", TargetTag = "default"},
			-- Kamera auf Einar
			CameraTakeAddToTrack {File = "CS_02_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay	{TextTag = "ClansDefeated06", Tag = "Einar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Einar: ClansDefeated07
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			-- Timer bleibt, damit man alle Lager gesehen hat
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 9},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "ClansDefeated07", Tag = "Einar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Einar: ClansDefeated08
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay	{TextTag = "ClansDefeated08", Tag = "Einar"},
			FigureLookAtEntity	{Tag = "pl_Human_Avatar", TargetTag = "Einar"},
	    	FigureLookAtEntity	{Tag = "Einar", TargetTag = "pl_Human_Avatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
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
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
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
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "Matricus"},
			FigureCutsceneTalkJobSet {Tag = "Einar"},
			-- Waffen Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Matricus"},
			CutsceneFigureWeaponsShow {Tag = "Einar"},
			-- Löschen der Dummies
			FigureVanish {Tag = "CS_02_Camp01_Dummy01"},
			FigureVanish {Tag = "CS_02_Camp01_Dummy02"},
			FigureVanish {Tag = "CS_02_Camp01_Dummy03"},
			FigureVanish {Tag = "CS_02_Camp01_Dummy04"},
			FigureVanish {Tag = "CS_02_Camp01_Dummy05"},
			FigureVanish {Tag = "CS_02_Camp01_Dummy06"},
			FigureVanish {Tag = "CS_02_Camp01_Dummy07"},
			FigureVanish {Tag = "CS_02_Camp01_Dummy08"},
			FigureVanish {Tag = "CS_02_Camp01_Dummy09"},
			FigureVanish {Tag = "CS_02_Camp01_Dummy10"},
			FigureVanish {Tag = "CS_02_Camp02_Dummy01"},
			FigureVanish {Tag = "CS_02_Camp02_Dummy02"},
			FigureVanish {Tag = "CS_02_Camp02_Dummy03"},
			FigureVanish {Tag = "CS_02_Camp02_Dummy04"},
			FigureVanish {Tag = "CS_02_Camp02_Dummy05"},
			FigureVanish {Tag = "CS_02_Camp02_Dummy06"},
			FigureVanish {Tag = "CS_02_Camp02_Dummy07"},
			FigureVanish {Tag = "CS_02_Camp02_Dummy08"},
			FigureVanish {Tag = "CS_02_Camp02_Dummy09"},
			FigureVanish {Tag = "CS_02_Camp02_Dummy10"},
			FigureVanish {Tag = "CS_02_Camp03_Dummy01"},
			FigureVanish {Tag = "CS_02_Camp03_Dummy02"},
			FigureVanish {Tag = "CS_02_Camp03_Dummy03"},
			FigureVanish {Tag = "CS_02_Camp03_Dummy04"},
			FigureVanish {Tag = "CS_02_Camp03_Dummy05"},
			FigureVanish {Tag = "CS_02_Camp03_Dummy06"},
			FigureVanish {Tag = "CS_02_Camp03_Dummy07"},
			FigureVanish {Tag = "CS_02_Camp03_Dummy08"},
			FigureVanish {Tag = "CS_02_Camp03_Dummy09"},
			FigureVanish {Tag = "CS_02_Camp03_Dummy10"},
			-- Scriptkram für die Karte
			AvatarFlagSetTrue {Name = "af_P307_CS02Finished"},
		},  
		GotoState = "CutsceneEnd",
	},      
};      

State
{
	StateName = "CutsceneEnd",
};    
            
            
            