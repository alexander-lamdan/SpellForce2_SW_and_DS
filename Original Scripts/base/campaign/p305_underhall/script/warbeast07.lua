
State
{
	StateName = "StateWarBeastDefender01",
	 
   
    OnEvent
    {
    	Conditions = 
    	{	
       		EntityFlagIsFalse {Name = "ef_EinmalSchalter"},	
       		FigureIsNotInRange	{Range = 20, X = 373, Y = 415},	
    	},
    	Actions = 
    	{
    		FigureForcedRun	{X = GetEntityX(), Y = GetEntityY()},
    		EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
    	},
    },
    
   
    OnEvent
    {
    	Conditions = 
    	{
    		EntityFlagIsTrue {Name = "ef_EinmalSchalter"},	
    		FigureIsInRange	{Range = 3, X = 373, Y = 415},	
    	},
    	Actions = 
    	{
    		EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
    	},
    },
       
   

   
};
