
State
{
	StateName = "StateMinerGhost08",
	 
    --Fullhealth, wenn die Geister in die Nähe eines Kristalls kommen
    OnEvent
    {
    	Conditions = 
    	{	
       			FigureIsInRange	{Range = 5, X = MinenKristall08X, Y = MinenKristall08Y},
   				FigureHasNotHealth	{Percent = 100},	
    	 },
    	Actions = 
    	{
    		FigureHealthSet{Percent = 100 },
    		EntityFlagSetFalse	{Name = "ef_MinerGhostEscape08"},
    	},
    },
    
    --Geister fluechten zum Kristall wenn sie weniger als 30% ihrer Hitpoints besitzen
    OnEvent
    {
    	Conditions = 
    	{
    		FigureIsNotInRange	{Range = 5, X = MinenKristall08X, Y = MinenKristall08Y},
    		FigureHasNotHealth	{Percent = 45},
    		EntityFlagIsFalse	{Name = "ef_MinerGhostEscape08"},	
    	},
    	Actions = 
    	{
    		FigureForcedWalk	{X = MinenKristall08X, Y = MinenKristall08Y},
       		EntityFlagSetTrue	{Name = "ef_MinerGhostEscape08"},
    	},
    },
       
   

   
};
