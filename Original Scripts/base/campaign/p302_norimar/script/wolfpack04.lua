TargetX = 616 + OffsetX 
TargetY	= 576 + OffsetY 

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureTeamIsInRange {Team = "tm_HumanTeam", X = 616, Y = 576, Range = 10},
		},
		Actions =
		{
			FigureRun {Tag = "default", X = TargetX, Y = TargetY},
		},
	},
};

