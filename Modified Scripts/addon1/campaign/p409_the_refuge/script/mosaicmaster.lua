


State
{	
	StateName = "INIT",
	

	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P409_MosaicOfDeath", Value = 4},
			AvatarIsNotTalking	{},	GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_MasterSpawned"},
			-- Flag für Questbook
		},
	
	};

   OnIdleGoHomeFake
   {
   	X = GetEntityX(),
   	Y = GetEntityY(),
   	Conditions = 
   	{
   	},
   	Actions = 
	{
	},
	HomeActions =
	{
	},
   },
	
}

