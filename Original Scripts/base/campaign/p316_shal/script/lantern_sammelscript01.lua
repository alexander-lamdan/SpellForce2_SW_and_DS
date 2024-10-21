
State
{
	
	StateName = "LanternState",
	OnToggleEvent	
	{
	EventName = "LanternToggle",
		OnConditions = 
		{
			TimeIsBetween	{StartHour = 6, EndHour = 18},
		},
		OnActions = 
		{
			ObjectChange	{ObjectId = 1487, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
		},
		OffConditions = 
		{
			TimeIsNotBetween	{StartHour = 6, EndHour = 18},
		},	
		OffActions =
		{
			ObjectChange	{ObjectId = 1553, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
			
		},
	},
	   
				
   
};
