State
{
	StateName = "MAIN",
	 OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "Prisoner1"},
    		
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P412_PrisonerReward01"},		
       	},
    },  	
   
   
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "Prisoner2"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P412_PrisonerReward02"},		
       	},
    },  	
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "Prisoner3"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P412_PrisonerReward03"},		
       	},
    },  	
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "Smutje"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P412_SmutjeReward"},		
       	},
    },  
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "Illusionist"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P412_BlessedReward1"},		
       	},
    },  
   OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "Necromancer"},
    		FigureIsDead	{Tag = "NecroGuard1"},
    		FigureIsDead	{Tag = "NecroGuard2"},
    		FigureIsDead	{Tag = "NecroGuard3"},
    		FigureIsDead	{Tag = "NecroGuard4"},
    		FigureIsDead	{Tag = "NecroGuard5"},
    		FigureIsDead	{Tag = "NecroGuard6"},
    		
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P412_BlessedReward2"},		
       	},
    },  
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "ElementalMage"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P412_BlessedReward3"},		
       	},
    },  
    
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_OutcryThiefTreasureroom"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P412_SQTreasureRoom"},		
       	},
    },  
      OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_SpawnWineGhosts"},
    	},
    	Actions =
    	{
			MapTimerStart	{Name = "mt_GhostsSpawnTimer"},
       	},
    },  
      OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "WineGhost1"},
    		FigureIsDead	{Tag = "WineGhost2"},
    		FigureIsDead	{Tag = "WineGhost3"},
    		FigureIsDead	{Tag = "WineGhost4"},
    		MapTimerIsElapsed	{Name = "mt_GhostsSpawnTimer", Seconds = 5},
    	},
    	Actions =
    	{
			MapTimerStop	{Name = "mt_GhostsSpawnTimer"},
			MapFlagSetTrue  {Name = "mf_P412_SQWineGhosts"},		
       	},
    },  
    
};   
    
    
    
	