
State
{
	StateName = "OUTCRIES",
	
		OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_AvatarHasListenedToGFMindstone"},
			QuestIsSolved {Quest = "TalkToMatricusToGetCamp"},
			QuestIsNotSolved {Quest = "NeedlePart1TheBulwark"},		
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_SorvinaTalkOutcries"},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_SorvinaTalkOutcries", Seconds = 30},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			FigureIsAlive	{Tag = "pl_HumanNightSong"},		
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_SorvinaTalkOutcries"},
			FigureOutcry	{TextTag = "SorvinaQ01", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "SorvinaQ02", Tag = "pl_HumanNightSong"},
			FigureOutcry	{TextTag = "SorvinaQ03", Tag = "pl_HumanNightSong"},
			FigureOutcry	{TextTag = "SorvinaQ04", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "SorvinaQ05", Tag = "pl_HumanNightSong"},
			FigureOutcry	{TextTag = "SorvinaQ06", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "SorvinaQ07", Tag = "pl_HumanNightSong"},
			FigureOutcry	{TextTag = "SorvinaQ08", Tag = "pl_HumanNightSong"},
			FigureOutcry	{TextTag = "SorvinaQ09", Tag = "pl_HumanNightSong"},
		},
	},
	
	
	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "StormBulwark"},
			FigureIsInRange	{Tag = "pl_HumanHeroLya", Range = 6, X = 431, Y = 341},
			FigureIsAlive	{Tag = "pl_HumanHeroBor"},
			FigureIsAlive	{Tag = "pl_HumanHeroLya"},
			FigureIsAlive	{Tag = "pl_HumanHeroShae"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "ToughGuys1", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "ToughGuys2", Tag = "pl_HumanHeroShae"},
			FigureOutcry	{TextTag = "ToughGuys3", Tag = "pl_HumanHeroBor"},
		},
	},
	
	
		OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FreeGriffons"},
			FigureIsAlive	{Tag = "pl_HumanHeroJared"},
			FigureIsAlive	{Tag = "pl_HumanHeroLya"},
			OR {
					AND{
						FigureIsInRange	{Tag = "pl_HumanNightSong", Range = 8, X = 273, Y = 355},
						FigureIsInRange	{Tag = "pl_HumanHeroJared", Range = 8, X = 273, Y = 355},
						},
					AND{
						FigureIsInRange	{Tag = "pl_HumanNightSong", Range = 8, X = 350, Y = 197},
						FigureIsInRange	{Tag = "pl_HumanHeroJared", Range = 8, X = 350, Y = 197},
						},
					},
			},
			
		Actions =
		{
			FigureOutcry	{TextTag = "JaredNS01", Tag = "pl_HumanHeroJared"},
			FigureOutcry	{TextTag = "JaredNS02", Tag = "pl_HumanHeroLya"},
		},
	},

	

};
