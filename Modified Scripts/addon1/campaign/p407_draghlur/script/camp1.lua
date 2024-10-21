myWait = 123

State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			PlayerHasBuildingAmount	{Player = "pl_Enemy1", Amount = 1},
			MapTimerIsElapsed {Name = "mt_P407_TrapItemCarrier", Seconds = myWait}
		},
		Actions =
		{
			FigureRun {X = 385, Y = 330},
			MapFlagSetTrue {Name = "mf_P407_ImSpawnedCamp1"},
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = myWait,
		X = GetEntityX(),
		Y = GetEntityY(),
		-- Wenn der Spieler das Lager zerstört hat geht der Dialog des Schroothaufens an und der Spieler kann eine Waffe bergen
		Conditions =
		{
			PlayerHasBuildingAmount	{Player = "pl_Enemy1", Amount = 1},
		},
		Actions =
		{
			FigureRun {X = 385, Y = 330},
			MapFlagSetFalse {Name = "mf_P407_ImDeadCamp1"},
		},
		DeathActions =
		{
			MapFlagSetTrue {Name = "mf_P407_ImDeadCamp1"},
		}
	},
}