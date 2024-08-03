--*******************************************************
--***                                                 ***
--***             TrebuchetSammelscript               ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	
--*******************************************************
--***                                                 ***
--***              		Trebuchet1		              ***
--***                                                 ***
--*******************************************************	   
    OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			FigureSwappingDisable	{Tag = "Trebuchet1"},
    	   	FigureSwappingDisable	{Tag = "Trebuchet2"},
			EntityFlagSetTrue {Name = "ef_Aim1Alive"},
			EntityFlagSetTrue {Name = "ef_Aim2Alive"},
			FigureAttackEntity	{Tag = "Trebuchet1", TargetTag = "AimTrebuchet1"},
			FigureAttackEntity	{Tag = "Trebuchet2", TargetTag = "AimTrebuchet2"},
		},	
		
	},
    
    OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_Aim1Alive"},
			FigureIsDead	{Tag = "AimTrebuchet1"},
			FigureTeamIsInRangeToEntity	{Team = "tm_Team2", Range = 10, TargetTag = "Trebuchet1"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "AimTrebuchet1", Level = 30, UnitId = 1367,X = 446.685, Y = 422.387,  Team = "tm_TrebuchetAim"},
			EntityFlagSetTrue {Name = "ef_Aim1Alive"},
			FigureAttackEntity	{Tag = "Trebuchet1", TargetTag = "AimTrebuchet1"},
			EntityFlagSetFalse {Name = "ef_Trebuchet1Shoot"},
			--
			DebugMessage	{Caption = "Trebuchet1", Message = "NPCSpawn"},
		},	
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Aim1Alive"},
			FigureIsAlive	{Tag = "AimTrebuchet1"},
			FigureTeamIsNotInRangeToEntity	{Team = "tm_Team2", Range = 10, TargetTag = "Trebuchet1"},
		},
		Actions =
		{
			FigureKill	{Tag = "AimTrebuchet1"},
			EntityFlagSetFalse {Name = "ef_Aim1Alive"},
			--DebugMessage	{Caption = "Trebuchet1", Message = "NPCKill"},
		},	
	},
	
	OnEvent
	{
		Conditions =
		{
			FigureIsAlive	{Tag = "AimTrebuchet1"},
			FigureTeamIsInRangeToEntity	{Team = "tm_Team2", Range = 10, TargetTag = "Trebuchet1"},
			EntityFlagIsFalse {Name = "ef_Trebuchet1Shoot"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_Trebuchet1Timer"},
			EntityFlagSetTrue {Name = "ef_Trebuchet1Shoot"},
			--DebugMessage	{Caption = "Trebuchet1", Message = "TimerWirdGestartet"},
		},	
	},
	
	OnEvent
	{
		Conditions =
		
		{
			FigureIsAlive	{Tag = "AimTrebuchet1"},
			FigureTeamIsInRangeToEntity	{Team = "tm_Team2", Range = 10, TargetTag = "Trebuchet1"},
			EntityTimerIsElapsed	{Name = "et_Trebuchet1Timer", Seconds = 15},
			EntityFlagIsTrue {Name = "ef_Trebuchet1Shoot"},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_Trebuchet1Timer"},
			FigureAttackEntity	{Tag = "Trebuchet1", TargetTag = "AimTrebuchet1"},
			EntityFlagSetFalse {Name = "ef_Trebuchet1Shoot"},
			--DebugMessage	{Caption = "Trebuchet1", Message = "TrebuchetSchiesst"},
		},	
	},
	
	
--*******************************************************
--***                                                 ***
--***              		Trebuchet2   	              ***
--***                                                 ***
--*******************************************************	   
   
OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_Aim2Alive"},
			FigureIsDead	{Tag = "AimTrebuchet2"},
			FigureTeamIsInRangeToEntity	{Team = "tm_Team2", Range = 10, TargetTag = "Trebuchet2"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "AimTrebuchet2", Level = 30, UnitId = 1367, X = 406.46, Y = 285.33,     Team = "tm_TrebuchetAim"},
			EntityFlagSetTrue {Name = "ef_Aim2Alive"},
			FigureAttackEntity	{Tag = "Trebuchet2", TargetTag = "AimTrebuchet2"},
			EntityFlagSetFalse {Name = "ef_Trebuchet2Shoot"},
		},	
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Aim2Alive"},
			FigureIsAlive	{Tag = "AimTrebuchet2"},
			FigureTeamIsNotInRangeToEntity	{Team = "tm_Team2", Range = 10, TargetTag = "Trebuchet2"},
		},
		Actions =
		{
			FigureKill	{Tag = "AimTrebuchet2"},
			EntityFlagSetFalse {Name = "ef_Aim2Alive"},
		},	
	},

	OnEvent
	{
		Conditions =
		{
			FigureIsAlive	{Tag = "AimTrebuchet2"},
			FigureTeamIsInRangeToEntity	{Team = "tm_Team2", Range = 10, TargetTag = "Trebuchet2"},
			EntityFlagIsFalse {Name = "ef_Trebuchet2Shoot"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_Trebuchet2Timer"},
			EntityFlagSetTrue {Name = "ef_Trebuchet2Shoot"},
		},	
	},
	
	OnEvent
	{
		Conditions =
		{
			FigureIsAlive	{Tag = "AimTrebuchet2"},
			FigureTeamIsInRangeToEntity	{Team = "tm_Team2", Range = 10, TargetTag = "Trebuchet2"},
			EntityTimerIsElapsed	{Name = "et_Trebuchet2Timer", Seconds = 15},
			EntityFlagIsTrue {Name = "ef_Trebuchet2Shoot"},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_Trebuchet2Timer"},
			FigureAttackEntity	{Tag = "Trebuchet2", TargetTag = "AimTrebuchet2"},
			EntityFlagSetFalse {Name = "ef_Trebuchet2Shoot"},
		},	
	},


--    OnEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsFalse {Name = "ef_Aim2Alive"},
--			FigureIsDead	{Tag = "AimTrebuchet2"},
--			FigureTeamIsInRangeToEntity	{Team = "tm_Team2", Range = 10, TargetTag = "Trebuchet2"},
--		},
--		Actions =
--		{
--			FigureNpcSpawn	{Tag = "AimTrebuchet2", Level = 30, UnitId = 1367, X = 396.531, Y = 263.252, Team = "tm_AimTrebuchet"},
--			EntityFlagSetTrue {Name = "ef_Aim2Alive"},
--			FigureAttackEntity	{Tag = "Trebuchet2", TargetTag = "AimTrebuchet2"},
--			EntityTimerStart	{Name = "et_Trebuchet2Timer"},
--		},	
--	},
--	
--	OnEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsFalse {Name = "ef_TimerTrebuchet2Start"},
--			FigureIsAlive	{Tag = "AimTrebuchet2"},
--			
--		},
--		Actions =
--		{
--			EntityTimerStart	{Name = "et_Trebuchet2Timer"},
--			EntityFlagSetTrue {Name = "ef_TimerTrebuchet2Start"},
--			
--		},	
--	},
--	
--	OnEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsTrue {Name = "ef_TimerTrebuchet2Start"},
--			FigureIsAlive	{Tag = "AimTrebuchet2"},
--			EntityTimerIsElapsed	{Name = "et_Trebuchet2Timer", Seconds = 10},
--			
--		},
--		Actions =
--		{
--			
--			EntityFlagSetFalse {Name = "ef_TimerTrebuchet2Start"},
--			FigureAttackEntity	{Tag = "Trebuchet2", TargetTag = "AimTrebuchet2"},
--			EntityTimerStop	{Name = "et_Trebuchet2Timer"},
--		},	
--	},
--	
--	OnEvent
--	{
--		Conditions =
--		{
--			EntityFlagIsTrue {Name = "ef_Aim2Alive"},
--			FigureIsAlive	{Tag = "AimTrebuchet2"},
--			FigureTeamIsNotInRangeToEntity	{Team = "tm_Team2", Range = 10, TargetTag = "Trebuchet2"},
--		},
--		Actions =
--		{
--			FigureKill	{Tag = "AimTrebuchet2"},
--			EntityFlagSetFalse {Name = "ef_Aim2Alive"},
--			FigureAttackEntity	{Tag = "Trebuchet2", TargetTag = "AimTrebuchet2"},
--		},	
--	},

	
};

