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
			MapFlagIsTrue {Name = "mf_SeventhFlameLit" }
		},
		Actions =
		{
			ObjectChange	{Tag = "default", ObjectId = 923, X = 179.369, Y = 596.119, Direction = 290},
			AtmoZoneChange	{Tag = "AtmoUndead07", AtmoDay = "silence", AtmoNight = "silence"},
		},
		
	},
	
	
};