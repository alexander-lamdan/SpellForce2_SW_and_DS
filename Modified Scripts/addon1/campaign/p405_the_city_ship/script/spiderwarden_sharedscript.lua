Coords = 
{
	
	[1] = { X = 269.542, Y = 257.247, },
	[2] = { X = 305.655, Y = 253.822, },
	[3] = { X = 368.809, Y = 269.113, },
	[4] = { X = 422.836, Y = 318.483, },
	[5] = { X = 423.166, Y = 354.268, },
	[6] = { X = 270.247, Y = 354.702, },
	[7] = { X = 271.014, Y = 287.664, },
	
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
