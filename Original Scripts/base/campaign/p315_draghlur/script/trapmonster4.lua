----------------------------------------------------------------------
--
--	Skelett, welches in der Palisade erscheint, in der der Spieler und seine Einheiten gefangen gehalten werden
--
-----------------------------------------------------------------------
State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigureVanish {},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
		},
	};
	OnFigureRespawnEvent
	{
		X = GetEntityX(), 
		Y = GetEntityY(),
		WaitTime = 1,
		Conditions = 
		{
			EntityFlagIsFalse {Name = "ef_p315_OneTimer"},
			MapFlagIsTrue {Name = "mf_P315_Trap6Triggered"}
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_p315_OneTimer"},
		},
	};
	
}