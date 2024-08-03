SpawnPointX = 252.865
SpawnPointY = 210.565

GoalPoint1X = 241.225 + (math.random(6)-3)
GoalPoint1Y = 210.655 + (math.random(6)-3)
GoalPoint2X = 284.648 + (math.random(6)-3)
GoalPoint2Y = 200.56 + (math.random(6)-3) 
GoalPoint3X = 309.282 + (math.random(6)-3)
GoalPoint3Y = 241.954 + (math.random(6)-3)
GoalPoint4X = 234.515 + (math.random(6)-3)
GoalPoint4Y = 286.324 + (math.random(6)-3)
GoalPoint5X = 196.011 + (math.random(6)-3)
GoalPoint5Y = 249.538 + (math.random(6)-3)

  


State
{
	StateName = "Main",
   
   	OnOneTimeEvent
   	{
   		Conditions =
   		{
   		},
   		Actions =
   		{
   			EntityValueSet{Name = "ev_Goal", Value = 1},
   		},
   	},
   
	OnFigureRespawnEvent
	{
		WaitTime = 700,
		X = SpawnPointX,
		Y = SpawnPointY,
		Conditions = 
		{
			FigureIsAlive{Tag = "GolemKingFire"},
			MapFlagIsTrue{Name = "mf_AllFireGolemsRespawn"},
		},
		Actions = 
		{
			EntityValueSet{Name = "ev_Goal", Value = 1},
		},
	};

	OnIdleGoHomeFake
	{
		X = GoalPoint1X,
		Y = GoalPoint1Y,
		Range = 10,
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_Goal", Value = 1},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_Goal", Value = 2},
		},
	};

	OnIdleGoHomeFake
	{
		X = GoalPoint2X,
		Y = GoalPoint2Y,
		Range = 10,
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_Goal", Value = 2},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_Goal", Value = 3},
		},
	};

	OnIdleGoHomeFake
	{
		X = GoalPoint3X,
		Y = GoalPoint3Y,
		Range = 10,
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_Goal", Value = 3},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_Goal", Value = 4},
		},
	};
  
  	OnIdleGoHomeFake
	{
		X = GoalPoint4X,
		Y = GoalPoint4Y,
		Range = 10,
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_Goal", Value = 4},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_Goal", Value = 5},
		},
	};
   
	OnIdleGoHomeFake
	{
		X = GoalPoint5X,
		Y = GoalPoint5Y,
		Range = 10,
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_Goal", Value = 5},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_Goal", Value = 6},
		},
	};
	
	OnIdleGoHomeFake
	{
		X = SpawnPointX,
		Y = SpawnPointY,
		Range = 10,
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_Goal", Value = 6},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_Goal", Value = 1},
		},
	};
};
