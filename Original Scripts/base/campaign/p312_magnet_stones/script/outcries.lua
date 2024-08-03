
State
{
	StateName = "OUTCRIES",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P312_MagnetStonesInfoGiven"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_JaredOutcries"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_JaredOutcries", Seconds = 150},
			FigureIsAlive	{Tag = "pl_HumanHeroLya"},
			FigureIsAlive	{Tag = "pl_HumanHeroJared"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_JaredOutcries"},
			FigureOutcry	{TextTag = "JaredMS1", Tag = "pl_HumanHeroJared"},
			FigureOutcry	{TextTag = "JaredMS2", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "JaredMS3", Tag = "pl_HumanHeroLya"},
		},
	},
};
