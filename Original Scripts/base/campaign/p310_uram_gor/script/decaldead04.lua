
State
{
	StateName = "MainState",
	 --DeadDecal wird an- und ausgeschaltet
    OnToggleEvent	
	{
		OnConditions =
		{
			FigureIsAlive	{Tag = "UntoterBewohnerSpawnOnly07"},
			FigureIsAlive	{Tag = "UntoterBewohnerSpawnOnly08"},
		},
		OnActions = 
		{
			ObjectChange	{Tag = "DecalDead04", ObjectId = 1836, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetFalse {Name = "mf_DecalDead04Aktiv"},
		},
		OffConditions =
		{
				FigureIsDead	{Tag = "UntoterBewohnerSpawnOnly07"},
				FigureIsDead	{Tag = "UntoterBewohnerSpawnOnly08"},
		},
		OffActions = 
		{
			ObjectChange	{Tag = "DecalDead04", ObjectId = 2040, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetTrue {Name = "mf_DecalDead04Aktiv"},
		},
	},
	                    
};                                                                            