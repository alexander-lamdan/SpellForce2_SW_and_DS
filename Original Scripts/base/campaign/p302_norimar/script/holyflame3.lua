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
			MapFlagIsTrue {Name = "mf_ThirdFlameLit" }
		},
		Actions =
		{
			ObjectChange	{Tag = "default", ObjectId = 923, X = 586.418, Y = 323.566, Direction = 221},
			AtmoZoneChange	{Tag = "AtmoUndead03", AtmoDay = "silence", AtmoNight = "silence"},
		},
		
	},
	
	
};