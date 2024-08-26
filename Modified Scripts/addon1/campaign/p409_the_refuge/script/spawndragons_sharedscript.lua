PlayerBaseCoords = { X = 587.741, Y = 101.019,  }
                   
NestACoords = { X = 378.939, Y = 154.052,  }
NestBCoords = { X = 552.288, Y = 344.984,  }
NestCCoords = { X = 256.857, Y = 330.559,  }
NestDCoords = { X = 413.969, Y = 455.81,  }

Routepoint1 =
{
	A = { X = NestACoords.X, Y = NestACoords.Y, },
	B = { X = NestBCoords.X, Y = NestBCoords.Y, },
	C = { X = NestCCoords.X, Y = NestCCoords.Y, },
	D = { X = NestDCoords.X, Y = NestDCoords.Y, },
}

Routepoint2 =
{
	A = { X = NestBCoords.X, Y = NestBCoords.Y, },
	B = { X = NestCCoords.X, Y = NestCCoords.Y, },
	C = { X = NestACoords.X, Y = NestACoords.Y, },
	D = { X = NestBCoords.X, Y = NestBCoords.Y, },
}

Routepoint3 =
{
	A = { X = NestDCoords.X, Y = NestDCoords.Y, },
	B = { X = NestACoords.X, Y = NestACoords.Y, },
	C = { X = NestBCoords.X, Y = NestBCoords.Y, },
	D = { X = NestCCoords.X, Y = NestCCoords.Y, },
}

Routepoint4 =
{
	A = { X = NestCCoords.X, Y = NestCCoords.Y, },
	B = { X = NestDCoords.X, Y = NestDCoords.Y, },
	C = { X = NestDCoords.X, Y = NestDCoords.Y, },
	D = { X = NestACoords.X, Y = NestACoords.Y, },
}

ProtectionValue =
{
	A = { ValueName = "mv_NestABuildingsDestroyed", CriticalValue = 3}, 
	B = { ValueName = "mv_NestBBuildingsDestroyed", CriticalValue = 3},
	C = { ValueName = "mv_NestCBuildingsDestroyed", CriticalValue = 3},
	D = { ValueName = "mv_NestDBuildingsDestroyed", CriticalValue = 3},   
}

RespawnStopValue =
{
	A = { ValueName = "mv_NestABuildingsDestroyed", CriticalValue = 7}, 
	B = { ValueName = "mv_NestBBuildingsDestroyed", CriticalValue = 5},
	C = { ValueName = "mv_NestCBuildingsDestroyed", CriticalValue = 7},
	D = { ValueName = "mv_NestDBuildingsDestroyed", CriticalValue = 6},   
}


-- es gibt vier Arten von Behavior:
-- BaseDefender: bleibt immer im eigenen Lager
-- AttackTroop: attackiert immer das Spieler-Basislager
-- Verstarkung: bleibt solange im eigenen Lager stehen, bis ein bestimmtes (exakt definiertes) 
--				Nachbarlager angegriffen wird,
--				dann Angriff der durch den Kampf geschwächten feindlichen Truppen
-- Patrol: patrouilliert durch alle vier Lager



------------------------------------------------------------------------------------------------------
-----------                                  	VERSTARKUNG                                 ----------
------------------------------------------------------------------------------------------------------

if MyBehavior == "Verstarkung" then


	State
	{
		StateName = "INIT04",
	
		OnFigureSpawnOnlyWhenEvent
		{
			X = GetEntityX(),
			Y = GetEntityY(),
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_CS01Ended"},
			},
			Actions = 
			{
			},
		};
		
		OnFigureRespawnEvent
		{
			WaitTime = 600,
			X = GetEntityX(),
			Y = GetEntityY(),
			Conditions = 
			{
				MapValueIsLess
				{
					Name = RespawnStopValue[MyCamp].ValueName, 
				 	Value = RespawnStopValue[MyCamp].CriticalValue, 
				},
			},
			Actions = 
			{
			},
		};
		
		OnIdleRunHomeFake
		{
			X = GetEntityX(),
			Y = GetEntityY(),
			Range = 8,
			GotoForced = false,
			UpdateInterval = 10,
			Conditions = 
			{
				OR
				{
					MapValueIsLess
					{
						Name = ProtectionValue[MyProtectCamp].ValueName, 
				 		Value = ProtectionValue[MyProtectCamp].CriticalValue, 
					},
					MapFlagIsTrue{Name = "mf_SecondPartOfMapStarted"},
				},
			},
		};
		
		OnIdleRunHomeFake
		{
			X = Routepoint1[MyProtectCamp].X,
			Y = Routepoint1[MyProtectCamp].Y,
			Range = 8,
			GotoForced = false,
			UpdateInterval = 10,
			Conditions = 
			{
				NotOR
				{
					MapValueIsLess
					{
						Name = ProtectionValue[MyProtectCamp].ValueName, 
				 		Value = ProtectionValue[MyProtectCamp].CriticalValue, 
					},
					MapFlagIsTrue{Name = "mf_SecondPartOfMapStarted"},
				},
			},
		};
		
		OnOneTimeEvent
		{
			Conditions =
			{
				MapFlagIsTrue{Name = "mf_SecondPartOfMapStarted"},
			},
			Actions =
			{
				FigureTeamTransfer	{Tag = "default", Team = "tm_Team1"},
			},
		},
}



------------------------------------------------------------------------------------------------------
-----------                                  BASEDEFENDER                                    ----------
------------------------------------------------------------------------------------------------------

elseif MyBehavior == "BaseDefender" then


	State
	{
		StateName = "INIT03",
	
		OnFigureSpawnOnlyWhenEvent
		{
			X = GetEntityX(),
			Y = GetEntityY(),
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_CS01Ended"},
			},
			Actions = 
			{
			},
		};
		
		OnFigureRespawnEvent
		{
			WaitTime = 600,
			X = GetEntityX(),
			Y = GetEntityY(),
			Conditions = 
			{
				MapValueIsLess
				{
					Name = RespawnStopValue[MyCamp].ValueName, 
				 	Value = RespawnStopValue[MyCamp].CriticalValue, 
				},
			},
			Actions = 
			{
			},
		};
		
		OnIdleRunHomeFake
		{
			X = GetEntityX(),
			Y = GetEntityY(),
			Range = 8,
			GotoForced = false,
			UpdateInterval = 10,
			Conditions = 
			{
			},
			Actions = 
			{
			},
			HomeActions = 
			{
			},
		};
		
		OnOneTimeEvent
		{
			Conditions =
			{
				MapFlagIsTrue{Name = "mf_SecondPartOfMapStarted"},
			},
			Actions =
			{
				FigureTeamTransfer	{Tag = "default", Team = "tm_Team1"},
			},
		},
}


------------------------------------------------------------------------------------------------------
-----------                                  ATTACKTROOP                                    ----------
------------------------------------------------------------------------------------------------------

elseif MyBehavior == "AttackTroop" then


	State
	{
		StateName = "INIT01",
	
		OnFigureSpawnOnlyWhenEvent
		{
			X = GetEntityX(),
			Y = GetEntityY(),
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_CS01Ended"},
				MapTimerIsElapsed{Name = "mt_AttackTroopTimer", Seconds = MySpawnTime},
			},
			Actions = 
			{
				EntityTimerStart{Name = "et_WaitAfterSpawned"},
			},
		};
		
		OnFigureRespawnEvent
		{
			WaitTime = 500,
			X = GetEntityX(),
			Y = GetEntityY(),
			Conditions = 
			{
				MapValueIsLess
				{
					Name = RespawnStopValue[MyCamp].ValueName, 
				 	Value = RespawnStopValue[MyCamp].CriticalValue, 
				},
			},
			Actions = 
			{
				EntityTimerStart{Name = "et_WaitAfterSpawned"},
			},
		};
		
		
		
		OnIdleRunHomeFake
		{
			X = GetEntityX(),
			Y = GetEntityY(),
			Range = 8,
			GotoForced = false,
			UpdateInterval = 10,
			Conditions = 
			{
				NotAND
				{
					PlayerHasBuildingAmount	{Player = "pl_Human", Amount = 1, OnlyCompleted = false},
					MapFlagIsFalse{Name = "mf_SecondPartOfMapStarted"},
					EntityTimerIsElapsed{Name = "et_WaitAfterSpawned", Seconds = 30},
				},
			},
			Actions = 
			{
			},
			HomeActions = 
			{
			},
		};
		
		
		OnIdleRunHomeFake
		{
			X = PlayerBaseCoords.X,
			Y = PlayerBaseCoords.Y,
			Range = 8,
			GotoForced = false,
			UpdateInterval = 10,
			Conditions = 
			{
				PlayerHasBuildingAmount	{Player = "pl_Human", Amount = 1, OnlyCompleted = false},
				MapFlagIsFalse{Name = "mf_SecondPartOfMapStarted"},
				EntityTimerIsElapsed{Name = "et_WaitAfterSpawned", Seconds = 30},
			},
			Actions = 
			{
			},
			HomeActions = 
			{
			},
		};
		
		OnOneTimeEvent
		{
			Conditions =
			{
				MapFlagIsTrue{Name = "mf_SecondPartOfMapStarted"},
			},
			Actions =
			{
				FigureTeamTransfer	{Tag = "default", Team = "tm_Team1"},
			},
		},
}



------------------------------------------------------------------------------------------------------
-----------                                  PATROL                                         ----------
------------------------------------------------------------------------------------------------------


elseif MyBehavior == "Patrol" then


	State
	{
		StateName = "INIT02",
	
		OnFigureSpawnOnlyWhenEvent
		{
			X = GetEntityX(),
			Y = GetEntityY(),
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_CS01Ended"},
			},
			Actions = 
			{
				EntityValueSet{Name = "ev_MyCurrentPos", Value = 1},
			},
		};
		
		--OnFigureRespawnEvent
		--{
		--	WaitTime = 600,
		--	X = GetEntityX(),
		--	Y = GetEntityY(),
		--	Conditions = 
		--	{
		--		MapValueIsLess
		--		{
		--			Name = RespawnStopValue[MyCamp].ValueName, 
		--		 	Value = RespawnStopValue[MyCamp].CriticalValue, 
		--		},
		--	},
		--	Actions = 
		--	{
		--	},
		--};
		-- Patrouillen sollen nicht mehr nachspawnen
		

		OnIdleRunHomeFake
		{
			X = Routepoint1[MyCamp].X,
			Y = Routepoint1[MyCamp].Y,
			Range = 8,
			GotoForced = false,
			UpdateInterval = 10,
			Conditions = 
			{
				EntityValueIsEqual{Name = "ev_MyCurrentPos", Value = 1},
				MapFlagIsFalse{Name = "mf_SecondPartOfMapStarted"},
			},
			Actions = 
			{
			},
			HomeActions = 
			{
				EntityValueSet{Name = "ev_MyCurrentPos", Value = 2},
			},
		};
		
		OnIdleRunHomeFake
		{
			X = Routepoint2[MyCamp].X,
			Y = Routepoint2[MyCamp].Y,
			Range = 8,
			GotoForced = false,
			UpdateInterval = 10,
			Conditions = 
			{
				EntityValueIsEqual{Name = "ev_MyCurrentPos", Value = 2},
				MapFlagIsFalse{Name = "mf_SecondPartOfMapStarted"},
			},
			Actions = 
			{
			},
			HomeActions = 
			{
				EntityValueSet{Name = "ev_MyCurrentPos", Value = 3},
			},
		};
		
		OnIdleRunHomeFake
		{
			X = Routepoint3[MyCamp].X,
			Y = Routepoint3[MyCamp].Y,
			Range = 8,
			GotoForced = false,
			UpdateInterval = 10,
			Conditions = 
			{
				EntityValueIsEqual{Name = "ev_MyCurrentPos", Value = 3},
				MapFlagIsFalse{Name = "mf_SecondPartOfMapStarted"},
			},
			Actions = 
			{
			},
			HomeActions = 
			{
				EntityValueSet{Name = "ev_MyCurrentPos", Value = 4},
			},
		};
		
		OnIdleRunHomeFake
		{
			X = Routepoint4[MyCamp].X, 
			Y = Routepoint4[MyCamp].Y, 
			Range = 8,
			GotoForced = false,
			UpdateInterval = 10,
			Conditions = 
			{
				EntityValueIsEqual{Name = "ev_MyCurrentPos", Value = 4},
				MapFlagIsFalse{Name = "mf_SecondPartOfMapStarted"},
			},
			Actions = 
			{
			},
			HomeActions = 
			{
				EntityValueSet{Name = "ev_MyCurrentPos", Value = 1},
			},
		};
		
		OnIdleRunHomeFake
		{
			X = GetEntityX(),
			Y =  GetEntityY(),
			Range = 8,
			GotoForced = false,
			UpdateInterval = 10,
			Conditions = 
			{
				MapFlagIsTrue{Name = "mf_SecondPartOfMapStarted"},
			},
			Actions = 
			{
			},
			HomeActions = 
			{
			},
		};
		
		OnOneTimeEvent
		{
			Conditions =
			{
				MapFlagIsTrue{Name = "mf_SecondPartOfMapStarted"},
			},
			Actions =
			{
				FigureTeamTransfer	{Tag = "default", Team = "tm_Team1"},
			},
		},
		
	}


end