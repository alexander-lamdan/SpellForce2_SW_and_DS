
State
{
	StateName = "MainState",
	 --DeadDecal wird an- und ausgeschaltet
    OnToggleEvent	
	{
		OnConditions =
		{
			FigureIsAlive	{Tag = "UntoterBewohnerSpawnOnly09"},
			FigureIsAlive	{Tag = "UntoterBewohnerSpawnOnly10"},
		},
		OnActions = 
		{
			ObjectChange	{Tag = "DecalDead05", ObjectId = 1836, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetFalse {Name = "mf_DecalDead05Aktiv"},
		},
		OffConditions =
		{
				FigureIsDead	{Tag = "UntoterBewohnerSpawnOnly09"},
				FigureIsDead	{Tag = "UntoterBewohnerSpawnOnly10"},
		},
		OffActions = 
		{
			ObjectChange	{Tag = "DecalDead05", ObjectId = 2040, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetTrue {Name = "mf_DecalDead05Aktiv"},
		},
	},
	                    
};                                                                            