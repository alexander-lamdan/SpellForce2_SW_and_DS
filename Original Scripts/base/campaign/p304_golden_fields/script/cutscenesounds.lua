State
{
	StateName = "INIT",
-------------------------
-- Cutscene A01 Palace Reached
-------------------------

	-- Shadowsong Sword
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P304_Golden_Fields_A01_SOUND_Play_Shadowsong_Sword"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_attack_avatar", X = 442.61, Y = 41, Z = 322.414, MaxRange = 50, FallOffRange = 10}, -- 0.68s
		},
	},
	-- Falkmar Sword
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P304_Golden_Fields_A01_SOUND_Play_Falkmar_Sword"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_attack_avatar", X = 439.288, Y = 41, Z = 322.414, MaxRange = 50, FallOffRange = 10}, -- 0.68s
		},
	},

-------------------------
-- Cutscene A02 Dwarven Quarter
-------------------------
	
	-- Dwarf Fall
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P304_Golden_Fields_A02_SOUND_Play_Dwarf_Fall"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "06_level/304_cs2_dwarffall", X = 477.4, Y = 50, Z = 610.4, MaxRange = 50, FallOffRange = 10}, -- 1.08s
		},
	},
	
-------------------------
-- Cutscene A03 Jared
-------------------------
	
	-- Blood Transfusion
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P304_Golden_Fields_A03_SOUND_Play_Blood_Transfusion"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_cauldron", X = 327.944, Y = 35, Z = 380.875, MaxRange = 50, FallOffRange = 10}, -- 1.87s
		},
	},
	
-------------------------
-- Cutscene B01 Hagard
-------------------------

	-- keine Soundeffekte

-------------------------
-- Cutscene B02 Follow Elvenqueen
-------------------------
	
	-- keine Soundeffekte

-------------------------
-- Cutscene C01 Reached King
-------------------------

	-- keine Soundeffekte
};