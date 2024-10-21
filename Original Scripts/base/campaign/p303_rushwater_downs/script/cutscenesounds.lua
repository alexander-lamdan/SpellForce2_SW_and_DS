State
{
	StateName = "INIT",
-------------------------
-- Cutscene 01 Intro
-------------------------

	OnOneTimeEvent	-- Ambient City Play
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P303_Rushwater_Downs_01_SOUND_Play_Ambient_City"},
		},
		Actions =
		{
			--SoundAmbientPlayLooped {File = "01_ambient/amb_atmo_humantown_day", X = 306.6, Y = 31, Z = 275.8, MaxRange = 50, FallOffRange = 10}, -- 14.7s
		},
	},
	OnOneTimeEvent	-- Ambient City Stop
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P303_Rushwater_Downs_01_SOUND_Stop_Ambient_City"},
		},
		Actions =
		{
			--SoundStop {File = "01_ambient/amb_atmo_humantown_day"}, -- 14.7s
		},
	},
	
-------------------------
-- Cutscene 02 Convoi
-------------------------

	OnOneTimeEvent	-- Gate Open Play
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P303_Rushwater_Downs_02_SOUND_Play_Gate_Open"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/gate_wood_small_side", X = 306.6, Y = 31, Z = 275.8, MaxRange = 50, FallOffRange = 10}, -- 3.3s
		},
	},
	
-------------------------
-- Cutscene 03 Helfdan
-------------------------

	-- keine Soundeffekte
	
};

