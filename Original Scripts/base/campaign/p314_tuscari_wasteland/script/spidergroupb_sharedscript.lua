MyHomeCaveX = 289.582
MyHomeCaveY = 347.685


State
{
	StateName = "RespawnPart",

   
	OnFigureRespawnEvent
		{
			WaitTime = 120,
			X = MyHomeCaveX,
			Y = MyHomeCaveY,
			Conditions = 
			{
				AvatarFlagIsFalse{Name = "af_P314_SorokMissionFulfilled"},
				AvatarValueIsLess{Name = "av_P314_SoroksSoulRun", Value = 3},
			},
			Actions = 
			{
			},
			DeathActions = 
			{
			},
		};
  
  
	OnIdleGoHomeFake
  	{
  		X = GetEntityX(),
  		Y = GetEntityY(),
  		Conditions = 
  		{
  		},
  		Actions = 
		{
		},
  	},

	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarFlagIsTrue{Name = "af_P314_SorokMissionFulfilled"},
				AvatarValueIsGreaterOrEqual{Name = "av_P314_SoroksSoulRun", Value = 3},
			},
		},
		Actions =
		{
		},
		GotoState = "VanishPart",
	},  
}


State
{
	StateName = "VanishPart",
	
	OnIdleRunHomeFake
  	{
  		X = MyHomeCaveX,
  		Y = MyHomeCaveY,
  		GotoForced = true,
  		Conditions = 
  		{
  		},
  		Actions = 
		{
		},
		HomeActions =
		{
			EntityFlagSetTrue{Name = "ef_Vanish"},
		},
  	},
  	
  	OnOneTimeEvent
  	{
  		Conditions =
  		{
  			EntityFlagIsTrue{Name = "ef_Vanish"},
  		},
  		Actions =
  		{
  			FigureVanish{},
  		},
  	},
	
}