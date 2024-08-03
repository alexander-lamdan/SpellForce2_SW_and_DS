--************************************************************
--**														**
--**		Norimar Skirmish								**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'pl_HumanNightsong'",
		"'pl_HumanHeroBor'",
		"'pl_HumanHeroLya'",
		"'Cutscene_Skirmish_Guard_1'",
		"'Cutscene_Skirmish_Guard_2'",
		"'Cutscene_Skirmish_Guard_3'",
		"'Cutscene_Skirmish_Guard_4'",
		"'Cutscene_Skeleton_1'",
		"'Cutscene_Skeleton_2'",
		"'Cutscene_Skeleton_3'",
		"'Cutscene_Skeleton_4'",
		"'Cutscene_Skeleton_5'",
		"'Cutscene_Skeleton_6'",
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamerafahrt zum Kampf
	{
		AllowCombat = true,
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene02"},
				AND
				{
					OR
					{
						FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 538.024, Y = 96.4202},
						FigureIsInRange	{Tag = "pl_HumanNightSong", Range = 10, X = 538.024, Y = 96.4202},					
						FigureIsInRange	{Tag = "pl_HumanHeroBor", Range = 10, X = 538.024, Y = 96.4202},					
						FigureIsInRange	{Tag = "pl_HumanHeroLya", Range = 10, X = 538.024, Y = 96.4202},
					},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
				},
			},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Akteure Teleport
			FigureTeleport {Tag = "pl_HumanAvatar", X = 540.031, Y = 100.239},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 150},
			FigureTeleport {Tag = "pl_HumanNightSong", X = 541.569, Y = 98.5569},
			FigureLookAtDirection {Tag = "pl_HumanNightSong", Direction = 150},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 538.297, Y = 100.034},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 150},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 539.732, Y = 97.3478},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 150},
			-- Akteure gehen in Richtung Kampfplatz
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 547.346, Y = 112.339},
			FigureSimpleWalk {Tag = "pl_HumanNightSong", X = 548.797, Y = 110.852},
			FigureSimpleWalk {Tag = "pl_HumanHeroBor", X = 545.672, Y = 112.492},
			FigureSimpleWalk {Tag = "pl_HumanHeroLya", X = 547.33, Y = 110.129},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},		
			-- Soldaten werden getötet
			FigureVanish {Tag = "Cutscene_Skirmish_Guard_1"},
			FigureVanish {Tag = "Cutscene_Skirmish_Guard_2"},
			FigureVanish {Tag = "Cutscene_Skirmish_Guard_3"},
			FigureVanish {Tag = "Cutscene_Skirmish_Guard_4"},
			-- Leichenobjekte werden gespawnt
			ObjectSpawn	{ObjectId = 848, X = 577.808, Y = 128.569, Direction = 97.403, Tag = "Skirmish_Guard_1_Corpse"},
			ObjectSpawn	{ObjectId = 848, X = 576.242, Y = 129.621, Direction = 296.975, Tag = "Skirmish_Guard_2_Corpse"},
			ObjectSpawn	{ObjectId = 848, X = 579.276, Y = 128.926, Direction = 0, Tag = "Skirmish_Guard_3_Corpse"},
			ObjectSpawn	{ObjectId = 848, X = 579.058, Y = 127.237, Direction = 205.302, Tag = "Skirmish_Guard_4_Corpse"},
			-- Teamwechsel der Skelette, damit sie angreifbar sind
			FigureTeamTransfer {Tag = "Cutscene_Skeleton_1", Team = "tm_BadGuys"},
			FigureTeamTransfer {Tag = "Cutscene_Skeleton_2", Team = "tm_BadGuys"},
			FigureTeamTransfer {Tag = "Cutscene_Skeleton_3", Team = "tm_BadGuys"},
			FigureTeamTransfer {Tag = "Cutscene_Skeleton_4", Team = "tm_BadGuys"},
			FigureTeamTransfer {Tag = "Cutscene_Skeleton_5", Team = "tm_BadGuys"},
			FigureTeamTransfer {Tag = "Cutscene_Skeleton_6", Team = "tm_BadGuys"},
			-- Scriptingkram für die Karte
			MapFlagSetTrue {Name = "mf_CS_norimar_skirmish_end"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};