WP1X = 529 + OffsetX
WP1Y = 403 + OffsetY
WP2X = 555 + OffsetX  
WP2Y = 452 + OffsetY 
WP3X = 502 + OffsetX 
WP3Y = 429 + OffsetY 

State
{
	StateName = "GotoWP01",
	
	OnIdleGoHomeFake
	{
		X = 529,
		Y = 403,
		Range = 3,
		UpdateInterval = 2,
		Conditions = 
		{
			
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityFlagSetTrue {Name = "ef_ReachedWP01"},
		},
		OneTimeHomeActions = 
		{
		},
	},
	OnEvent
	{
		GotoState = "GotoWP02",
		Conditions = 
		{
			EntityFlagIsTrue {Name = "ef_ReachedWP01"},
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_ReachedWP01"},
		},
	},
};
State
{
	StateName = "GotoWP02",
	
	OnIdleGoHomeFake
	{
		X = 555,
		Y = 452,
		Range = 3,
		UpdateInterval = 2,
		Conditions = 
		{
			
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityFlagSetTrue {Name = "ef_ReachedWP02"},
		},
		OneTimeHomeActions = 
		{
		},
	},
	OnEvent
	{
		GotoState = "GotoWP03",
		Conditions = 
		{
			EntityFlagIsTrue {Name = "ef_ReachedWP02"},
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_ReachedWP02"},
		},
	},
};

State
{
	StateName = "GotoWP03",
	
	OnIdleGoHomeFake
	{
		X = 502,
		Y = 429,
		Range = 3,
		UpdateInterval = 2,
		Conditions = 
		{
			
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityFlagSetTrue {Name = "ef_ReachedWP03"},
		},
		OneTimeHomeActions = 
		{
		},
	},
	OnEvent
	{
		GotoState = "GotoWP01",
		Conditions = 
		{
			EntityFlagIsTrue {Name = "ef_ReachedWP03"},
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_ReachedWP03"},
		},
	},
};