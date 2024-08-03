State
{
	 --Citadel Part I
	StateName = "MAIN",
	 OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "DemonBoss1"},
    		
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P406_DemonBossReward1"},		
       	},
    },  	
   
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "DemonBoss2"},
    		
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P406_DemonBossReward2"},		
       	},
    },  	
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "DemonBoss3"},
    		
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P406_DemonBossReward3"},		
       	},
    },  	
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "DemonBoss4"},
    		
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P406_DemonBossReward4"},		
       	},
    },  
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "UndeadBoss1"},
    		
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P406_UndeadBossReward1"},		
       	},
    },  
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "UndeadBoss2"},
    		
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P406_UndeadBossReward2"},		
       	},
    },  
    
    --Citadel Part II
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue	{Name = "mf_GuardianDead"},	
    		
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P406_GateMonsterReward"},		
       	},
    },  	
   	OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "CampBoss1"},
    		
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P406_CampBossReward1"},		
       	},
    },  
   OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "CampBoss2"},
    		
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P406_CampBossReward2"},		
       	},
    },  
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "CampBoss3"},
    		
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P406_CampBossReward3"},		
       	},
    },  
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "CampBoss4"},
    		
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P406_CampBossReward4"},		
       	},
    },  
      
};   
    
    
    
	