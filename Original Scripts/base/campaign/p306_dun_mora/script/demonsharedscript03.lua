-- Script fuer die normalen Daemonen FLUG (Tor 04)
-- "Group04Demon01-0X"
-- werden der Flug-KI uebergeben
-- greifen bei Attack2 mit an
----------------------------------------



State
{	
	StateName = "INIT",
	
		OnOneTimeEvent
	{
		
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_DemonAttack2Running"},
		},
		Actions = 
		{
			FigurePlayerTransfer	{Tag = "default", Player = "pl_FlightDemon"},
		},
	},
	
	
	



	
	
	 --Daemonen ziehen sich nach Attack2 zurueck
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Retreat02"},			
		},
		Actions = 
		{
			FigureForcedRun	{Tag = "default", X = GetEntityX(), Y = GetEntityY()},
		},
	},
}


 