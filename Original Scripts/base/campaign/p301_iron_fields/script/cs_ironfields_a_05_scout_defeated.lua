--************************************************************
--**														**
--**		Iron Fiels A Scout Defeated						**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"''",
		-- pl_HumanNightsong & NightSong spawnen in der Cutscene
	}
}

State
{
	StateName = "INIT",
	OnCutsceneFigureRespawnEvent	-- Kamera auf Schattenlieds Leiche
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_CutsceneA05"},
				AND
				{
					MapFlagIsTrue {Name = "mf_P301_NightsongFree"},
					MapFlagIsTrue {Name = "mf_P301_Tutorial"},
					MapFlagIsTrue {Name = "mf_P301_NightSong_Kill"},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
					FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
				},
			},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_05_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Spawning der Leichenobjekte
			--ObjectSpawn	{ObjectId = 1152, X = 374.144, Y = 426.122, Direction = 234.913, Tag = "CS_A_05_ShadowbladeDead01"},
			--ObjectSpawn	{ObjectId = 1152, X = 375.376, Y = 427.229, Direction = 302.704, Tag = "CS_A_05_ShadowbladeDead02"},
			ObjectSpawn	{ObjectId = 1152, X = 371.817, Y = 426.527, Direction = 314.164, Tag = "CS_A_05_ShadowbladeDead01"},
			ObjectSpawn	{ObjectId = 1152, X = 374.121, Y = 430.593, Direction = 251.138, Tag = "CS_A_05_ShadowbladeDead02"},
			-- Schattenliedleiche Spawn, Anim startet in ihrem Script
			MapFlagSetTrue {Name = "mf_NightSong_Spawn"},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 373.002, Y = 429.391},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 64.1713},
			--FigureTeleport {Tag = "pl_HumanHeroBor", X = 375.911, Y = 430.357},
			--FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 337.082},
			--FigureTeleport {Tag = "pl_HumanHeroLya", X = 373.062, Y = 427.22},
			--FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 126.051},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 373.223, Y = 431.432},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 45.8369},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 371.472, Y = 428.31},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 85.944},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroBor"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroLya"},
			FigureCutsceneTalkJobSet {Tag = "NightSong"},
			-- Waffen Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsHide {Tag = "Pl_HumanHeroLya"},
			EntityTimerStart {Name = "et_CStimer"},
			
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Avatar: Avatar2a
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar2a", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Avatar3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_05_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar3", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Avatar kniet nieder
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_KneelDownHack"},
		},
	},
	OnOneTimeEvent	-- Avatar kniet nieder
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_KneelDownHack", Seconds = 0.6},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_KneelDownHack"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_05_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureStop	{Tag = "pl_HumanAvatar"},
			MapFlagSetTrue {Name = "mf_CS_A_05_Avatar_Kneel_Down"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05a",
	},
};

State
{
	StateName = "Cutscene05a",
	OnOneTimeEvent	-- SOUND: Blood Transfusion
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Tutorial_A04_SOUND_Play_Blood_Transfusion"},
		},
		GotoState = "Cutscene05b",
	},
};

State
{
	StateName = "Cutscene05b",
	OnOneTimeEvent	--  Schattenlied steht auf
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_NightSong_Kneel_Stop"},
			FigureAnimPlayOnce	{Tag = "NightSong", File = "base/gfx/figures/hero/figure_hero_female_emote_kneel_up.ska"}, -- 1.83s
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Avatar steht wieder auf
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_05_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			MapFlagSetTrue {Name = "mf_CS_A_05_Avatar_Kneel_Up"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- NightSong1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_05_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSong1", Tag = "NightSong"},
			FigureCutsceneTalkJobSet {Tag = "NightSong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Avatar3a
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_05_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			CutsceneSay {TextTag = "Avatar3a", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- NightSong2
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "NightSong2", Tag = "NightSong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Shadowsong kniet nieder
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_KneelDownHack"},
		},
	},
	OnOneTimeEvent	-- Shadowsong kniet nieder
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_KneelDownHack", Seconds = 0.6},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_KneelDownHack"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_05_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureStop	{Tag = "NightSong"},
			MapFlagSetTrue {Name = "mf_NightSong_Kneel_Down"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Avatar4
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_05_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
 			CutsceneSay {TextTag = "Avatar4", Tag = "pl_HumanAvatar"},
 			FigureStop {Tag = "NightSong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};
State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- NightSong3
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.85},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_05_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureCutsceneTalkJobSet {Tag = "NightSong"},
			CutsceneSay {TextTag = "NightSong3", Tag = "NightSong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Avatar5
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_05_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Avatar5", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Avatar5a
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Avatar5a", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- NightSong3a
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_A_05_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSong3a", Tag = "NightSong"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
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
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
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
			FigureStop {Tag = "pl_HumanHeroBor"},
			FigureStop {Tag = "pl_HumanHeroLya"},
			-- Waffen Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsShow {Tag = "Pl_HumanHeroLya"},
			-- NightSong wird gelöscht, Respawn als Held
			MapFlagSetTrue {Name = "mf_NightSong_Vanish"},
			PlayerHeroAdd {Player = "pl_Human", HeroId = 25},
			FigureOutcry {TextTag = "System3", Tag = "System_Npc"}, --SYSTEM-OC: sie haben einen Helden
			NoSpawnEffect	{Spawn = FigureHeroSpawn {Player = "default", Tag = "Nightsong", X = 374.962, Y = 428.404, Direction = 252.856},},
			-- Scriptingkram für die Karte
			QuestSetSolved {Quest = "SaveNightsong"},
			QuestSetActive {Quest = "IgniteAlarmFire"},
			MapFlagSetTrue {Name = "mf_P301_NightsongFreeShown"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};