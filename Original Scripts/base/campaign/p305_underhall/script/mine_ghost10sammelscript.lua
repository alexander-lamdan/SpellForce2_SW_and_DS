
State
{
	StateName = "StateMinerGhost10",
	 
    --Fullhealth, wenn die Geister in die Nähe eines Kristalls kommen
    OnEvent
    {
    	Conditions = 
    	{	
       			FigureIsInRange	{Range = 5, X = MinenKristall10X, Y = MinenKristall10Y},
   				FigureHasNotHealth	{Percent = 100},	
    	 },
    	Actions = 
    	{
    		FigureHealthSet{Percent = 100 },
    		EntityFlagSetFalse	{Name = "ef_MinerGhostEscape10"},
    	},
    },
    
    --Geister fluechten zum Kristall wenn sie weniger als 30% ihrer Hitpoints besitzen
    OnEvent
    {
    	Conditions = 
    	{
    		FigureIsNotInRange	{Range = 5, X = MinenKristall10X, Y = MinenKristall10Y},
    		FigureHasNotHealth	{Percent = 30},
    		EntityFlagIsFalse	{Name = "ef_MinerGhostEscape10"},	
    	},
    	Actions = 
    	{
    		FigureForcedWalk	{X = MinenKristall10X, Y = MinenKristall10Y},
       		EntityFlagSetTrue	{Name = "ef_MinerGhostEscape10"},
    	},
    },
  
   
};
