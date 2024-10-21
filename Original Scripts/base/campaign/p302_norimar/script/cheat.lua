State
{
	StateName = "Cheat",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_ImADirtyLittleCheater"},
		},
		Actions = 
		{
			QuestSetActive {Quest = "Wachfeuer1"},
			QuestSetActive {Quest = "NorimarWachfeuerRest"},
			
			QuestSetSolved {Quest = "Wachfeuer1"},
			QuestSetSolved {Quest = "NorimarWachfeuerRest"},
			
			MapFlagSetTrue  {Name = "mf_AvaAtCastle"},
			
		},
		
	},


};

