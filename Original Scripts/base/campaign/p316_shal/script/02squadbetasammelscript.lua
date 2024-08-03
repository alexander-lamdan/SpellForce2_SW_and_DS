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
					"270, 134",
					"260, 162",
					"196, 158",
					"156, 193",
					"201, 222",
				},
			},
		},
		GotoState = "02SquadBeta",
	},
}

State
{
	StateName = "02SquadBeta",
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
					"270, 134",
					"260, 162",
					"196, 158",
					"156, 193",
					"201, 222",
				},
			},
		},
		DeathActions = 
		{
			
		},
	},  
};

