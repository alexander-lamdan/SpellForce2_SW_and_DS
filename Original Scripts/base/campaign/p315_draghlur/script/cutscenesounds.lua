State
{
	StateName = "INIT",
-------------------------
-- Cutscene 01 Intro
-------------------------

	-- Trap
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P315_DraghLur_04_SOUND_Play_Trap"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_trapgas", X = 404.6, Y = 13, Z = 100.8, MaxRange = 50, FallOffRange = 10}, -- 2.9s
		},
	},
	-- Shadow Despawn
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P315_DraghLur_04_SOUND_Play_Shadow_Despawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_despawn_unit", X = 424.212, Y = 71, Z = 621.313, MaxRange = 50, FallOffRange = 10}, -- 3.4s
		},
	},
	-- Sorvina Despawn
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P315_DraghLur_04_SOUND_Play_Sorvina_Despawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_despawn_unit", X = 415.673, Y = 71, Z = 619.544, MaxRange = 50, FallOffRange = 10}, -- 3.4s
		},
	},

-------------------------
-- Cutscene 02 Toth Lar Dead
-------------------------

	-- Shadow Spawn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P315_DraghLur_04_SOUND_Play_Shadow_Spawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 421.4, Y = 71, Z = 649.6, MaxRange = 50, FallOffRange = 10}, -- 2.28s
		},
	},	
	
-------------------------
-- Cutscene A03 Lyas Resurrection
-------------------------

	-- keine Soundeffekte
	
-------------------------
-- Cutscene A04 Battlefield
-------------------------

	-- keine Soundeffekte

-------------------------
-- Cutscene A05 Scout Defeated
-------------------------
	

-------------------------
-- Cutscene A06 Reached Watchfire
-------------------------

	-- keine Soundeffekte

-------------------------
-- Cutscene A07 Reached Peak
-------------------------

	-- keine Soundeffekte

-------------------------
-- Cutscene A08 Portal DraghLur
-------------------------
	
	-- Sorvina Cast
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Tutorial_A08_SOUND_Play_Sorvina_Cast"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_evade_initial", X = 658.412, Y = 45, Z = 179.001, MaxRange = 20, FallOffRange = 5}, -- 1.42s
		},
	},	
	-- Devourer Spawn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Tutorial_A08_SOUND_Play_Devourer_Spawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 633.221, Y = 40, Z = 181.412, MaxRange = 50, FallOffRange = 10}, -- 2.28s
		},
	},	
	-- Devourer Scream
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Tutorial_A08_SOUND_Play_Devourer_Scream"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "09_combat/unit_devourer_die2", X = 633.221, Y = 40, Z = 181.412, MaxRange = 50, FallOffRange = 50}, -- 2.9s
		},
	},









};