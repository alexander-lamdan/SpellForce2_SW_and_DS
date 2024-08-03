


State
{
	StateName = "GolemStart",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SteinGolem06Aktiv"},
			MapTimerIsElapsed	{Name = "mt_RieseTimer06", Seconds = 1},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Riese06", TextTag = "Giants02"},
			MapFlagSetTrue  {Name = "mf_Riese06Alive"},
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Golem06"},   
		},
	},

};
