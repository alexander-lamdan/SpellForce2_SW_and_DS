State
{	
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX{},
		Y = GetEntityY{},
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P302_CS_04_DarkelfSpawnB"},
		},
		Actions = 
		{
		},
	},
	OnOneTimeEvent
	{ 
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P302_CS_04_Darkelf_Vanish"},
		},
		Actions = 
		{
			FigureVanish {},
		},
		
		GotoState = "EndScript",
	},
};

State
{
	StateName = "EndScript",
};

