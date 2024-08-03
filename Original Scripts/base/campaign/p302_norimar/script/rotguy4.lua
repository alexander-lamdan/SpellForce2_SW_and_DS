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
			FigureHoldPosition {},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved 	{Quest = "NorimarMainPart1ToCastle"},
		},
		Actions =
		{
			FigureVanish {},
		},
	},
};