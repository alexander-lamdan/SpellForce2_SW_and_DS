TagOwnBuilding =
{
	-- Die Namen der Gebäude
	
	[1] = "Spawn01",
	[2] = "Spawn02",
	[3] = "Spawn03",
 	[4] = "Spawn04",
 	[5] = "Spawn05",
 	[6] = "Spawn06",
 	
} 
 


State
{	
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapTimerIsElapsed{Name = "mt_SpawnFlyerTimer", Seconds = MySpawnTime},
		},
		Actions = 
		{
			EntityValueRandomize{Name = "ev_MyGoal", MinValue = 1, MaxValue = 15},
		},
		NoSpawnEffect = false,
	};


			
	OnFigureRespawnEvent
	{
		WaitTime = MyRespawnTime,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			BuildingIsAlive{Tag = TagOwnBuilding[MyIsland]},
		},
		Actions = 
		{
			EntityValueRandomize{Name = "ev_MyGoal", MinValue = 1, MaxValue = 15},
		},
		NoSpawnEffect = false,
	};
	
--	OnIdleRunHomeFake
--	{
--		X = 201.009 + math.random(10) - 5, 
--		Y = 120.265 + math.random(10) - 5,  
--		Range = 8,
--		GotoForced = false,
--		UpdateInterval = 5,
--		Conditions = 
--		{
--			EntityValueIsEqual{Name = "ev_MyGoal", Value = 1},
--		},
--		Actions = 
--		{
--		},
--	};
--	OnIdleRunHomeFake
--	{
--		X = 201.369 + math.random(10) - 5, 
--		Y = 159.503 + math.random(10) - 5, 
--		Range = 8,
--		GotoForced = false,
--		UpdateInterval = 5,
--		Conditions = 
--		{
--			EntityValueIsEqual{Name = "ev_MyGoal", Value = 2},
--		},
--		Actions = 
--		{
--		},
--	};
--	OnIdleRunHomeFake
--	{
--		X = 184.233 + math.random(10) - 5, 
--		Y = 222.191 + math.random(10) - 5, 
--		Range = 8,
--		GotoForced = false,
--		UpdateInterval = 5,
--		Conditions = 
--		{
--			EntityValueIsEqual{Name = "ev_MyGoal", Value = 3},
--		},
--		Actions = 
--		{
--		},
--	};
--	OnIdleRunHomeFake
--	{
--		X = 265.201 + math.random(10) - 5,
--		Y = 144.394 + math.random(10) - 5,
--		Range = 8,
--		GotoForced = false,
--		UpdateInterval = 5,
--		Conditions = 
--		{
--			EntityValueIsEqual{Name = "ev_MyGoal", Value = 4},
--		},
--		Actions = 
--		{
--		},
--	};
--	OnIdleRunHomeFake
--	{
--		X = 267.071 + math.random(10) - 5,
--		Y = 98.2985 + math.random(10) - 5,
--		Range = 8,
--		GotoForced = false,
--		UpdateInterval = 5,
--		Conditions = 
--		{
--			EntityValueIsEqual{Name = "ev_MyGoal", Value = 5},
--		},
--		Actions = 
--		{
--		},
--	};
	OnIdleRunHomeFake
	{
		X = 237.802 + math.random(10) - 5,
		Y = 163.227 + math.random(10) - 5,
		Range = 8,
		GotoForced = false,
		UpdateInterval = 5,
		Conditions = 
		{
			OR
			{
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 2},
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 3},
				
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 6},
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 8},
			},
		},
		Actions = 
		{
		},
	};
	OnIdleRunHomeFake
	{
		X = 270.592 + math.random(10) - 5,
		Y = 200.781 + math.random(10) - 5,
		Range = 8,
		GotoForced = false,
		UpdateInterval = 5,
		Conditions = 
		{
			OR
			{
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 4},
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 5},
				
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 7},
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 9},
			},
		},
		Actions = 
		{
		},
	};
	OnIdleRunHomeFake
	{
		X = 250.592 + math.random(20) - 10,
		Y = 180.781 + math.random(20) - 10,
		Range = 8,
		GotoForced = false,
		UpdateInterval = 5,
		Conditions = 
		{
			OR
			{
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 1},
				
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 10},
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 11},
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 12},
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 13},
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 14},
				EntityValueIsEqual{Name = "ev_MyGoal", Value = 15},
			},
		},
		Actions = 
		{
		},
	};
	
};