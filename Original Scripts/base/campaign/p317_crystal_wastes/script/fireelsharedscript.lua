
State
{
	StateName = "MainScript",
   
   OnIdleGoHomeFake
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Range = 1.5,
		UpdateInterval = 5,
		Conditions = 
		{
		},
	};


   
   OnFigureRespawnEvent
	{
		WaitTime = 30,
		X = 50.6388,
		Y = 249.49,
		Conditions = 
		{
			BuildingIsAlive	{Tag = "FireElSpawn01"},
		},
		Actions = 
		{
		},
	};


	OnFigureRespawnEvent
	{
		WaitTime = 50,
		X = 45.7017,
		Y = 255.55,
		Conditions = 
		{
			BuildingIsDead	{Tag = "FireElSpawn01"},
			BuildingIsAlive	{Tag = "FireElSpawn02"},
		},
		Actions = 
		{
		},
	};
	
	OnFigureRespawnEvent
	{
		WaitTime = 70,
		X = 53.9039,
		Y = 268.049,
		Conditions = 
		{
			BuildingIsDead	{Tag = "FireElSpawn01"},
			BuildingIsDead	{Tag = "FireElSpawn02"},
			BuildingIsAlive	{Tag = "FireElSpawn03"},
		},
		Actions = 
		{
		},
	};

   
  
   


  
   
};
