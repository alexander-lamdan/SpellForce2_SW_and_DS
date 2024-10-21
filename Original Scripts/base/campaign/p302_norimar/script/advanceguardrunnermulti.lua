State
{
	StateName = "Attack",
	
	OnFigureSpawnOnlyWhenEvent
	{
		--Team = "tm_BadGuys",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SpawnAdvanceGuard"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_HasSpawned"},
		},
	},
	OnOneTimeEvent
	{
		--Team = "tm_BadGuys",
		Conditions = 
		{
			MapFlagIsTrue 	  {Name = "mf_DarkElvesGo"},
			EntityFlagIsTrue  {Name = "ef_HasSpawned"},
		},
		Actions = 
		{
			FigureAttackEntity {Tag = "default", TargetTag = "pl_HumanAvatar"},
		},
	},
	
};	
