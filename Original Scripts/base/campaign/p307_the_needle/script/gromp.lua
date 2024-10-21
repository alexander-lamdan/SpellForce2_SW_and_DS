

State
{
	StateName = "MainState",
	
	

    
    OnIdleRunHomeFake
	{
		X = 562.356,
		Y = 264.414,
		-- Koordinaten des Eingangsportals
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P307_KaraAndGrompGoHome"},
			AvatarIsNotTalking{},
			GameInterfaceIsVisible{},
		},
		Actions = 
		{
		},
		OneTimeHomeActions = 
		{
			FigureVanish{},
		},
	};

  
                                                                      
};                                                                               