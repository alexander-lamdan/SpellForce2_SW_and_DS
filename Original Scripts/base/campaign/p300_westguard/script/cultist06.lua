
State
{
	StateName = "INIT",

	
	OnFigureSpawnOnlyWhenEvent
	{
		
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
			MapFlagIsTrue{Name = "mf_ThurAttack"},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_Cultist06Alive"},
		},
		
	},

};




