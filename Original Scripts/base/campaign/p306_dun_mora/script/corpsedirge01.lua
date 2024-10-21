State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		GotoState = "Dialog",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Exhauster1DialogEnded"},
			QuestIsActive	{Player = "default", Quest = "Befreie_ersten_Geist"},
			FigureIsDead	{Tag = "LeichenDaemon01"}, --Bewacher-Daemonen muessen tot sein
			FigureIsDead	{Tag = "LeichenDaemon02"},
			FigureIsDead	{Tag = "LeichenDaemon03"},
			FigureIsDead	{Tag = "LeichenDaemon04"},
			FigureIsDead	{Tag = "LeichenDaemon05"},
			FigureIsDead	{Tag = "LeichenDaemon06"},
			
		},
		
		Actions = 
		{
			DialogTypeSetMainQuest {Tag = "CorpseDirge01"},
			DialogSetEnabled	{Tag = "CorpseDirge01"},
			MapFlagSetTrue {Name = "mf_CorpseDialogOn"},
		},                      
                                
	},                          
	                            
}                               
 

State
{
	StateName = "Dialog",
	
	OnOneTimeEvent
	{
		GotoState = "Off",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CorpseDirgeGetsBurried"},
		},
		
		Actions = 
		{
			ObjectChange	{Tag = "default", ObjectId = 610, X = 410.391, Y = 256.431, Direction = 0},
			MapFlagSetTrue {Name = "mf_BurrialDone"},
			--DialogSetDisabled	{Tag = "CorpseDirge01"},
		},                      
                                
	},                          
	                            
} 

State
{
	StateName = "Off",
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_BurrialDone"},
		},
		
		Actions = 
		{	
		},                      
                                
	},                          
	                            
}            

          