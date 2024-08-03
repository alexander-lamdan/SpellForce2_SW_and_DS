

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

	
	                    
};                                                                            