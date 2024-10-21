State
{
	StateName = "INIT",
-------------------------
-- Cutscene 01 Intro
-------------------------

	OnOneTimeEvent	-- Verschwinden der Helden
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P316_Shal_01_SOUND_Play_Vanish_Heroes"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_despawn_unit", X = 95.2, Y = 10, Z = 26.6, MaxRange = 50, FallOffRange = 10}, -- 3.4s
		},
	},
	OnOneTimeEvent	-- Verschwinden des Avatar
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P316_Shal_01_SOUND_Play_Vanish_Avatar"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_despawn_unit", X = 95.2, Y = 10, Z = 26.6, MaxRange = 50, FallOffRange = 10}, -- 3.4s
		},
	},
	OnOneTimeEvent	-- Erscheinen der Helden 1
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P316_Shal_01_SOUND_Play_Appearance_Heroes1"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 84.536, Y = 15, Z = 119.324, MaxRange = 50, FallOffRange = 10}, -- 2.28s
		},
	},
	OnOneTimeEvent	-- Erscheinen des Helden 2
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P316_Shal_01_SOUND_Play_Appearance_Heroes2"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 125.071, Y = 15, Z = 120.386, MaxRange = 50, FallOffRange = 10}, -- 2.28s
		},
	},
	OnOneTimeEvent	-- Fesseln des Avatar Play
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P316_Shal_01_SOUND_Play_Magic_Chain"},
		},
		Actions =
		{
			SoundAmbientPlayLooped {File = "07_ui/misc_portal_glow", X = 99.4, Y = 26, Z = 133, MaxRange = 50, FallOffRange = 10}, -- 2.28s
		},
	},	
	OnOneTimeEvent	-- Fesseln des Avatar Stop
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P316_Shal_01_SOUND_Stop_Magic_Chain"},
		},
		Actions =
		{
			SoundStop {File = "07_ui/misc_portal_glow"}, -- 2.28s
		},
	},
	OnOneTimeEvent	-- Erscheinen von Sorvina
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P316_Shal_01_SOUND_Play_Appearance_Sorvina"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 99.4, Y = 25, Z = 133, MaxRange = 50, FallOffRange = 10}, -- 2.28s
		},
	},
	OnOneTimeEvent	-- Sorvinas Blutschlag in den Avatar
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P316_Shal_01_SOUND_Play_Bloodstrike"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "06_level/316_cs1_bloodhit", X = 101.8, Y = 27, Z = 133, MaxRange = 50, FallOffRange = 10}, -- 2.6s
		},
	},
	OnOneTimeEvent	-- Schrei Avatar Weiblich
	{
		Conditions =
		{
			AvatarIsFemale {Player = "default"},
			MapFlagIsTrue {Name = "mf_P316_Shal_01_SOUND_Play_Scream_Avatar"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "09_combat/unit_avatar_female_die1", X = 101.8, Y = 27, Z = 133, MaxRange = 50, FallOffRange = 10}, -- 2.7s
		},
	},
	OnOneTimeEvent	-- Schrei Avatar Männlich
	{
		Conditions =
		{
			AvatarIsMale {Player = "default"},
			MapFlagIsTrue {Name = "mf_P316_Shal_01_SOUND_Play_Scream_Avatar"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "09_combat/unit_avatar_male_die1", X = 99.4, Y = 26.5, Z = 133, MaxRange = 50, FallOffRange = 10}, -- 2.4s
		},
	},
	OnOneTimeEvent	-- Sorvina trinkt das Blut
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P316_Shal_01_SOUND_Play_Blood_Drinking"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "06_level/316_cs1_drink", X = 99.4, Y = 26.5, Z = 133, MaxRange = 50, FallOffRange = 10}, -- 1.5s
		},
	},
	OnOneTimeEvent	-- Schrei Sorvina
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P316_Shal_01_SOUND_Play_Scream_Sorvina"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "09_combat/unit_sorvina_die2", X = 99.4, Y = 26.5, Z = 133, MaxRange = 50, FallOffRange = 10}, -- 1.44s
			--SoundAmbientPlayOnce {File = "06_level/316_cs1_sorvina_groan", X = 99.4, Y = 26.5, Z = 133, MaxRange = 50, FallOffRange = 10}, -- 1.44s
		},
	},
	OnOneTimeEvent	-- Erscheinen der Malar
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P316_Shal_01_SOUND_Play_Appearance_Malar"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 100.8, Y = 25, Z = 128.8, MaxRange = 50, FallOffRange = 10}, -- 2.28s
		},
	},
	OnOneTimeEvent	-- Verschwinden der Malar
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P316_Shal_01_SOUND_Play_Vanish_Malar"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_despawn_unit", X = 100.8, Y = 25, Z = 128.8, MaxRange = 50, FallOffRange = 10}, -- 3.4s
		},
	},
	
-------------------------
-- Cutscene 02 Gate Shadowsong
-------------------------

	OnOneTimeEvent	-- Tor öffnet sich
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P316_Shal_02_SOUND_Play_Gate_Open"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/gate_iron_small_side", X = 117.6, Y = 16.5, Z = 91, MaxRange = 50, FallOffRange = 10}, -- 3.5s
		},
	},
	
-------------------------
-- Cutscene 03 Flags Captured
-------------------------

	-- keine Soundeffekte
	
-------------------------
-- Cutscene 04 Ur Dying
-------------------------

	-- keine Soundeffekte
};

