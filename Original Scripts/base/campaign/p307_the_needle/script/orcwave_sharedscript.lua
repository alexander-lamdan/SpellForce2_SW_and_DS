

AttackPointX = 213 
AttackPointY = 249
-- der Punkt, an den die OrcWave rennt

State
{
	StateName = "MainScript",

   
  
  OnIdleRunHomeFake
  {
  	UpdateInterval = 50,
  	X = AttackPointX + (math.random(8)-4),
  	Y = AttackPointY + (math.random(8)-4),
  	Conditions = 
  	{
  		AvatarFlagIsTrue {Name = "af_P307_OrcWaveGo"},
  	},
  	Actions = 
	{
	},
  },


  
   
};
