

State
{
	StateName = "MerchantState",
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_KaufmannSpawn"}, 
		},
		Actions = 
		{
			FigureTeleport	{X = 397, Y = 392.5},
			MapFlagSetTrue {Name = "mf_MerchantAlive"},
			FigureOutcryAlert	{TextTag = "Verwalter05", Tag = "VerwalterUtrecht", TargetTag = "Merchant"},
    		MapValueAdd	{Name = "mv_PlattformChange", Value = 1},
    		FigureSwappingDisable {},
		},
	},
	
	
};
