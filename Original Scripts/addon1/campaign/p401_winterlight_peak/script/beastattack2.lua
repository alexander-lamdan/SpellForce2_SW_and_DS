State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 187,
		Y = 58,
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
		X = 187,
		Y = 58,
		Conditions =
		{
			QuestIsNotSolved {Quest = "WinterlightPeak_CloseIt"}
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P407_Respawn"},
			EntityFlagSetFalse {Name = "ef_P401_There"}
		},
		
	},
	OnIdleRunHomeFake
	{
		X = myX,
		Y = myY,
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_P401_There"}
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
		X = 82,
		Y = 102,
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P401_There"}
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