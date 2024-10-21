


State
{	
	StateName = "INIT",
	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			MapFlagIsFalse{Name = "mf_Source3Disabled"},
		},
		OnActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
    		
    		ObjectSpawn	{ObjectId = 2411, X = 197.4, Y = 579.6, Direction = 1, Tag = "TowerLight03"},
		},
		OffConditions = 
		{
			MapFlagIsTrue{Name = "mf_Source3Disabled"},
		},
		OffActions = 
		{
			DialogSetDisabled{},
			--FigureManaIncrease{Tag = "pl_HumanUr", Value = 500},
			ObjectChange	{Tag = "default", ObjectId = 2224, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			ObjectVanish	{Tag = "TowerLight03"},
		},
	};


   
};
