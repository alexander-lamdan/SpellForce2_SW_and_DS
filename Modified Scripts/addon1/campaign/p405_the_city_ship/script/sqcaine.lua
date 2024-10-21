State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS01Ended"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_Delay"},
		},
		GotoState = "Victim1",
	};
}

State
{
	StateName = "Victim1",

	OnToggleEvent
	{
		EventName = "Victim1_HeroCaine_DialogEnable",
		OnConditions = 
		{
			EntityTimerIsElapsed	{Name = "et_Delay", Seconds = 1},
			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
			QuestIsNotKnown	{Quest = "HeroCaineVictim1"},
			AvatarIsNotTalking	{},
		},
		OnActions = 
		{
			MapFlagSetFalse	{Name = "mf_SQCaine_MapChangeDetected"},
			DialogTypeSetSideQuest	{Tag = "pl_HumanHeroCaine"},
			DialogSetEnabled	{Tag = "pl_HumanHeroCaine"},
		},
		OffConditions = 
		{
			OR
			{
				FigureIsDead	{Tag = "pl_HumanHeroCaine"},
				MapFlagIsTrue	{Name = "mf_SQCaine_MapChangeDetected"},
			},
		},
		OffActions = 
		{
			MapFlagSetFalse	{Name = "mf_SQCaine_MapChangeDetected"},
			DialogSetDisabled	{Tag = "pl_HumanHeroCaine"},
			DialogSetDisabled	{Tag = "pl_HumanHeroCaine_DEAD"},
		},
	};

	OnEvent
	{
		Conditions =
		{
			QuestIsKnown	{Quest = "HeroCaineVictim1"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
		},
		GotoState = "Victim2",
	};
};

State
{
	StateName = "Victim2",

	OnToggleEvent
	{
		EventName = "Victim2_HeroCaine_DialogEnable",
		OnConditions = 
		{
			QuestIsKnown	{Quest = "CityShip3_ReturnToCityShip"},
			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
			QuestIsNotKnown	{Quest = "HeroCaineVictim2"},
			AvatarIsNotTalking	{},
		},
		OnActions = 
		{
			DialogTypeSetSideQuest	{Tag = "pl_HumanHeroCaine"},
			DialogSetEnabled	{Tag = "pl_HumanHeroCaine"},
		},
		OffConditions = 
		{
			FigureIsDead	{Tag = "pl_HumanHeroCaine"},
		},
		OffActions = 
		{
			DialogSetDisabled	{Tag = "pl_HumanHeroCaine_DEAD"},
		},
	};

	OnEvent
	{
		Conditions =
		{
			QuestIsKnown	{Quest = "HeroCaineVictim2"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
		},
		GotoState = "Victim3",
	};
};

State
{
	StateName = "Victim3",

	OnToggleEvent
	{
		EventName = "Victim3_HeroCaine_DialogEnable",
		OnConditions = 
		{
			QuestIsKnown	{Quest = "CityShip4_InvasionOfTheCityShip"},
			FigureIsAlive	{Tag = "pl_HumanHeroCaine"},
			QuestIsNotKnown	{Quest = "HeroCaineVictim3"},
			AvatarIsNotTalking	{},
		},
		OnActions = 
		{
			DialogTypeSetSideQuest	{Tag = "pl_HumanHeroCaine"},
			DialogSetEnabled	{Tag = "pl_HumanHeroCaine"},
		},
		OffConditions = 
		{
			FigureIsDead	{Tag = "pl_HumanHeroCaine"},
		},
		OffActions = 
		{
			DialogSetDisabled	{Tag = "pl_HumanHeroCaine_DEAD"},
		},
	};

	OnEvent
	{
		Conditions =
		{
			QuestIsKnown	{Quest = "HeroCaineVictim3"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
		},
		GotoState = "END",
	};
};

State	{StateName = "END"};
