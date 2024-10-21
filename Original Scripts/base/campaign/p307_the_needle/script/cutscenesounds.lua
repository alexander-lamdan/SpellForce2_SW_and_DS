State
{
	StateName = "INIT",
-------------------------
-- Cutscene 01 Intro
-------------------------

	-- keine Soundeffekte

-------------------------
-- Cutscene 02 Clans Defeated
-------------------------
	
	-- keine Soundeffekte
	
-------------------------
-- Cutscene 03 Portal Fight
-------------------------
	
	-- Kaziz Attack
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P307_The_Needle_03_SOUND_Play_Kaziz_Attack"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "02_units/arm_hit_sword_small3", X = 434.141, Y = 41, Z = 524.185, MaxRange = 50, FallOffRange = 10}, -- 0.93s
		},
	},
	-- Kor Scream
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P307_The_Needle_03_SOUND_Play_Kor_Scream"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "09_combat/unit_veteran_die2", X = 434.141, Y = 41, Z = 524.185, MaxRange = 50, FallOffRange = 10}, -- 2.1s
		},
	},
	-- Kor Groundhit
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P307_The_Needle_03_SOUND_Play_Kor_Groundhit"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "06_level/309_cs3_orcfall", X = 434.141, Y = 41, Z = 524.185, MaxRange = 50, FallOffRange = 10}, -- 0.93s
		},
	},
	
-------------------------
-- Cutscene 04 Kaziz Dead
-------------------------
	
	-- Blood Transfusion
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P307_The_Needle_04_SOUND_Play_Blood_Transfusion"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_cauldron", X = 433.699, Y = 40, Z = 521.869, MaxRange = 50, FallOffRange = 10}, -- 1.87s
		},
	},
};