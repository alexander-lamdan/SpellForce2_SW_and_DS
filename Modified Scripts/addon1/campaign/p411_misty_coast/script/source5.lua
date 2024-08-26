


State
{	
	StateName = "INIT",
	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			MapFlagIsFalse{Name = "mf_Source5Disabled"},
		},
		OnActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
    		
    		ObjectSpawn	{ObjectId = 2411, X = 232.4, Y = 592.2, Direction = 1, Tag = "TowerLight05"},
		},
		OffConditions = 
		{
			MapFlagIsTrue{Name = "mf_Source5Disabled"},
		},
		OffActions = 
		{
			DialogSetDisabled{},
			--FigureManaIncrease{Tag = "pl_HumanUr", Value = 500},
			ObjectChange	{Tag = "default", ObjectId = 2224, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			ObjectVanish	{Tag = "TowerLight05"},
		},
	};


   
};
