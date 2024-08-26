State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			FigureHoldPosition	{},
			FigureSwappingDisable	{},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth	{Percent = 30},
			MapFlagIsTrue {Name = "mf_EndIntroCS"},
		},
		Actions =
		{
			MapValueIncrease	{Name = "mv_OutcryPriest"},
			EntityTimerStart	{Name = "et_OutcryTimer"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_OutcryTimer", Seconds = 5},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_OutcryTimer"},
			FigureAbilityRemove	{Tag = "Geweihter01", AbilityId = 094},
		},
		
	},
};
