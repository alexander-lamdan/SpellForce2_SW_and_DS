
State
{
	StateName = "MAIN",

	OnToggleEvent
	{
		EventName = "DialogAnAusSchalter",
		OnConditions = 
		{
			-- Dialog ist an, solange eine der 3 Questen aktiv ist,
			-- und der Infosatz zu der jeweiligen Quest noch nicht vom Spieler „abgefragt“ worden ist:
			OR
			{
				AND
				{
					QuestIsActive 	{Quest = "HeroCaineVictim1Evidence"},
					EntityFlagIsFalse	{Name = "ef_GotEvidence_Ainur"},
				},
				AND
				{
					QuestIsActive 	{Quest = "HeroCaineVictim2Evidence"},
					EntityFlagIsFalse	{Name = "ef_GotEvidence_Eisen"},
				},
				AND
				{
					QuestIsActive 	{Quest = "HeroCaineVictim3Evidence"},
					EntityFlagIsFalse	{Name = "ef_GotEvidence_Una"},
				},
			},
		},
		OnActions = 
		{
			DialogSetEnabled	{},
		},
		OffConditions = 
		{
			-- Dialog ist aus, wenn keine der 3 Questen aktiv ist, 
			-- oder eine, beide oder alle Questen aktiv sind, 
			-- aber zu allen aktiven Questen die Infos bereits vom Spieler „abgefragt“ worden sind:
			OR
			{
				QuestIsNotActive 	{Quest = "HeroCaineVictim1Evidence"},
				EntityFlagIsTrue	{Name = "ef_GotEvidence_Ainur"},
			},
			OR
			{
				QuestIsNotActive 	{Quest = "HeroCaineVictim2Evidence"},
				EntityFlagIsTrue	{Name = "ef_GotEvidence_Eisen"},
			},
			OR
			{
				QuestIsNotActive 	{Quest = "HeroCaineVictim3Evidence"},
				EntityFlagIsTrue	{Name = "ef_GotEvidence_Una"},
			},
		},
		OffActions = 
		{
			DialogSetDisabled	{},
		},
	};
};

State{StateName = "ENDE"};
