-------------------------------------------------------------------------------
--
--		
--
--		Spiel die merry Melody
--
--		
--
-------------------------------------------------------------------------------


State
{
	StateName = "State01",
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_PlayMerryMelody"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_PlayMerryMelody"},
			SoundGlobalPlayOnce	{File = "06_level/map_cf_06_soundriddle5"},
			--SoundGlobalPlayOnce	{File = "06_level/map_cf_02_soundriddle1"},
			EntityTimerStart {Name = "et_Melody"},		
		},
		GotoState = "State02",
	},
	
}	

State
{
	StateName = "State02",
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Melody", Seconds = 2},
		},
		Actions =
		{
			SoundGlobalPlayOnce	{File = "06_level/map_cf_05_soundriddle4"},
			--SoundGlobalPlayOnce	{File = "06_level/map_cf_03_soundriddle2"},
			EntityTimerStart {Name = "et_Melody"},	
		},
		GotoState = "State03",
	},
}

State
{
	StateName = "State03",
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Melody", Seconds = 2},
		},
		Actions =
		{
			SoundGlobalPlayOnce	{File = "06_level/map_cf_04_soundriddle3"},
			EntityTimerStart {Name = "et_Melody"},	
		},
		GotoState = "State04",
	},
}

State
{
	StateName = "State04",
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Melody", Seconds = 2},
		},
		Actions =
		{
			SoundGlobalPlayOnce	{File = "06_level/map_cf_03_soundriddle2"},
			--SoundGlobalPlayOnce	{File = "06_level/map_cf_05_soundriddle4"},
			EntityTimerStart {Name = "et_Melody"},	
		},
		GotoState = "State05",
	},
}

State
{
	StateName = "State05",
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_Melody", Seconds = 2},
		},
		Actions =
		{
			SoundGlobalPlayOnce	{File = "06_level/map_cf_02_soundriddle1"},
			--SoundGlobalPlayOnce	{File = "06_level/map_cf_06_soundriddle5"},
			EntityTimerStart {Name = "et_Melody"},	
		},
		GotoState = "State01",
	},
}
	