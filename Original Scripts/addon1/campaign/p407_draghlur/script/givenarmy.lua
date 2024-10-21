State
{
	StateName = "INIT",
	-- Erst spawnen, wenn der Spieler das Lager hat
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P407_EndTrapsCS"}
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P407_Spawn"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P407_Spawn"}
		},
		Actions =
		{
			FigurePlayerTransfer {Tag = myTag},
		},
	},
}