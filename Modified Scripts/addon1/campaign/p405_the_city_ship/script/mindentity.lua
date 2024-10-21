

State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_TraumaghostAppeared"},
		},
		Actions =
		{
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS02Ended"},
		},
		Actions =
		{
			EntityTimerStart{Name = "et_CallWaves"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed{Name = "et_CallWaves", Seconds = 10},
		},
		Actions =
		{
			FigureOutcryImmediate{TextTag = "CallingGhosts01", Tag = "MindEntity"},
			MapValueSet{Name = "mv_ThoughtsWave", Value = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed{Name = "et_CallWaves", Seconds = 30},
		},
		Actions =
		{
			FigureOutcryImmediate{TextTag = "CallingGhosts02", Tag = "MindEntity"},
			MapValueSet{Name = "mv_ThoughtsWave", Value = 2},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed{Name = "et_CallWaves", Seconds = 50},
		},
		Actions =
		{
			FigureOutcryImmediate{TextTag = "CallingGhosts03", Tag = "MindEntity"},
			MapValueSet{Name = "mv_ThoughtsWave", Value = 3},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed{Name = "et_CallWaves", Seconds = 70},
		},
		Actions =
		{
			FigureOutcryImmediate{TextTag = "CallingGhosts04", Tag = "MindEntity"},
			MapValueSet{Name = "mv_ThoughtsWave", Value = 4},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed{Name = "et_CallWaves", Seconds = 90},
		},
		Actions =
		{
			FigureOutcryImmediate{TextTag = "CallingGhosts05", Tag = "MindEntity"},
			MapValueSet{Name = "mv_ThoughtsWave", Value = 5},
		},
	},
		
}
