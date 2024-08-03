
State
{
	StateName = "INIT",
	
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P304_ShadowsongKidnapperTold"},
			-- Figur erscheint erst, wenn Avatar vom Kidnapping Schattenlieds benachrichtigt wurde
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_GhulaarSpawned"},
		},
	};

	
}                                                             