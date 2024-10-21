

State
{
	StateName = "Kalkstein",
	OnOneTimeLeverEvent	
	{
		Lever = "NQ_Westguard01",
		OnConditions = 
		{
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = "pl_Human", ItemId = 118, Amount = 1},
			ObjectVanish	{Tag = "NQ_Westguard01"},
		},
	},
	OnOneTimeLeverEvent	
	{
		Lever = "NQ_Westguard02",
		OnConditions = 
		{
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = "pl_Human", ItemId = 118, Amount = 1},
			ObjectVanish	{Tag = "NQ_Westguard02"},
		},
	},



};
