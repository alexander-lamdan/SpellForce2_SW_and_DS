State
{
	StateName = "MAIN",
	 OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "Geweihter01"},
    		
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P410_GeweihterReward01"},		
       	},
    },  	
   
   
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "Geweihter02"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P410_GeweihterReward02"},		
       	},
    },  	
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "Geweihter03"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P410_GeweihterReward03"},		
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
			MapFlagSetTrue  {Name = "mf_P410_CampBossReward01"},		
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
			MapFlagSetTrue  {Name = "mf_P410_CampBossReward02"},		
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
			MapFlagSetTrue  {Name = "mf_P410_CampBossReward03"},		
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
			MapFlagSetTrue  {Name = "mf_P410_CampBossReward04"},		
       	},
    },  	
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "CampBoss5"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P410_CampBossReward05"},		
       	},
    },  
    --Verschlinger
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue  {Name = "mf_EndbossAlive"},
    		FigureIsDead	{Tag = "Monster"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P410_MonsterReward"},		
       	},
    },  		   
};   
    
    
    
	