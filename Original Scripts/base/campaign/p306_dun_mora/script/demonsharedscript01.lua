---------------------------------------------
			-- Script fuer die --
			-- SAUGER DAEMONEN--
			-- Tags = "Demon 01-16"--
			-- werden vor Attack2 der Flug-KI uebergeben--
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
  
State
{
	StateName = "Init",
	OnOneTimeEvent
	{
		GotoState = "Attack1",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SpawnAttack1Boss"}, --Flag fuer Spawning von Attack1Boss
		},
		Actions = 
		{},
		
	};


	
}  
-----------------------------------------------------
State
{
	StateName = "Attack1",
	
	
	
---------------------------------------------------------------
---------------------------------------------------------------
				-- Verhalten waehrend Attack1 --	
			  -- gesteuert von DemonAttack1.lua --
---------------------------------------------------------------

   -- Wenn Counter = 0, dann
   
   OnIdleGoHomeFake
   {
   	UpdateInterval = 30,
   	X = (gtCoords[(gtPersonalCounter[1])].X) ,
   	Y = (gtCoords[(gtPersonalCounter[1])].Y) ,
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
   	X = (gtCoords[(gtPersonalCounter[2])].X) ,
   	Y = (gtCoords[(gtPersonalCounter[2])].Y) ,
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
   	X = (gtCoords[(gtPersonalCounter[3])].X) ,
   	Y = (gtCoords[(gtPersonalCounter[3])].Y) ,
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
   	X = (gtCoords[(gtPersonalCounter[4])].X) ,
   	Y = (gtCoords[(gtPersonalCounter[4])].Y) ,
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
   	X = (gtCoords[(gtPersonalCounter[5])].X) ,
   	Y = (gtCoords[(gtPersonalCounter[5])].Y) ,
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
   	X = (gtCoords[(gtPersonalCounter[6])].X) ,
   	Y = (gtCoords[(gtPersonalCounter[6])].Y) ,
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
   	X = (gtCoords[(gtPersonalCounter[7])].X) ,
   	Y = (gtCoords[(gtPersonalCounter[7])].Y) ,
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
   	X = (gtCoords[(gtPersonalCounter[8])].X) ,
   	Y = (gtCoords[(gtPersonalCounter[8])].Y) ,
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
   	X = (gtCoords[(gtPersonalCounter[9])].X) ,
   	Y = (gtCoords[(gtPersonalCounter[9])].Y) ,
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
   	X = (gtCoords[(gtPersonalCounter[10])].X) ,
   	Y = (gtCoords[(gtPersonalCounter[10])].Y) ,
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
		GotoState = "WaitingForAttack2",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Retreat01"},			
		},
		Actions = 
		{
			FigureForcedRun	{Tag = "default", X = GetEntityX(), Y = GetEntityY()},
		},
	},
}

---------------------------------------------------------
State
{
	StateName = "WaitingForAttack2",
	OnOneTimeEvent
	{
		GotoState = "Attack2",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_FlightDemonRespawnInit"},		
		},
		Actions = 
		{
			
		},
	},
}


	
-------------------------------------------------------------
-------------------------------------------------------------
				--VERHALTEN WAEHREND ATTACK 2 --	
---------------------------------------------------------------
------------------------------------------------------------------	
State
{
	StateName = "Attack2",	
	OnFigureRespawnEvent
	{
		WaitTime = 210,
		X = 345.8,
		Y = 532,
		Conditions = 
		{
			
			MapFlagIsTrue	{Name = "mf_FlightDemonRespawnInit"}, -- erst Respawn, wenn Attacke2 initiiert, weil Death-Abfrage in Mapscript sonst falsch
		},
		Actions = 
		{
			FigureWalk	{Tag = "default", X = GetEntityX(), Y = GetEntityY()},
			
		},
		DeathActions = 
		{
		},
		DelayedActions = 
		{
		},
	},
	
	
	
	
	
	--Daemonen greifen Aufbau an
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_DemonAttack2Running"},			
		},
		Actions = 
		{
			FigurePlayerTransfer	{Tag = "default", Player = "pl_FlightDemon"}, --Daemonen an Flug-KI uebergeben
		},
	},
	

----------------------------------------------------------	
   --Daemonen ziehen sich nach Attack2 zurueck
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Retreat02"},			
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_DemonAttack2Retreat"}, -- Timer, der Daemonenscripte in Off-State schaltet
			FigureForcedRun	{Tag = "default", X = GetEntityX(), Y = GetEntityY()},
			MapFlagSetFalse	{Name = "mf_FlightDemonRespawnInit"}, --Respawn aus
		},
	},
	
	
	
------------------------------------------------------------------------
--------------------------------------------------------------------------- 
   -- Script ausschalten, wenn Attacke2 vorbei ist
   
   OnOneTimeEvent
	{
		GotoState = "Off",
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_DemonAttack2Defeated"},
			EntityTimerIsElapsed	{Name = "et_DemonAttack2Retreat", Seconds = 120},
			
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