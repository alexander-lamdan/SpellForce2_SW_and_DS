

State
{
	StateName = "StateMinerGhost02",
	 
    --Fullhealth, wenn die Geister in die Nähe eines Kristalls kommen
    OnEvent
    {
    	Conditions = 
    	{	
       			FigureIsInRange	{Range = 5, X = MinenKristall02X, Y = MinenKristall02Y},
   				FigureHasNotHealth	{Percent = 100},	
    	 },
    	Actions = 
    	{
    		FigureHealthSet{Percent = 100 },
    		EntityFlagSetFalse	{Name = "ef_MinerGhostEscape02"},
    	},
    },
    
    --Geister fluechten zum Kristall wenn sie weniger als 30% ihrer Hitpoints besitzen
    OnEvent
    {
    	Conditions = 
    	{
    		FigureIsNotInRange	{Range = 5, X = MinenKristall02X, Y = MinenKristall02Y},
    		FigureHasNotHealth	{Percent = 45},
    		EntityFlagIsFalse	{Name = "ef_MinerGhostEscape02"},	
    	},
    	Actions = 
    	{
    		FigureForcedWalk	{X = MinenKristall02X, Y = MinenKristall02Y},
       		EntityFlagSetTrue	{Name = "ef_MinerGhostEscape02"},
    	},
    },
       
   

   
};
