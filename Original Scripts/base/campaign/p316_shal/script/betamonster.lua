
State
{
	StateName = "MainState",
	--Monster rennt ins feindliche Camps sobald er in die Nähe kommt
	OnOneTimeEvent
	{
	
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_MonsterBBefreit"},
			FigureIsInEntityRange	{TargetTag = "FlagAlpha01", Range = 15},
			
		},
		Actions = 
		{
			FigureForcedRun	{X = 26, Y = 149},
		},
	},
	
	OnOneTimeEvent
	{
	
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_MonsterBBefreit"},
			FigureIsInEntityRange	{TargetTag = "FlagAlpha02", Range = 15},
		},
		Actions = 
		{
			FigureForcedRun	{X = 119, Y = 208},
		},
	},
	
	OnOneTimeEvent
	{
	
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_MonsterBBefreit"},
			FigureIsInEntityRange	{TargetTag = "FlagAlpha03", Range = 15},
		},
		Actions = 
		{
			FigureForcedRun	{X = 89, Y = 333},
		},
	},
	
	OnOneTimeEvent
	{
	
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_MonsterBBefreit"},
			FigureIsInEntityRange	{TargetTag = "FlagAlpha04", Range = 15},
		},
		Actions = 
		{
			FigureForcedRun	{X = 162, Y = 279},
		},
	},
		
	OnOneTimeEvent
	{
	
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_MonsterBBefreit"},
			FigureIsInRange	{Range = 20, X = HomePointAlphaX, Y = HomePointAlphaY},
		},
		Actions = 
		{
			FigureForcedRun	{X = HomePointAlphaX, Y = HomePointAlphaY},
		},
	},
	--Beta Camps
	OnOneTimeEvent
	{
	
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_MonsterBBefreit"},
			FigureIsInEntityRange	{TargetTag = "FlagBeta01", Range = 15},
		},
		Actions = 
		{
			FigureForcedRun	{X = 247, Y = 331},
		},
	},
   OnOneTimeEvent
	{
	
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_MonsterBBefreit"},
			FigureIsInEntityRange	{TargetTag = "FlagBeta02", Range = 15},
		},
		Actions = 
		{
			FigureForcedRun	{X = 314, Y = 300},
		},
	},
	OnOneTimeEvent
	{
	
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_MonsterBBefreit"},
			FigureIsInEntityRange	{TargetTag = "FlagBeta03", Range = 15},
		},
		Actions = 
		{
			FigureForcedRun	{X = 306, Y = 222},
		},
	},
	OnOneTimeEvent
	{
	
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_MonsterBBefreit"},
			FigureIsInEntityRange	{TargetTag = "FlagBeta04", Range = 15},
		},
		Actions = 
		{
			FigureForcedRun	{X = 267, Y = 194},
		},
	},
	OnOneTimeEvent
	{
	
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_MonsterBBefreit"},
			FigureIsInEntityRange	{TargetTag = "FlagBeta05", Range = 15},
		},
		Actions = 
		{
			FigureForcedRun	{X = 283, Y = 20},
		},
	},
	OnOneTimeEvent
	{
	
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_MonsterBBefreit"},
			FigureIsInEntityRange	{TargetTag = "FlagBeta06", Range = 15},
		},
		Actions = 
		{
			FigureForcedRun	{X = 189, Y = 127},
		},
	},
	OnOneTimeEvent
	{
	
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_MonsterBBefreit"},
			FigureIsInRange	{Range = 20, X = HomePointBetaX, Y = HomePointBetaY},
		},
		Actions = 
		{
			FigureForcedRun	{X = HomePointBetaX, Y = HomePointBetaY},
		},
	},
   
				
   
};