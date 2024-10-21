
State
{
	StateName = "MainState",
	 --DeadDecal wird an- und ausgeschaltet
    OnToggleEvent	
	{
		OnConditions =
		{
			FigureIsAlive	{Tag = "UntoterBewohnerSpawnOnly03"},
			FigureIsAlive	{Tag = "UntoterBewohnerSpawnOnly04"},
		},
		OnActions = 
		{
			ObjectChange	{Tag = "DecalDead02", ObjectId = 1836, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetFalse {Name = "mf_DecalDead02Aktiv"},
		},
		OffConditions =
		{
				FigureIsDead	{Tag = "UntoterBewohnerSpawnOnly03"},
				FigureIsDead	{Tag = "UntoterBewohnerSpawnOnly04"},
		},
		OffActions = 
		{
			ObjectChange	{Tag = "DecalDead02", ObjectId = 2040, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			MapFlagSetTrue {Name = "mf_DecalDead02Aktiv"},
		},
	},
	                    
};                                                                            