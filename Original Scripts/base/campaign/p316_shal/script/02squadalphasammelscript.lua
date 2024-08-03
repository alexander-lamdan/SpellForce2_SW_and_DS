HomePointAlphaX = 35 --50
HomePointAlphaY = 266 --270

State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_GameCommencing"},
		},
		Actions =
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalk {X = HomePointAlphaX,Y = HomePointAlphaY},
				Points = 
				{
					"85, 319",
					"123, 330",
					"189, 329",
					"184, 277",
				},
			},
		},
		GotoState = "02SquadAlpha",
	},
}

State
{
	StateName = "02SquadAlpha",
	OnFigureRespawnEvent
	{
		WaitTime = 300,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			PlayerBuildingIsInRange	{Player = "pl_SchattenTeamAlpha", BuildingId = 147, Range = 10, X = HomePointAlphaX, Y = HomePointAlphaY},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalk {X = HomePointAlphaX,Y = HomePointAlphaY},
				Points = 
				{
					"85, 319",
					"123, 330",
					"189, 329",
					"184, 277",
				},
			},
		},
		DeathActions = 
		{
			
		},
	},  
};
