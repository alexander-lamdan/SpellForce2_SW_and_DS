--*******************************************************
--***                                                 ***
--***               Palace Addon1					  ***
--***			    Thief			                  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	OnFollowEvent	
	{
		TargetTag = "pl_HumanAvatar", 
		OnConditions = 
		{
			MapFlagIsTrue {Name = "mf_ThiefFollow"},
		},
		Actions = 
		{
			
		},
	},
		
	--Wenn alle Secret Doors geöffnet wurden, oder der Spieler den Templeraum betritt verabschiedet sich der Dieb
	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		OR
    		{
    	 			GateIsOpen	{Tag = "SecretDoor5"},
    	 			GateIsOpen	{Tag = "SecretDoor4"},
    	 	},
    	 },
    	Actions = 
    	{
    		MapFlagSetFalse {Name = "mf_ThiefFollow"},
    		MapTimerStart	{Name = "mt_ThiefGoing"},
    	},
    	
    },
   
    --Dieb begibt sich in die Schatzkammer
	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		OR
    		{
    	 			GateIsOpen	{Tag = "SecretDoor5"},
    	 			GateIsOpen	{Tag = "SecretDoor4"},
    	 	},
    		MapTimerIsElapsed	{Name = "mt_ThiefGoing", Seconds = 5},
    	 },
    	Actions = 
    	{
    		--FigureForcedRunToEntity	{TargetTag = "Secret6"},
    		FigureRun	{Tag = "Thief", X = 84, Y = 177},
    		GateSetOpen	{Tag = "SecretDoor3"},
    		GateSetOpen	{Tag = "SecretDoor2"},
    		GateSetOpen	{Tag = "SecretDoor5"},
    		GateSetOpen	{Tag = "SecretDoor1"},
    		GateSetOpen	{Tag = "SecretDoor4"},
    		GateSetOpen	{Tag = "GuradsGate1"},
    		GateSetOpen	{Tag = "GuradsGate2"},
    		GateSetOpen	{Tag = "GuradsGate4"},
    		MapFlagSetTrue {Name = "mf_OutcryThiefTreasureroom"},
    	},
    	
    }, 
         
     --Outcry bevor der Dieb abhaut
	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		MapTimerIsElapsed	{Name = "mt_ThiefGoing", Seconds = 33},
    	 },
    	Actions = 
    	{
    		MapFlagSetTrue {Name = "mf_OutcryThiefLeaving"},
    	},
    	
    }, 
     --Dieb haut ab.
	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		MapTimerIsElapsed	{Name = "mt_ThiefGoing", Seconds = 40},
    	 },
    	Actions = 
    	{
    		FigureRun	{Tag = "Thief", X = 186, Y = 180},
    		--FigureForcedRun	{X = 186, Y = 180},   		
    	},
    	
    },  
    
    OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		FigureIsInRange	{Range = 2, X = 186, Y = 180},
    	 },
    	Actions = 
    	{
    		MapTimerStart	{Name = "mt_DespawnThief"},
    		EffectStart	{Tag = "ElementalMage", File = "Effect_DeSpawn_Unit"},	
    	},
    	
    },  
    
    OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		MapTimerIsElapsed	{Name = "mt_DespawnThief", Seconds = 2},
    	 },
    	Actions = 
    	{
    		FigureVanish	{},
    	},
    	
    },  
};