State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_gate_of_swords_stonegod_talker_spawn"},
		},
		Actions = 
		{
		},
	};
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_gate_of_swords_stonegod_talker_vanish"},
		},
		Actions =
		{
			FigureVanish {Tag = "default"},			
		},
		GotoState = "EndScript",
	},
}

State
{
	StateName = "EndScript",
}