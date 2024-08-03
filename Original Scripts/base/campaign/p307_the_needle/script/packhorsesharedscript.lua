

State
{	
	StateName = "INIT",
	
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = IAppearAtX,
		Y = IAppearAtY,
		Conditions =
		{
			AvatarFlagIsTrue {Name = MySpawnCondition},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_Spawned"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "MainScript"
	},
}



State
{
	StateName = "MainScript",
   
   
   OnFigureRespawnEvent
	{
		WaitTime = 60,
		X = IAppearAtX,
		Y = IAppearAtY,
		Conditions = 
		{
			AvatarFlagIsTrue {Name = MySpawnCondition},
			BuildingIsAlive{Tag = MyCampTag},
		},
		Actions = 
		{
		},
		DeathActions = 
		{
		},
	};



   
   OnIdleGoHomeFake
   {
   	UpdateInterval = 30,
   	X = BaseCoordX,
   	Y = BaseCoordY,
   	Conditions = 
   	{
   	},
   	Actions = 
		{
		},
	HomeActions =
		{
			PlayerResourceLenyaGive	{Amount = GiveLenya },
			PlayerResourceStoneGive	{Amount = GiveStone},
			PlayerResourceSilverGive	{Amount = GiveIron},
			EntityFlagSetTrue {Name = "ef_GoVanishing"},
		},
   },
   
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_GoVanishing"},
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_GoVanishing"},
			FigureVanish{},
		},
	},
   
};

