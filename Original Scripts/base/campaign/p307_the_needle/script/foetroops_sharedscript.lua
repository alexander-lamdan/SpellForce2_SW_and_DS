


BustedVariable = {	A = "af_P307_Camp1Busted",
					C = "af_P307_Camp3Busted"}
					
---- Flag, das zeigt, ob das entsprechende Camp gebusted wurde

AttackPointX = { 
					--A = 172 + (math.random(6)-3),
					--C = 262 + (math.random(6)-3)
					A = 219 + (math.random(8)-4),
					C = 219 + (math.random(8)-4)
				}
AttackPointY = { 
					--A = 371 + (math.random(6)-3),
					--C = 147 + (math.random(6)-3)
					A = 263 + (math.random(8)-4),
					C = 263 + (math.random(8)-4)
				}
  


State
{
	StateName = "MainScript",

   
	OnFigureRespawnEvent
		{
			WaitTime = 120,
			X = GetEntityX(),
			Y = GetEntityY(),
			Conditions = 
			{
				AvatarFlagIsFalse {Name = BustedVariable[MyCamp] },
			},
			Actions = 
			{
			},
			DeathActions = 
			{
			},
		};
  
  
	OnIdleRunHomeFake
  	{
  		UpdateInterval = 50,
  		X = AttackPointX[MyCamp], Y = AttackPointY[MyCamp],
  		Conditions = 
  		{
  			AvatarFlagIsTrue {Name = "af_P307_OrcAttacksStart"},
  		},
  		Actions = 
		{
		},
  	},

	
	
  
   
};
