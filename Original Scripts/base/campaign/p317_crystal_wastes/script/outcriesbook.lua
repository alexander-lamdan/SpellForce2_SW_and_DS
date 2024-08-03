-------------------------------------------------------------------------------
--
--		Outcry, wenn Spieler einen Teil des Buchs gefunden hat
--
-------------------------------------------------------------------------------

State
{
	StateName = "Main",
	
	OnOneTimeEvent
	{
		Conditions =
		{  
			OR
			{
				AvatarHasItemMisc{ItemId = 48, Amount = 1 },
				AvatarHasItemMisc{ItemId = 49, Amount = 1 },
				AvatarHasItemMisc{ItemId = 50, Amount = 1 },
				AvatarHasItemMisc{ItemId = 51, Amount = 1 },
				AvatarHasItemMisc{ItemId = 52, Amount = 1 },
			},
		},
		Actions = 
		{
			FigureOutcry{TextTag = "BookPartFound01", Tag = "pl_HumanNightsong"},
			FigureOutcry{TextTag = "BookPartFound02", Tag = "pl_HumanNightsong"},
		},
		
	},
	
	
};

	
