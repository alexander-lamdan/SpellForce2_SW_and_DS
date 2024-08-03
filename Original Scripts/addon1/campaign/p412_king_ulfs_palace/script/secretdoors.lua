--*******************************************************
--***                                                 ***
--***               Palace Addon1					  ***
--***			    NecromantFight	                  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	OnToggleEvent	
	{
		EventName = "SecretDoorDetected",
		OnConditions =
		{
			MapFlagIsFalse {Name = "mf_SearchingActivate"},
			MapFlagIsTrue {Name = "mf_SaveThief"},
			OR
			{
				FigureIsInEntityRange	{Tag = "Thief", TargetTag = "Secret1", Range = 6},
				FigureIsInEntityRange	{Tag = "Thief", TargetTag = "Secret2", Range = 6},
				FigureIsInEntityRange	{Tag = "Thief", TargetTag = "Secret2_5", Range = 6},
				FigureIsInEntityRange	{Tag = "Thief", TargetTag = "Secret3", Range = 6},
				FigureIsInEntityRange	{Tag = "Thief", TargetTag = "Secret4", Range = 6},
				FigureIsInEntityRange	{Tag = "Thief", TargetTag = "Secret5", Range = 6},
				--FigureIsInEntityRange	{Tag = "Thief", TargetTag = "Secret6", Range = 6},
				FigureIsInEntityRange	{Tag = "Thief", TargetTag = "Secret7", Range = 6},
				
				
			},
		},
		OnActions = 
		{
			EntityFlagSetFalse	{Name = "ef_FollowStartTrigger"},
			DialogSetEnabled	{Tag = "Thief"},
			DialogTypeSetSideQuest	{Tag = "Thief"},
			MapFlagSetFalse {Name = "mf_ThiefFollow"},
		},
		OffConditions =
		{
			MapFlagIsFalse {Name = "mf_SearchingActivate"},
			MapFlagIsTrue {Name = "mf_SaveThief"},
			FigureIsNotInEntityRange	{Tag = "Thief", TargetTag = "Secret1", Range = 6},
			FigureIsNotInEntityRange	{Tag = "Thief", TargetTag = "Secret2", Range = 6},
			FigureIsNotInEntityRange	{Tag = "Thief", TargetTag = "Secret2_5", Range = 6},
			FigureIsNotInEntityRange	{Tag = "Thief", TargetTag = "Secret3", Range = 6},
			FigureIsNotInEntityRange	{Tag = "Thief", TargetTag = "Secret4", Range = 6},
			FigureIsNotInEntityRange	{Tag = "Thief", TargetTag = "Secret5", Range = 6},
			--FigureIsNotInEntityRange	{Tag = "Thief", TargetTag = "Secret6", Range = 6},
			FigureIsNotInEntityRange	{Tag = "Thief", TargetTag = "Secret7", Range = 6},
		},
		OffActions = 
		{
			DialogSetDisabled	{Tag = "Thief"},
		},
	},
	
	
	
	
	OnEvent
    {
    	Conditions = 
    	 {	
    		MapFlagIsTrue {Name = "mf_SearchingActivate"},
    		EntityFlagIsFalse	{Name = "ef_FollowStartTrigger"},
    		
    	 },
    	Actions = 
    	{
    		MapFlagSetTrue {Name = "mf_ThiefFollow"},
    		EntityFlagSetTrue	{Name = "ef_FollowStartTrigger"},
    	},
    	
    }, 
	
	--SecretDoor1
	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		MapFlagIsTrue {Name = "mf_SearchingActivate"},
    		FigureIsInEntityRange	{Tag = "Thief", TargetTag = "Secret1", Range = 6},
    	 },
    	Actions = 
    	{
    		ObjectSpawn	{ObjectId = 1677, X = 109.236, Y = 108.69, Direction = 270, Tag = "InvisibleSecretLever1"},
    		LeverSetDisabled	{Tag = "InvisibleSecretLever1"},
    	},
    	
    }, 
    
	
	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    	 		OR
    	 		{
    	 			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "InvisibleSecretLever1", Range = 4},
    				FigureIsInEntityRange	{Tag = "Thief", TargetTag = "InvisibleSecretLever1", Range = 4},
    			},
    			MapFlagIsTrue {Name = "mf_SearchingActivate"},
    	 },
    	Actions = 
    	{
    		ObjectVanish	{Tag = "InvisibleSecretLever1"},
    		ObjectSpawn	{ObjectId = 2375, X = 109.236, Y = 108.69, Direction = 270, Tag = "SecretLever1"},
    		MapFlagSetFalse {Name = "mf_SearchingActivate"},
    	},
    	
    }, 
    
    OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		MapFlagIsTrue {Name = "mf_SearchingActivate"},
    		FigureIsInEntityRange	{Tag = "Thief", TargetTag = "Secret7", Range = 6},
    	 },
    	Actions = 
    	{
    		ObjectSpawn	{ObjectId = 1677, X = 110.602, Y = 108.407,  Direction = 90, Tag = "InvisibleSecretLever7"},
    		LeverSetDisabled	{Tag = "InvisibleSecretLever7"},
    	},
    	
    }, 
    
    
    OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    	 		OR
    	 		{
    	 			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "InvisibleSecretLever7", Range = 4},
    				FigureIsInEntityRange	{Tag = "Thief", TargetTag = "InvisibleSecretLever7", Range = 4},
    			},
    			MapFlagIsTrue {Name = "mf_SearchingActivate"},
    	 },
    	Actions = 
    	{
    		
    		ObjectVanish	{Tag = "InvisibleSecretLever7"},
    		ObjectSpawn	{ObjectId = 2375, X = 110.602, Y = 108.407,  Direction = 90, Tag = "SecretLever7"},
    		MapFlagSetFalse {Name = "mf_SearchingActivate"},
    	},
    	
    }, 
    
    
    
    --SecretDoor2
	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		MapFlagIsTrue {Name = "mf_SearchingActivate"},
    		FigureIsInEntityRange	{Tag = "Thief", TargetTag = "Secret2", Range = 6},
    	 },
    	Actions = 
    	{
    		ObjectSpawn	{ObjectId = 1677, X = 131.516, Y = 156.847,  Direction = 90, Tag = "InvisibleSecretLever2"},
    		LeverSetDisabled	{Tag = "InvisibleSecretLever2"},
    	},
    	
    }, 
	

	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    			OR
    	 		{
    	 			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "InvisibleSecretLever2", Range = 4},
    				FigureIsInEntityRange	{Tag = "Thief", TargetTag = "InvisibleSecretLever2", Range = 4},
    			},
    			
    			MapFlagIsTrue {Name = "mf_SearchingActivate"},
    	 },
    	Actions = 
    	{
    		ObjectVanish	{Tag = "InvisibleSecretLever2"},
    		ObjectSpawn	{ObjectId = 2375, X = 131.516, Y = 156.847, Direction = 0, Tag = "SecretLever2"},
    		MapFlagSetFalse {Name = "mf_SearchingActivate"},
    	},
    	
    }, 
    
     OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		GateIsOpen	{Tag = "SecretDoor2"},
			GateIsOpen	{Tag = "SecretDoor3"},
    	 },
    	Actions = 
    	{
    		ObjectVanish	{Tag = "Secret2_5"},
    		ObjectVanish	{Tag = "Secret2"},
    	},
    	
    }, 
    
     --SecretDoor4
	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		MapFlagIsTrue {Name = "mf_SearchingActivate"},
    		FigureIsInEntityRange	{Tag = "Thief", TargetTag = "Secret4", Range = 6},
    	 },
    	Actions = 
    	{
    		ObjectSpawn	{ObjectId = 1677,X = 116.251, Y = 182.204,  Direction = 90, Tag = "InvisibleSecretLever4"},
    		LeverSetDisabled	{Tag = "InvisibleSecretLever4"},
    	},
    	
    }, 
	
	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    			OR
    	 		{
    	 			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "InvisibleSecretLever4", Range = 4},
    				FigureIsInEntityRange	{Tag = "Thief", TargetTag = "InvisibleSecretLever4", Range = 4},
    			},
    			
    			MapFlagIsTrue {Name = "mf_SearchingActivate"},
    	 },
    	Actions = 
    	{
    		ObjectVanish	{Tag = "InvisibleSecretLever4"},
    		ObjectSpawn	{ObjectId = 2375, X = 116.251, Y = 182.204, Direction = 90, Tag = "SecretLever4"},
    		MapFlagSetFalse {Name = "mf_SearchingActivate"},
    	},
    	
    }, 

	 OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		GateIsOpen	{Tag = "SecretDoor4"},
    	 },
    	Actions = 
    	{
    		ObjectVanish	{Tag = "Secret4"},
    	},
    	
    }, 
  

	 -- Spieler entdeckt zuerst die Schatzkammer dann kann er auch zum Wachraum vordringen, SecretDoor5 and 6
	
	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		MapFlagIsTrue {Name = "mf_SearchingActivate"},
    		FigureIsInEntityRange	{Tag = "Thief", TargetTag = "Secret5", Range = 6},
    	 },
    	Actions = 
    	{
    		ObjectSpawn	{ObjectId = 1677, X = 92.386, Y = 156.843,   Direction = 0, Tag = "InvisibleSecretLever5"},
    		LeverSetDisabled	{Tag = "InvisibleSecretLever5"},
    	},
    	
    }, 
   
	
	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    			OR
    	 		{
    	 			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "InvisibleSecretLever5", Range = 4},
    				FigureIsInEntityRange	{Tag = "Thief", TargetTag = "InvisibleSecretLever5", Range = 4},
    			},
    			
    			MapFlagIsTrue {Name = "mf_SearchingActivate"},
    	 },
    	Actions = 
    	{
    		ObjectVanish	{Tag = "InvisibleSecretLever5"},
    		
    		ObjectSpawn	{ObjectId = 2375, X = 92.386, Y = 156.843, Direction = 0, Tag = "SecretLever5"},
    		
    		MapFlagSetFalse {Name = "mf_SearchingActivate"},
    		
    	},
    	
    }, 
   
    OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		MapFlagIsTrue {Name = "mf_SearchingActivate"},
    		FigureIsInEntityRange	{Tag = "Thief", TargetTag = "Secret6", Range = 6},
    	 },
    	Actions = 
    	{
    		ObjectSpawn	{ObjectId = 1677, X = 80, Y = 164,   Direction = 180, Tag = "InvisibleSecretLever6"},
    		LeverSetDisabled	{Tag = "InvisibleSecretLever6"},
    	},
    	
    }, 
   
    OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    			OR
    	 		{
    	 			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "InvisibleSecretLever6", Range = 4},
    				FigureIsInEntityRange	{Tag = "Thief", TargetTag = "InvisibleSecretLever6", Range = 4},
    			},
    			
    			MapFlagIsTrue {Name = "mf_SearchingActivate"},
    	 },
    	Actions = 
    	{
    		
    		ObjectVanish	{Tag = "InvisibleSecretLever6"},
    		
    		ObjectSpawn	{ObjectId = 1089, X = 80, Y = 164, Direction = 180, Tag = "SecretLever6"},
    		MapFlagSetFalse {Name = "mf_SearchingActivate"},
    		MapFlagSetTrue {Name = "mf_SecretLever6"},
    	},
    	
    }, 
    OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    			MapFlagIsTrue {Name = "mf_SecretLever6"},
    			GateIsClosed	{Tag = "GuradsGate2"},
    			GateIsClosed	{Tag = "GuradsGate1"},
    	 },
    	Actions = 
    	{
    		GateSetOpen	{Tag = "GuradsGate1"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_grate_open", X = 116, Y = 15, Z = 109, MaxRange = 15, FallOffRange = 5},
			GateSetOpen	{Tag = "GuradsGate2"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_wooddoor_open", X = 116, Y = 19, Z = 126, MaxRange = 15, FallOffRange = 5},
    	},
    	
    }, 

--*******************************************************
--***                                                 ***
--***               Secret Door 1					  ***
--***                                                 ***
--*******************************************************

	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		OR
			{
				LeverIsOn	{Tag = "SecretLever1"},
				LeverIsOn	{Tag = "SecretLever7"},
			},	
    	 },
    	Actions = 
    	{
    		GateSetOpen	{Tag = "SecretDoor1"},
    		SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_stonedoor_open", X = 107, Y = 15, Z = 103, MaxRange = 15, FallOffRange = 5},
    		ObjectVanish	{Tag = "Secret1"},
    		ObjectVanish	{Tag = "Secret7"},
    	},
    	
    }, 
    

--*******************************************************
--***                                                 ***
--***               Secret Door 2					  ***
--***                                                 ***
--*******************************************************
	OnOneTimeLeverEvent	
	{
		Lever = "SecretLever2", 
		OnConditions = 
		{
		
		},
		Actions = 
		{
			GateSetOpen	{Tag = "SecretDoor2"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_stonedoor_open", X = 134, Y = 20, Z = 156, MaxRange = 15, FallOffRange = 5},
			GateSetOpen	{Tag = "SecretDoor3"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_stonedoor_open", X = 134, Y = 20, Z = 169, MaxRange = 15, FallOffRange = 5},
		},
	},
	

--*******************************************************
--***                                                 ***
--***               Secret Door 4					  ***
--***                                                 ***
--*******************************************************

		OnOneTimeLeverEvent	
	{
		Lever = "SecretLever4", 
		OnConditions = 
		{
		
		},
		Actions = 
		{
			GateSetOpen	{Tag = "SecretDoor4"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_stonedoor_open", X = 116, Y = 20, Z = 176, MaxRange = 15, FallOffRange = 5},
		},
	},
	
	
--*******************************************************
--***                                                 ***
--***               Secret Door 5					  ***
--***                                                 ***
--*******************************************************

	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		OR
			{
				LeverIsOn	{Tag = "SecretLever5"},
				LeverIsOn	{Tag = "SecretLever6"},
			},	
    	 },
    	Actions = 
    	{
    		GateSetOpen	{Tag = "SecretDoor5"},
    		SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_stonedoor_open", X = 84, Y = 20, Z = 155, MaxRange = 15, FallOffRange = 5},
    		ObjectVanish	{Tag = "Secret5"},
    		ObjectVanish	{Tag = "Secret6"},
    	},
    	
    }, 
	
	
--*******************************************************
--***                                                 ***
--***               Secret Door Formerin			  ***
--***                                                 ***
--*******************************************************
	OnOneTimeLeverEvent	
	{
		Lever = "LeverFormerin", 
		OnConditions = 
		{
		
		},
		Actions = 
		{
			GateSetOpen	{Tag = "SecretDoorFormerin"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_stonedoor_open", X = 163, Y = 25, Z = 232, MaxRange = 15, FallOffRange = 5},	
		},
	},

	--Die Türen öffnen sich sobald der Spieler aus dem Geheimraum tritt
	OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		GateIsOpen	{Tag = "SecretDoorFormerin"},
    	 },
    	Actions = 
    	{
    		GateSetOpen	{Tag = "GateFloorThroneRoom1"},
    		SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_wooddoor_open", X = 178, Y = 25, Z = 221, MaxRange = 15, FallOffRange = 5},
    		GateSetOpen	{Tag = "GateFloorThroneRoom2"},
    		SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_wooddoor_open", X = 195, Y = 25, Z = 221, MaxRange = 15, FallOffRange = 5},
    	},
    	
    }, 

};