--****************************************************
--**												**
--**		Gate of Swords Resurrect Mordecay		**
--**												**
--****************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'MordecayAlive'",
		"'Berserker'",
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
				MapFlagIsTrue	{Name = "mf_Cutscene10"},
				AND
				{
					QuestIsActive {Player = "default", Quest = "SaveMordecayFromArena"},
					PlayerFigureIsInRange {Player = "default", Range = 20, X = 572, Y = 339},
					AvatarIsNotTalking {},
					GameInterfaceIsVisible {},
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
			CameraTakeAddToTrack {File = "CS_10_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 590.8, Y = 340.2},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			FigureTeleport {Tag = "MordecayAlive", X = 575, Y = 340.2},
			FigureLookAtDirection {Tag = "MordecayAlive", Direction = 270},
			FigureTeleport {Tag = "Berserker", X = 572.6, Y = 340.2},
			FigureLookAtDirection {Tag = "Berserker", Direction = 90},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "MordecayAlive"},
			-- Mordecay und Berserker werden in ein aufeinander neutrales Team gesteckt
			FigureTeamTransfer {Tag = "Berserker", Team = "tm_CutsceneRed"},
			FigureTeamTransfer {Tag = "MordecayAlive", Team = "tm_CutsceneRed"},
			-- Animationen starten
			FigureAnimPlayOnce {Tag = "Berserker", File = "base/gfx/figures/fraction_2/figure_barbarian_berserker_attackspecial.ska"},
			MapFlagSetTrue {Name = "mf_CS_10_Anim_Mordecay_Dies"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Kamerazoom auf Gesicht des Avatar, Löschen der Figur MordecayAlive
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Flag damit die Animation nicht neu gestartet wird
			MapFlagSetTrue {Name = "mf_CS_10_Anim_Mordecay_Dead"},
			-- Löschen von (Npc)MordecayAlive
			FigureVanish {Tag = "MordecayAlive"},
			-- SOUND: Beast Attack
			MapFlagSetTrue {Name = "mf_P309_Gate_Of_Swords_10_SOUND_Play_Beast_Attack"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02a",
	},
};

State
{
	StateName = "Cutscene02a",
	OnOneTimeEvent	-- Spawn des Objektes MordecayALive
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.8},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 2048, X = 574.8, Y = 340.2, Direction = 310, Tag = "MordecayAlive2"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02b",
	},
};



State
{
	StateName = "Cutscene02b",
	OnOneTimeEvent	-- Kamera zurück auf MordecayAlive, der am Boden liegt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Kamera weiter raus, auf MordecayAlive, Berserker und Avatar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
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
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			-- Berserker wird in ein feindliches Team gesteckt
			FigureTeamTransfer {Tag = "Berserker", Team = "tm_Berserker"},
			-- UNkillable weg, sonst ärgert sich der Spieler evtl *g*
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Berserker"},
			-- Scriptingkram für die Karte
			MapFlagSetTrue {Name = "mf_P309_CS_10_Done"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};