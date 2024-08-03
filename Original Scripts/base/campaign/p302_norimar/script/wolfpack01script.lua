WP1X = 524 + OffsetX
WP1Y = 380 + OffsetY
WP2X = 540 + OffsetX  
WP2Y = 300 + OffsetY 

State
{
	StateName = "GotoWP01",
	
	OnIdleGoHomeFake
	{
		X = WP1X,
		Y = WP1Y,
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
		X = WP2X,
		Y = WP2Y,
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
		GotoState = "GotoWP01",
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
