

State
{
	StateName = "Kalkstein",
	OnOneTimeLeverEvent	
	{
		Lever = "NQ_Westguard07",
		OnConditions = 
		{
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = "pl_Human", ItemId = 118, Amount = 1},
			ObjectVanish	{Tag = "NQ_Westguard07"},
		},
	},
	
	OnOneTimeLeverEvent	
	{
		Lever = "NQ_Westguard08",
		OnConditions = 
		{
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = "pl_Human", ItemId = 117, Amount = 1},
			ObjectVanish	{Tag = "NQ_Westguard08"},
		},
	},

};
