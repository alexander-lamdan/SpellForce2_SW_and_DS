State
{
	StateName = "INIT",
-------------------------
-- Cutscene 01 Intro
-------------------------

	-- keine Soundeffekte

-------------------------
-- Cutscene 02 Truchsess Orc
-------------------------

	-- Truchsess Spawn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P310_Uram_Gor_01_SOUND_Play_Truchsess_Spawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 249.548, Y = 31, Z = 129.772, MaxRange = 50, FallOffRange = 10}, -- 2.8s
		},
	},
	-- Destroy Stone
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P310_Uram_Gor_01_SOUND_Play_Destroy_Stone"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "06_level/310_cs2_destroystone", X = 243.925, Y = 31.2, Z = 137.683, MaxRange = 50, FallOffRange = 10}, -- 2.1s
		},
	},
	-- Open Gate
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P310_Uram_Gor_01_SOUND_Play_Open_Gate"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/gate_iron_big_side", X = 249.2, Y = 33, Z = 142.8, MaxRange = 50, FallOffRange = 10}, -- 4s
		},
	},
	-- Truchsess Transform
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P310_Uram_Gor_01_SOUND_Play_Truchsess_Transform"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 249.548, Y = 31, Z = 129.772, MaxRange = 50, FallOffRange = 10}, -- 2.8s
		},
	},
	-- Truchsess Despawn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P310_Uram_Gor_01_SOUND_Play_Truchsess_Despawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_despawn_unit", X = 249.548, Y = 31, Z = 129.772, MaxRange = 50, FallOffRange = 10}, -- 3.4s
		},
	},
};