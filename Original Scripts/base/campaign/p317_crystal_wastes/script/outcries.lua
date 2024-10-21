
State
{
	StateName = "OUTCRIES",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_EmpressOutcries", Seconds = 120},
			FigureIsAlive	{Tag = "pl_HumanHeroNightsong"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_EmpressOutcries"},
			FigureOutcry	{TextTag = "NSEmpress1", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "NSEmpress2", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "NSEmpress3", Tag = "pl_HumanHeroNightsong"},
			FigureOutcry	{TextTag = "NSEmpress4", Tag = "pl_HumanHeroNightsong"},
			FigureOutcry	{TextTag = "NSEmpress5", Tag = "pl_HumanHeroNightsong"},
			FigureOutcry	{TextTag = "NSEmpress6", Tag = "pl_HumanHeroNightsong"},
			FigureOutcry	{TextTag = "NSEmpress7", Tag = "pl_HumanHeroNightsong"},
			FigureOutcry	{TextTag = "NSEmpress8", Tag = "pl_HumanHeroNightsong"},
			FigureOutcry	{TextTag = "NSEmpress9", Tag = "pl_HumanHeroNightsong"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_BookCompleteOutcries", Seconds = 5},
			FigureIsAlive	{Tag = "pl_HumanHeroNightsong"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_EmpressOutcries"},
			FigureOutcry	{TextTag = "Dragons01", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Dragons02", Tag = "pl_HumanHeroNightsong"},
			FigureOutcry	{TextTag = "Dragons03", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Dragons04", Tag = "pl_HumanAvatar"},
			-- hier fehlt eigentlich einer von nightsong...
			FigureOutcry	{TextTag = "Dragons05", Tag = "pl_HumanAvatar"},
		},
	},


};
