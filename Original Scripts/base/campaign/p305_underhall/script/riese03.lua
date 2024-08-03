


State
{
	StateName = "GolemStart",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SteinGolem03Aktiv"},
			MapTimerIsElapsed	{Name = "mt_RieseTimer03", Seconds = 1},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Riese03", TextTag = "Giants03"},
			MapFlagSetTrue  {Name = "mf_Riese03Alive"},
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Golem03"},   
		},
	},

};
