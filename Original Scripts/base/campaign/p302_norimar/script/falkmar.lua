WP1  = "wp1cf"
WP2  = "wp2cf"
WP3  = "wp3cf"
WP4  = "wp4cf"
WP5  = "wp5cf"
WP6  = "wp6cf"
WP7  = "wp7cf"
WP8  = "wp8cf"
WP9  = "wp9cf"
WP10 = "wp10cf"
WP11 = "wp11cf"
WP12 = "wp12cf"
WP13 = "wp13cf"
WP14 = "wp14cf"
WP15 = "wp15cf"
WP16 = "wp16cf"
WP17 = "wp17cf"
WP18 = "wp18cf"
WP19 = "wp19cf"
WP20 = "wp20cf"
WP21 = "wp21cf"
WP22 = "wp22cf"
WP23 = "wp23cf"
WP24 = "wp24cf"
WP25 = "wp25cf"
WP26 = "wp26cf"
WP27 = "wp27cf"
WP28 = "wp28cf"
WP29 = "wp29cf"
WP30 = "wp30cf"
WP31 = "wp31cf"
WP32 = "wp32cf"
WP33 = "wp33cf"
WP34 = "wp34cf"


PortalDelay = 5


State
{
	StateName = "INIT",

	--Falkmars Reise zum Aufbauplatz
	
	-- Von WP1 zu WP2
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "Falkmar", TargetTag = "FalkmarWp1", Range = 1.5},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_FalkmarAtWP1"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse			{Name = "mf_RTSPartStart"},
			EntityFlagIsFalse   	{Name = "ef_FalkmarEmergencyFlag"},
			EntityFlagIsTrue 	   {Name = "ef_FalkmarAtWP1"},
			FigureIsInEntityRange  {Tag  = "pl_HumanAvatar", TargetTag = "Falkmar", Range = 7},
		},
		Actions    = 
		{
			FigureForcedRunToEntity		{Tag = "Falkmar", TargetTag = "FalkmarWp2"},
		},
	},
	
	-- Von WP2 zu WP3
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "Falkmar", TargetTag = "FalkmarWp2", Range = 1.5},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_FalkmarAtWP2"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse			{Name = "mf_RTSPartStart"},
			EntityFlagIsFalse   	{Name = "ef_FalkmarEmergencyFlag"},
			EntityFlagIsTrue 	   {Name = "ef_FalkmarAtWP2"},
			FigureIsInEntityRange  {Tag  = "pl_HumanAvatar", TargetTag = "Falkmar", Range = 15},
		},
		Actions    = 
		{
			FigureForcedRunToEntity		{Tag = "Falkmar", TargetTag = "FalkmarWp3"},
		},
	},
	
	-- Von WP3 zu WP4
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "Falkmar", TargetTag = "FalkmarWp3", Range = 1.5},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_FalkmarAtWP3"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse			{Name = "mf_RTSPartStart"},
			EntityFlagIsFalse   	{Name = "ef_FalkmarEmergencyFlag"},
			EntityFlagIsTrue 	   {Name = "ef_FalkmarAtWP3"},
			FigureIsInEntityRange  {Tag  = "pl_HumanAvatar", TargetTag = "Falkmar", Range = 15},
		},
		Actions    = 
		{
			FigureForcedRunToEntity		{Tag = "Falkmar", TargetTag = "FalkmarWp4"},
		},
	},	

	-- Von WP4 zu WP5
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "Falkmar", TargetTag = "FalkmarWp4", Range = 1.5},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_FalkmarAtWP4"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse			{Name = "mf_RTSPartStart"},
			EntityFlagIsFalse   	{Name = "ef_FalkmarEmergencyFlag"},
			EntityFlagIsTrue 	   {Name = "ef_FalkmarAtWP4"},
			FigureIsInEntityRange  {Tag  = "pl_HumanAvatar", TargetTag = "Falkmar", Range = 15},
		},
		Actions    = 
		{
			FigureForcedRunToEntity		{Tag = "Falkmar", TargetTag = "FalkmarWp5"},
		},
	},		
	
	-- Von WP5 zu WP6
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "Falkmar", TargetTag = "FalkmarWp5", Range = 1.5},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_FalkmarAtWP5"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse			{Name = "mf_RTSPartStart"},
			EntityFlagIsFalse   	{Name = "ef_FalkmarEmergencyFlag"},
			EntityFlagIsTrue 	   {Name = "ef_FalkmarAtWP5"},
			FigureIsInEntityRange  {Tag  = "pl_HumanAvatar", TargetTag = "Falkmar", Range = 15},
		},
		Actions    = 
		{
			FigureForcedRunToEntity		{Tag = "Falkmar", TargetTag = "FalkmarWp6"},
		},
	},		
	
	-- Von WP6 zu WP7
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "Falkmar", TargetTag = "FalkmarWp6", Range = 1.5},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_FalkmarAtWP6"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse			{Name = "mf_RTSPartStart"},
			EntityFlagIsFalse   	{Name = "ef_FalkmarEmergencyFlag"},
			EntityFlagIsTrue 	   {Name = "ef_FalkmarAtWP6"},
			FigureIsInEntityRange  {Tag  = "pl_HumanAvatar", TargetTag = "Falkmar", Range = 15},
		},
		Actions    = 
		{
			FigureForcedRunToEntity		{Tag = "Falkmar", TargetTag = "FalkmarWp7"},
		},
	},		
	
	-- Von WP7 zu WP8
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "Falkmar", TargetTag = "FalkmarWp7", Range = 1.5},
		},
		Actions    = 
		{
			EntityFlagSetTrue	{Name = "ef_FalkmarAtWP7"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse			{Name = "mf_RTSPartStart"},
			EntityFlagIsFalse   	{Name = "ef_FalkmarEmergencyFlag"},
			EntityFlagIsTrue 	   	{Name = "ef_FalkmarAtWP7"},
			FigureIsInEntityRange  	{Tag  = "pl_HumanAvatar", TargetTag = "Falkmar", Range = 15},
		},
		Actions    = 
		{
			FigureForcedRunToEntity		{Tag = "Falkmar", TargetTag = "FalkmarWp8"},
		},
	},	
	
	-- Notlösung, falls Spieler Falkmar überholt:
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsInEntityRange		{Tag = "HumanHeadquarter", TargetTag = "pl_HumanAvatar", Range = 20},
				FigureTeamIsInRange	{Team = "tm_HumanTeam", X = 350, Y = 484, Range = 7},
			},
			FigureIsNotInEntityRange	{Tag = "HumanHeadquarter", TargetTag = "Falkmar", Range = 20},
		},
		Actions    = 
		{
			FigureForcedRunToEntity		{Tag = "Falkmar", TargetTag = "FalkmarWp8"},
			EntityFlagSetTrue			{Name = "ef_FalkmarEmergencyFlag"},
		},
	},	
	
	OnOneTimeEvent
	{
		GotoState = "LetsGo",
		Conditions = 
		{
			MapFlagIsTrue		{Name = "mf_KonvoiGo"},
		},
		Actions = 
		{
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
	OnIdleGoHomeFake
	{
		X = 126.572, 
		Y = 455.126, 
		Range = 2,
		GotoForced = true,
		UpdateInterval = 0.5,
		Conditions = 
		{
			EntityFlagIsFalse	{Name = "ef_AtWP27"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
		},
		OneTimeHomeActions = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP27"},
		},
	},
	OnIdleGoHomeFake
	{
		X = 126.168, 
		Y = 438.551, 
		Range = 2,
		GotoForced = true,
		UpdateInterval = 0.5,
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP27"},
			EntityFlagIsFalse	{Name = "ef_AtWP28"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
		},
		OneTimeHomeActions = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP28"},
		},
	},
	OnIdleGoHomeFake
	{
		X = 127.068, 
		Y = 410.819, 
		Range = 2,
		GotoForced = true,
		UpdateInterval = 0.5,
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP28"},
			EntityFlagIsFalse	{Name = "ef_AtWP29"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
		},
		OneTimeHomeActions = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP29"},
		},
	},
	OnIdleGoHomeFake
	{
		X = 122.75, 
		Y = 393.18, 
		Range = 2,
		GotoForced = true,
		UpdateInterval = 0.5,
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP29"},
			EntityFlagIsFalse	{Name = "ef_AtWP30"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
		},
		OneTimeHomeActions = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP30"},
		},
	},
	OnIdleGoHomeFake
	{
		X = 127.154, 
		Y = 375.971, 
		Range = 2,
		GotoForced = true,
		UpdateInterval = 0.5,
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP30"},
			EntityFlagIsFalse	{Name = "ef_AtWP31"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
		},
		OneTimeHomeActions = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP31"},
		},
	},
	OnIdleGoHomeFake
	{
		X = 135.682, 
		Y = 359.744, 
		Range = 2,
		GotoForced = true,
		UpdateInterval = 0.5,
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP31"},
			EntityFlagIsFalse	{Name = "ef_AtWP32"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
		},
		OneTimeHomeActions = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP32"},
		},
	},
	OnIdleGoHomeFake
	{
		X = 148.002, 
		Y = 346.925, 
		Range = 2,
		GotoForced = true,
		UpdateInterval = 0.5,
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP32"},
			EntityFlagIsFalse	{Name = "ef_AtWP33"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
		},
		OneTimeHomeActions = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP33"},
		},
	},
	OnIdleGoHomeFake
	{
		X = 155.864,
		Y = 339.513, 
		Range = 2,
		GotoForced = true,
		UpdateInterval = 0.5,
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP33"},
			EntityFlagIsFalse	{Name = "ef_AtWP34"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
		},
		OneTimeHomeActions = 
		{
			EntityFlagSetTrue	{Name = "ef_AtWP34"},
		},
	},
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--		},
--		Actions    = 
--		{
--			FigureWalkToEntity		{Tag = "default", TargetTag = WP27},
--		},
--	},
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			FigureIsInEntityRange {Tag = "default", TargetTag = WP27, Range = 1},
--		},
--		Actions    = 
--		{
--			EntityFlagSetTrue	{Name = "ef_AtWP27"},
--		},
--	},
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			EntityFlagIsTrue	{Name = "ef_AtWP27"},
--		},
--		Actions    = 
--		{
--			FigureWalkToEntity		{Tag = "default", TargetTag = WP28},
--		},
--	},
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			FigureIsInEntityRange {Tag = "default", TargetTag = WP28, Range = 1},
--		},
--		Actions    = 
--		{
--			EntityFlagSetTrue	{Name = "ef_AtWP28"},
--		},
--	},
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			EntityFlagIsTrue	{Name = "ef_AtWP28"},
--		},
--		Actions    = 
--		{
--			FigureWalkToEntity		{Tag = "default", TargetTag = WP29},
--		},
--	},
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			FigureIsInEntityRange {Tag = "default", TargetTag = WP29, Range = 1},
--		},
--		Actions    = 
--		{
--			EntityFlagSetTrue	{Name = "ef_AtWP29"},
--		},
--	},	
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			EntityFlagIsTrue	{Name = "ef_AtWP29"},
--		},
--		Actions    = 
--		{
--			FigureWalkToEntity		{Tag = "default", TargetTag = WP30},
--		},
--	},
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			FigureIsInEntityRange {Tag = "default", TargetTag = WP30, Range = 1},
--		},
--		Actions    = 
--		{
--			EntityFlagSetTrue	{Name = "ef_AtWP30"},
--		},
--	},	
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			EntityFlagIsTrue	{Name = "ef_AtWP30"},
--		},
--		Actions    = 
--		{
--			FigureWalkToEntity		{Tag = "default", TargetTag = WP31},
--		},
--	},
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			FigureIsInEntityRange {Tag = "default", TargetTag = WP31, Range = 1},
--		},
--		Actions    = 
--		{
--			EntityFlagSetTrue	{Name = "ef_AtWP31"},
--		},
--	},	
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			EntityFlagIsTrue	{Name = "ef_AtWP31"},
--		},
--		Actions    = 
--		{
--			FigureWalkToEntity		{Tag = "default", TargetTag = WP32},
--		},
--	},
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			FigureIsInEntityRange {Tag = "default", TargetTag = WP32, Range = 1},
--		},
--		Actions    = 
--		{
--			EntityFlagSetTrue	{Name = "ef_AtWP32"},
--		},
--	},	
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			EntityFlagIsTrue	{Name = "ef_AtWP32"},
--		},
--		Actions    = 
--		{
--			FigureWalkToEntity		{Tag = "default", TargetTag = WP33},
--		},
--	},
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			FigureIsInEntityRange {Tag = "default", TargetTag = WP33, Range = 1},
--		},
--		Actions    = 
--		{
--			EntityFlagSetTrue	{Name = "ef_AtWP33"},
--		},
--	},	
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			EntityFlagIsTrue	{Name = "ef_AtWP33"},
--		},
--		Actions    = 
--		{
--			FigureWalkToEntity		{Tag = "default", TargetTag = WP34},
--		},
--	},
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			FigureIsInEntityRange {Tag = "default", TargetTag = WP34, Range = 1},
--		},
--		Actions    = 
--		{
--			EntityFlagSetTrue	{Name = "ef_AtWP34"},
--		},
--	},		
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AtWP34"},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "Falkmar", Range = 10},
		},
		Actions    = 
		{
			MapValueAdd	   {Name = "mv_HorsesAtGate", Value = 1},
			EntityTimerStart  {Name = "et_DelayTimer"},
			MapFlagSetTrue {Name = "mf_NoGameOver"},
			MapFlagSetTrue {Name = "mf_FalkmarAtPortal"},
		},
	},
	
	OnOneTimeEvent
	{
		GotoState = "GoThroughPortal",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_DelayTimer", Seconds = PortalDelay},
		},
		Actions = 
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