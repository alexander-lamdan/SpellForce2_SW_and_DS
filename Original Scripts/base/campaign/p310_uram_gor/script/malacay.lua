
 -- Malacay Spawned und vanished für die Outcries nach Cutscene II

State
{
	StateName = "MalacayStart",
   	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_ZwergenCampErreicht"},
		},
		Actions = 
		{
		},
	},
	-- Sobald der Zwerg das portal erreicht hat verschwindet er.
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_ZwergenCampErreicht"},
			MapTimerIsElapsed {Name = "mt_MalacayVanish", Seconds = 15},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Malacay"},
		},
	},	
 
 
};
