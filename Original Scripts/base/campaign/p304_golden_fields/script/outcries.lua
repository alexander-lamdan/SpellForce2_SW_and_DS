
State
{
	StateName = "OUTCRIES",
	
	
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			AvatarFlagIsTrue {Name = "af_P304_CS01Finished"},
--			GameInterfaceIsVisible{},
--		},
--		Actions =
--		{
--			FigureOutcry{TextTag = "AudienzEnde01", Tag = "pl_HumanAvatar"},
--			FigureOutcry{TextTag = "AudienzEnde02", Tag = "OddVoice"},
--			FigureOutcry{TextTag = "AudienzEnde03", Tag = "OddVoice"},
--			FigureOutcry{TextTag = "AudienzEnde04", Tag = "pl_HumanAvatar"},
--			FigureOutcry{TextTag = "AudienzEnde05", Tag = "Schattenlied"},
--			FigureOutcry{TextTag = "AudienzEnde06", Tag = "pl_HumanAvatar"},
--			FigureOutcry{TextTag = "AudienzEnde07", Tag = "OddVoice"},
--			FigureOutcry{TextTag = "AudienzEnde08", Tag = "Schattenlied"},
--		},
--		-- Outcries nach Beendigung der 1. Cutscene
--	},
	
--	Texte kommen nun in der Cutscene selbst


	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 8, X = 413, Y = 116},
				FigureIsInRange	{Tag = "pl_HumanHeroBor", Range = 8, X = 413, Y = 116},
				FigureIsInRange	{Tag = "pl_HumanHeroLya", Range = 8, X = 413, Y = 116},
			},
			FigureIsAlive	{Tag = "pl_HumanHeroBor"},
			FigureIsAlive	{Tag = "pl_HumanHeroLya"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Soultalk1", Tag = "pl_HumanHeroBor"},
			FigureOutcry	{TextTag = "Soultalk2", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "Soultalk3", Tag = "pl_HumanHeroBor"},
			FigureOutcry	{TextTag = "Soultalk4", Tag = "pl_HumanHeroBor"},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_TalkWithShadowsong01"},
			AvatarValueIsGreaterOrEqual	{Name = "av_P304_TalkWithEinar", Value = 1 },
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_FalkmarFraudOutcries"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_FalkmarFraudOutcries", Seconds = 120},
			FigureIsAlive	{Tag = "pl_HumanHeroBor"},
			FigureIsAlive	{Tag = "pl_HumanHeroLya"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_FalkmarFraudOutcries"},
			FigureOutcry	{TextTag = "FalkmarBetr1", Tag = "pl_HumanHeroBor"},
			FigureOutcry	{TextTag = "FalkmarBetr2", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "FalkmarBetr3", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "FalkmarBetr4", Tag = "pl_HumanHeroBor"},
		},
	},

-- Arnes Änderung: Outcryblöcke vertauscht, inhaltlich passender
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_JaredOutcries", Seconds = 30},
			FigureIsAlive	{Tag = "pl_HumanHeroBor"},
			FigureIsAlive	{Tag = "pl_HumanHeroLya"},
			FigureIsAlive	{Tag = "pl_HumanHeroJared"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_JaredOutcries"},
			MapTimerStart	{Name = "mt_JaredOutcriesSecondPart"},
			FigureOutcry	{TextTag = "JaredsQ06", Tag = "pl_HumanHeroJared"},
			FigureOutcry	{TextTag = "JaredsQ07", Tag = "pl_HumanHeroBor"},
			FigureOutcry	{TextTag = "JaredsQ08", Tag = "pl_HumanHeroBor"},
			FigureOutcry	{TextTag = "JaredsQ09", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "JaredsQ10", Tag = "pl_HumanHeroJared"},
			FigureOutcry	{TextTag = "JaredsQ11", Tag = "pl_HumanHeroBor"},
			FigureOutcry	{TextTag = "JaredsQ12", Tag = "pl_HumanHeroBor"},
			FigureOutcry	{TextTag = "JaredsQ13", Tag = "pl_HumanHeroLya"},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_JaredOutcriesSecondPart", Seconds = 80},
			FigureIsAlive	{Tag = "pl_HumanHeroBor"},
			FigureIsAlive	{Tag = "pl_HumanHeroLya"},
			FigureIsAlive	{Tag = "pl_HumanHeroJared"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_JaredOutcriesSecondPart"},
			FigureOutcry	{TextTag = "JaredsQ01", Tag = "pl_HumanHeroJared"},
			FigureOutcry	{TextTag = "JaredsQ02", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "JaredsQ03", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "JaredsQ04", Tag = "pl_HumanHeroJared"},
			FigureOutcry	{TextTag = "JaredsQ05", Tag = "pl_HumanHeroBor"},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
   			AvatarFlagIsTrue {Name = "af_P305_UnderhallVisited"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_JaredReturnOutcries"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_JaredReturnOutcries", Seconds = 10},
			FigureIsAlive	{Tag = "pl_HumanHeroBor"},
			FigureIsAlive	{Tag = "pl_HumanHeroJared"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_JaredReturnOutcries"},
			FigureOutcry	{TextTag = "JaredsReturn1", Tag = "pl_HumanHeroBor"},
			FigureOutcry	{TextTag = "JaredsReturn2", Tag = "pl_HumanHeroJared"},
			FigureOutcry	{TextTag = "JaredsReturn3", Tag = "pl_HumanHeroJared"},
			FigureOutcry	{TextTag = "JaredsReturn4", Tag = "pl_HumanHeroBor"},
			FigureOutcry	{TextTag = "JaredsReturn5", Tag = "pl_HumanHeroBor"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarValueIsEqual	{Name = "av_P304_TalkWithEinar", Value = 2 },
				AvatarValueIsGreaterOrEqual	{Name = "av_P304_TalkWithYlia", Value = 1 }, 
			},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_JaredDunMoraOutcries"},
		},
	},
	
-- Arnes Änderung: fehlende UpToDunMora hinzugefügt, Jareds Fragen nun nach Idara
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_JaredDunMoraOutcries", Seconds = 10},
			FigureIsAlive	{Tag = "pl_HumanHeroLya"},
			FigureIsAlive	{Tag = "pl_HumanHeroBor"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_JaredDunMoraOutcries"},
			FigureOutcry	{TextTag = "UpToDunMora01", Tag = "pl_HumanHeroBor"},
			FigureOutcry	{TextTag = "UpToDunMora02", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "UpToDunMora03", Tag = "pl_HumanHeroBor"},
			FigureOutcry	{TextTag = "UpToDunMora04", Tag = "pl_HumanHeroLya"},

		},
	},
	
		OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_TalkedWithIdara"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_JaredDunMoraOutcries2"},
		},
	},
	
		OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_JaredDunMoraOutcries2", Seconds = 10},
			FigureIsAlive	{Tag = "pl_HumanHeroLya"},
			FigureIsAlive	{Tag = "pl_HumanHeroJared"},
			FigureIsAlive	{Tag = "pl_HumanHeroBor"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_JaredDunMoraOutcries2"},
			FigureOutcry	{TextTag = "JaredDM01", Tag = "pl_HumanHeroJared"},
			FigureOutcry	{TextTag = "JaredDM02", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "JaredDM03", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "JaredDM05", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "JaredDM06", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "JaredDM07", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "JaredDM08", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "JaredDM09", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "JaredDM10", Tag = "pl_HumanHeroLya"},
			FigureOutcry	{TextTag = "JaredDM11", Tag = "pl_HumanHeroJared"},
			FigureOutcry	{TextTag = "JaredDM12", Tag = "pl_HumanHeroLya"},
		},
	},
	
	-- Mindstone Dialog anschalten wenn Hagard tot...
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_HagardKilled"},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "MindstoneGF"},
			DialogTypeSetSideQuest	{Tag = "MindstoneGF"},
		},
	},
	

};
