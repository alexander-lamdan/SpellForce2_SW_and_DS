State
{
	StateName = "INIT",
-------------------------
-- Cutscene 01 Intro
-------------------------

	-- Waterfall Play
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P302_Norimar_01_SOUND_Play_Waterfall"},
		},
		Actions =
		{
			SoundAmbientPlayLooped {File = "01_ambient/amb_water_waterfall_med", X = 437.23, Y = 50, Z = 546.266, MaxRange = 150, FallOffRange = 10}, -- 3.9s
		},
	},
	-- Waterfall Stop
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P302_Norimar_01_SOUND_Stop_Waterfall"},
		},
		Actions =
		{
			SoundStop {File = "01_ambient/amb_water_waterfall_med"}, -- 3.9s
		},
	},

-------------------------
-- Cutscene 02 Skirmish
-------------------------

	-- keine Soundeffekte
	
-------------------------
-- Cutscene 03 Meet Guard
-------------------------

	-- keine Soundeffekte
	
-------------------------
-- Cutscene 04 Reached Eyrie
-------------------------

	-- keine Soundeffekte

-------------------------
-- Cutscene 05 Rottgar Jail
-------------------------
	
	-- Jail Door
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P302_Norimar_01_SOUND_Play_Jail_Door"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/gate_wood_small_side", X = 456.935, Y = 71, Z = 598.733, MaxRange = 50, FallOffRange = 10}, -- 3.28s
		},
	},

-------------------------
-- Cutscene 06 Game Over
-------------------------

	-- keine Soundeffekte

-------------------------
-- Cutscene 07 Horn Uses
-------------------------

	-- Sounds(Blasen des Horns, Einstürzen der Steinsäule) kommen aus den Map-Scripten
	
};