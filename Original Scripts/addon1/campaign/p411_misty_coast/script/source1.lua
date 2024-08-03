


State
{	
	StateName = "INIT",
	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			MapFlagIsFalse{Name = "mf_Source1Disabled"},
		},
		OnActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
    		
    		ObjectSpawn	{ObjectId = 2411, X = 190.4, Y = 546, Direction = 1, Tag = "TowerLight01"},
		},
		OffConditions = 
		{
			MapFlagIsTrue{Name = "mf_Source1Disabled"},
		},
		OffActions = 
		{
			DialogSetDisabled{},
			--FigureManaIncrease{Tag = "pl_HumanUr", Value = 500},
			ObjectChange	{Tag = "default", ObjectId = 2224, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			ObjectVanish	{Tag = "TowerLight01"},
		},
	};


   
};
