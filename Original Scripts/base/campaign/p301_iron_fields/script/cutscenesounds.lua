State  -- verschiedene States, zum Testen müssen eventuell erst andere Cutscenes gelaufen sein
{
	StateName = "INIT",
-------------------------
-- Cutscene A01 Intro
-------------------------

	-- keine Soundeffekte

-------------------------
-- Cutscene A02 Lyas Corpse
-------------------------

	-- keine Soundeffekte
	
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
	
	-- Blood Transfusion
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Tutorial_A04_SOUND_Play_Blood_Transfusion"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_cauldron", X = 373.002, Y = 32, Z = 429.391, MaxRange = 25, FallOffRange = 1}, -- 1.87s
			--SoundGlobalPlayOnce {File = "04_spells/fx_cauldron"}, -- 1.87s
		},
	},

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
			SoundAmbientPlayOnce {File = "03_creeps/creep_beast_att2", X = 633.221, Y = 40, Z = 181.412, MaxRange = 100, FallOffRange = 100}, -- 1.3s
		},
	},
	
-----------------------------------------------------------------------------
---------------------------		Teil II der Karte ---------------------------
-----------------------------------------------------------------------------

-------------------------
-- Cutscene B01 Intro
-------------------------

	-- Devourer Attack
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Devourer_Attack"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "03_creeps/creep_beast_att2", X = 65.933, Y = 88, Z = 623.602, MaxRange = 250, FallOffRange = 50}, -- 0.63s
		},
	},
	-- Ur Nearby
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Ur_Nearby"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "03_creeps/creep_dragon_ur_att1", X = 107.8, Y = 100, Z = 637, MaxRange = 250, FallOffRange = 50}, -- 1.1s
		},
	},
	-- Devourer Weapon Ground
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Weapon_Ground"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "02_units/arm_hit_hammer6", X = 65.933, Y = 88, Z = 623.602, MaxRange = 250, FallOffRange = 50}, -- 0.69s
		},
	},
	-- Ur Firebreath
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Ur_Firebreath"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_urfirebreath", X = 72.8, Y = 88, Z = 627.2, MaxRange = 250, FallOffRange = 50}, -- 2.9s
		},
	},
	-- Ur Firebreath2
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Ur_Firebreath2"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_urfirebreath", X = 72.8, Y = 88, Z = 627.2, MaxRange = 250, FallOffRange = 50}, -- 2.9s
		},
	},
	-- Devourer Attack2
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Devourer_Attack2"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "02_units/arm_hit_axe2", X = 65.933, Y = 88, Z = 623.602, MaxRange = 250, FallOffRange = 50}, -- 0.87s
		},
	},
	-- Ur Hit
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Ur_Hit"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "03_creeps/creep_dragon_ur_hit3", X = 65.933, Y = 88, Z = 623.602, MaxRange = 250, FallOffRange = 50}, -- 1.33s
		},
	},
	-- Ur Hit2
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Ur_Hit2"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "03_creeps/creep_dragon_ur_hit3", X = 65.933, Y = 88, Z = 623.602, MaxRange = 250, FallOffRange = 50}, -- 1.33s
		},
	},
	-- Devourer Hit
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Devourer_Hit"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "03_creeps/creep_beast_att2", X = 65.933, Y = 88, Z = 623.602, MaxRange = 250, FallOffRange = 50}, -- 0.63s
		},
	},
	-- Barrier
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Barrier"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_endure_initial", X = 359.8, Y = 15, Z = 288.4, MaxRange = 250, FallOffRange = 50}, -- 2.62s
		},
	},
	-- Devourer Scream
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Devourer_Scream"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "03_creeps/creep_beast_att2", X = 82.6, Y = 100, Z = 635.6, MaxRange = 100, FallOffRange = 100}, -- 1.3s
		},
	},
	-- Devourer Attack3
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Devourer_Attack3"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "02_units/arm_hit_axe2", X = 67.2, Y = 91, Z = 651, MaxRange = 250, FallOffRange = 50}, -- 0.87s
		},
	},
	-- Shaikan Scream1
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Shaikan_Scream1"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "09_combat/unit_heroadventurer2_die1", X = 67.2, Y = 91, Z = 651, MaxRange = 100, FallOffRange = 100}, -- 2.59s
		},
	},
	-- Shaikan Scream2
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Shaikan_Scream2"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "09_combat/unit_heroadventurer3_die1", X = 67.2, Y = 91, Z = 651, MaxRange = 100, FallOffRange = 100}, -- 2.81s
		},
	},
	-- Ur Despawn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Ur_Despawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_despawn_unit", X = 89.6, Y = 92, Z = 634.2, MaxRange = 50, FallOffRange = 10}, -- 3.4s
		},
	},
	-- Sorvina Despawn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Sorvina_Despawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_despawn_unit", X = 85.4, Y = 92, Z = 637, MaxRange = 50, FallOffRange = 10}, -- 3.4s
		},
		GotoState = "Next",
	},
};

State
{
	StateName = "Next",
	-- Working Worker Play
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Working_Worker"},
		},
		Actions =
		{
			SoundGlobalPlayOnce {File = "02_units/work_build01"}, -- 0.37s
			EntityTimerStart {Name = "et_WorkTimer"},
		},
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_WorkTimer", Seconds = 0.6},
		},
		Actions =
		{
			SoundGlobalPlayOnce {File = "02_units/work_build01"}, -- 0.37s
			EntityTimerStart {Name = "et_WorkTimer"},
		},
	},
	-- Working Worker Stop
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Stop_Working_Worker"},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_WorkTimer"},
		},
		GotoState = "Next2",
	},
};

State	
{
	StateName = "Next2",
	-- Barrier Glow Play
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Play_Barrier_Glow"},
		},
		Actions =
		{
			--SoundAmbientPlayLooped {File = "07_ui/misc_portal_glow", X = 359.8, Y = 15, Z = 288.4, MaxRange = 200, FallOffRange = 100}, -- 2.65s
			SoundGlobalPlayLooped {File = "07_ui/misc_portal_glow"},
		},
	},
	-- Barrier Glow Play
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B01_SOUND_Stop_Barrier_Glow"},
		},
		Actions =
		{
			SoundStop {File = "07_ui/misc_portal_glow"}, -- 2.65s
		},
	},
	

-------------------------
-- Cutscene B03 Woodkeeper Awake
-------------------------
	
	-- Avatar Attack1
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B03_SOUND_Play_Avatar_Attack1"},
		},
		Actions =
		{
			SoundGlobalPlayOnce {File = "02_units/arm_hit_sword_small2"}, -- 0.67s
		},
	},
	-- Avatar Attack2
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B03_SOUND_Play_Avatar_Attack2"},
		},
		Actions =
		{
			SoundGlobalPlayOnce {File = "02_units/arm_hit_sword_small1"}, -- 1.05s
		},
	},

-------------------------
-- Cutscene B04 Urs Residence
-------------------------

	-- Devourer Scream
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B04_SOUND_Play_Devourer_Scream"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "03_creeps/creep_beast_att2", X = 74.2, Y = 40, Z = 644, MaxRange = 100, FallOffRange = 100}, -- 1.3s
		},
	},

-------------------------
-- Cutscene B05 After Hydra Battle
-------------------------

	-- keine Soundeffekte

-------------------------
-- Cutscene B06 Stoneblockade
-------------------------

	-- Treant Attack1
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B06_SOUND_Play_Treant_Attack1"},
		},
		Actions =
		{
			SoundGlobalPlayLooped {File = "03_creeps/creep_treant_att1"}, -- 1.58s
		},
	},
	-- Treant Attack2
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B06_SOUND_Play_Treant_Attack2"},
		},
		Actions =
		{
			SoundGlobalPlayLooped {File = "03_creeps/creep_treant_att2"}, -- 1.5s
		},
	},
	-- Treant Attack3
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B06_SOUND_Play_Treant_Attack3"},
		},
		Actions =
		{
			SoundGlobalPlayLooped {File = "03_creeps/creep_treant_att3"}, -- 1.32s
		},
	},
	-- Treant Attack4
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B06_SOUND_Play_Treant_Attack4"},
		},
		Actions =
		{
			SoundGlobalPlayLooped {File = "03_creeps/creep_treant_att2"}, -- 1.5s
		},
	},
	-- Treant Attack5
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B06_SOUND_Play_Treant_Attack5"},
		},
		Actions =
		{
			SoundGlobalPlayLooped {File = "03_creeps/creep_treant_att1"}, -- 1.58s
		},
	},
	-- Treant Stop
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Iron_Fields_B06_SOUND_Stop_Treant_Stop"},
		},
		Actions =
		{
			SoundStop {File = "03_creeps/creep_treant_att1"}, -- 1.58s
			SoundStop {File = "03_creeps/creep_treant_att2"}, -- 1.5s
			SoundStop {File = "03_creeps/creep_treant_att3"}, -- 1.32s
			EntityTimerStop {Name = "et_TreantTimer"},
		},
	},
};