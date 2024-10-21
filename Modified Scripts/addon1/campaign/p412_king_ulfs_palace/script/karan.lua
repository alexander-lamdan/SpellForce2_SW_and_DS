--*******************************************************
--***                                                 ***
--***               Palace Addon1					  ***
--***			    Karan			                  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
		
	--Karan begit sich zum König Ulf
	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		MapFlagIsTrue {Name = "mf_KingUlfsQuestSolved"},
    		AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
    	 },
    	Actions = 
    	{
    		FigureRunToEntity	{Tag = "Karan", TargetTag = "Ulf"},
    	},
    	
    },
   
    
};