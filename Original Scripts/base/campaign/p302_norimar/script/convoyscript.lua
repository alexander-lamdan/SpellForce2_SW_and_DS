State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		
		GotoState = "LetsGo",
		Conditions = 
		{
			MapFlagIsTrue		{Name = "mf_KonvoiGo"},
		},
		Actions = 
		{
--			EntityValueSet {Name = "ev_ReachedWaypoint01", Value = 0},
--			EntityValueSet {Name = "ev_ReachedWaypoint02", Value = 0},
--			EntityValueSet {Name = "ev_ReachedWaypoint03", Value = 0},
--			EntityValueSet {Name = "ev_ReachedWaypoint04", Value = 0},
--			EntityValueSet {Name = "ev_ReachedWaypoint05", Value = 0},
--			EntityValueSet {Name = "ev_ReachedWaypoint06", Value = 0},
--			EntityValueSet {Name = "ev_ReachedWaypoint07", Value = 0},
--			EntityValueSet {Name = "ev_ReachedWaypoint08", Value = 0},
--			EntityValueSet {Name = "ev_ReachedWaypoint09", Value = 0},
		},
	};

};
State
{
	StateName = "LetsGo",
		
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP1, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP1"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP1"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP2},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP2, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP2"},
		},
	},
	OnOneTimeEvent
	{
		
		GotoState	= "Camp1",
		Conditions = 
		{
		--	EntityFlagIsTrue  {Name = "ef_AtWP2"},
			MapFlagIsTrue	  {Name = "mf_UndeadCamp01Destroyed"},
		},
		Actions =
		{
		},
	},
};

State
{
	StateName = "Camp1",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP3},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP3, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP3"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP3"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP4},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP4, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP4"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP4"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP5},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP5, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP5"},
		},
	},
	OnOneTimeEvent
	{
		
		GotoState	= "Camp2",
		Conditions = 
		{
			MapFlagIsTrue	  {Name = "mf_UndeadCamp02Destroyed"},
			--EntityFlagIsTrue  {Name = "ef_AtWP5"},
		},
		Actions =
		{
		},
	},
};

State
{
	StateName = "Camp2",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP6},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP6, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP6"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP6"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP7},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP7, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP7"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP7"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP8},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP8, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP8"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP8"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP9},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP9, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP9"},
		},
	},
		OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP9"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP10},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP10, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP10"},
		},
	},

	OnOneTimeEvent
	{
		
		GotoState	= "Camp3",
		Conditions = 
		{
			MapFlagIsTrue	  {Name = "mf_UndeadCamp03Destroyed"},
			--EntityFlagIsTrue	{Name = "ef_AtWP10"},
		},
		Actions =
		{
		},
	},
};

State
{
	StateName = "Camp3",
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP11},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP11, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP11"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP11"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP12},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP12, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP12"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP12"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP13},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP13, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP13"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP13"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP14},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP14, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP14"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP14"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP15},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP15, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP15"},
		},
	},	

	
	OnOneTimeEvent
	{
		
		GotoState	= "Camp4",
		Conditions = 
		{
			--EntityFlagIsTrue	{Name = "ef_AtWP15"},
			MapFlagIsTrue	  	{Name = "mf_UndeadCamp04Destroyed"},
		},
		Actions =
		{
		},
	},
};

State
{
	StateName = "Camp4",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP16},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP16, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP16"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP16"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP17},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP17, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP17"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP17"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP18},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP18, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP18"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP18"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP19},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP19, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP19"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP19"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP20},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP20, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP20"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP20"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP21},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP21, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP21"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP21"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP22},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP22, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP22"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP22"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP23},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP23, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP23"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP23"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP24},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP24, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP24"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP24"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP25},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP25, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP25"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP25"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP26},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP26, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP26"},
		},
	},
	
	
	OnOneTimeEvent
	{
		
		GotoState	= "CryptSealed",
		Conditions = 
		{
			QuestIsSolved	  {Quest = "CloseCrypt"},
			--EntityFlagIsTrue  {Name = "ef_AtWP26"},
		},
		Actions =
		{
		},
	},
};

State
{
	StateName = "CryptSealed",
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP27},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP27, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP27"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP27"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP28},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP28, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP28"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP28"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP29},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP29, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP29"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP29"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP30},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP30, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP30"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP30"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP31},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP31, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP31"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP31"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP32},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP32, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP32"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP32"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP33},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP33, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP33"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP33"},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = WP34},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = WP34, Range = 1},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP34"},
		},
	},		
	OnOneTimeEvent
	{
		GotoState = "GoThroughPortal",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_FalkmarAtPortal"},
		},
		Actions    = 
		{
		},
	},
};
State
{
	StateName = "GoThroughPortal",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions    = 
		{
			MapValueAdd	   {Name = "mv_HorsesAtGate", Value = 1},
			EntityTimerStart  {Name = "et_DelayTimer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_DelayTimer", Seconds = PortalDelay},
		},
		Actions    = 
		{
			FigureWalkToEntity		{Tag = "default", TargetTag = "NorimarWest"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "NorimarWest", Range = 2},
		},
		Actions    = 
		{
			AvatarValueAdd {Name = "av_P302_HorsesRescued", Value = 1},
			FigureVanish {},
		},
	},		
	
};