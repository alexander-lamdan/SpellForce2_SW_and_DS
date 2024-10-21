State
{
	StateName = "INIT",
-------------------------
-- Cutscene 01 Intro
-------------------------

	-- Malar1 Spawn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P320_Steel_Shore_01_SOUND_Play_MalarA_Spawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 177.834, Y = 24, Z = 162.331, MaxRange = 50, FallOffRange = 10}, -- 2.28s
		},
	},
	-- Malar2 Spawn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P320_Steel_Shore_01_SOUND_Play_MalarB_Spawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 177.8, Y = 24, Z = 218.4, MaxRange = 50, FallOffRange = 10}, -- 2.28s
		},
	},
	-- Shadowwarrior Spawn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P320_Steel_Shore_01_SOUND_Play_Shadowwarrior_Spawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 175.6, Y = 24, Z = 180, MaxRange = 100, FallOffRange = 35}, -- 2.28s
		},
	},
	-- Shadowwarrior Despawn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P320_Steel_Shore_01_SOUND_Play_Shadowwarrior_Despawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_despawn_unit", X = 175.6, Y = 24, Z = 180, MaxRange = 100, FallOffRange = 35}, -- 3.4s
		},
	},

-------------------------
-- Cutscene 02 Extro
-------------------------

	-- Sorvina Scream
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P320_Steel_Shore_02_SOUND_Play_Sorvina_Scream"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "06_level/316_cs1_sorvina_groan", X = 177.8, Y = 45, Z = 648.2, MaxRange = 50, FallOffRange = 10}, -- 1.44s
		},
	},
	-- Malacay Vanish
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P320_Steel_Shore_02_SOUND_Play_Malacay_Vanish"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_lifetap_resolve", X = 177.8, Y = 49, Z = 648.2, MaxRange = 50, FallOffRange = 10}, -- 1.8s
		},
	},
	-- Shadowwarrior Spawn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P320_Steel_Shore_02_SOUND_Play_Shadowwarrior_Spawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 175, Y = 45, Z = 645.4, MaxRange = 100, FallOffRange = 35}, -- 2.28s
		},
	},









};