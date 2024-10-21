--*******************************************************
--***                                                 ***
--***             DwarfSammelscript                   ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	--Dead or Alive
	
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
			
			EntityFlagSetTrue {Name = "ef_Aim1Alive"},
			EntityFlagSetTrue {Name = "ef_Aim2Alive"},
			EntityFlagSetTrue {Name = "ef_Aim3Alive"},
			EntityFlagSetTrue {Name = "ef_Aim4Alive"},
			EntityFlagSetTrue {Name = "ef_Aim5Alive"},
			FigureAttackEntity	{Tag = "Trebuchet1", TargetTag = "AimTrebuchet1"},
			FigureAttackEntity	{Tag = "Trebuchet3", TargetTag = "AimTrebuchet3"},
			FigureAttackEntity	{Tag = "Trebuchet4", TargetTag = "AimTrebuchet4"},
			FigureAttackEntity	{Tag = "Trebuchet5", TargetTag = "AimTrebuchet5"},
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
			FigureNpcSpawn	{Tag = "AimTrebuchet1", Level = 30, UnitId = 1367,X = 464.371, Y = 490.439, Team = "tm_AimTrebuchet"},
			EntityFlagSetTrue {Name = "ef_Aim1Alive"},
			FigureAttackEntity	{Tag = "Trebuchet1", TargetTag = "AimTrebuchet1"},
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
		},	
	},
	

	
--*******************************************************
--***                                                 ***
--***              		Trebuchet3   	              ***
--***                                                 ***
--*******************************************************	   
   
OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_Aim3Alive"},
			FigureIsDead	{Tag = "AimTrebuchet3"},
			FigureTeamIsInRangeToEntity	{Team = "tm_TeamPact5", Range = 10, TargetTag = "Trebuchet3"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "AimTrebuchet3", Level = 30, UnitId = 1367, X = 77.626, Y = 153.204,   Team = "tm_AimTrebuchet"},
			EntityFlagSetTrue {Name = "ef_Aim3Alive"},
			FigureAttackEntity	{Tag = "Trebuchet3", TargetTag = "AimTrebuchet3"},
		},	
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Aim3Alive"},
			FigureIsAlive	{Tag = "AimTrebuchet3"},
			FigureTeamIsNotInRangeToEntity	{Team = "tm_TeamPact5", Range = 10, TargetTag = "Trebuchet3"},
		},
		Actions =
		{
			FigureKill	{Tag = "AimTrebuchet3"},
			EntityFlagSetFalse {Name = "ef_Aim3Alive"},
		},	
	},
	
--*******************************************************
--***                                                 ***
--***              		Trebuchet  4	              ***
--***                                                 ***
--*******************************************************		
	
  OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_Aim4Alive"},
			FigureIsDead	{Tag = "AimTrebuchet4"},
			FigureTeamIsInRangeToEntity	{Team = "tm_TeamPact5", Range = 10, TargetTag = "Trebuchet4"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "AimTrebuchet4", Level = 30, UnitId = 1367, X = 80.3782, Y = 178.526,  Team = "tm_AimTrebuchet"},
			EntityFlagSetTrue {Name = "ef_Aim4Alive"},
			FigureAttackEntity	{Tag = "Trebuchet4", TargetTag = "AimTrebuchet4"},
		},	
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Aim4Alive"},
			FigureIsAlive	{Tag = "AimTrebuchet4"},
			FigureTeamIsNotInRangeToEntity	{Team = "tm_TeamPact5", Range = 10, TargetTag = "Trebuchet4"},
		},
		Actions =
		{
			FigureKill	{Tag = "AimTrebuchet4"},
			EntityFlagSetFalse {Name = "ef_Aim4Alive"},
		},	
	},



--*******************************************************
--***                                                 ***
--***              		Trebuchet  5	              ***
--***                                                 ***
--*******************************************************		
	
	  OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_Aim5Alive"},
			FigureIsDead	{Tag = "AimTrebuchet5"},
			FigureTeamIsInRangeToEntity	{Team = "tm_TeamPact2", Range = 10, TargetTag = "Trebuchet5"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "AimTrebuchet5", Level = 30, UnitId = 1367, X = 271.344, Y = 537.234,  Team = "tm_AimTrebuchet"},
			EntityFlagSetTrue {Name = "ef_Aim5Alive"},
			FigureAttackEntity	{Tag = "Trebuchet5", TargetTag = "AimTrebuchet5"},
		},	
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Aim5Alive"},
			FigureIsAlive	{Tag = "AimTrebuchet5"},
			FigureTeamIsNotInRangeToEntity	{Team = "tm_TeamPact2", Range = 10, TargetTag = "Trebuchet5"},
		},
		Actions =
		{
			FigureKill	{Tag = "AimTrebuchet5"},
			EntityFlagSetFalse {Name = "ef_Aim5Alive"},
		},	
	},


};

