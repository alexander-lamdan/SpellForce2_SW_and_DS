
State
{
	StateName = "MainState",
	 --DeadDecal wird an- und ausgeschaltet
    OnToggleEvent	
	{
		OnConditions =
		{
			FigureIsAlive	{Tag = "UntoterBewohnerSpawnOnly01"},
			FigureIsAlive	{Tag = "UntoterBewohnerSpawnOnly02"},
		},
		OnActions = 
		{
			ObjectChange	{Tag = "DecalDead01", ObjectId = 1836, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetFalse {Name = "mf_DecalDead01Aktiv"},
		},
		OffConditions =
		{
				FigureIsDead	{Tag = "UntoterBewohnerSpawnOnly01"},
				FigureIsDead	{Tag = "UntoterBewohnerSpawnOnly02"},
		},
		OffActions = 
		{
			ObjectChange	{Tag = "DecalDead01", ObjectId = 2040, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetTrue {Name = "mf_DecalDead01Aktiv"},
		},
	},
	                    
};                                                                            