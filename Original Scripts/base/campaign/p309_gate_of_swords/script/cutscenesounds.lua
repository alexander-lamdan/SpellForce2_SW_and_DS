State
{
	StateName = "INIT",
-------------------------
-- Cutscene 01 Intro
-------------------------

	-- keine Soundeffekte

-------------------------
-- Cutscene 02 Clans Camp
-------------------------
	
	-- keine Soundeffekte
	
-------------------------
-- Cutscene 03 Gate
-------------------------
	
	-- Gate1 Open
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_Gate_Of_Swords_03_SOUND_Play_Gate1_Open"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/gate_stone_big_up", X = 488.6, Y = 30, Z = 581, MaxRange = 50, FallOffRange = 10}, -- 1.88s
		},
	},
	-- Gate2 Open
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_Gate_Of_Swords_03_SOUND_Play_Gate2_Open"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/gate_stone_big_up", X = 488.6, Y = 30, Z = 581, MaxRange = 50, FallOffRange = 10}, -- 1.88s
		},
	},
	-- Gate1 Close
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_Gate_Of_Swords_03_SOUND_Play_Gate1_Close"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/gate_stone_big_up", X = 488.6, Y = 30, Z = 581, MaxRange = 50, FallOffRange = 10}, -- 1.88s
		},
	},
	-- Gate2 Close
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_Gate_Of_Swords_03_SOUND_Play_Gate2_Close"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/gate_stone_big_up", X = 488.6, Y = 30, Z = 568.4, MaxRange = 50, FallOffRange = 10}, -- 1.88s
		},
	},
	
-------------------------
-- Cutscene 04 City
-------------------------
	
	-- keine Soundeffekte
	
-------------------------
-- Cutscene 05 Resurrect Mordecay
-------------------------

	-- Blood Transfusion
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_Gate_Of_Swords_05_SOUND_Play_Blood_Tranfusion"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_cauldron", X = 566.695, Y = 54, Z = 412.552, MaxRange = 50, FallOffRange = 10}, -- 1.87s
		},
	},

-------------------------
-- Cutscene 06 Oracle
-------------------------
	
	-- keine Soundeffekte


-------------------------
-- Cutscene 07 Flowers Failed
-------------------------
	
	-- keine Soundeffekte
	
-------------------------
-- Cutscene 08 Flowers Success
-------------------------
	
	-- keine Soundeffekte

-------------------------
-- Cutscene 09 Stonegod
-------------------------
	
	-- keine Soundeffekte
	

-------------------------
-- Cutscene 10 Mordecay Dies
-------------------------
	
	-- Beast Attack
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_Gate_Of_Swords_10_SOUND_Play_Beast_Attack"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "02_units/arm_hit_mace5", X = 574.8, Y = 42, Z = 340.2, MaxRange = 50, FallOffRange = 10}, -- 0.8s
		},
	},
	
-------------------------
-- Cutscene 11 Resurrect Mordecay 2
-------------------------
	
	-- Blood Transfusion
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_Gate_Of_Swords_05_SOUND_Play_Blood_Tranfusion2"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_cauldron", X = 573.25, Y = 42, Z = 340.2, MaxRange = 50, FallOffRange = 10}, -- 1.87s
		},
	},

-------------------------
-- Cutscene 12 In Memoriam Craig
-------------------------

	-- Shadowwarrior Spawn
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_Gate_Of_Swords_12_SOUND_Play_Shadowwarrior_Spawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 476.794, Y = 44, Z = 483.298, MaxRange = 50, FallOffRange = 10}, -- 2.28s
		},
	},
	-- Shadowwarrior Despawn
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_Gate_Of_Swords_12_SOUND_Play_Shadowwarrior_Despawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_despawn_unit", X = 476.794, Y = 44, Z = 483.298, MaxRange = 50, FallOffRange = 10}, -- 3.4s
		},
	},

};