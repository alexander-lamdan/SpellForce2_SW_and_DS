

State
{
	StateName = "StateMinerGhost03",
	 
    --Fullhealth, wenn die Geister in die N�he eines Kristalls kommen
    OnEvent
    {
    	Conditions = 
    	{	
       			FigureIsInRange	{Range = 5, X = MinenKristall03X, Y = MinenKristall03Y},
   				FigureHasNotHealth	{Percent = 100},	
    	 },
    	Actions = 
    	{
    		FigureHealthSet{Percent = 100 },
    		EntityFlagSetFalse	{Name = "ef_MinerGhostEscape03"},
    	},
    },
    
    --Geister fluechten zum Kristall wenn sie weniger als 30% ihrer Hitpoints besitzen
    OnEvent
    {
    	Conditions = 
    	{
    		FigureIsNotInRange	{Range = 5, X = MinenKristall03X, Y = MinenKristall03Y},
    		FigureHasNotHealth	{Percent = 45},
    		EntityFlagIsFalse	{Name = "ef_MinerGhostEscape03"},	
    	},
    	Actions = 
    	{
    		FigureForcedWalk	{X = MinenKristall03X, Y = MinenKristall03Y},
       		EntityFlagSetTrue	{Name = "ef_MinerGhostEscape03"},
    	},
    },
       
   

   
};
