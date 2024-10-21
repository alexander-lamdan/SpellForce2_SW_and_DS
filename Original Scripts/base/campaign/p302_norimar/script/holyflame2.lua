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
			MapFlagIsTrue { Name = "mf_SecondFlameLit"  }
		},
		Actions =
		{
			ObjectChange	{Tag = "default", ObjectId = 923, X = 498.003, Y = 237.627, Direction = 141},
			AtmoZoneChange	{Tag = "AtmoUndead02", AtmoDay = "silence", AtmoNight = "silence"},
		},
		
	},
	
	
};