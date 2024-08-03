State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 452,
		Y = 221,
		Conditions =
		{
			QuestIsSolved {Quest = "AwakeTreants"},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P301_NobodyThereWalkOn"}
		}
	},
	OnFigureRespawnEvent
	{
		X = 452,
		Y = 221,
		WaitTime = 120,
		Conditions =
		{
			PlayerBuildingIsInRange	{Player = "pl_DarkElves", BuildingId = 0, Range = 15, X = 451, Y = 229},
			QuestIsActive {Quest = "GatherLenya"},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P301_NobodyThereWalkOn"}
		},
	},
	-- Solange die Dunkelelfen noch Gebäude haben spawnen Schatten
	OnIdleGoHomeFake
	{
		X = 390,
		Y = 70,
		Conditions =
		{
			OR
			{
				EntityTimerIsElapsed {Name = "et_P301_NobodyThereWalkOn", Seconds = 60},
				AND
				{
					FigureIsAlive {Tag = "EvenMoreBetterAI1"},
					FigureIsAlive {Tag = "EvenMoreBetterAI2"},
					FigureIsAlive {Tag = "EvenMoreBetterAI3"},
					FigureIsAlive {Tag = "EvenMoreBetterAI4"},
					FigureIsAlive {Tag = "EvenMoreBetterAI5"},
					FigureIsAlive {Tag = "EvenMoreBetterAI6"},
					FigureIsAlive {Tag = "EvenMoreBetterAI7"},
				}
			},
		},
		Actions =
		{
			
		}
	},
	OnOneTimeEvent
	{
		GotoState = "DeadEnd",
		Conditions =
		{
			PlayerBuildingIsNotInRange	{Player = "pl_DarkElves", BuildingId = 0, Range = 15, X = 451, Y = 229},
		},
		Actions =
		{
		},
	},
}
State
{
	StateName = "DeadEnd"
}