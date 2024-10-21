Coords = 
{
	
	[1] = { X = 398.665, Y = 304.857, },
	[2] = { X = 399.174, Y = 365.384, },
	[3] = { X = 347.084, Y = 321.742, },
	[4] = { X = 270.954, Y = 365.141, },
	[5] = { X = 269.283, Y = 317.292, },
	[6] = { X = 264.589, Y = 371.425, },
	[7] = { X = 399.174, Y = 365.384, },
	
}

State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
		},
		GotoState = MyStartState,
	},	
}

	
State
{
	StateName = "Point01",
	
	
	OnIdleGoHomeFake
	{
		X = Coords[1].X,
		Y = Coords[1].Y,
		Range = 15,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_TourDeCityShip", Value = 2},
		},
		
	};
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroWind", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroWisper", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroCaine", Range = 5},
				
			},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "default", Team = "tm_Creep"},
		},
	},
	
	
	OnEvent
	{
		GotoState = "Point02",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeCityShip", Value = 2},
		},
		Actions = 
		{
		},
	};
	
	
	-- Im 3. Teil sterben alle Creeps
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_KillAllCreeps"},
		},
		Actions =
		{
			FigureKill	{Tag = "default"},
		},
	},
		
}

State
{
	StateName = "Point02",
	
	
	OnIdleGoHomeFake
	{
		X = Coords[2].X,
		Y = Coords[2].Y,
		Range = 15,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_TourDeCityShip", Value = 3},
		},
		
	};
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroWind", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroWisper", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroCaine", Range = 5},
				
			},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "default", Team = "tm_Creep"},
		},
	},
	
	OnEvent
	{
		GotoState = "Point03",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeCityShip", Value = 3},
		},
		Actions = 
		{
		},
	};
	
	
	-- Im 3. Teil sterben alle Creeps
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_KillAllCreeps"},
		},
		Actions =
		{
			FigureKill	{Tag = "default"},
		},
	},
		
}


State
{
	StateName = "Point03",
	
	
	OnIdleGoHomeFake
	{
		X = Coords[3].X,
		Y = Coords[3].Y,
		Range = 15,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_TourDeCityShip", Value = 4},
		},
		
	};
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroWind", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroWisper", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroCaine", Range = 5},
			},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "default", Team = "tm_Creep"},
		},
	},
	
	OnEvent
	{
		GotoState = "Point04",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeCityShip", Value = 4},
		},
		Actions = 
		{
		},
	};
	
	-- Im 3. Teil sterben alle Creeps
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_KillAllCreeps"},
		},
		Actions =
		{
			FigureKill	{Tag = "default"},
		},
	},
		
}

State
{
	StateName = "Point04",
	
	
	OnIdleGoHomeFake
	{
		X = Coords[4].X,
		Y = Coords[4].Y,
		Range = 15,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_TourDeCityShip", Value = 5},
		},
		
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroWind", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroWisper", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroCaine", Range = 5},
			},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "default", Team = "tm_Creep"},
		},
	},
	
	
	OnEvent
	{
		GotoState = "Point05",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeCityShip", Value = 5},
		},
		Actions = 
		{
		},
	};
	
	-- Im 3. Teil sterben alle Creeps
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_KillAllCreeps"},
		},
		Actions =
		{
			FigureKill	{Tag = "default"},
		},
	},
		
}


State
{
	StateName = "Point05",
	
	
	OnIdleGoHomeFake
	{
		X = Coords[5].X,
		Y = Coords[5].Y,
		Range = 15,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_TourDeCityShip", Value = 6},
		},
		
	};
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroWind", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroWisper", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroCaine", Range = 5},
			},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "default", Team = "tm_Creep"},
		},
	},
	
	OnEvent
	{
		GotoState = "Point06",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeCityShip", Value = 6},
		},
		Actions = 
		{
		},
	};
	
	-- Im 3. Teil sterben alle Creeps
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_KillAllCreeps"},
		},
		Actions =
		{
			FigureKill	{Tag = "default"},
		},
	},
		
}


State
{
	StateName = "Point06",
	
	
	OnIdleGoHomeFake
	{
		X = Coords[6].X,
		Y = Coords[6].Y,
		Range = 15,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_TourDeCityShip", Value = 7},
		},
		
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroWind", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroWisper", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroCaine", Range = 5},
			},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "default", Team = "tm_Creep"},
		},
	},
	
	
	OnEvent
	{
		GotoState = "Point07",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeCityShip", Value = 7},
		},
		Actions = 
		{
		},
	};
	
	
	-- Im 3. Teil sterben alle Creeps
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_KillAllCreeps"},
		},
		Actions =
		{
			FigureKill	{Tag = "default"},
		},
	},
}
	
	
State
{
	StateName = "Point07",
	
	
	OnIdleGoHomeFake
	{
		X = Coords[7].X,
		Y = Coords[7].Y,
		Range = 15,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_TourDeCityShip", Value = 1},
		},
		
	};
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroWind", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroWisper", Range = 5},
				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanHeroCaine", Range = 5},
			},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "default", Team = "tm_Creep"},
		},
	},
	
	OnEvent
	{
		GotoState = "Point01",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeCityShip", Value = 1},
		},
		Actions = 
		{
		},
	};
	
	
	-- Im 3. Teil sterben alle Creeps
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_KillAllCreeps"},
		},
		Actions =
		{
			FigureKill	{Tag = "default"},
		},
	},
		
}
