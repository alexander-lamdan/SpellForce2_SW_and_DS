
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
		X = 272.194,
		Y = 71.275,
		Conditions = 
		{
			BuildingIsAlive	{Tag = "IceElSpawn01"},
		},
		Actions = 
		{
		},
	};


	OnFigureRespawnEvent
	{
		WaitTime = 60,
		X = 318.03,
		Y = 113.128,
		Conditions = 
		{
			BuildingIsDead	{Tag = "IceElSpawn01"},
			BuildingIsAlive	{Tag = "IceElSpawn02"},
		},
		Actions = 
		{
		},
	};
	
	OnFigureRespawnEvent
	{
		WaitTime = 90,
		X = 293.752,
		Y = 106.955,
		Conditions = 
		{
			BuildingIsDead	{Tag = "IceElSpawn01"},
			BuildingIsDead	{Tag = "IceElSpawn02"},
			BuildingIsAlive	{Tag = "IceElSpawn03"},
		},
		Actions = 
		{
		},
	};

   OnFigureRespawnEvent
	{
		WaitTime = 120,
		X = 298.792,
		Y = 100.662,
		Conditions = 
		{
			BuildingIsDead	{Tag = "IceElSpawn01"},
			BuildingIsDead	{Tag = "IceElSpawn02"},
			BuildingIsDead	{Tag = "IceElSpawn03"},
			BuildingIsAlive	{Tag = "IceElSpawn04"},
		},
		Actions = 
		{
		},
	};
  
   


  
   
};
