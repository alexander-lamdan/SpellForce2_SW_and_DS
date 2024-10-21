
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
			QuestIsActive	{Quest = "Recipe2VulcansteelHilts"},
			AvatarHasItemMisc	{ItemId = 210, Amount = 2},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "Recipe2VulcansteelHilts"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "Recipe2PerfectBeastHide"},
			AvatarHasItemMisc	{ItemId = 211, Amount = 1},
			AvatarFlagIsTrue{Name = "af_P300_JandrimRecruit"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "Recipe2PerfectBeastHide"},
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