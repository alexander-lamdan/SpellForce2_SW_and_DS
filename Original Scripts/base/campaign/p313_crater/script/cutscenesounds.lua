State
{
	StateName = "INIT",
-------------------------
-- Cutscene 01 Intro
-------------------------

	-- keine Soundeffekte

-------------------------
-- Cutscene 02 Crater Entrance
-------------------------

	-- keine Soundeffekte
	
-------------------------
-- Cutscene 03 Naugron Defeated
-------------------------

	-- Pick Up Mirror
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P313_Crater_03_SOUND_Play_Pick_Up_Mirror"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_got_item", X = 170.497, Y = 22, Z = 262.886, MaxRange = 50, FallOffRange = 10}, -- 2.3s
		},
	},

};