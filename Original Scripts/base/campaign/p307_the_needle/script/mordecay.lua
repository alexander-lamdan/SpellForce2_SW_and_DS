
State
{
	StateName = "INIT",
	
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = 433.81,
		Y = 317.00,
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P307_Camp2Busted"},
		},
		Actions = 
		{
			EntityFlagSetTrue{Name = "ef_Spawned"},
		},
		
	},


	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_Spawned"},
		},
		Actions =
		{
    		DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
    		
    		FogOfWarRevealAtEntity	{Tag = "Mordecay", Range = 20 , Height = default},
    		-- Mordecay deckt um sich herum den FOW auf, damit er nicht so leicht
    		-- übersehen werden kann
		},
		GotoState = "MainState"
	},
}


State
{
	StateName = "MainState",
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		OR
    		{
    			AvatarFlagIsTrue {Name = "af_P307_PlayerEnteredBulwark"},
				AvatarFlagIsTrue{Name = "af_P307_CampBulwarkBusted"},
			},
			-- normalerweise wird Mordecay gevanished, wenn man mit ihm den Dialog geführt hat
			-- falls der Spieler aber nie mit ihm den Dialog führt, dann verschwindet er von allein
			-- sobald der Spieler das Bulwark betritt oder zerstört hat
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue{Name = "af_P307_MordecayVanish"},
    	},
    },
    
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P307_MordecayVanish"},
    	},
    	Actions =
    	{
    		DialogSetDisabled{},
    	},   	
    },    
    
    OnIdleRunHomeFake
	{
		X = 573,
		Y = 173,
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P307_MordecayVanish"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			FigureVanish {},
		},
		OneTimeHomeActions = 
		{
		},
	};

                                                     
};                                                                            