State
{ 
	StateName = "GameOverCheck",
	
	
	-- Ortbrand
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Ortbrand"},
		},
		Actions =
		{
			PlayerGameOver	{Player = "default", Tag = "Ortbrand_DEAD", LocaTag = "GameOverSF2OrtbrandtDied"},
		},
	},
	
	--Falkmar
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Falkmar"},
			MapFlagIsFalse {Name = "mf_NoGameOver"},
		},
		Actions =
		{
			PlayerGameOver	{Player = "default", Tag = "Falkmar_DEAD", LocaTag = "GameOverSF2FalkmarDied"},
		},
	},
	
	-- Pferde
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "horse1"},
			MapFlagIsFalse {Name = "mf_NoGameOver"},	
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_HosesDead", Value = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "horse2"},
			MapFlagIsFalse {Name = "mf_NoGameOver"},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_HosesDead", Value = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "horse3"},
			MapFlagIsFalse {Name = "mf_NoGameOver"},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_HosesDead", Value = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "horse4"},
			MapFlagIsFalse {Name = "mf_NoGameOver"},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_HosesDead", Value = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "horse5"},
			MapFlagIsFalse {Name = "mf_NoGameOver"},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_HosesDead", Value = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "horse6"},
			MapFlagIsFalse {Name = "mf_NoGameOver"},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_HosesDead", Value = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "horse7"},
			MapFlagIsFalse {Name = "mf_NoGameOver"},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_HosesDead", Value = 1},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsGreaterOrEqual {Name = "mv_HosesDead", Value = 3},
			MapFlagIsFalse {Name = "mf_NoGameOver"},
			FigureIsAlive	{Tag = "Falkmar"},
		},
		Actions =
		{
			PlayerGameOver {Player = "default", Tag = "Falkmar", LocaTag = "GameOverSF2PackhorsesDead"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsGreaterOrEqual {Name = "mv_HosesDead", Value = 3},
			MapFlagIsFalse {Name = "mf_NoGameOver"},
			FigureIsDead	{Tag = "Falkmar"},
		},
		Actions =
		{
			PlayerGameOver {Player = "default", Tag = "Falkmar_DEAD", LocaTag = "GameOverSF2PackhorsesDead"},
		},
	},	
};