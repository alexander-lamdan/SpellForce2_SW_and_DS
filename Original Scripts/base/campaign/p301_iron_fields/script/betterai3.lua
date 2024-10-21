State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 452,
		Y = 221,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Mission"},
			MapTimerIsElapsed {Name = "mt_P301_OutcriesAfterShadowFight", Seconds = 180},
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
					FigureIsAlive {Tag = "BetterAI1"},
					FigureIsAlive {Tag = "BetterAI2"},
					FigureIsAlive {Tag = "BetterAI3"},
					FigureIsAlive {Tag = "BetterAI4"},
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
			QuestIsSolved {Quest = "AwakeTreants"},
		},
		Actions =
		{
		}
	},
}
State
{
	StateName = "DeadEnd"
}