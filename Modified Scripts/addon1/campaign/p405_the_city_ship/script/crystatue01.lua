
State
{
	StateName = "INIT",
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
		},
		GotoState = "MainState"
	},
}

State
{
	StateName = "MainState",
	
	
	OnToggleEvent
	{
		OnConditions = 
		{
			OR
			{
				AND
				{
					QuestIsNotActive {Quest = "CityShip4_CallGrossThoughts"},
					QuestIsNotActive {Quest = "CityShip4_CallHateThoughts"},
					QuestIsNotActive {Quest = "CityShip4_CallFearThoughts"},
					QuestIsNotActive {Quest = "CityShip4_CallWrathThoughts"},
					QuestIsNotActive {Quest = "CityShip4_CallMadnessThoughts"},
				},
				MapFlagIsTrue{Name = "mf_ThoughtsAreOnTheirWay"},
			},
		},
		OnActions = 
		{
			DialogSetDisabled{},
		},
		OffConditions = 
		{
			NotOR
			{
				AND
				{
					QuestIsNotActive {Quest = "CityShip4_CallGrossThoughts"},
					QuestIsNotActive {Quest = "CityShip4_CallHateThoughts"},
					QuestIsNotActive {Quest = "CityShip4_CallFearThoughts"},
					QuestIsNotActive {Quest = "CityShip4_CallWrathThoughts"},
					QuestIsNotActive {Quest = "CityShip4_CallMadnessThoughts"},
				},
				MapFlagIsTrue{Name = "mf_ThoughtsAreOnTheirWay"},
			},
		},
		OffActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
		},
	};


}
