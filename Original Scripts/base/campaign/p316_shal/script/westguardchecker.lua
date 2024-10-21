
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
			QuestIsActive	{Quest = "Recipe3Dragonskin"},
			AvatarHasItemMisc	{ItemId = 214, Amount = 1},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "Recipe3Dragonskin"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "Recipe3LivingRunes"},
			QuestIsSolved	{Quest = "Recipe3TeartemperedBlade"},
			QuestIsSolved	{Quest = "Recipe3Dragonskin"},
		},
		Actions =
		{
			AvatarFlagSetTrue{Name = "af_P300_JandrimsItemsCReady"},
			QuestSetActive	{Quest = "Recipe3ReturnJandrim"},
		},
		
	},
	
	                    
};                                                                            