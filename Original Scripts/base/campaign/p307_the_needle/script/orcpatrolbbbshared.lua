SpawnPointX = 220.672
SpawnPointY = 244.333

GoalPoint5X = 270.119 + (math.random(6)-3)
GoalPoint5Y = 262.815 + (math.random(6)-3)
GoalPoint4X = 244.782 + (math.random(6)-3)
GoalPoint4Y = 335.36 + (math.random(6)-3)
GoalPoint3X = 321.922 + (math.random(6)-3)
GoalPoint3Y = 190.654 + (math.random(6)-3)
GoalPoint2X = 358.189 + (math.random(6)-3)
GoalPoint2Y = 232.845 + (math.random(6)-3)
GoalPoint1X = 304.335 + (math.random(6)-3)
GoalPoint1Y = 345.507 + (math.random(6)-3)

  
  


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
