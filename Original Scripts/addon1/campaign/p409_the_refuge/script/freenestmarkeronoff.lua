
State
{
	StateName = "INIT",

	OnToggleEvent
	{
		OnConditions = 
		{
			FigureTeamIsNotInRange	{Team = "tm_Team2", Range = 15, X = 374.777, Y = 569.629},
		},
		OnActions = 
		{
			ObjectVanish{Tag = "FreeNestMarkerA"},
		},
		OffConditions = 
		{
			FigureTeamIsInRange	{Team = "tm_Team2", Range = 15, X = 374.777, Y = 569.629},
		},
		OffActions = 
		{
			ObjectSpawn	{ObjectId = 1591, X = 378.153, Y = 570.297, Direction = 0, Tag = "FreeNestMarkerA"},
		},
	};
	
	OnToggleEvent
	{
		OnConditions = 
		{
			FigureTeamIsNotInRange	{Team = "tm_Team2", Range = 15, X = 413.539, Y = 602.783},
		},
		OnActions = 
		{
			ObjectVanish{Tag = "FreeNestMarkerB"},
		},
		OffConditions = 
		{
			FigureTeamIsInRange	{Team = "tm_Team2", Range = 15, X = 413.539, Y = 602.783},
		},
		OffActions = 
		{
			ObjectSpawn	{ObjectId = 1591, X = 413.525, Y = 598.896, Direction = 0, Tag = "FreeNestMarkerB"},
		},
	};


	OnToggleEvent
	{
		OnConditions = 
		{
			FigureTeamIsNotInRange	{Team = "tm_Team2", Range = 15, X = 454.452, Y = 575.999},
		},
		OnActions = 
		{
			ObjectVanish{Tag = "FreeNestMarkerC"},
		},
		OffConditions = 
		{
			FigureTeamIsInRange	{Team = "tm_Team2", Range = 15, X = 454.452, Y = 575.999},
		},
		OffActions = 
		{
			ObjectSpawn	{ObjectId = 1591, X = 448.222, Y = 575.959, Direction = 0, Tag = "FreeNestMarkerC"},
		},
	};
	
	
	OnToggleEvent
	{
		OnConditions = 
		{
			FigureTeamIsNotInRange	{Team = "tm_Team2", Range = 15, X = 506.007, Y = 499.818},
		},
		OnActions = 
		{
			ObjectVanish{Tag = "FreeNestMarkerD"},
		},
		OffConditions = 
		{
			FigureTeamIsInRange	{Team = "tm_Team2", Range = 15, X = 506.007, Y = 499.818},
		},
		OffActions = 
		{
			ObjectSpawn	{ObjectId = 1591, X = 508.634, Y = 502.226, Direction = 0, Tag = "FreeNestMarkerD"},
		},
	};

	
};

