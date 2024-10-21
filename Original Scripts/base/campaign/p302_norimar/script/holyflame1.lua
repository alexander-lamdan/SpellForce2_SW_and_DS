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
			MapFlagIsTrue {Name = "mf_FirstFlameLit" }
		},
		Actions =
		{
			
			ObjectChange	{Tag = "default", ObjectId = 923, X = 426.584, Y = 198.02, Direction = 267},
			AtmoZoneChange	{Tag = "AtmoUndead01", AtmoDay = "silence", AtmoNight = "silence"},
		},
		
	},
	
	
};