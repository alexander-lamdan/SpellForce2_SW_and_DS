
State
{
	StateName = "MainState",
	
	----------------------------------------------------------------------
	--------------------------- RESIDENTS --------------------------------
	----------------------------------------------------------------------
   
    OnOneTimeEvent
    {
    	Conditions =
    	{
    	},
    	Actions =
    	{
    		 MapTimerStart{Name = "mt_ResidentTimer"},
    		 AvatarValueSet	{Name = "av_P304_ResidentCounter", Value = 1},
    	},
    },
    
    -- Um zu verhindern, daﬂ alle Residents zum selben Zeitpunkt loslaufen (Performanceinbruch)
    -- z‰hlt der Counter nicht wie bisher bis 20 hoch, sondern bis 200
    -- und die Residents laufen nicht bei 1,2,3,4,5 ... 10 los
    -- sondern bei 10*x + individualsumme
    -- wobei x von 0 bis 19 geht
    -- und individualsumme 1,2,3,4,5 ... 10 sein kann
    -- d.h. ein NPC mit individualsumme == 1 l‰uft also bei 1,11,21,31 etc. los
    -- ein NPC mit individualsumme == 7 bei 7,17,27,37 etc.
    
    
    OnEvent
    {
    	Conditions = 
    	{	
    		MapTimerIsElapsed {Name = "mt_ResidentTimer", Seconds = 10},
    		AvatarValueIsLess{Name = "av_P304_ResidentCounter", Value = 200},
    	 },
    	Actions = 
    	{
    		 AvatarValueAdd{Name = "av_P304_ResidentCounter", Value = 1},
    		 MapTimerStart{Name = "mt_ResidentTimer"},
    	},
    },
    
    
    OnEvent
    {
    	Conditions = 
    	{
    		MapTimerIsElapsed {Name = "mt_ResidentTimer", Seconds = 10},
    		AvatarValueIsEqual{Name = "av_P304_ResidentCounter", Value = 200},
    	 },
    	Actions = 
    	{
    		 AvatarValueSet	{Name = "av_P304_ResidentCounter", Value = 1},
    		 MapTimerStart{Name = "mt_ResidentTimer"},
    	},
    },
       
   
	----------------------------------------------------------------------
	------------------------ ENDE RESIDENTS ------------------------------
	----------------------------------------------------------------------
   
   
   OnOneTimeEvent
    {
    	Conditions =
    	{
    	},
    	Actions =
    	{
    		 MapTimerStart{Name = "mt_WatchmanTimer"},
    		 MapValueSet{Name = "mv_WatchmanCounter", Value = 1},
    	},
    },
 
 	OnEvent
    {
    	Conditions = 
    	{	
    		MapTimerIsElapsed {Name = "mt_WatchmanTimer", Seconds = 15},
    		MapValueIsLess{Name = "mv_WatchmanCounter", Value = 7},
    	 },
    	Actions = 
    	{
    		 MapValueAdd{Name = "mv_WatchmanCounter", Value = 1},
    		 MapTimerStart{Name = "mt_WatchmanTimer"},
    	},
    },
    
    OnEvent
    {
    	Conditions = 
    	{	
    		MapTimerIsElapsed {Name = "mt_WatchmanTimer", Seconds = 15},
    		MapValueIsEqual{Name = "mv_WatchmanCounter", Value = 7},
    	 },
    	Actions = 
    	{
    		 MapValueSet{Name = "mv_WatchmanCounter", Value = 1},
    		 MapTimerStart{Name = "mt_WatchmanTimer"},
    	},
    },
	
}
