
State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_SpawnNaugronServants"},
		},
		Actions = 
		{
			EntityFlagSetTrue{Name = "ef_Spawned"},
		},
	};


	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "Main",
	},
}
	
State
{
	StateName = "Main",
	
	OnOneTimeEvent
	{
		Conditions = {},
		Actions = 
		{
			EntityValueRandomize{Name = "ev_MyTarget", MinValue = 1, MaxValue = 6},
		},
	},
	
	OnFigureRespawnEvent
	{
		WaitTime = 30,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_SpawnNaugronServants"},
			MapFlagIsFalse{Name = "mf_NaugronStopSpawningServants"},
		},
		Actions = 
		{
			EntityFlagSetFalse{Name = "ef_IGotMyGoal"},
			EntityValueRandomize{Name = "ev_MyTarget", MinValue = 1, MaxValue = 6},
		},
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual{Name = "ev_MyTarget", Value = 1},
			EntityFlagIsFalse{Name = "ef_IGotMyGoal"},
		},
		Actions =
		{
			FigureForceAttackEntity	{Tag = "default", TargetTag = "pl_HumanAvatar"},
			EntityFlagSetTrue{Name = "ef_IGotMyGoal"},
		},
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual{Name = "ev_MyTarget", Value = 2},
			EntityFlagIsFalse{Name = "ef_IGotMyGoal"},
		},
		Actions =
		{
			FigureForceAttackEntity	{Tag = "default", TargetTag = "pl_HumanHeroBor"},
			EntityFlagSetTrue{Name = "ef_IGotMyGoal"},
		},
	},

	OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual{Name = "ev_MyTarget", Value = 3},
			EntityFlagIsFalse{Name = "ef_IGotMyGoal"},
		},
		Actions =
		{
			FigureForceAttackEntity	{Tag = "default", TargetTag = "pl_HumanHeroJared"},
			EntityFlagSetTrue{Name = "ef_IGotMyGoal"},
		},
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual{Name = "ev_MyTarget", Value = 4},
			EntityFlagIsFalse{Name = "ef_IGotMyGoal"},
		},
		Actions =
		{
			FigureForceAttackEntity	{Tag = "default", TargetTag = "pl_HumanHeroLya"},
			EntityFlagSetTrue{Name = "ef_IGotMyGoal"},
		},
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual{Name = "ev_MyTarget", Value = 5},
			EntityFlagIsFalse{Name = "ef_IGotMyGoal"},
		},
		Actions =
		{
			FigureForceAttackEntity	{Tag = "default", TargetTag = "pl_HumanHeroMordecay"},
			EntityFlagSetTrue{Name = "ef_IGotMyGoal"},
		},
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual{Name = "ev_MyTarget", Value = 6},
			EntityFlagIsFalse{Name = "ef_IGotMyGoal"},
		},
		Actions =
		{
			FigureForceAttackEntity	{Tag = "default", TargetTag = "pl_HumanHeroShae"},
			EntityFlagSetTrue{Name = "ef_IGotMyGoal"},
		},
	},

}