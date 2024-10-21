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
			MapFlagIsFalse  {Name  = "mf_GotRottgarGuys"},
			QuestIsSolved 	{Quest = "NorimarMainPart1ToCastle"},
		},
		Actions =
		{
			FigureVanish {},
		},
	},
	
};