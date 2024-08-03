


State
{
	StateName = "GolemStart",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SteinGolem04Aktiv"},
			MapTimerIsElapsed	{Name = "mt_RieseTimer04", Seconds = 1},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Riese04", TextTag = "Giants04"},
			MapFlagSetTrue  {Name = "mf_Riese04Alive"},
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Golem04"},   
		},
	},

};
