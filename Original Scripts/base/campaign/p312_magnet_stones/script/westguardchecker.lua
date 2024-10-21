

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
			QuestIsActive	{Quest = "Recipe2GetSingingShard"},
			AvatarHasItemMisc	{ItemId = 212, Amount = 1},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "Recipe2GetSingingShard"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "Recipe2Whisperstone"},
			QuestIsSolved	{Quest = "Recipe2VulcansteelHilts"},
			QuestIsSolved	{Quest = "Recipe2PerfectBeastHide"},
			QuestIsSolved	{Quest = "Recipe2GetSingingShard"},
		},
		Actions =
		{
			AvatarFlagSetTrue{Name = "af_P300_JandrimsItemsBReady"},
			QuestSetActive	{Quest = "Recipe2BringStuffToJandrim"},
		},
		
	},
	
	
	                    
};                                                                            