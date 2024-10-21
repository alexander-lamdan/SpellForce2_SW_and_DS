---------------------------------------------
				-- Script fuer --
			-- SAUGER DAEMONEN BOSS 01--
				-- Attack1--
---------------------------------------------
---------------------------------------------


gtCoords =
{  
  [1] = { X = 334, Y = 400 }, 
  [2] = { X = 345, Y = 416 },   
  [3] = { X = 415, Y = 423 }, 
  [4] = { X = 423, Y = 379 }, 
  [5] = { X = 454, Y = 386 }, 
  [6] = { X = 438, Y = 421 }, 
  [7] = { X = 400, Y = 392 }, 
  [8] = { X = 425, Y = 363 }, 
  [9] = { X = 442, Y = 425 }, 
  [10] = { X = 379, Y = 359 },

} 
  
  
-------------------------------------------------------
State
{
	StateName = "StrollingAlong",
	
	OnFigureSpawnOnlyWhenEvent	
	{
		X = 345.8,
		Y = 532,
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SpawnAttack1Boss"}, 
		}, 
		Actions = 
		{
		}, 
		DelayedActions = 
		{
		},
	},
	
   -- Wenn Counter = 0, dann
   
   OnIdleGoHomeFake
   {
   	UpdateInterval = 30,
   	X = (gtCoords[1].X) ,
   	Y = (gtCoords[1].Y) ,
   	Conditions = 
   		{
   			MapFlagIsTrue {Name = "mf_DemonAttackRunning"},
   			--MapFlagIsTrue  {Name = "mf_SuckingWaypointsOn"},
   			EntityValueIsEqual{Name = "ev_P306_SuckingDemonCounter", Value = 0},
   			
   		},
   	Actions = 
		{
			EntityValueAdd	{Name = "ev_P306_SuckingDemonCounter", Value = 1},
			
		},
   },
   
   -- Wenn Counter = 1, dann
   
   OnIdleRunHomeFake
   {
   	UpdateInterval = 30,
   	X = (gtCoords[2].X) ,
   	Y = (gtCoords[2].Y) ,
   	Conditions = 
   	{
   		MapFlagIsTrue {Name = "mf_DemonAttackRunning"},
   		EntityValueIsEqual {Name = "ev_P306_SuckingDemonCounter", Value = 1},
   	},
   	Actions = 
		{
			EntityValueAdd	{Name = "ev_P306_SuckingDemonCounter", Value = 1},
		},
   },
   
   -- Wenn Counter = 2, dann
   
   OnIdleRunHomeFake
   {
   	UpdateInterval = 30,
   	X = (gtCoords[3].X) ,
   	Y = (gtCoords[3].Y) ,
   	Conditions = 
   	{
   		MapFlagIsTrue {Name = "mf_DemonAttackRunning"},
   		EntityValueIsEqual{Name = "ev_P306_SuckingDemonCounter", Value = 2},
   	},
   	Actions = 
		{
			EntityValueAdd	{Name = "ev_P306_SuckingDemonCounter", Value = 1},
		},
   },
   
   -- Wenn Counter = 3, dann
   
   OnIdleRunHomeFake
   {
   	UpdateInterval = 30,
   	X = (gtCoords[4].X) ,
   	Y = (gtCoords[4].Y) ,
   	Conditions = 
   	{
   		MapFlagIsTrue {Name = "mf_DemonAttackRunning"},
   		EntityValueIsEqual{Name = "ev_P306_SuckingDemonCounter", Value = 3},
   	},
   	Actions = 
		{
			EntityValueAdd	{Name = "ev_P306_SuckingDemonCounter", Value = 1},
		},
   },
   
   -- Wenn Counter = 4, dann
   
   OnIdleRunHomeFake
   {
   	UpdateInterval = 30,
   	X = (gtCoords[5].X) ,
   	Y = (gtCoords[5].Y) ,
   	Conditions = 
   	{
   		MapFlagIsTrue {Name = "mf_DemonAttackRunning"},
   		EntityValueIsEqual{Name = "ev_P306_SuckingDemonCounter", Value = 4},
   	},
   	Actions = 
		{
			EntityValueAdd	{Name = "ev_P306_SuckingDemonCounter", Value = 1},
		},
   },
   
   -- Wenn Counter = 5, dann
   
   OnIdleRunHomeFake
   {
   	UpdateInterval = 30,
   	X = (gtCoords[6].X) ,
   	Y = (gtCoords[6].Y) ,
   	Conditions = 
   	{
   		MapFlagIsTrue {Name = "mf_DemonAttackRunning"},
   		EntityValueIsEqual{Name = "ev_P306_SuckingDemonCounter", Value = 5},
   	},
   	Actions = 
		{
			EntityValueAdd	{Name = "ev_P306_SuckingDemonCounter", Value = 1},
		},
   },
   
   -- Wenn Counter = 6, dann
   
   OnIdleRunHomeFake
   {
   	UpdateInterval = 30,
   	X = (gtCoords[7].X) ,
   	Y = (gtCoords[7].Y) ,
   	Conditions = 
   	{
   		MapFlagIsTrue {Name = "mf_DemonAttackRunning"},
   		EntityValueIsEqual{Name = "ev_P306_SuckingDemonCounter", Value = 6},
   	},
   	Actions = 
		{
			EntityValueAdd	{Name = "ev_P306_SuckingDemonCounter", Value = 1},
		},
   },
   
   -- Wenn Counter = 7, dann
   
   OnIdleRunHomeFake
   {
   	UpdateInterval = 30,
   	X = (gtCoords[8].X) ,
   	Y = (gtCoords[8].Y) ,
   	Conditions = 
   	{
   		MapFlagIsTrue {Name = "mf_DemonAttackRunning"},
   		EntityValueIsEqual{Name = "ev_P306_SuckingDemonCounter", Value = 7},
   	},
   	Actions = 
		{
			EntityValueAdd	{Name = "ev_P306_SuckingDemonCounter", Value = 1},
		},
   },
   
   -- Wenn Counter = 8, dann
   
   OnIdleRunHomeFake
   {
   	UpdateInterval = 30,
   	X = (gtCoords[9].X) ,
   	Y = (gtCoords[9].Y) ,
   	Conditions = 
   	{
   		MapFlagIsTrue {Name = "mf_DemonAttackRunning"},
   		EntityValueIsEqual{Name = "ev_P306_SuckingDemonCounter", Value = 8},
   	},
   	Actions = 
		{
			EntityValueAdd	{Name = "ev_P306_SuckingDemonCounter", Value = 1},
		},
   },
   
   
   -- Wenn Counter = 9, dann
   
   OnIdleRunHomeFake
   {
   	UpdateInterval = 30,
   	X = (gtCoords[10].X) ,
   	Y = (gtCoords[10].Y) ,
   	Conditions = 
   	{
   		MapFlagIsTrue {Name = "mf_DemonAttackRunning"},
   		EntityValueIsEqual {Name = "ev_P306_SuckingDemonCounter", Value = 9},
   	},
   	Actions = 
		{
			EntityValueSet	{Name = "ev_P306_SuckingDemonCounter", Value = 0},
		},
   },
   
   
   -------------------------------------------------------------------------
   --Rueckzug
   -------------------------------------------------------------------------
   --Daemonen ziehen sich nach Attack1 zurueck
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Retreat01"},			
		},
		Actions = 
		{
			FigureForcedRun	{Tag = "default", X = GetEntityX(), Y = GetEntityY()},
		},
	},
	
   
	
	
	
  --------------------------------------------------------------------------- 
   -- Script ausschalten, wenn Attacke1 vorbei ist
   
   OnOneTimeEvent
	{
		GotoState = "Off",
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Attack01Over"},
			
		},
		Actions =
		{
		},
		
	},
 }
  
	
-------------------------------------------------------


-- State, wenn vorbei (ausgeschaltet)
State
{	
	StateName = "Off",
}