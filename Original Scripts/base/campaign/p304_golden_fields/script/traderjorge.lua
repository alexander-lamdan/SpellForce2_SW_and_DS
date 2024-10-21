
State
{
	StateName = "MainState",
	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			OR
			{
				QuestIsActive{Player = "default", Quest = "DeliveryJorge"},
				QuestIsActive{Player = "default", Quest = "TalkToJorge"},
				AND
				{
					QuestIsActive{Player = "default", Quest = "OpenChestOrLetItOpen"},
					MapFlagIsTrue{Name = "mf_JorgesChestIsOpen"},
				},
				AND
				{
					AvatarFlagIsTrue{Name = "af_P304_LaudiniaKnown"},
					EntityFlagIsFalse{Name = "ef_TaskGiven"},
				},
			},
			
		},
		OnActions = 
		{
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
				AND
				{
					QuestIsNotActive{Player = "default", Quest = "DeliveryJorge"},
					QuestIsNotActive{Player = "default", Quest = "TalkToJorge"},
					NotAND
					{
						QuestIsActive{Player = "default", Quest = "OpenChestOrLetItOpen"},
						MapFlagIsTrue{Name = "mf_JorgesChestIsOpen"},
					},
					NotAND
					{
						AvatarFlagIsTrue{Name = "af_P304_LaudiniaKnown"},
						EntityFlagIsFalse{Name = "ef_TaskGiven"},
					},		
				}
		},
		OffActions = 
		{
			DialogSetDisabled{},
		},
	};

	
	OnOneTimeEvent
	{
		Conditions = {},
		Actions = 
		{
			DialogSetDisabled{},
		}, -- zu Beginn der Karte Dialog abschalten
	};
    
    
                                                                      
};                                                                              