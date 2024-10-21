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
			MapFlagIsTrue {Name = "mf_SixthFlameLit" }
		},
		Actions =
		{
			ObjectChange	{Tag = "default", ObjectId = 923, X = 279.998, Y = 587.307, Direction = 196},
			AtmoZoneChange	{Tag = "AtmoUndead06", AtmoDay = "silence", AtmoNight = "silence"},
		},
		
	},
	
	
};