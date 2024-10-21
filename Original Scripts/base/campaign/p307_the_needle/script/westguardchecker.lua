

State
{
	StateName = "MainState",
	

	OnEvent
   {
    	
    	Conditions =
    	{
    		AvatarFlagIsFalse {Name = "af_P300_WestguardPlattformChange"},
    		
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue {Name = "af_P300_WestguardPlattformChange"},
       	},
  }, 


	OnEvent
  	{
    	
    	Conditions =
    	{
    		AvatarFlagIsFalse {Name = "af_P313_CraterPlattformChange"},
    		
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue {Name = "af_P313_CraterPlattformChange"},
       	},
  	}, 
	
	                    
};                                                                            