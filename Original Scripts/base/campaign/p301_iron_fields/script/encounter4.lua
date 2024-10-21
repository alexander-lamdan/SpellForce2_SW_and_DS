State
{
	StateName = "MAIN",
	
	--OnFigureRespawnEvent
	--{
	--	WaitTime = 0,
	--	X = 239, Y = 511,
	--	Conditions = 
	--	{
	--		MapFlagIsFalse	{Name = "mf_Encounter4Respawned"},
	--	},
	--	Actions = 
	--	{
	--		MapFlagSetTrue	{Name = "mf_Encounter4Respawned"},
	--	},
	--	DeathActions = 
	--	{
	--		EntityFlagSetTrue {Name = "ef_P301_BearJustKilled"}
	--	},
	--	DelayedActions = 
	--	{
	--		FigureTeamTransfer {Team = "tm_Team2"},
	--	},
	--};

	--OnEvent
	--{
	--	Conditions = 
	--	{
	--		FigureIsIdle	{},
	--		FigureIsNotInEntityRange	{Range = 0.2, TargetTag = "BearPositionMushroom"},
	--		EntityFlagIsTrue {Name = "ef_P301_BearJustKilled"}
	--	},
	--	Actions = 
	--	{
	--		FigureWalkToEntity	{TargetTag = "BearPositionMushroom"},
	--		EntityFlagSetFalse {Name = "ef_P301_BearJustKilled"}
	--	},
	--};
}