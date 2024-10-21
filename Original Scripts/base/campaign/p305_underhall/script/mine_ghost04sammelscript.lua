
State
{
	StateName = "StateMinerGhost04",
	 
    --Fullhealth, wenn die Geister in die Nähe eines Kristalls kommen
    OnEvent
    {
    	Conditions = 
    	{	
       			FigureIsInRange	{Range = 5, X = MinenKristall04X, Y = MinenKristall04Y},
   				FigureHasNotHealth	{Percent = 100},	
    	 },
    	Actions = 
    	{
    		FigureHealthSet{Percent = 100 },
    		EntityFlagSetFalse	{Name = "ef_MinerGhostEscape04"},
    	},
    },
    
    --Geister fluechten zum Kristall wenn sie weniger als 30% ihrer Hitpoints besitzen
    OnEvent
    {
    	Conditions = 
    	{
    		FigureIsNotInRange	{Range = 5, X = MinenKristall04X, Y = MinenKristall04Y},
    		FigureHasNotHealth	{Percent = 45},
    		EntityFlagIsFalse	{Name = "ef_MinerGhostEscape04"},	
    	},
    	Actions = 
    	{
    		FigureForcedWalk	{X = MinenKristall04X, Y = MinenKristall04Y},
       		EntityFlagSetTrue	{Name = "ef_MinerGhostEscape04"},
    	},
    },
       
   

   
};
