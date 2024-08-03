 --Wenn Endgegner Titan getötet wurde
   
 State
{
	StateName = "MAIN",
	 OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "EndMonster"},
    		MapFlagIsTrue {Name = "mf_EndMonsterAlive"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P402_EndMonster"},		
       	},
    },  	
   
   
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "MiniBoss1"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P402_MiniBoss1"},		
       	},
    },  	
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "OrcBossWest"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P402_OrcBossWest"},		
       	},
    },  	
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "OrcBossEast"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P402_OrcBossEast"},		
       	},
    },  	
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "OrcCommandant"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P402_OrcCommandant"},		
       	},
    },
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "OrcCommandantEast"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P402_OrcCommandantEast"},		
       	},
    },  	  
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "Kulkar"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P402_Kulkar"},		
       	},
    },  		
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "01OrcPat01"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P402_OrkSkin2"},		
       	},
    },  	
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "OrchautTroop1"},
    		MapFlagIsTrue {Name = "mf_OrcSkin3Alive"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P402_OrkSkin3"},		
       	},
    },  	
     OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "OrkSkin1"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P402_OrkSkin1"},		
       	},
    },  	
    
    
    
};   
    
    
    
	