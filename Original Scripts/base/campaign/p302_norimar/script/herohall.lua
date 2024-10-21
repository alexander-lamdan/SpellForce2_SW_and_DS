	State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		GotoState = "Activate",
		
		Actions = 
		{
		},
		
		Conditions = 
		{
		},
		
	},
	
};

State
{
	StateName = "Activate",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			PlayerKitTransfer	{PlayerKit = "pk_HeroHall", Player = "pl_Human"},
			FigureRtsKitSpawn	{UnitId = 77, X = 557 , Y = 59, PlayerKit = "pk_HeroesFake", Tag = "Bor", Level = 3},
			FigureRtsKitSpawn	{UnitId = 78, X = 561,  Y = 54, PlayerKit = "pk_HeroesFake", Tag = "Lya", Level = 3},
			PlayerKitTransfer 	{Player = "pl_Human", PlayerKit = "pk_HeroesFake"},
			
			FigureOutcry		{Tag = "Bor", TextTag = "Bor1"},
			FigureOutcry		{Tag = "pl_HumanAvatar", TextTag = "Avatar2"},
			FigureOutcry		{Tag = "Lya", TextTag = "Lya1"},
			
			MapFlagSetTrue		{Name = "mf_GotHeroes"},
		},
		
		Conditions = 
		{
			FigureIsInEntityRange	{TargetTag = "pl_HumanAvatar", Range = 10},
		},
	
	},
	
	
	
};

