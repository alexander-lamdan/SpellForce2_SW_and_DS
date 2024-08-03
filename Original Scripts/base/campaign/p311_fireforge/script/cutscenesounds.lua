State
{
	StateName = "INIT",
-------------------------
-- Cutscene 01 Shadowwarrior
-------------------------

	-- Ghost Despawn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P311_Fireforge_01_SOUND_Play_Ghost_Despawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_despawn_unit", X = 375.71, Y = 71, Z = 438.647, MaxRange = 50, FallOffRange = 10}, -- 3.4s
		},
	},
	-- Shadowwarrior Spawn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P311_Fireforge_01_SOUND_Play_Shadowwarrior_Spawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 374.472, Y = 71, Z = 438.881, MaxRange = 50, FallOffRange = 10}, -- 2.8s
		},
	},
	-- Shadowwarrior Despawn
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P311_Fireforge_01_SOUND_Play_Shadowwarrior_Despawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_despawn_unit", X = 374.472, Y = 71, Z = 438.881, MaxRange = 50, FallOffRange = 10}, -- 3.4s
		},
	},
};