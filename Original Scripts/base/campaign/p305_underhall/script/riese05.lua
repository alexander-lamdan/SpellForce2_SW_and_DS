--
--
--
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
--		},
--		GotoState = "GolemStart"
--	},
--}
--State
--{
--	StateName = "GolemStart",
--	OnFigureSpawnOnlyWhenEvent
--	{
--		X = GetEntityX(),
--		Y = GetEntityY(),
--		Conditions = 
--		{
--			MapFlagIsTrue {Name = "mf_SteinGolem05Aktiv"},
--			MapTimerIsElapsed	{Name = "mt_RieseTimer05", Seconds = 1},
--			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden geh�ren zusammen, deswegen beide in einer zeile!
--		},
--		Actions = 
--		{
--			FigureOutcry	{Tag = "Riese05", TextTag = "Giants02"},
--			MapFlagSetTrue  {Name = "mf_Riese05Alive"},
--			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Golem05"},   
--		},
--	},
--
--};
