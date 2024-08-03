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
			MapFlagIsTrue {Name = "mf_FourthFlameLit" }
		},
		Actions =
		{
			ObjectChange	{Tag = "default", ObjectId = 923, X = 454.996, Y = 334.529, Direction = 226},
			AtmoZoneChange	{Tag = "AtmoUndead04", AtmoDay = "silence", AtmoNight = "silence"},
		},
		
	},
	
	
};