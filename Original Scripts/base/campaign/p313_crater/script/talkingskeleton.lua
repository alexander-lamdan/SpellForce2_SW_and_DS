State
{
	StateName = "MainState",
	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			EntityFlagIsFalse {Name ="ef_DialogOff"},
		},
		OnActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
			EntityFlagIsTrue {Name ="ef_DialogOff"},
		},
		OffActions = 
		{
			DialogSetDisabled{},
		},
	};

	
	
    
    OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				EntityFlagIsTrue{Name = "ef_Talked"},
				FigureIsDead{Tag = "Naugron"},   
			},
		},
		Actions = 
		{
			DialogSetDisabled{},
			FigureKill	{Tag = "default"},
		}, 	
		-- sobald mit Skelett gesprochen
		-- oder Naugron tot
		-- wird Dialog weggenommen & Skelett bricht auseinander
	};  
	
--	OnIdleGoHomeFake
--	{
--		X = 659.431,
--		Y = 264.863,
--		Range = 5,
--		Conditions = 
--		{
--			EntityFlagIsTrue{Name = "ef_Talked"},
--			AvatarIsNotTalking{},
--		},
--		Actions = 
--		{
--		},
--		HomeActions = 
--		{
--			FigureVanish{Tag = "default"},
--		},
--		OneTimeHomeActions = 
--		{
--		},
--	};

     
    
                                                                      
};                                                                              