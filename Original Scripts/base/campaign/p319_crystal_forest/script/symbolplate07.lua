
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
		Conditions = {},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, -- zu Beginn der Karte Dialog abschalten
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive{Quest = "CrystalForestPart2TheLab"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, -- anschalten, sobald Spieler die Quest hat
	};
    
    ----------------------------------------------------------------
    ----------------------------------------------------------------
    
    OnEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_ReplaceThruEye"},
		},
		Actions = 
		{
			EntityFlagSetFalse{Name = "ef_ReplaceThruEye"},
			ObjectChange{Tag = "default", ObjectId = 1273, X = default, Y = default, Direction = default},
			DialogTypeSetMainQuest{},
			DialogSetEnabled{},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_ReplaceThruStar"},
		},
		Actions = 
		{
			EntityFlagSetFalse{Name = "ef_ReplaceThruStar"},
			ObjectChange{Tag = "default", ObjectId = 1274, X = default, Y = default, Direction = default},
			DialogTypeSetMainQuest{},
			DialogSetEnabled{},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_ReplaceThruTriangle"},
		},
		Actions = 
		{
			EntityFlagSetFalse{Name = "ef_ReplaceThruTriangle"},
			ObjectChange{Tag = "default", ObjectId = 1275, X = default, Y = default, Direction = default},
			DialogTypeSetMainQuest{},
			DialogSetEnabled{},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_ReplaceThruCross"},
		},
		Actions = 
		{
			EntityFlagSetFalse{Name = "ef_ReplaceThruCross"},
			ObjectChange{Tag = "default", ObjectId = 1276, X = default, Y = default, Direction = default},
			DialogTypeSetMainQuest{},
			DialogSetEnabled{},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_ReplaceThruSpiral"},
		},
		Actions = 
		{
			EntityFlagSetFalse{Name = "ef_ReplaceThruSpiral"},
			ObjectChange{Tag = "default", ObjectId = 1277, X = default, Y = default, Direction = default},
			DialogTypeSetMainQuest{},
			DialogSetEnabled{},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_ReplaceThruSquare"},
		},
		Actions = 
		{
			EntityFlagSetFalse{Name = "ef_ReplaceThruSquare"},
			ObjectChange{Tag = "default", ObjectId = 1278, X = default, Y = default, Direction = default},
			DialogTypeSetMainQuest{},
			DialogSetEnabled{},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_ReplaceThruSnake"},
		},
		Actions = 
		{
			EntityFlagSetFalse{Name = "ef_ReplaceThruSnake"},
			ObjectChange{Tag = "default", ObjectId = 1279, X = default, Y = default, Direction = default},
			DialogTypeSetMainQuest{},
			DialogSetEnabled{},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_ReplaceThruHeart"},
		},
		Actions = 
		{
			EntityFlagSetFalse{Name = "ef_ReplaceThruHeart"},
			ObjectChange{Tag = "default", ObjectId = 1280, X = default, Y = default, Direction = default},
			DialogTypeSetMainQuest{},
			DialogSetEnabled{},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_ReplaceBack"},
		},
		Actions = 
		{
			EntityFlagSetFalse{Name = "ef_ReplaceBack"},
			ObjectChange{Tag = "default", ObjectId = 1251, X = default, Y = default, Direction = default},
			DialogTypeSetMainQuest{},
			DialogSetEnabled{},
		},
	};
	
	----------------------------------------------------------------
    ----------------------------------------------------------------
    
	OnOneTimeEvent                                    
	{                                                 
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_StencilRiddleSolved"},	
		},                              
		Actions =                                     
		{                                             
			EntityFlagSetTrue {Name ="ef_DialogOff"}, 
		}, -- abschalten, nachdem man das Schablonenrätsel gelöst hat
	};       
                                          
};                                                                            
    
    
    
    
    