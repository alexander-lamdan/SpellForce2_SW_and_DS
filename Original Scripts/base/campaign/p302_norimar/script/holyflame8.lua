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
			MapFlagIsTrue {Name = "mf_EigthFlameLit" }
		},
		Actions =
		{
			ObjectChange	{Tag = "default", ObjectId = 923, X = 140.09, Y = 527.293, Direction = 286},
			AtmoZoneChange	{Tag = "AtmoUndead08", AtmoDay = "silence", AtmoNight = "silence"},
		},
		
	},
	
	
};