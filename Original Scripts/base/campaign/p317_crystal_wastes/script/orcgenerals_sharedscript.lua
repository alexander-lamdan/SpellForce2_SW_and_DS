


HomePointX = {	
				A = 192,
				B = 125,
				C = 140,
				D = 58,
				E = 172,
			}
HomePointY = {	
				A = 180,
				B = 231,
				C = 173,
				D = 162,
				E = 90,
			}
		


State
{
	StateName = "MainScript",

  
	OnIdleRunHomeFake
  	{
  		X = HomePointX[MyCamp], 
  		Y = HomePointY[MyCamp],
  		Conditions = 
  		{
  			AvatarFlagIsTrue {Name = "af_P317_CS01Finished"},
  		},
  		Actions = 
		{
		},
		OneTimeHomeActions =
		{
			FogOfWarRevealAtEntity	{Tag = "default", Range = 20 , Height = default},
		},
  	}, 
  	
}
