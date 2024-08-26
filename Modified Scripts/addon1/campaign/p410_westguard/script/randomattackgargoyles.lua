
--*******************************************************
--***                                                 ***
--*** 					Main State					  ***
--***												  ***
--*******************************************************  
AttackTime1 = 180
AttackTime2 = 360
AttackTime3 = 540
AttackTime4 = 720
AttackTime5 = 780
AttackTime6 = 840


State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_GargoyleAttackTimer", Seconds = AttackTime1},
    	},
    	Actions =
    	{
 			--FigureForcedRunToEntity	{Tag = "FireG01", TargetTag = "Gargoyle1"},
 		 	FigureForcedRunToEntity	{Tag = "FireG02", TargetTag = "Gargoyle2"},
 		 	--FigureForcedRunToEntity	{Tag = "FireG03", TargetTag = "Gargoyle3"},
 		 	FigureForcedRunToEntity	{Tag = "FireG04", TargetTag = "Gargoyle4"},
 		 	FigureForcedRunToEntity	{Tag = "FireG05", TargetTag = "Gargoyle5"},
 		 	
 		 	FigureForcedRunToEntity	{Tag = "FrostG01", TargetTag = "Gargoyle6"},
 		 	FigureForcedRunToEntity	{Tag = "FrostG02", TargetTag = "Gargoyle7"},
 		 	--FigureForcedRunToEntity	{Tag = "FrostG03", TargetTag = "Gargoyle8"},
 		 	--FigureForcedRunToEntity	{Tag = "FrostG04", TargetTag = "Gargoyle9"},
 		 	--FigureForcedRunToEntity	{Tag = "FrostG05", TargetTag = "Gargoyle10"},
 		 	--SoundGlobalPlayLoopedAddon1	{File = "06_level/lvl_palace_alarm"},
 		 	--MapTimerStart	{Name = "mt_AlarmGargoyleTimer"},
   		},
    },
   
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			MapTimerIsElapsed	{Name = "mt_AlarmGargoyleTimer", Seconds = 5},
--		},
--		Actions =
--		{
--			SoundStopAddon1	{File = "06_level/lvl_palace_alarm"},
--			MapTimerStop	{Name = "mt_AlarmGargoyleTimer"},
--		},
--		
--	},
    OnOneTimeEvent
    
    {
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_GargoyleAttackTimer", Seconds = AttackTime2},
    	},
    	Actions =
    	{
 			MapFlagSetTrue	{Name = "mf_AttackStart2"},
 			EntityFlagSetFalse {Name = "ef_GargoyleReset"},
   		},
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_GargoyleAttackTimer", Seconds = AttackTime3},
    	},
    	Actions =
    	{
 			MapFlagSetTrue	{Name = "mf_AttackStart3"},
 			EntityFlagSetFalse {Name = "ef_GargoyleReset"},
   		},
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_GargoyleAttackTimer", Seconds = AttackTime4},
    	},
    	Actions =
    	{
 			MapFlagSetTrue	{Name = "mf_AttackStart4"},
 			EntityFlagSetFalse {Name = "ef_GargoyleReset"},
   		},
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_GargoyleAttackTimer", Seconds = AttackTime5},
    	},
    	Actions =
    	{
 			MapFlagSetTrue	{Name = "mf_AttackStart5"},
 			EntityFlagSetFalse {Name = "ef_GargoyleReset"},
   		},
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_GargoyleAttackTimer", Seconds = AttackTime6},
    	},
    	Actions =
    	{
 			MapFlagSetTrue	{Name = "mf_AttackStart6"},
 			EntityFlagSetFalse {Name = "ef_GargoyleReset"},
   		},
    },
     
    OnEvent
    {
    	Conditions =
    	{
    		OR
    		{
    			MapFlagIsTrue	{Name = "mf_AttackStart2"},
    			MapFlagIsTrue	{Name = "mf_AttackStart3"},
    			MapFlagIsTrue	{Name = "mf_AttackStart4"},
    			MapFlagIsTrue	{Name = "mf_AttackStart5"},
    			MapFlagIsTrue	{Name = "mf_AttackStart6"},
 			},
 			
   			EntityFlagIsFalse {Name = "ef_GargoyleReset"},
   			OR
   			{
   				--FigureIsAlive	{Tag = "FireG01"},
   				FigureIsAlive	{Tag = "FireG02"},
   				--FigureIsAlive	{Tag = "FireG03"},
   				FigureIsAlive	{Tag = "FireG04"},
   				FigureIsAlive	{Tag = "FireG05"},
   				FigureIsAlive	{Tag = "FrostG01"},
   				FigureIsAlive	{Tag = "FrostG02"},
   				--FigureIsAlive	{Tag = "FrostG03"},
   				--FigureIsAlive	{Tag = "FrostG04"},
   				--FigureIsAlive	{Tag = "FrostG05"},
   				
   			},
   		},
    
    	Actions =
    	{
 			--FigureKill	{Tag = "FireG01"},
 			FigureKill	{Tag = "FireG02"},
 			--FigureKill	{Tag = "FireG03"},
 			FigureKill	{Tag = "FireG04"},
 			FigureKill	{Tag = "FireG05"},
 			FigureKill	{Tag = "FrostG01"},
 			FigureKill	{Tag = "FrostG02"},
 			--FigureKill	{Tag = "FrostG03"},
 			--FigureKill	{Tag = "FrostG04"},
 			--FigureKill	{Tag = "FrostG05"},
 			EntityFlagSetTrue {Name = "ef_GargoyleReset"},
   		},
    }, 
    
    
    OnEvent
    {
    	Conditions =
    	{
    		
    		OR
    		{
    			MapFlagIsTrue	{Name = "mf_AttackStart2"},
    			MapFlagIsTrue	{Name = "mf_AttackStart3"},
    			MapFlagIsTrue	{Name = "mf_AttackStart4"},
    			MapFlagIsTrue	{Name = "mf_AttackStart5"},
    			MapFlagIsTrue	{Name = "mf_AttackStart6"},
 			},
 			
   			EntityFlagIsFalse {Name = "ef_GargoyleSpawn"},
   			--FigureIsDead	{Tag = "FireG01"},	
   			FigureIsDead	{Tag = "FireG02"},
   			--FigureIsDead	{Tag = "FireG03"},
   			FigureIsDead	{Tag = "FireG04"},
   			FigureIsDead	{Tag = "FireG05"},
   			FigureIsDead	{Tag = "FrostG01"},
   			FigureIsDead	{Tag = "FrostG02"},
   			--FigureIsDead	{Tag = "FrostG03"},
   			--FigureIsDead	{Tag = "FrostG04"},
   			--FigureIsDead	{Tag = "FrostG05"},
   		},
   
    	Actions =
    	{
 			--FigureNpcSpawn	{Tag = "FireG01", Level = 20, UnitId = 88, X = 630, Y = 246, Team = "tm_Team2"},
 			FigureNpcSpawn	{Tag = "FireG02", Level = 20, UnitId = 88, X = 630, Y = 246, Team = "tm_Team2"},
 			--FigureNpcSpawn	{Tag = "FireG03", Level = 20, UnitId = 88, X = 630, Y = 246, Team = "tm_Team2"},
 			FigureNpcSpawn	{Tag = "FireG04", Level = 20, UnitId = 88, X = 630, Y = 246, Team = "tm_Team2"},
 			FigureNpcSpawn	{Tag = "FireG05", Level = 20, UnitId = 88, X = 630, Y = 246, Team = "tm_Team2"},
 			
 			FigureNpcSpawn	{Tag = "FrostG01", Level = 20, UnitId = 910, X = 634, Y = 274, Team = "tm_Team2"},
 			FigureNpcSpawn	{Tag = "FrostG02", Level = 20, UnitId = 910, X = 634, Y = 274, Team = "tm_Team2"},
 			--FigureNpcSpawn	{Tag = "FrostG03", Level = 20, UnitId = 910, X = 634, Y = 274, Team = "tm_Team2"},
 			--FigureNpcSpawn	{Tag = "FrostG04", Level = 20, UnitId = 910, X = 634, Y = 274, Team = "tm_Team2"},
 			--FigureNpcSpawn	{Tag = "FrostG05", Level = 20, UnitId = 910, X = 634, Y = 274, Team = "tm_Team2"},
 			
 			EntityFlagSetTrue {Name = "ef_GargoyleSpawn"},
   		},
    }, 

	 OnEvent
    {
    	Conditions =
    	{
    		--FigureIsAlive	{Tag = "FireG01"},
   			FigureIsAlive	{Tag = "FireG02"},
   			--FigureIsAlive	{Tag = "FireG03"},
   			FigureIsAlive	{Tag = "FireG04"},
   			FigureIsAlive	{Tag = "FireG05"},
   			FigureIsAlive	{Tag = "FrostG01"},
 			FigureIsAlive	{Tag = "FrostG02"},
 			--FigureIsAlive	{Tag = "FrostG03"},
   			--FigureIsAlive	{Tag = "FrostG04"},
   			--FigureIsAlive	{Tag = "FrostG05"},
    		EntityFlagIsTrue {Name = "ef_GargoyleSpawn"},
  		 },
    	Actions =
    	{
 		 	MapFlagSetFalse	{Name = "mf_AttackStart2"},
 		 	MapFlagSetFalse	{Name = "mf_AttackStart3"},
 		 	MapFlagSetFalse	{Name = "mf_AttackStart4"},
 		 	MapFlagSetFalse	{Name = "mf_AttackStart5"},
 		 	MapFlagSetFalse	{Name = "mf_AttackStart6"},
  		 	
 		 	--FigureForcedRunToEntity	{Tag = "FireG01", TargetTag = "Gargoyle1"},
 		 	FigureForcedRunToEntity	{Tag = "FireG02", TargetTag = "Gargoyle2"},
 		 	--FigureForcedRunToEntity	{Tag = "FireG03", TargetTag = "Gargoyle3"},
 		 	FigureForcedRunToEntity	{Tag = "FireG04", TargetTag = "Gargoyle4"},
 		 	FigureForcedRunToEntity	{Tag = "FireG05", TargetTag = "Gargoyle5"},
 		 	
 		 	FigureForcedRunToEntity	{Tag = "FrostG01", TargetTag = "Gargoyle6"},
 		 	FigureForcedRunToEntity	{Tag = "FrostG02", TargetTag = "Gargoyle7"},
 		 	--FigureForcedRunToEntity	{Tag = "FrostG03", TargetTag = "Gargoyle8"},
 		 	--FigureForcedRunToEntity	{Tag = "FrostG04", TargetTag = "Gargoyle9"},
 		 	--FigureForcedRunToEntity	{Tag = "FrostG05", TargetTag = "Gargoyle10"},
 		 	
 			EntityFlagSetFalse {Name = "ef_GargoyleSpawn"},
 			--MapTimerStart	{Name = "mt_AlarmGargoyleTimer"},
 			--EntityFlagSetFalse {Name = "ef_AlarmSound"},
   		},
    }, 
    
--    OnEvent
--	{
--		Conditions =
--		{
--			MapTimerIsElapsed	{Name = "mt_AlarmGargoyleTimer", Seconds = 5},
--			EntityFlagIsFalse {Name = "ef_AlarmSound"},
--		},
--		Actions =
--		{
--			SoundStopAddon1	{File = "06_level/lvl_palace_alarm"},
--			MapTimerStop	{Name = "mt_AlarmGargoyleTimer"},
--			EntityFlagSetTrue {Name = "ef_AlarmSound"},
--		},
--		
--	},
	
};
