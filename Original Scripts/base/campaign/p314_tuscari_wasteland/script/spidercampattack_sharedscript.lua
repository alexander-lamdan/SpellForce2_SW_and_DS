


AttackCoordX = 102.54 + (math.random(20)-10)    
AttackCoordY = 243.169 + (math.random(20)-10)    
-- Angriffskoordinate: Hierhin kriechen die Spinnen
-- (es sind die Koordinaten des Spieler-Haupthauses)

State
{
	StateName = "MainScript",

   
	OnFigureRespawnEvent
		{
			WaitTime = MyRespawnWaitTime,
			X = GetEntityX(),
			Y = GetEntityY(),
			Conditions = 
			{
				AvatarFlagIsFalse{Name = "af_P314_SorokMissionFulfilled"},
				AvatarValueIsLess{Name = "av_P314_SoroksSoulRun", Value = MyCave+1},
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
  		UpdateInterval = 30,
  		Range = 15,
  		X = AttackCoordX, Y = AttackCoordY,
  		Conditions = 
  		{
  			AvatarFlagIsTrue {Name = "af_P314_CS01Finished"},
  		},
  		Actions = 
		{
		},
  	},

	
	
  
   
};
