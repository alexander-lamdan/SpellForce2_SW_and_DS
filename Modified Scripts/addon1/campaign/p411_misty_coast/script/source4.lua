


State
{	
	StateName = "INIT",
	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			MapFlagIsFalse{Name = "mf_Source4Disabled"},
		},
		OnActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
    		
    		ObjectSpawn	{ObjectId = 2411, X = 266, Y = 579.6, Direction = 1, Tag = "TowerLight04"},
		},
		OffConditions = 
		{
			MapFlagIsTrue{Name = "mf_Source4Disabled"},
		},
		OffActions = 
		{
			DialogSetDisabled{},
			--FigureManaIncrease{Tag = "pl_HumanUr", Value = 500},
			ObjectChange	{Tag = "default", ObjectId = 2224, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			ObjectVanish	{Tag = "TowerLight04"},
		},
	};


   
};
