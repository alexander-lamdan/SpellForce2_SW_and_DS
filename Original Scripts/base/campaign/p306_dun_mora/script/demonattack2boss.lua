---------------------------------------------
				-- Script fuer --
			-- SAUGER DAEMON BOSS 02--
				-- Attack 2, kein Respawn --
---------------------------------------------
---------------------------------------------

---------------------------------------------------------------
---------------------------------------------------------------
				--Verhalten waehrend Attack2 --	
---------------------------------------------------------------
State
{	
	StateName = "INIT",		
	
	OnFigureSpawnOnlyWhenEvent	
	{
		X = 345.8,
		Y = 532,
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SpawnAttack2Boss"}, 
		}, 
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Boss2GotoNextState"},
		}, 
		DelayedActions = 
		{
		},
	},
	
	OnOneTimeEvent
	{
		GotoState = "Attack2",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Boss2GotoNextState"},			
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
	--Daemonen greifen Aufbau an
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_02", Seconds = 15},
			MapFlagIsTrue {Name = "mf_SecondAttackInit"},		
		},
		Actions = 
		{
			FigureAttackEntity	{Tag = "default", TargetTag = "pl_HumanAvatar"},
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
	

	
--	--Daemonen greifen Aufbau an
--	OnOneTimeEvent
--	{
--		
--		Conditions = 
--		{
--			MapFlagIsTrue {Name = "mf_DemonAttack2Running"},			
--		},
--		Actions = 
--		{
--			FigureAttackEntity	{Tag = "default", TargetTag = "pl_HumanAvatar"},
--			FigurePlayerTransfer	{Tag = "default", Player = "pl_Demon"}, --Daemonen an Flug-KI uebergeben
--		},
--	},
--	
------------------------------------------------------------------------
-- --Rueckzug
-- -------------------------------------------------------------------------
-- 
--
-- --Daemonen ziehen sich nach Attack2 zurueck
--	OnOneTimeEvent
--	{
--	
--		Conditions = 
--		{
--			MapFlagIsTrue {Name = "mf_Retreat02"},			
--		},
--		Actions = 
--		{
--			FigureForcedRun	{Tag = "default", X = GetEntityX(), Y = GetEntityY()},
--		},
--	},
--}
--
--
--
---- State, wenn vorbei (ausgeschaltet)
--State
--{	
--	StateName = "Off",
--}