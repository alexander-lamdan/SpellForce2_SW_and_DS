HomePointBetaX = 325 --320
HomePointBetaY = 93.8 --110

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
				Goto = FigurePatrolWalk {X = HomePointBetaX,Y = HomePointBetaY},
				Points = 
				{
					"324, 208",
					"334, 250",
					"267, 277",
					"225, 284",
				},
			},
		},
		GotoState = "03SquadBeta",
	},
}

State
{
	StateName = "03SquadBeta",
	OnFigureRespawnEvent
	{
		WaitTime = 300,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			PlayerBuildingIsInRange	{Player = "pl_SchattenTeamBeta", BuildingId = 147, Range = 10, X = HomePointBetaX, Y = HomePointBetaY},
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalk {X = HomePointBetaX,Y = HomePointBetaY},
				Points = 
				{
					"324, 208",
					"334, 250",
					"267, 277",
					"225, 284",
				},
			},
		},
		DeathActions = 
		{
			
		},
	},  
};

