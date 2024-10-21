

State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_WacheSiebenburgSpawn"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_WacheSiebenburgAlive"}, 
			FigureWalk	{X = 302, Y = 376},
			MapValueAdd	{Name = "mv_EnemyCounter", Value = 1},
		},
		
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_WacheSiebenburgAlive"}, 
		},
		Actions =
		{
		
		},
		GotoState = "MainState",
	},
	
}

State
{
	StateName = "MainState",
	OnFigureDeadOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue {Name = "ef_WacheSiebenburgAlive"},
		},
		Actions = 
		{
			MapValueSubtract {Name = "mv_EnemyCounter", Value = 1},
		},
	};
	
--	OnFigureDyingOneTimeEvent
--	{
--		Conditions = 
--		{
--			EntityFlagIsTrue {Name = "ef_WacheSiebenburgAlive"}, 
--		},
--		Actions = 
--		{
--			MapValueSubtract {Name = "mv_EnemyCounter", Value = 1},
--		},
--	},
	
};