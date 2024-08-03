--************************************************************
--**														**
--**		Magnet Stones Intro								**
--**														**
--************************************************************

-- Variablen für die Orks, wenn sie das Zweite mal laufen
Goto2ndX = 13.998
Goto2ndY = 13.371

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroBor'",
		"'pl_HumanHeroLya'",
		"'pl_HumanHeroJared'",
		"'pl_HumanHeroShae'",
		"'pl_HumanHeroMordecay'",
		"'CS_01_SkeletonLance01'",
		"'CS_01_SkeletonLance02'",
		"'CS_01_SkeletonLance03'",
		"'CS_01_SkeletonLance04'",
		"'CS_01_SkeletonLance05'",
		"'CS_01_SkeletonLance06'",
		"'CS_01_SkeletonSword01'",
		"'CS_01_SkeletonSword02'",
		"'CS_01_SkeletonSword03'",
		"'CS_01_SkeletonSword04'",
		"'CS_01_SkeletonSword05'",
		"'CS_01_SkeletonSword06'",
		"'CS_01_Troll01'",
		"'CS_01_Troll02'",
		"'CS_01_Troll03'",
		"'CS_01_Troll04'",
		"'CS_01_Troll05'",
		"'Orc_01'",
		"'Orc_02'",
		"'Orc_03'",
		"'Orc_04'",
		"'Orc_05'",
		"'Orc_06'",
		"'Orc_07'",
		"'Orc_08'",
		"'Orc_09'",
		"'Orc_10'",
		"'Orc_11'",
		"'Orc_12'",
		"'Orc_13'",
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
			FigureVanish {Tag = "CS_01_Avatar03"},
			FigureVanish {Tag = "CS_01_Avatar04"},
			FigureVanish {Tag = "CS_01_Bor01"},
			FigureVanish {Tag = "CS_01_Bor02"},
			FigureVanish {Tag = "CS_01_Bor03"},
			FigureVanish {Tag = "CS_01_Bor04"},
			FigureVanish {Tag = "CS_01_Lya01"},
			FigureVanish {Tag = "CS_01_Lya02"},
			FigureVanish {Tag = "CS_01_Lya03"},
			FigureVanish {Tag = "CS_01_Lya04"},
			FigureVanish {Tag = "CS_01_Jared01"},
			FigureVanish {Tag = "CS_01_Jared02"},
			FigureVanish {Tag = "CS_01_Jared03"},
			FigureVanish {Tag = "CS_01_Jared04"},
			FigureVanish {Tag = "CS_01_Shae01"},
			FigureVanish {Tag = "CS_01_Shae02"},
			FigureVanish {Tag = "CS_01_Shae03"},
			FigureVanish {Tag = "CS_01_Shae04"},
			FigureVanish {Tag = "CS_01_Mordecay01"},
			FigureVanish {Tag = "CS_01_Mordecay02"},
			FigureVanish {Tag = "CS_01_Mordecay03"},
			FigureVanish {Tag = "CS_01_Mordecay04"},
			FigureVanish {Tag = "CS_01_Orc01"},
			FigureVanish {Tag = "CS_01_Orc02"},
			FigureVanish {Tag = "CS_01_Orc03"},
			FigureVanish {Tag = "CS_01_Orc04"},
			FigureVanish {Tag = "CS_01_Orc05"},
			FigureVanish {Tag = "CS_01_Orc06"},
			FigureVanish {Tag = "CS_01_Orc07"},
			FigureVanish {Tag = "CS_01_Orc08"},
			FigureVanish {Tag = "CS_01_Orc09"},
			FigureVanish {Tag = "CS_01_Orc10"},
			FigureVanish {Tag = "CS_01_Orc11"},
			FigureVanish {Tag = "CS_01_Orc12"},
			FigureVanish {Tag = "CS_01_Orc13"},
			FigureVanish {Tag = "CS_01_Orc14"},
			
		},
	},
	OnCutsceneFigureRespawnEvent	-- Animationen werden gestartet 1
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
			--CutsceneBeginWithMusic {File = "Horst_hat_nen_kleinen_Dödel"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "pl_HumanAvatar", X = 617.786, Y = 298.69},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 335},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 619.869, Y = 309.778},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 335},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 624.067, Y = 308.483},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 335},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 621.317, Y = 299.802},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 335},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 616.221, Y = 304.518},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 335},
			FigureTeleport {Tag = "pl_HumanHeroMordecay", X = 618.022, Y = 307.407},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 335},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "pl_HumanAvatar"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			-- Animationen der Trolle und Seklette starten
			--MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_Troll01"},
			--MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_Troll04"},
			--MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_SkeletonSword02"},
			--MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_SkeletonSword05"},
			--MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_SkeletonLance02"},
			--MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_SkeletonLance05"},
			EntityTimerStart {Name = "et_CStimer"},
			-- Skelette und Trolle im ersten Kampf werden Immortal
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_SkeletonLance01"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_SkeletonLance02"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_SkeletonLance03"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_SkeletonLance04"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_SkeletonLance05"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_SkeletonLance06"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_SkeletonSword01"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_SkeletonSword02"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_SkeletonSword03"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_SkeletonSword04"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_SkeletonSword05"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_SkeletonSword06"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_Troll01"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_Troll02"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_Troll03"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_Troll04"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "CS_01_Troll05"},
			
			-- Ardar, Trolle und Skelette im Lager werden Immortal
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Ardar"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege01"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege02"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege03"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege04"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege05"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege06"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege07"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege08"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege09"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege10"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege11"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege12"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege13"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege14"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege15"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege16"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege17"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege18"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege19"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege20"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege21"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege22"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege23"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege24"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "SkelSiege25"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Troll01"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Troll02"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Troll03"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Troll04"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Troll05"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Troll06"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Troll07"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Troll08"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Troll09"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Troll10"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Troll11"},			
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Animationen werden gestartet 2
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_Troll02"},
			MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_Troll05"},
			MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_SkeletonSword03"},
			MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_SkeletonSword06"},
			MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_SkeletonLance03"},
			MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_SkeletonLance06"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Animationen werden gestartet 3
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.4},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_Troll03"},
			MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_SkeletonSword01"},
			MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_SkeletonSword04"},
			MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_SkeletonLance01"},
			MapFlagSetTrue {Name = "mf_CS_01_Anim_Start_SkeletonLance04"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Avatar: Arrival_01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 9},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Arrival_01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Avatar: Arrival_02
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
			CutsceneSay {TextTag = "Arrival_02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Avatar und Orcs laufen los
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 608.337, Y = 279.09},
			FigureSimpleWalk {Tag = "pl_HumanHeroBor", X = 610.727, Y = 288.813},
			FigureSimpleWalk {Tag = "pl_HumanHeroLya", X = 614.925, Y = 287.518},
			FigureSimpleWalk {Tag = "pl_HumanHeroJared", X = 612.175, Y = 278.837},
			FigureSimpleWalk {Tag = "pl_HumanHeroShae", X = 607.079, Y = 283.553},
			FigureSimpleWalk {Tag = "pl_HumanHeroMordecay", X = 608.88, Y = 286.442},
			MapFlagSetTrue {Name = "mf_CS_Orc_Goto_A"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Kamera auf kämpfende Trolle und Skelette im Lager
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Teleport der Akteure
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			FigureTeleport {Tag = "pl_HumanAvatar", X = 525.853, Y = 204.523},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 320},
			FigureTeleport {Tag = "pl_HumanHeroBor", X = 531.849, Y = 213.894},
			FigureLookAtDirection {Tag = "pl_HumanHeroBor", Direction = 320},
			FigureTeleport {Tag = "pl_HumanHeroLya", X = 534.11, Y = 208.148},
			FigureLookAtDirection {Tag = "pl_HumanHeroLya", Direction = 320},
			FigureTeleport {Tag = "pl_HumanHeroJared", X = 529.989, Y = 204.58},
			FigureLookAtDirection {Tag = "pl_HumanHeroJared", Direction = 320},
			FigureTeleport {Tag = "pl_HumanHeroShae", X = 525.982, Y = 210.238},
			FigureLookAtDirection {Tag = "pl_HumanHeroShae", Direction = 320},
			FigureTeleport {Tag = "pl_HumanHeroMordecay", X = 533.921, Y = 212.05},
			FigureLookAtDirection {Tag = "pl_HumanHeroMordecay", Direction = 320},
			FigureTeleport {Tag = "Orc_01", X = 526.008, Y = 206.723},
			FigureLookAtDirection {Tag = "Orc_01", Direction = 320},
			FigureTeleport {Tag = "Orc_02", X = 528.115, Y = 204.723},
			FigureLookAtDirection {Tag = "Orc_02", Direction = 320},
			FigureTeleport {Tag = "Orc_03", X = 525.978, Y = 208.339},
			FigureLookAtDirection {Tag = "Orc_03", Direction = 320},
			FigureTeleport {Tag = "Orc_04", X = 528.366, Y = 206.968},
			FigureLookAtDirection {Tag = "Orc_04", Direction = 320},
			FigureTeleport {Tag = "Orc_05", X = 530.123, Y = 206.468},
			FigureLookAtDirection {Tag = "Orc_05", Direction = 320},
			FigureTeleport {Tag = "Orc_06", X = 527.507, Y = 210.834},
			FigureLookAtDirection {Tag = "Orc_06", Direction = 320},
			FigureTeleport {Tag = "Orc_07", X = 528.177, Y = 208.744},
			FigureLookAtDirection {Tag = "Orc_07", Direction = 320},
			FigureTeleport {Tag = "Orc_08", X = 530.104, Y = 208.94},
			FigureLookAtDirection {Tag = "Orc_08", Direction = 320},
			FigureTeleport {Tag = "Orc_09", X = 531.944, Y = 207.492},
			FigureLookAtDirection {Tag = "Orc_09", Direction = 320},
			FigureTeleport {Tag = "Orc_10", X = 529.773, Y = 213.084},
			FigureLookAtDirection {Tag = "Orc_10", Direction = 320},
			FigureTeleport {Tag = "Orc_11", X = 532.289, Y = 211.155},
			FigureLookAtDirection {Tag = "Orc_11", Direction = 320},
			FigureTeleport {Tag = "Orc_12", X = 532.46, Y = 209.399},
			FigureLookAtDirection {Tag = "Orc_12", Direction = 320},
			FigureTeleport {Tag = "Orc_13", X = 529.239, Y = 214.949},
			FigureLookAtDirection {Tag = "Orc_13", Direction = 320},
			FigureTeleport {Tag = "Orc_14", X = 529.823, Y = 211.045},
			FigureLookAtDirection {Tag = "Orc_14", Direction = 320},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Avatar und Orks gehen los
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "pl_HumanAvatar", X = 512.255, Y = 191.152},
			FigureSimpleWalk {Tag = "Orc_01", X = 526.008 - Goto2ndX, Y = 206.723 - Goto2ndY},
			FigureSimpleWalk {Tag = "Orc_02", X = 528.115 - Goto2ndX, Y = 204.723 - Goto2ndY},
			FigureSimpleWalk {Tag = "Orc_03", X = 525.978 - Goto2ndX, Y = 208.339 - Goto2ndY},
			FigureSimpleWalk {Tag = "Orc_04", X = 528.366 - Goto2ndX, Y = 206.968 - Goto2ndY},
			FigureSimpleWalk {Tag = "Orc_05", X = 530.123 - Goto2ndX, Y = 206.468 - Goto2ndY},
			FigureSimpleWalk {Tag = "Orc_06", X = 527.507 - Goto2ndX, Y = 210.834 - Goto2ndY},
			FigureSimpleWalk {Tag = "Orc_07", X = 528.177 - Goto2ndX, Y = 208.744 - Goto2ndY},
			FigureSimpleWalk {Tag = "Orc_08", X = 530.104 - Goto2ndX, Y = 208.94 - Goto2ndY},
			FigureSimpleWalk {Tag = "Orc_09", X = 531.944 - Goto2ndX, Y = 207.492 - Goto2ndY},
			FigureSimpleWalk {Tag = "Orc_10", X = 529.773 - Goto2ndX, Y = 213.084 - Goto2ndY},
			FigureSimpleWalk {Tag = "Orc_11", X = 532.289 - Goto2ndX, Y = 211.155 - Goto2ndY},
			FigureSimpleWalk {Tag = "Orc_12", X = 532.46 - Goto2ndX, Y = 209.399 - Goto2ndY},
			FigureSimpleWalk {Tag = "Orc_13", X = 529.239 - Goto2ndX, Y = 214.949 - Goto2ndY},
			FigureSimpleWalk {Tag = "Orc_14", X = 529.823 - Goto2ndX, Y = 211.045 - Goto2ndY},
			FigureSimpleWalk {Tag = "pl_HumanHeroBor", X = 518.074, Y = 200.194},
			FigureSimpleWalk {Tag = "pl_HumanHeroLya", X = 520.334, Y = 194.447},
			FigureSimpleWalk {Tag = "pl_HumanHeroJared", X = 516.213, Y = 190.88},
			FigureSimpleWalk {Tag = "pl_HumanHeroShae", X = 512.206, Y = 196.538},
			FigureSimpleWalk {Tag = "pl_HumanHeroMordecay", X = 520.145, Y = 198.35},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Kamera folgt Avatar und Orks
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Avatar und Orks fangen an zu laufen
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			FigureRun {Tag = "pl_HumanAvatar", X = 512.255, Y = 191.152},
			FigureRun {Tag = "Orc_01", X = 526.008 - Goto2ndX, Y = 206.723 - Goto2ndY},
			FigureRun {Tag = "Orc_02", X = 528.115 - Goto2ndX, Y = 204.723 - Goto2ndY},
			FigureRun {Tag = "Orc_03", X = 525.978 - Goto2ndX, Y = 208.339 - Goto2ndY},
			FigureRun {Tag = "Orc_04", X = 528.366 - Goto2ndX, Y = 206.968 - Goto2ndY},
			FigureRun {Tag = "Orc_05", X = 530.123 - Goto2ndX, Y = 206.468 - Goto2ndY},
			FigureRun {Tag = "Orc_06", X = 527.507 - Goto2ndX, Y = 210.834 - Goto2ndY},
			FigureRun {Tag = "Orc_07", X = 528.177 - Goto2ndX, Y = 208.744 - Goto2ndY},
			FigureRun {Tag = "Orc_08", X = 530.104 - Goto2ndX, Y = 208.94 - Goto2ndY},
			FigureRun {Tag = "Orc_09", X = 531.944 - Goto2ndX, Y = 207.492 - Goto2ndY},
			FigureRun {Tag = "Orc_10", X = 529.773 - Goto2ndX, Y = 213.084 - Goto2ndY},
			FigureRun {Tag = "Orc_11", X = 532.289 - Goto2ndX, Y = 211.155 - Goto2ndY},
			FigureRun {Tag = "Orc_12", X = 532.46 - Goto2ndX, Y = 209.399 - Goto2ndY},
			FigureRun {Tag = "Orc_13", X = 529.239 - Goto2ndX, Y = 214.949 - Goto2ndY},
			FigureRun {Tag = "Orc_14", X = 529.823 - Goto2ndX, Y = 211.045 - Goto2ndY},

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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden bereits im State Cutscene06 wieder alla angezeigt
			-- Talkjobs beenden
			FigureStop {Tag = "pl_HumanAvatar"},
			-- Trolle und Skelette aus der ersten Einstellung werden gelöscht
			MapFlagSetTrue {Name = "mf_CS_01_Anim_Units_Vanish"},
			-- Kameras wird auf Avatar zentriert
			TutorialCameraCenterOnEntity {Tag = "pl_HumanAvatar"},
			-- Ardar, Trollen und Skeletten wird Immortal wieder entfernt
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Ardar"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege01"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege02"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege03"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege04"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege05"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege06"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege07"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege08"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege09"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege10"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege11"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege12"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege13"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege14"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege15"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege16"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege17"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege18"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege19"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege20"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege21"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege22"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege23"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege24"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "SkelSiege25"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Troll01"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Troll02"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Troll03"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Troll04"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Troll05"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Troll06"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Troll07"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Troll08"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Troll09"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Troll10"},
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "Troll11"},
			-- Scriptingkram für die Karte
			AvatarFlagSetTrue {Name = "af_P312_CS01Finished"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};