State
{
	StateName = "Init",
 
 	OnOneTimeEvent
 	{
 		Conditions =
 		{
 			FigureIsInEntityRange {Tag = "pl_HumanHeroMordecay", TargetTag = "Zanza", Range = 5}
 		},
 		Actions =
 		{
 			FigureOutcry {Tag = "Zanza", TextTag = "Stalker8"},
 			FigureOutcry {Tag = "pl_HumanHeroMordecay", TextTag = "Stalker9"},
 			FigureOutcry {Tag = "pl_HumanHeroMordecay", TextTag = "Stalker10"},
 			MapTimerStart {Name = "mt_P309_ZanzasOutcriesRunning"}
 		},
 	},
 	OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsSolved {Quest = "TalkToZanzaAboutMagnetStones"},
    		FigureIsAlive {Tag = "Librarian"},
    	},
    	Actions =
    	{
    		FogOfWarRevealAtEntity {Tag = "Librarian", Range = 5}
    	}
    },
}