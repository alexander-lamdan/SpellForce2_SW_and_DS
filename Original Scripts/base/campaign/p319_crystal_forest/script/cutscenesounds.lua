State
{
	StateName = "INIT",
-------------------------
-- Cutscene 01 Intro
-------------------------

	-- keine Soundeffekte

-------------------------
-- Cutscene 02 Near Gate
-------------------------

	-- Shadowwarrior Spawn Play
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P319_Crystal_Forest_02_SOUND_Play_Shadowwarrior_Spawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 275.349, Y = 36, Z = 229.517, MaxRange = 50, FallOffRange = 10}, -- 2.28s
		},
	},
	
-------------------------
-- Cutscene 03 Laboratory
-------------------------

	-- Scroll Book Play
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P319_Crystal_Forest_03_SOUND_Play_Scroll_Book"},
		},
		Actions =
		{
			SoundAmbientPlayLooped {File = "06_level/319_cs3_paging", X = 284.321, Y = 85, Z = 515.491, MaxRange = 250, FallOffRange = 1}, -- 2.22s
		},
	},
	
	-- Scroll Book Stop
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P319_Crystal_Forest_03_SOUND_Stop_Scroll_Book"},
		},
		Actions =
		{
			SoundStop {File = "06_level/319_cs3_paging"}, -- 1.87s
		},
	},
	
-------------------------
-- Cutscene 04 Puzzle Solved
-------------------------

	-- Portal Play
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P319_Crystal_Forest_04_SOUND_Play_Portal"},
		},
		Actions =
		{
			SoundAmbientPlayLooped {File = "07_ui/misc_portal_glow", X = 284.2, Y = 100, Z = 561.4, MaxRange = 50, FallOffRange = 10}, -- 2.65s
		},
	},
	-- Portal Stop
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P319_Crystal_Forest_04_SOUND_Stop_Portal"},
		},
		Actions =
		{
			SoundStop {File = "07_ui/misc_portal_glow"}, -- 2.65s
		},
	},
};