

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

--*******************************************************
--***                                                 ***
--***          Jandrims Schmiedekunst NQ              ***
--***                                                 ***
--*******************************************************
    
    OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 162, Amount = 8},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
			QuestIsActive	{Quest = "Recipe1GetCrystals"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "Recipe1GetCrystals"},
			QuestSetActive	{Quest = "Recipe1BringStuffToJandrim"},
			AvatarFlagSetTrue{Name = "af_P300_JandrimsItemsAReady"},
		},
		
	},
	                    
};                                                                            