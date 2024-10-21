----------------------------------------------------------------------------------
					-- Script fuer die "SecondDemons"
							-- Bodentruppen --
						-- an Ground-KI uebergeben --
					-- nur waehrend Attack2 ausfuehren --

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------


-----------------------------------------------------------------
--				--Verhalten waehrend Attack2 --	
-----------------------------------------------------------------
State
{	
	StateName = "INIT",	
	
	--Daemonen greifen Aufbau an
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_DemonAttack2Running"},			
		},
		Actions = 
		{
			FigurePlayerTransfer	{Tag = "default", Player = "pl_GroundDemon"}, --Daemonen an Boden-KI uebergeben
		},
	},
	
----------------------------------------------------------------------
 --Rueckzug
 -------------------------------------------------------------------------
 

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

	
----------------------------------------------------------------------------- 
 -- Script ausschalten, wenn die SaugerDaemonen tot oder Attacke2 vorbei ist
 
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
	
---------------------------------------------------


-- State, wenn vorbei (ausgeschaltet)
State
{	
	StateName = "Off",
}