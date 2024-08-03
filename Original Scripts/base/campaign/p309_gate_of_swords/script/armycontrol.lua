-- Skript um den Trupp vom Eisenfürsten am Portal verschwinden zu lassen

State
{
	StateName = "Init",
	OnOneTimeEvent
	{
		GotoState = "Fight",
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P309_CutsceneGateEndEnd"},
		},
		Actions =
		{
			
		}
	}
}
State
{
	StateName = "Fight",
	-- Wenn der Eisenfürst tot ist GameOver
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "IronLord"},
			MapTimerIsNotElapsed {Name = "mt_P309_IronLordLeavesSave", Seconds = 1}
		},
		Actions =
		{
			PlayerGameOver {Tag = "IronLord_DEAD", LocaTag = "GameOverSF2IronlordDied"},
		}
	},
	-- Outcries des Eisenfürsten
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord", X = 536, Y = 194, Range = 10},
		},
		Actions =
		{
			FigureOutcry {Tag = "IronLord", TextTag = "IronLord1"},
			FigureOutcry {Tag = "IronLord", TextTag = "IronLord2"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army01", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army01"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army02", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army02"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army03", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army03"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army04", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army04"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army05", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army05"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army06", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army06"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army07", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army07"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army08", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army08"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army09", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army09"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army10", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army10"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army11", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army11"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army12", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army12"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army13", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army13"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army14", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army14"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army15", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army15"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army16", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army16"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army17", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army17"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army18", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army18"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army19", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army19"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord_Army20", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord_Army20"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "IronLord", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			MapTimerStart {Name = "mt_P309_IronLordLeavesSave"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P309_IronLordLeavesSave", Seconds = 6}
		},
		Actions =
		{
			FigureVanish {Tag = "IronLord"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "Nightsong", X = 536.2, Y = 145.6, Range = 2},
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {Tag = "Nightsong"},
		}
	},
	
	
	
}