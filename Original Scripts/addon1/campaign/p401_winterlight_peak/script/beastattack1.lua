State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 182,
		Y = 54,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_EndIntroCS"}
		},
		Actions =
		{
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = myWait,
		X = 182,
		Y = 54,
		Conditions =
		{
			QuestIsNotSolved {Quest = "WinterlightPeak_CloseIt" }
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_P401_There"}
		},
		
	},
	OnIdleRunHomeFake
	{
		X = myX,
		Y = myY,
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_P401_There"},
			MapFlagIsFalse {Name = "mf_P401_EndGateCS"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			EntityFlagSetTrue {Name = "ef_P401_There"}
		}
	},
	OnIdleRunHomeFake
	{
		X = 133,
		Y = 120,
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P401_There"},
			MapFlagIsFalse {Name = "mf_P401_EndGateCS"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			EntityFlagSetFalse {Name = "ef_P401_There"}
		},
	},
	-- Wenn die Tore zu sind bleiben die Einheiten wo sie sind
	OnOneTimeEvent
	{
		GotoState = "GatesClosed",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_EndGateCS"},
		},
		Actions =
		{
		},
	}
}

State
{
	StateName = "GatesClosed"
}