Coords = 
{
	X = 
	{ 
		[1] = 238.592,
		[2] = 220.949,
		[3] = 219.268,
		[4] = 243.72,
	},
	Y = 
	{ 
		[1] = 312.159,
		[2] = 310.999,
		[3] = 274.11,
		[4] = 275.069,
	},
}



State
{
	StateName = "Point01",
	
	
	OnIdleGoHomeFake
	{
		X = Coords.X[1],
		Y = Coords.Y[1],
		Range = 8,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_TourDeGF", Value = 2},
		},
		
	};

	OnEvent
	{
		GotoState = "Point02",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeGF", Value = 2},
		},
		Actions = 
		{
		},
	};
		
}

State
{
	StateName = "Point02",
	
	
	OnIdleGoHomeFake
	{
		X = Coords.X[2],
		Y = Coords.Y[2],
		Range = 8,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_TourDeGF", Value = 3},
		},
		
	};

	OnEvent
	{
		GotoState = "Point03",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeGF", Value = 3},
		},
		Actions = 
		{
		},
	};
		
}


State
{
	StateName = "Point03",
	
	
	OnIdleGoHomeFake
	{
		X = Coords.X[3],
		Y = Coords.Y[3],
		Range = 8,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_TourDeGF", Value = 4},
		},
		
	};

	OnEvent
	{
		GotoState = "Point04",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeGF", Value = 4},
		},
		Actions = 
		{
		},
	};
		
}

State
{
	StateName = "Point04",
	
	
	OnIdleGoHomeFake
	{
		X = Coords.X[4],
		Y = Coords.Y[4],
		Range = 8,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			EntityValueSet{Name = "ev_TourDeGF", Value = 5},
		},
		
	};

	OnEvent
	{
		GotoState = "Point01",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeGF", Value = 5},
		},
		Actions = 
		{
		},
	};
		
}

