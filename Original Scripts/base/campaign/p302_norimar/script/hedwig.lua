State
{
	
	
	StateName = "QuestGive",


	
	-- Nachdem man von Uland die quest bekommen hat
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SetKidsQuestActive"},
		},
		Actions = 
		{
			DialogSetEnabled{},
			DialogTypeSetSideQuest{},
		},
	},
	
	
	-- Nachdem man mit dem Baron über Hedwig gesprochen hat 
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_BringHedwigToBaron"},
		},
		Actions = 
		{
			QuestSetSolved  {Quest = "ReportHedwigToBaron"},
			QuestSetActive  {Quest = "BringHedwigToBaron"},
			DialogSetEnabled{},
			DialogTypeSetSideQuest{},
		},
	},
	
	-- Wenn man Hedwig ein zweites mal anspricht
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue 	   {Name = "ef_HedwigFight"},
			AvatarIsNotTalking     {},
			GameInterfaceIsVisible {},
		},
		Actions = 
		{
			FigureTeamTransfer	{Tag = "Hedwig", Team = "tm_BadGuys"},
			MapFlagSetTrue		{Name = "mf_HedwigSummonSkeletons"},
		},
	},

	-- Wenn Hedwig tot ist	
	OnFigureDeadOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsFalse 	{Name = "af_P300_HedwigOnWestguard"},
		},
		Actions =
		{
			MapFlagSetTrue	  	{Name = "mf_HedwigKilled"},
			AvatarFlagSetTrue  	{Name = "af_P302_HedwigKilled"},
			QuestSetSolved  	{Quest = "BringHedwigToBaron"},
			QuestSetActive  	{Quest = "BringNewsToBaron"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotActive {Quest = "NorimarArrestHedwig"},
			OR
			{
				QuestIsSolved  {Quest = "FindMuendelRolf"},
				QuestIsSolved  {Quest = "FindMuendelInga"},
			},
		},
		Actions = 
		{
			DialogSetDisabled {},
		},
	},
	

};
