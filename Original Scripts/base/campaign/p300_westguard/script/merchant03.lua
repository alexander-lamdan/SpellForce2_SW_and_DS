
--State
--{
--	StateName = "INIT",
--	
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--		},
--		Actions =
--		{
--		
--		},
--		GotoState = "MerchantState",
--	},
--}
--
--State
--{
--	StateName = "MerchantState",
--	OnFigureSpawnOnlyWhenEvent
--	{
--		X = GetEntityX(),
--		Y = GetEntityY(),
--		Conditions = 
--		{
--			MapFlagIsTrue{Name = "mf_MerchantSpawn"}, 
--		},
--		Actions = 
--		{
--			MapFlagSetTrue {Name = "mf_Merchant03Alive"},
--		},
--	},
--
--
--
--	
--};
