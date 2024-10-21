RangePlayer = 20
RangeFog = 15

State
{	
	StateName = "InitState",
--*******************************************************
--***                                                 ***
--***               	InitState	 		          ***
--***                                                 ***
--*******************************************************		

--*******************************************************
--***                                                 ***
--***           PipelineSouth		 		          ***
--***                                                 ***
--*******************************************************			
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "FOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "FOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "FOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "FOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "FOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "FOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "FOG1", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 338, Y = 312, Range = RangeFog, Height = 128},		
		},  
		    
	},      
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "FOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "FOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "FOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "FOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "FOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "FOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "FOG2", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 352, Y = 312, Range = RangeFog, Height = 128},		
		},  
		    
	},      	    
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "FOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "FOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "FOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "FOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "FOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "FOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "FOG3", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 340, Y = 306, Range = RangeFog, Height = 115},		
		},  
		    
	},      	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "FOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "FOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "FOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "FOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "FOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "FOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "FOG4", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 352, Y = 306, Range = RangeFog, Height = 115},		
		},  
		    
	}, 
	
	     	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "FOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "FOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "FOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "FOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "FOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "FOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "FOG5", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 338, Y = 285, Range = RangeFog, Height = 115},		
		},  
		    
	},    
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "FOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "FOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "FOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "FOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "FOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "FOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "FOG6", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 335, Y = 285, Range = RangeFog, Height = 115},		
		},  
		    
	},      
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "FOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "FOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "FOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "FOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "FOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "FOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "FOG7", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 340, Y = 280, Range = RangeFog, Height = 105},		
		},  
		    
	},      
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "FOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "FOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "FOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "FOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "FOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "FOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "FOG8", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 352, Y = 280, Range = RangeFog, Height = 105},		
		},  
		    
	},      

--*******************************************************
--***                                                 ***
--***           PipelineWest		 		          ***
--***                                                 ***
--*******************************************************			
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "WestFOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "WestFOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "WestFOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "WestFOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "WestFOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "WestFOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "WestFOG1", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 308, Y = 351, Range = RangeFog, Height = 125},		
		},  
		    
	},      

	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "WestFOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "WestFOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "WestFOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "WestFOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "WestFOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "WestFOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "WestFOG2", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 308, Y = 340, Range = RangeFog, Height = 125},		
		},  
		    
	},      

	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "WestFOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "WestFOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "WestFOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "WestFOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "WestFOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "WestFOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "WestFOG3", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 301, Y = 351, Range = RangeFog, Height = 115},		
		},  
		    
	},       
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "WestFOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "WestFOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "WestFOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "WestFOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "WestFOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "WestFOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "WestFOG4", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 301, Y = 337, Range = RangeFog, Height = 115},		
		},  
		    
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "WestFOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "WestFOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "WestFOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "WestFOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "WestFOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "WestFOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "WestFOG5", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 284, Y = 351, Range = RangeFog, Height = 115},		
		},  
		    
	},  
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "WestFOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "WestFOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "WestFOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "WestFOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "WestFOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "WestFOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "WestFOG6", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 284, Y = 337, Range = RangeFog, Height = 115},		
		},  
		    
	},     
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "WestFOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "WestFOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "WestFOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "WestFOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "WestFOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "WestFOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "WestFOG7", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 277, Y = 352, Range = RangeFog, Height = 105},		
		},  
		    
	},       	   
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "WestFOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "WestFOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "WestFOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "WestFOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "WestFOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "WestFOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "WestFOG8", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 277, Y = 337, Range = RangeFog, Height = 105},		
		},  
		    
	},       	       

--*******************************************************
--***                                                 ***
--***           PipelineEast		 		          ***
--***                                                 ***
--*******************************************************			
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "EastFOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "EastFOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "EastFOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "EastFOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "EastFOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "EastFOG1", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "EastFOG1", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 382, Y = 338, Range = RangeFog, Height = 125},		
		},  
		    
	},      	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "EastFOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "EastFOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "EastFOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "EastFOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "EastFOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "EastFOG2", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "EastFOG2", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 382, Y = 351, Range = RangeFog, Height = 125},		
		},  
		    
	},      
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "EastFOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "EastFOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "EastFOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "EastFOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "EastFOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "EastFOG3", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "EastFOG3", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 390, Y = 338, Range = RangeFog, Height = 115},		
		},  
		    
	},     
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "EastFOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "EastFOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "EastFOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "EastFOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "EastFOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "EastFOG4", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "EastFOG4", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 390, Y = 354, Range = RangeFog, Height = 115},		
		},  
		    
	},       
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "EastFOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "EastFOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "EastFOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "EastFOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "EastFOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "EastFOG5", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "EastFOG5", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 406, Y = 338, Range = RangeFog, Height = 115},		
		},  
		    
	},       
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "EastFOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "EastFOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "EastFOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "EastFOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "EastFOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "EastFOG6", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "EastFOG6", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 406, Y = 352, Range = RangeFog, Height = 115},		
		},  
		    
	},       
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "EastFOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "EastFOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "EastFOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "EastFOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "EastFOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "EastFOG7", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "EastFOG7", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 413, Y = 337, Range = RangeFog, Height = 105},		
		},  
		    
	},       
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "EastFOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroYasha", TargetTag = "EastFOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "EastFOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "EastFOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "EastFOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroMordecay", TargetTag = "EastFOG8", Range = RangePlayer},
				FigureIsInRangeToEntity	{Tag = "pl_HumanNightsong", TargetTag = "EastFOG8", Range = RangePlayer},
			},
		},
		Actions =
		{
			FogOfWarReveal	{X = 413, Y = 352, Range = RangeFog, Height = 105},		
		},  
		    
	},       
	  	          	       	 	        
};          
            
            
            
            
            
            
            
            
            
            
            
            