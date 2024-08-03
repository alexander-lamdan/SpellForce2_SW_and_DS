
GoalPoint1X = 204.059 + (math.random(6)-3)
GoalPoint1Y = 417.271 + (math.random(6)-3) 
GoalPoint2X = 291.498 + (math.random(6)-3)
GoalPoint2Y = 550.553 + (math.random(6)-3) 
GoalPoint3X = 202.721 + (math.random(6)-3)
GoalPoint3Y = 561.104 + (math.random(6)-3)
GoalPoint4X = 145.124 + (math.random(6)-3)
GoalPoint4Y = 445.69 + (math.random(6)-3)
GoalPoint5X = 61.6103 + (math.random(6)-3)
GoalPoint5Y = 563.85 + (math.random(6)-3)

  

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
   			FigureUnitChange{Tag = "default", UnitId = 1462, Level = 16},
   			EntityValueSet{Name = "ev_Goal", Value = 1},
   		},
   	},
   	

	OnIdleRunHomeFake
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

	OnIdleRunHomeFake
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

	OnIdleRunHomeFake
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
  
  	OnIdleRunHomeFake
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
   
	OnIdleRunHomeFake
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
	
	OnIdleRunHomeFake
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