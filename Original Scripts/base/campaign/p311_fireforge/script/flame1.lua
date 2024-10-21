-- Erklärung der FlameStates: 
--  Value = 0 -> rot
--  Value = 1 -> gelb
--  Value = 2 -> grün
--  Value = 3 -> blau
--  Value = 4 -> weiss

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "Puzzle",
		Conditions = 
		{
			QuestIsSolved	{Quest = "IgniteForge"},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame1", ObjectId = 1109},
		},
	},
};
State
{
	StateName = "Puzzle",
	
	OnLeverEvent
	{
		Delay = 2,
		Lever = "Lever1",
		OnConditions = 
		{
			QuestIsActive		{Quest = "SetFlamesToYellow"},
		},
		Actions = 
		{
			MapValueAdd 		{Name = "mv_Flame1State", Value = 1},
			MapValueSubtract	{Name = "mv_Flame2State", Value = 1},
			MapValueSubtract	{Name = "mv_Flame3State", Value = 1},
			
			MapFlagSetTrue		{Name = "mf_ChangeFlame1"},
			MapFlagSetTrue		{Name = "mf_ChangeFlame2"},
			MapFlagSetTrue		{Name = "mf_ChangeFlame3"},
		},
	},
	OnEvent
	{
		Conditions =
		{
			MapValueIsGreaterOrEqual	{Name = "mv_Flame1State", Value = 5},				
		},
		Actions = 
		{
			MapValueSet					{Name = "mv_Flame1State", Value = 0},				
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			MapValueIsLessOrEqual	{Name = "mv_Flame1State", Value = -1},							
		},
		Actions = 
		{
			MapValueSet				{Name = "mv_Flame1State", Value = 0},							
		},
		
	},
	
	-- RESET AKTIV
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_ResetFires"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ChangeFlame1"},
			MapValueSet  	{Name = "mv_Flame1State", Value = 0},
		},
	},
	
	-- FLAMESTATE == 0 ->-> RED
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame1"},
			MapValueIsEqual	{Name = "mv_Flame1State", Value = 0},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame1", ObjectId = 1109},
			MapFlagSetFalse {Name = "mf_ChangeFlame1"},
		},
		
	},
	-- FLAMESTATE == 1 ->-> YELLOW
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame1"},
			MapValueIsEqual	{Name = "mv_Flame1State", Value = 1},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame1", ObjectId = 1111},
			MapFlagSetFalse {Name = "mf_ChangeFlame1"},
		},
		
	},
	-- FLAMESTATE == 2 ->-> GREEN
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame1"},
			MapValueIsEqual	{Name = "mv_Flame1State", Value = 2},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame1", ObjectId = 1110},
			MapFlagSetFalse {Name = "mf_ChangeFlame1"},
		},
		
	},
	-- FLAMESTATE == 3 ->-> BLUE
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame1"},
			MapValueIsEqual	{Name = "mv_Flame1State", Value = 3},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame1", ObjectId = 1113},
			MapFlagSetFalse {Name = "mf_ChangeFlame1"},
		},
		
	},
	-- FLAMESTATE == 4 ->-> WHITE
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame1"},
			MapValueIsEqual	{Name = "mv_Flame1State", Value = 4},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame1", ObjectId = 1112},
			MapFlagSetFalse {Name = "mf_ChangeFlame1"},
		},
		
	},
	
	OnOneTimeEvent
	{
		GotoState = "Disabled",
		Conditions = 
		{
			QuestIsSolved	{Quest = "SetFlamesToYellow"},
		},
		Actions = 
		{
		},
	},
	
};

State
{
	StateName = "Disabled",
	
};