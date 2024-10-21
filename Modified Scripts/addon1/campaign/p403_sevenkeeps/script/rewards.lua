State
{
	StateName = "MAIN",
	OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "ChefTrackCamp1"},
    		QuestIsNotSolved {Quest = "SevenkeepsA1_PortToGhostwatch"},	
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P403_ChefTrackCamp1"},		
       	},
    },
   
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "ChefTrackCamp2"},
    		QuestIsNotSolved {Quest = "SevenkeepsA1_PortToGhostwatch"},	
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P403_ChefTrackCamp2"},		
       	},
    },
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "ChefCamp1"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P403_ChefCamp1"},		
       	},
    },
    
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "ChefCamp2"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P403_ChefCamp2"},		
       	},
    },
    
    
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "ChefCamp3"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P403_ChefCamp3"},		
       	},
    },
    
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "ChefCamp4"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P403_ChefCamp4"},		
       	},
    },
    
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "ChefCamp5"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P403_ChefCamp5"},		
       	},
    },
    
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_HaldorCast"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P403_SkinHaldor"},		
       	},
    },
    
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_EndEndeCS"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P403_KingUlf"},		
       	},
    },
     
    --SQ Farmer 
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		QuestIsSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene1"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P403_Prisoners1"},		
			AvatarGoldGive	{Player = "pl_Human", Amount = 50},
       	},
    },
    
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		QuestIsSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene2"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P403_Prisoners2"},	
			AvatarGoldGive	{Player = "pl_Human", Amount = 50},
       	},
    },
    
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		QuestIsSolved	{Player = "pl_Human", Quest = "Bring_back_Farmer_SaliosGoods"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P403_SaliosGoodsReward"},
			AvatarGoldGive	{Player = "pl_Human", Amount = 50},	
       	},
    },
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		QuestIsSolved	{Player = "pl_Human", Quest = "Bring_back_Farmer_LockeGoods"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P403_LockesGoodsReward"},	
			AvatarGoldGive	{Player = "pl_Human", Amount = 50},	
       	},
    },
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		QuestIsSolved	{Player = "pl_Human", Quest = "Bring_back_Farmer_IdlingGoods"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P403_IdlingsGoodsReward"},
			AvatarGoldGive	{Player = "pl_Human", Amount = 50},		
       	},
    },
    
      	
  };