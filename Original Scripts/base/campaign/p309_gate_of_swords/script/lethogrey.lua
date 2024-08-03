State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P309_CutsceneIronLordEnd"},
		},
		Actions =
		{
			--FigureVanish {},
			DialogTypeSetSideQuest {},
			DialogSetEnabled {},
		},
	},
	-- Wenn der Spieler die Entschuldigungsquest hat und Letho leergequatscht ist, wird der Dialog ausgemacht
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_P309_TellStory"},
			QuestIsNotKnown {Quest = "HouseOfGreyLethosApology1"},
			QuestIsNotKnown {Quest = "HouseOfGreyLethosApology2"},
		},
		Actions =
		{
			DialogSetDisabled {},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "HouseOfGreyReturnToLetho"},
		},
		Actions =
		{
			DialogSetEnabled {},
		}
	},
	-- Alle Grau Questen sind gelöst
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsSolved {Quest = "GoSTheHouseOfGreyLetho"},
    		QuestIsSolved {Quest = "GoSTheHouseOfGreyDario"},
    		QuestIsSolved {Quest = "GoSTheHouseOfGreySara"},
    		QuestIsSolved {Quest = "GoSTheHouseOfGreyNyano"},
    		QuestIsSolved {Quest = "GoSTheHouseOfGreyMyra"},
    	},
    	Actions =
    	{
    		DialogSetEnabled {Tag = "LethoGrey"}
    	},
    },
}