State
{
	StateName = "INIT",
-------------------------
-- Cutscene 01 First Realms Beaten
-------------------------

	-- keine Soundeffekte

-------------------------
-- Cutscene 02 Freed Fortress
-------------------------

	-- Spiders
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P314_Tuscari_Wasteland_04_SOUND_Play_Spiders"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "03_creeps/creep_spider_idle", X = 519.063, Y = 17, Z = 145.495, MaxRange = 50, FallOffRange = 10}, -- 2.7s
		},
	},	
	
-------------------------
-- Cutscene 03 Sacrifice Or Victory
-------------------------

	-- keine Soundeffekte
};