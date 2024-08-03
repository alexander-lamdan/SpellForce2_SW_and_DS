State
{
	StateName = "INIT",	
	
	OnOneTimeEvent
	{
		GotoState = "LightMyFire",
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
	StateName = "LightMyFire",
	
	OnOneTimeEvent
	{
		Conditions = 
		{ 
			MapFlagIsTrue {Name = "mf_FifthFlameLit" }
		},
		Actions =
		{
			ObjectChange	{Tag = "default", ObjectId = 923, X = 240.994, Y = 464.013, Direction = 350.679},
			AtmoZoneChange	{Tag = "AtmoUndead05", AtmoDay = "silence", AtmoNight = "silence"},
		},
		
	},
	
	
};