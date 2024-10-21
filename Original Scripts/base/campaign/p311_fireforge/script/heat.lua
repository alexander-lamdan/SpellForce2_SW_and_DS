State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Essence1Flame1"},
			FigureIsDead {Tag = "Essence1Flame2"},
			FigureIsDead {Tag = "Essence1Flame3"},
			FigureIsDead {Tag = "Essence1Flame4"},
			FigureIsDead {Tag = "Essence1Flame5"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_SpawnEssence1"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Essence2Flame1"},
			FigureIsDead {Tag = "Essence2Flame2"},
			FigureIsDead {Tag = "Essence2Flame3"},
			FigureIsDead {Tag = "Essence2Flame4"},
			FigureIsDead {Tag = "Essence2Flame5"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_SpawnEssence2"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Essence3Flame1"},
			FigureIsDead {Tag = "Essence3Flame2"},
			FigureIsDead {Tag = "Essence3Flame3"},
			FigureIsDead {Tag = "Essence3Flame4"},
			FigureIsDead {Tag = "Essence3Flame5"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_SpawnEssence3"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_SpawnEssence1"},
			MapFlagIsTrue {Name = "mf_SpawnEssence2"},
			MapFlagIsTrue {Name = "mf_SpawnEssence3"},
			
			FigureIsDead  {Tag = "SmallEssence1"},
			FigureIsDead  {Tag = "SmallEssence2"},
			FigureIsDead  {Tag = "SmallEssence3"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_SpawnLastEssence"},
		},
	},

};


