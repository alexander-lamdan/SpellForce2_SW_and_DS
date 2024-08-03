
State
{
	StateName = "MainState",
	 --DeadDecal wird an- und ausgeschaltet
    OnToggleEvent	
	{
		OnConditions =
		{
			FigureIsAlive	{Tag = "UntoterBewohnerSpawnOnly05"},
			FigureIsAlive	{Tag = "UntoterBewohnerSpawnOnly06"},
		},
		OnActions = 
		{
			ObjectChange	{Tag = "DecalDead03", ObjectId = 1836, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetFalse {Name = "mf_DecalDead03Aktiv"},
		},
		OffConditions =
		{
				FigureIsDead	{Tag = "UntoterBewohnerSpawnOnly05"},
				FigureIsDead	{Tag = "UntoterBewohnerSpawnOnly06"},
		},
		OffActions = 
		{
			ObjectChange	{Tag = "DecalDead03", ObjectId = 2040, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetTrue {Name = "mf_DecalDead03Aktiv"},
		},
	},
	                    
};                                                                            