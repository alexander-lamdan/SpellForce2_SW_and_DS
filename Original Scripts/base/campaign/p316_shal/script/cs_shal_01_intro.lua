--************************************************************
--**														**
--**		Shal Intro										**
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
		"'pl_HumanHeroMordecay'",
		"'pl_HumanHeroJared'",
		"'pl_HumanHeroShae'",
		"'Sorvina'",
		"'Wache01'",
		"'Wache02'",
		"'Wache03'",
		"'Wache04'",
		"'Ur_Dragon'",
		"'Leibwache'",
		"'Wache06'",
		"'CS_01_Shadowblade01'",
		"'CS_01_Shadowblade02'",
		"'CS_01_Shadowblade03'",
		"'CS_01_Shadowblade04'",
		"'CS_01_Shadowblade05'",
		"'CS_01_Shadowblade06'",
		"'CS_01_Shadowblade07'",
		"'CS_01_Shadowblade08'",
		"'CS_01_Shadowblade09'",
		"'CS_01_Shadowblade10'",
		"'CS_01_Shadowblade11'",
		"'CS_01_Shadowblade12'",
		"'CS_01_Shadowblade13'",
		"'CS_01_Shadowblade14'",
		"'CS_01_Shadowblade15'",
		"'CS_01_Shadowblade16'",
		"'CS_01_Shadowblade17'",
		"'CS_01_Shadowblade18'",
		"'CS_01_Shadowblade19'",
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
			FigureVanish {Tag = "CS_01_Sorvina01"},
			FigureVanish {Tag = "CS_01_Sorvina02"},
			FigureVanish {Tag = "CS_01_Sorvina03"},
			FigureVanish {Tag = "CS_01_Wache01"},
			FigureVanish {Tag = "CS_01_Wache02"},
			FigureVanish {Tag = "CS_01_Wache03"},
			FigureVanish {Tag = "CS_01_Wache04"},
			FigureVanish {Tag = "CS_01_Wache05"},
			FigureVanish {Tag = "CS_01_Avatar01"},
			FigureVanish {Tag = "CS_01_Avatar02"},
			FigureVanish {Tag = "CS_01_Avatar03"},
			FigureVanish {Tag = "CS_01_Bor01"},
			FigureVanish {Tag = "CS_01_Bor02"},
			FigureVanish {Tag = "CS_01_Bor03"},
			FigureVanish {Tag = "CS_01_Bor04"},
			FigureVanish {Tag = "CS_01_Lya01"},
			FigureVanish {Tag = "CS_01_Lya02"},
			FigureVanish {Tag = "CS_01_Lya03"},
			FigureVanish {Tag = "CS_01_Lya04"},
			FigureVanish {Tag = "CS_01_Mordecay01"},
			FigureVanish {Tag = "CS_01_Mordecay02"},
			FigureVanish {Tag = "CS_01_Mordecay03"},
			FigureVanish {Tag = "CS_01_Mordecay04"},
			FigureVanish {Tag = "CS_01_Jared01"},
			FigureVanish {Tag = "CS_01_Jared02"},
			FigureVanish {Tag = "CS_01_Jared03"},
			FigureVanish {Tag = "CS_01_Jared04"},
			FigureVanish {Tag = "CS_01_Shae01"},
			FigureVanish {Tag = "CS_01_Shae02"},
			FigureVanish {Tag = "CS_01_Shae03"},
			FigureVanish {Tag = "CS_01_Shae04"},
			FigureVanish {Tag = "CS_01_Leibwache01"},
			FigureVanish {Tag = "CS_01_Malar00"},
			FigureVanish {Tag = "CS_01_Malar01"},
			FigureVanish {Tag = "CS_01_Malar02"},
			ObjectVanish {Tag = "CS_01_Cup01"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Avatar01"},
			FigureVanish {Tag = "CS_02_Shadowsong01"},
			FigureVanish {Tag = "CS_02_Rebell01"},
			FigureVanish {Tag = "CS_02_Rebell02"},
			-- dritte Cutscene Vanish
			FigureVanish {Tag = "CS_03_Avatar01"},
			FigureVanish {Tag = "CS_03_Shadowsong01"},
			-- vierte Cutscene Vanish
			FigureVanish {Tag = "CS_04_Avatar01"},
			FigureVanish {Tag = "CS_04_Avatar02"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Sorvinas Soldaten gehen auf den Avatar und seine Helden Zu
	{
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
			-- Teleport der Akteure(Sorvina und Wachen)
			FigureTeleport {Tag = "Sorvina", X = 95.2, Y = 42.479},
			FigureLookAtDirection {Tag = "Sorvina", Direction = 0},
			FigureTeleport {Tag = "Wache01", X = 93.8, Y = 40.6},
			FigureLookAtDirection {Tag = "Wache01", Direction = 0},
			FigureTeleport {Tag = "Wache02", X = 92.4, Y = 39.2},
			FigureLookAtDirection {Tag = "Wache02", Direction = 0},
			FigureTeleport {Tag = "Wache03", X = 96.6, Y = 40.6},
			FigureLookAtDirection {Tag = "Wache03", Direction = 0},
			FigureTeleport {Tag = "Wache04", X = 98, Y = 39.2},
			FigureLookAtDirection {Tag = "Wache04", Direction = 0},
			-- Teleport der Akteure(Avatar und Helden)
			FigureTeleport {Tag = "pl_HumanAvatar", X = 95.2, Y = 26.6},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 180},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 92.081, Y = 28.04},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 174.27},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 96.698, Y = 26.739},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 180},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 97.949, Y = 27.282},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 202.918},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 93.25, Y = 27.013},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 174.27},
			FigureTeleport {Tag = "pl_HumanHeroMordecay", X = 98.711, Y = 28.329},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 200.626},
			-- Teleport der restlichen Akteure
			--FigureTeleport {Tag = "Ur", X = 103.916, Y = 142.28},
			--FigureLookAtDirection {Tag = "Ur", Direction = 279.786},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Sorvina"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroBor"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroLya"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroJared"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroShae"},
			FigureCutsceneTalkJobSet {Tag = "pl_HumanHeroMordecay"},
			FigureCutsceneTalkJobSet {Tag = "Ur_Dragon"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroJared"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroShae"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroMordecay"},
			-- Wache01 läuft auf die Helden und Avatar zu
			FigureSimpleWalk {Tag = "Wache01", X = 93.8, Y = 33.6},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Wache02 läuft auf die Helden und Avatar zu
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Wache02", X = 92.4, Y = 32.2},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Wache03 läuft auf die Helden und Avatar zu
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Wache03", X = 96.6, Y = 33.6},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Wache04 läuft auf die Helden und Avatar zu
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk{Tag = "Wache04", X = 98, Y = 32.2},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Sorvina: Sorvina01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Sorvina01", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimerA"},
			EntityTimerStart {Name = "et_CStimer"},
		},
	},
	OnOneTimeEvent	-- Sorvinas Wachen bleiben stehen
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 0.8},
		},
		Actions =
		{
			FigureStop {Tag = "Wache01"},
			FigureStop {Tag = "Wache02"},
			FigureStop {Tag = "Wache03"},
			FigureStop {Tag = "Wache04"},
			EntityTimerStop {Name = "et_CStimerA"},
			EntityTimerStart {Name = "et_CStimerB"},
		},
	},
	OnOneTimeEvent	-- Kamera auf Sorvina
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerB", Seconds = 0.4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStop {Name = "et_CStimerB"},
			-- Timer damit Sorvina erst los geht, wenn die Kamerafahrt auch zu sehen war
			EntityTimerStart {Name = "et_CStimerAnim"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Sorvina läuft(naja bei ihr wohl eher "gleitet") zum Avatar und Helden
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			-- Timer damit man Sorvina auf jeden Fall kurz sieht
			EntityTimerIsElapsed {Name = "et_CStimerAnim", Seconds = 0.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "Sorvina", X = 95.2, Y = 31.5},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06a",
	},
};

State
{
	StateName = "Cutscene06a",
	OnOneTimeEvent	-- Kamera auf Sorvina
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Sorvina"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06b",
	},
};

State
{
	StateName = "Cutscene06b",
	OnOneTimeEvent	-- Sorvina spielt Animation ab
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "Sorvina", File = "base/gfx/figures/boss/figure_boss_sorvina_special_cutscene_cast_65degree.ska"}, -- 2s
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07a",
	},
};

State
{
	StateName = "Cutscene07a",
	OnOneTimeEvent	-- Kamera hinter Sorvina, Effekt Start auf Positionen der Helden
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerAnim", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "Sorvina", File = "base/gfx/figures/boss/figure_boss_sorvina_special_cutscene_cast_65degree.ska"}, -- 2s
			-- Effekt Start auf Positionen der Helden
			EffectStartAtEntityPosition {Tag = "pl_HumanHeroBor", File = "Effect_Misc_SpawnSpecial_02"},
			EffectStartAtEntityPosition {Tag = "pl_HumanHeroLya", File = "Effect_Misc_SpawnSpecial_02"},
			EffectStartAtEntityPosition {Tag = "pl_HumanHeroJared", File = "Effect_Misc_SpawnSpecial_02"},
			EffectStartAtEntityPosition {Tag = "pl_HumanHeroShae", File = "Effect_Misc_SpawnSpecial_02"},
			EffectStartAtEntityPosition {Tag = "pl_HumanHeroMordecay", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Vanish Heroes
			MapFlagSetTrue {Name = "mf_P316_Shal_01_SOUND_Play_Vanish_Heroes"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07b",
	},
};

State
{
	StateName = "Cutscene07b",
	OnOneTimeEvent	-- Helden verschwinden(werden außerhalb des Sichtfeldes teleportiert)
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 107.8, Y = 85.4},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 0},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 107.8, Y = 85.4},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 0},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 107.8, Y = 85.4},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 0},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 107.8, Y = 85.4},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 0},
			FigureTeleport {Tag = "pl_HumanHeroMordecay", X = 107.8, Y = 85.4},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 0},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Kamerazoom auf Gesicht des Avatar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Kamera auf Sorvina
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Sorvina spielt Animation ab
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.7},
		},
		Actions =
		{
			FigureAnimPlayOnce {Tag = "Sorvina", File = "base/gfx/figures/boss/figure_boss_sorvina_special_cutscene_cast.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11a",
	},
};

State
{
	StateName = "Cutscene11a",
	OnOneTimeEvent	-- Effekt Start auf Position des Avatar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			EffectStartAtEntityPosition {Tag = "pl_HumanAvatar", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Vanish Avatar
			MapFlagSetTrue {Name = "mf_P316_Shal_01_SOUND_Play_Vanish_Avatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11b",
	},
};
State
{
	StateName = "Cutscene11b",
	OnOneTimeEvent	-- Kamera geht weiter raus
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12a",
	},
};

State
{
	StateName = "Cutscene12a",
	OnOneTimeEvent	-- Avatar verschwindet(auf den Platz vor Ur) und spielt Gefangenen-Animation ab
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.4},
		},
		Actions =
		{
			FigureTeleport {Tag = "pl_HumanAvatar", X = 99.4, Y = 133},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 90},
			-- Avatar spielt Animation ab
			MapFlagSetTrue {Name = "mf_CS_01_Avatar_Anim_Prisoned"},
			-- Talkjob Avatar
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12b",
	},
};

State
{
	StateName = "Cutscene12b",
	OnOneTimeEvent	-- Kamerazoom auf Sorvina
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.7},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12c",
	},
};

State
{
	StateName = "Cutscene12c",
	OnOneTimeEvent	-- Effekt Start auf Sorvinas Position
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.7},
		},
		Actions =
		{
			-- Effekt Start auf Position von Sorvina
			EffectStartAtEntityPosition {Tag = "Sorvina", File = "Effect_Misc_SpawnSpecial_02"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12d",
	},
};

State
{
	StateName = "Cutscene12d",
	OnOneTimeEvent	-- Sorvina verschwindet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureTeleport {Tag = "Sorvina", X = 107.8, Y = 85.4},
			FigureLookAtDirection {Tag = "Sorvina", Direction = 0},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Kamera auf linke Gefängniszelle, Effekt Start auf FX-Dummies in der linken Zelle
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Effekt Start auf FX-Dummies in der linken Zelle
			EffectStart {Tag = "CS_01_Bor02_Effect", File = "Effect_Misc_SpawnSpecial_02"},
			EffectStart {Tag = "CS_01_Lya02_Effect", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUNd: Auftauchen der Helden 1
			MapFlagSetTrue {Name = "mf_P316_Shal_01_SOUND_Play_Appearance_Heroes1"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Bor und Lya tauchen auf
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 84.536, Y = 119.324},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 302.704},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 85.168, Y = 119.684},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 131.78},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- Dunkelelfen bedrängen Bor und Lya
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade14", TargetTag = "pl_HumanHeroLya"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade15", TargetTag = "pl_HumanHeroLya"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade16", TargetTag = "pl_HumanHeroLya"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade17", TargetTag = "pl_HumanHeroBor"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade18", TargetTag = "pl_HumanHeroBor"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade19", TargetTag = "pl_HumanHeroBor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Kamera auf rechte Gefängniszelle, Effekt Start auf FX-Dummies in der rechten Zelle
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Effekt Start auf FX-Dummies in der linken Zelle
			EffectStart {Tag = "CS_01_Jared02_Effect", File = "Effect_Misc_SpawnSpecial_02"},
			EffectStart {Tag = "CS_01_Shae02_Effect", File = "Effect_Misc_SpawnSpecial_02"},
			EffectStart {Tag = "CS_01_Mordecay02_Effect", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Auftauchen der Helden 2
			MapFlagSetTrue {Name = "mf_P316_Shal_01_SOUND_Play_Appearance_Heroes2"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Jared, Shae und Mordecay tauchen auf
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 124.701, Y = 119.462},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 291.245},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 125.071, Y = 120.386},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 153.736},
			FigureTeleport {Tag = "pl_HumanHeroMordecay", X = 125.766, Y = 119.327},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 63.026},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- Dunkelelfen bedrängen Jared, Shae und Mordecay
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.4},
		},
		Actions =
		{
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade01", TargetTag = "pl_HumanHeroMordecay"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade02", TargetTag = "pl_HumanHeroJared"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade03", TargetTag = "pl_HumanHeroShae"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade04", TargetTag = "pl_HumanHeroJared"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade05", TargetTag = "pl_HumanHeroMordecay"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade06", TargetTag = "pl_HumanHeroMordecay"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade07", TargetTag = "pl_HumanHeroShae"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade08", TargetTag = "pl_HumanHeroShae"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade09", TargetTag = "pl_HumanHeroShae"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade10", TargetTag = "pl_HumanHeroMordecay"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade11", TargetTag = "pl_HumanHeroMordecay"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade12", TargetTag = "pl_HumanHeroJared"},
			FigureSimpleWalkToEntity {Tag = "CS_01_Shadowblade13", TargetTag = "pl_HumanHeroShae"},
			-- Todes-Animationen für Bor und Lya werden abgespielt
			MapFlagSetTrue {Name = "mf_CS_01_Bor_Dead"},
			MapFlagSetTrue {Name = "mf_CS_01_Lya_Dead"},
			-- Dunkelelfen aus der linke Zelle werden gelöscht
			FigureVanish {Tag = "CS_01_Shadowblade14"},
			FigureVanish {Tag = "CS_01_Shadowblade15"},
			FigureVanish {Tag = "CS_01_Shadowblade16"},
			FigureVanish {Tag = "CS_01_Shadowblade17"},
			FigureVanish {Tag = "CS_01_Shadowblade18"},
			FigureVanish {Tag = "CS_01_Shadowblade19"},
			-- Jared und Mordecay werden umteleportiert
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 83.583, Y = 123.978},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 291.245},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 84.414, Y = 125.204},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 34.377},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- Kamera wieder auf die linke Zelle
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Todes-Animation für Jared, Shae und Mordecay werden abgespielt
			MapFlagSetTrue {Name = "mf_CS_01_Jared_Dead"},
			MapFlagSetTrue {Name = "mf_CS_01_Shae_Dead"},
			MapFlagSetTrue {Name = "mf_CS_01_Mordecay_Dead"},
			-- Dunkelelfen aus der linke Zelle werden gelöscht
			FigureVanish {Tag = "CS_01_Shadowblade01"},
			FigureVanish {Tag = "CS_01_Shadowblade02"},
			FigureVanish {Tag = "CS_01_Shadowblade03"},
			FigureVanish {Tag = "CS_01_Shadowblade04"},
			FigureVanish {Tag = "CS_01_Shadowblade05"},
			FigureVanish {Tag = "CS_01_Shadowblade06"},
			FigureVanish {Tag = "CS_01_Shadowblade07"},
			FigureVanish {Tag = "CS_01_Shadowblade08"},
			FigureVanish {Tag = "CS_01_Shadowblade09"},
			FigureVanish {Tag = "CS_01_Shadowblade10"},
			FigureVanish {Tag = "CS_01_Shadowblade11"},
			FigureVanish {Tag = "CS_01_Shadowblade12"},
			FigureVanish {Tag = "CS_01_Shadowblade13"},
			-- Bor, Shae und Mordecay werden umteleportiert
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 122.662, Y = 124.588},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 0},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 123.648, Y = 124.969},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 228.22},
			FigureTeleport {Tag = "pl_HumanHeroMordecay", X = 124.865, Y = 124.833},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 314.164},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- Kamera wieder auf die rechte Zelle
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent	-- Kamera auf Platz vor Ur, SOUND: Fesseln des Avatar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- SOUND: Avatar-Fesseln
			MapFlagSetTrue {Name = "mf_P316_Shal_01_SOUND_Play_Magic_Chain"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
	OnOneTimeEvent	-- Kamera dreht sich um Avatar
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23a",
	},
};

State
{
	StateName = "Cutscene23a",
	OnOneTimeEvent	-- SOUND: Sorvina erscheint
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.7},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P316_Shal_01_SOUND_Play_Appearance_Sorvina"},
		},
		GotoState = "Cutscene23b",
	},
};

State
{
	StateName = "Cutscene23b",
	OnOneTimeEvent	-- Kamera wieder auf den Platz, zeigt Avatar und Sorvina & Sorvina Teleport auf den Platz
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureTeleport {Tag = "Sorvina", X = 101.8, Y = 133},
			FigureLookAtDirection {Tag = "Sorvina", Direction = 270},
			-- Talkjob
			FigureCutsceneTalkJobSet {Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	-- Sorvina: Sorvina02
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.4},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Sorvina02", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
	OnOneTimeEvent	-- Sorvina: Sorvina03
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina03", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene26",
	},
};

State
{
	StateName = "Cutscene26",
	OnOneTimeEvent	-- Sorvina: Sorvina04
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina04", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene27",
	},
};

State
{
	StateName = "Cutscene27",
	OnOneTimeEvent	-- Sorvina schlägt auf den Avatar ein
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take18", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Sorvina spielt Schlag-Animation ab
			FigureAnimPlayOnce {Tag = "Sorvina", File = "base/gfx/figures/boss/figure_boss_sorvina_special_blood_attack.ska"}, -- 3s
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene28a",
	},
};

State
{
	StateName = "Cutscene28a",
	OnOneTimeEvent	-- SOUND: Sorvinas Blutschlag
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.4},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P316_Shal_01_SOUND_Play_Bloodstrike"},
		},
		GotoState = "Cutscene28b",
	},
};

State
{
	StateName = "Cutscene28b",
	OnOneTimeEvent	-- Kamerazoom auf Gesicht des Avatar, Sorvina Mesh wird getauscht, Avatar windet sich

	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.7},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take19", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Sorvina Mesh wird getauscht
			FigureUnitChange {Tag = "Sorvina", UnitId = 898, Level = 1},
			-- Avatar windet sich
			MapFlagSetTrue {Name = "mf_CS_01_Avatar_Anim_Prisoned_Scream"},
			-- Sorvina wird neu ausgerichtet
			FigureLookAtDirection {Tag = "Sorvina", Direction = 270},
			-- SOUND: Avatar stöhnt
			MapFlagSetTrue {Name = "mf_P316_Shal_01_SOUND_Play_Scream_Avatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene29a",
	},
};

State
{
	StateName = "Cutscene29a",
	OnOneTimeEvent	-- Malacays Stimme: Malacay01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Malacay01", Tag = "Malacay_Voice"},
			-- Talkjob Sorvina
			FigureCutsceneTalkJobSet {Tag = "Sorvina"},			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene29b",
	},
};

State
{
	StateName = "Cutscene29b",
	OnOneTimeEvent	-- Ur: Ur01, Sorvina spielt Trink-Animation ab
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take20", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Ur01", Tag = "Ur_Dragon"},
			-- Sorvina spielt Trink-Animation ab
			FigureAnimPlayOnce {Tag = "Sorvina", File = "base/gfx/figures/boss/figure_boss_sorvina_drink.ska"}, -- 5.25s
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene31a",
	},
};

State
{
	StateName = "Cutscene31a",
	OnOneTimeEvent	-- SOUND: Sorvina trinkt das Blut
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.3},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P316_Shal_01_SOUND_Play_Blood_Drinking"},
		},
		GotoState = "Cutscene31b",
	},
};

State
{
	StateName = "Cutscene31b",
	OnOneTimeEvent	-- Sorvina: Sorvina05, Kamera auf Sorvina
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			-- Timer bleibt wegen Animation
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5.25},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take21", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina05", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene32",
	},
};

State
{
	StateName = "Cutscene32",
	OnOneTimeEvent	-- Sorvina windet sich
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			-- Sorvina spielt TurnIntoMalcay-Animation ab
			FigureAnimPlayOnce {Tag = "Sorvina", File = "base/gfx/figures/boss/figure_boss_sorvina_special_turn_into_malacay.ska"}, -- 5.46s
			EntityTimerStart {Name = "et_CStimerAnimStart"},
		},
	},
	OnOneTimeEvent	-- Kamerajumpcuts, fangen an nach 1.2 Sekunden der Animation, SOUND: Sorvina stöhnt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerAnimStart", Seconds = 1.2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take22", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Kamera(Jumpcuts): Kamerawechsel nach(von Anim-Start an,
			-- im Kamera -1.2 auf die Zeiten, dann passt das) 1.2, 1.8, 2.6, endet bei 3.7s
			-- SOUND: Sorvina stöhnt
			MapFlagSetTrue {Name = "mf_P316_Shal_01_SOUND_Play_Scream_Sorvina"},
		},
	},
	OnOneTimeEvent	-- Kamera auf den Becher & Becherspawn & Sorvina Mesh-Wechsel nach 3.7s nach Anim-Start
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerAnimStart", Seconds = 3.7},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take22a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Becher wird gespawnt
			ObjectSpawn	{ObjectId = 1926, X = 102.52, Y = 132.006, Direction = 314.163, Tag = "Sorvinas_Cup"},
			-- Sorvina Mesh wird getauscht
			FigureUnitChange {Tag = "Sorvina", UnitId = 980, Level = 1},
		},
	},
	OnOneTimeEvent	-- Sorvina wird mal wieder ausgerichtet, sicher ist sicher nach Mechwechsel
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerAnimStart", Seconds = 3.8},
		},
		Actions =
		{
			-- Sorvina wird neu ausgerichtet
			FigureLookAtDirection {Tag = "Sorvina", Direction = 270},
			EntityTimerStop {Name = "et_CStimerAnimStart"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene33",
	},
};

State
{
	StateName = "Cutscene33",
	OnOneTimeEvent	-- Sorvina(Malacays Stimme): Sorvina06, Kamerafahrt um Sorvina
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take23", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina06", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene34",
	},
};

State
{
	StateName = "Cutscene34",
	OnOneTimeEvent	-- Sorvina(Malacays Stimme): Sorvina07
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Sorvina07", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene35",
	},
};

State
{
	StateName = "Cutscene35",
	OnOneTimeEvent	-- Leibwache kommt angelaufen, Sorvina wird auf Leibwache ausgerichtet
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take24", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_01_Take25", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleRun {Tag = "Leibwache", X = 102.2, Y = 128.8},
			-- Sorvina wird auf Leibwache ausgerichtet
			FigureLookAtDirection {Tag = "Sorvina", Direction = 10},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene36",
	},
};

State
{
	StateName = "Cutscene36",
	OnOneTimeEvent	-- Leibwache: Leibgarde01
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Leibwache"},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Leibgarde01", Tag = "Leibwache"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene37",
	},
};

State
{
	StateName = "Cutscene37",
	OnOneTimeEvent	-- Sorvina(Malacays Stimme): Sorvina08
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take26", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina08", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene38a",
	},
};

State
{
	StateName = "Cutscene38a",
	OnOneTimeEvent	-- Sorvina spielt Cast-Animation ab, Malar werden gespawnt(als Vorbereitung auf State Cutscene41)
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureAnimPlayOnce {Tag = "Sorvina", File = "base/gfx/figures/boss/figure_boss_sorvina_special_cutscene_cast.ska"}, -- 2s
			-- Malar werden gespawnt(werden später an die richtige Stelle teleportiert
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "Malar01", Level = 1, UnitId = 196, X = 107.8, Y = 85.4, Team = "tm_Neutral"},},
			NoSpawnEffect {Spawn = FigureNpcSpawn {Tag = "Malar02", Level = 1, UnitId = 196, X = 107.8, Y = 85.4, Team = "tm_Neutral"},},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene38b",
	},
};

State
{
	StateName = "Cutscene38b",
	OnOneTimeEvent	-- Effekt Start auf Malar-FX-Dummies
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			EffectStart {Tag = "CS_01_Malar01_Effect", File = "Effect_Misc_SpawnSpecial_02"},
			EffectStart {Tag = "CS_01_Malar02_Effect", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Erscheinen der Malar
			MapFlagSetTrue {Name = "mf_P316_Shal_01_SOUND_Play_Appearance_Malar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene39",
	},
};

State
{
	StateName = "Cutscene39",
	OnOneTimeEvent	-- Kamera hinter Sorvina
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take27", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Timer auf State 39 wird verwendet
		},
		GotoState = "Cutscene41",
	},
};

State
{
	StateName = "Cutscene41",
	OnOneTimeEvent	-- Malar werden zu Sorvina teleportiert
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureTeleport {Tag = "Malar01", X = 104.711, Y = 130.607},
			FigureLookAtDirection {Tag = "Malar01", Direction = 304},
			FigureTeleport {Tag = "Malar02", X = 99.909, Y = 129.808},
			FigureLookAtDirection {Tag = "Malar02", Direction = 75},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene42",
	},
};

State
{
	StateName = "Cutscene42",
	OnOneTimeEvent	-- Sorvina(Malacays Stimme): Sorvina09, Malar02 schlägt zu
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Sorvina09", Tag = "Sorvina"},
			FigureAnimPlayOnce	{Tag = "Malar02", File = "base/gfx/figures/npc/figure_npc_malar_attack3.ska"}, -- 1.71s
			EntityTimerStart {Name = "et_CStimerA"},
		},
	},
	OnOneTimeEvent	-- Leibwache stirbt
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimerA", Seconds = 1.4},
		},
		Actions =
		{
			FigureKill	{Tag = "Leibwache"},
			EntityTimerStop {Name = "et_CStimerA"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene43",
	},
};

State
{
	StateName = "Cutscene43",
	OnOneTimeEvent	-- Ur: Ur02, Kamerazoom auf Ur, Sorvina wird auf Ur ausgerichtet
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take28", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Ur02", Tag = "Ur_Dragon"},
			-- Sorvina wird auf Ur ausgerichtet
			FigureLookAtDirection {Tag = "Sorvina", Direction = 225},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene44",
	},
};

State
{
	StateName = "Cutscene44",
	OnOneTimeEvent	-- Sorvina(Malacays Stimme): Sorvina10
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take29", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina10", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene45",
	},
};

State
{
	StateName = "Cutscene45",
	OnOneTimeEvent	-- Sorvina(Malacays Stimme): Sorvina11
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take30", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Sorvina11", Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene46",
	},
};

State
{
	StateName = "Cutscene46",
	OnOneTimeEvent	-- Kamera auf Sorvina und ihre Malar, Sorvina wird neu ausgerichtet
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take31", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Sorvina wird neu ausgerichtet
			FigureLookAtDirection {Tag = "Sorvina", Direction = 5},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene47",
	},
};

State
{
	StateName = "Cutscene47",
	OnOneTimeEvent	-- Sorvina spielt ihre Cast-Animation
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.6},
		},
		Actions =
		{
			FigureAnimPlayOnce {Tag = "Sorvina", File = "base/gfx/figures/boss/figure_boss_sorvina_special_cutscene_cast_65degree.ska"}, -- 2s
			EffectStartAtEntityPosition	{Tag = "Malar01", File = "Effect_Misc_SpawnSpecial_02"},
			EffectStartAtEntityPosition	{Tag = "Malar02", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Verschwinden der Malar
			MapFlagSetTrue {Name = "mf_P316_Shal_01_SOUND_Play_Vanish_Malar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene48",
	},
};

State
{
	StateName = "Cutscene48",
	OnOneTimeEvent	-- Malar verschwinden, Effekt Start auf Sorvina
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureVanish {Tag = "Malar01"},
			FigureVanish {Tag = "Malar02"},
			-- Effekt Start auf Sorvina
			EffectStartAtEntityPosition	{Tag = "Sorvina", File = "Effect_Misc_SpawnSpecial_02"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene49",
	},
};

State
{
	StateName = "Cutscene49",
	OnOneTimeEvent	-- Sorvina verschwindet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureVanish {Tag = "Sorvina"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene50",
	},
};

State
{
	StateName = "Cutscene50",
	OnOneTimeEvent	-- Kamera auf die Rampe, Avatar stoppt Animationen, Wache06 kommt angelaufen, Helden werden getötet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.7},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take32", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Avatar stoppt Animationen
			MapFlagSetTrue {Name = "mf_CS_01_Avatar_Anim_Free"},
			-- Teleport der Akteure
			FigureTeleport {Tag = "Wache06", X = 102.2, Y = 107.8},
			FigureLookAtDirection {Tag = "Wache06", Direction = 180},
			-- Wache06 kommt angelaufen
			FigureRun {Tag = "Wache06", X = 102.2, Y = 128.8},
			-- Helden weren getötet
			FigureKill	{Tag = "pl_HumanHeroBor"},
			FigureKill	{Tag = "pl_HumanHeroLya"},
			FigureKill	{Tag = "pl_HumanHeroJared"},
			FigureKill	{Tag = "pl_HumanHeroShae"},
			FigureKill	{Tag = "pl_HumanHeroMordecay"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene51",
	},
};

State
{
	StateName = "Cutscene51",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
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
			FigureStop {Tag = "Ur_Dragon"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroBor"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroLya"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroJared"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroShae"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroMordecay"},
			-- nicht benötigte Figuren werden gelöscht
			FigureVanish {Tag = "Malacay_Voice"},
			FigureVanish {Tag = "Wache01"},
			FigureVanish {Tag = "Wache02"},
			FigureVanish {Tag = "Wache03"},
			FigureVanish {Tag = "Wache04"},
			-- Flag damit die Ur Dying Cutscene nicht schon losgeht
			MapFlagSetTrue {Name = "mf_P316_Intro_Done"},
			-- Sounds werden gestoppt
			MapFlagSetTrue {Name = "mf_P316_Shal_01_SOUND_Stop_Magic_Chain"},
			-- Scriptingkram für die Karte
			FigureAnimPlayLooped {Tag = "Ur_Dragon", File = "base/gfx/figures/boss/figure_boss_dragon_ur_wounded_idle.ska"},
			MapFlagSetTrue	{Name = "mf_CutsceneStartEnded"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};