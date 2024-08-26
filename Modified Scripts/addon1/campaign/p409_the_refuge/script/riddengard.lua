State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_CS_03_Actors_Spawn"},
				QuestIsActive {Quest = "Refuge_KillRiddengard"},
			},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_RiddengardSpawned"},
			
			FigureTeamTransfer	{Tag = "default", Team = "tm_Neutral"},
		},
	};
	
	-- Nach der 3. Cutscene wird Riddengard in den Ozean geschmissen
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS03Ended"},
		},
		Actions = 
		{
			FigureTeleport	{Tag = "default", X = 700.47, Y = 12.2078, },
		},
	};
	
	-- Wenn die 4. Cutscene beginnt, kommt er wieder raus
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS04Start"},
		},
		Actions = 
		{
			FigureTeleport	{Tag = "default", X = 521.312, Y = 574.796, },
		},
	};

	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS04Ended"},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "default", Team = "tm_Team2"},
		},
	},
}
