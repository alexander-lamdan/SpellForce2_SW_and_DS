


State
{	
	StateName = "INIT",
	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			MapFlagIsFalse{Name = "mf_Source2Disabled"},
		},
		OnActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
    		
    		ObjectSpawn	{ObjectId = 2411, X = 271.6, Y = 547.4, Direction = 1, Tag = "TowerLight02"},
		},
		OffConditions = 
		{
			MapFlagIsTrue{Name = "mf_Source2Disabled"},
		},
		OffActions = 
		{
			DialogSetDisabled{},
			--FigureManaIncrease{Tag = "pl_HumanUr", Value = 500},
			ObjectChange	{Tag = "default", ObjectId = 2224, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			ObjectVanish	{Tag = "TowerLight02"},
		},
	};


   
};
