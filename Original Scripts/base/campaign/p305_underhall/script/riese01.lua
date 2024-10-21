


State
{
	StateName = "GolemStart",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SteinGolem01Aktiv"},
			MapTimerIsElapsed	{Name = "mt_RieseTimer01", Seconds = 1},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Riese01", TextTag = "Giants01"},
			MapFlagSetTrue  {Name = "mf_Riese01Alive"},
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Golem01"},   
		},
	},

};
