Coords = 
{
	X = 
	{ 
		[1] = 437.407,
		[2] = 317.733,
		[3] = 244.092,
		[4] = 352.508,
		[5] = 533,
		[6] = 567.964,
		
	},
	Y = 
	{ 
		[1] = 431.616,
		[2] = 395.864,
		[3] = 184.987,
		[4] = 92.2741,
		[5] = 140,
		[6] = 303.052,
		
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
			EntityValueSet{Name = "ev_TourDeCrater", Value = 2},
		},
		
	};

	OnEvent
	{
		GotoState = "Point02",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeCrater", Value = 2},
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
			EntityValueSet{Name = "ev_TourDeCrater", Value = 3},
		},
		
	};

	OnEvent
	{
		GotoState = "Point03",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeCrater", Value = 3},
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
			EntityValueSet{Name = "ev_TourDeCrater", Value = 4},
		},
		
	};

	OnEvent
	{
		GotoState = "Point04",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeCrater", Value = 4},
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
			EntityValueSet{Name = "ev_TourDeCrater", Value = 5},
		},
		
	};

	OnEvent
	{
		GotoState = "Point05",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeCrater", Value = 5},
		},
		Actions = 
		{
		},
	};
		
}


State
{
	StateName = "Point05",
	
	
	OnIdleGoHomeFake
	{
		X = Coords.X[5],
		Y = Coords.Y[5],
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
			EntityValueSet{Name = "ev_TourDeCrater", Value = 6},
		},
		
	};

	OnEvent
	{
		GotoState = "Point06",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeCrater", Value = 6},
		},
		Actions = 
		{
		},
	};
		
}


State
{
	StateName = "Point06",
	
	
	OnIdleGoHomeFake
	{
		X = Coords.X[6],
		Y = Coords.Y[6],
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
			EntityValueSet{Name = "ev_TourDeCrater", Value = 1},
		},
		
	};

	OnEvent
	{
		GotoState = "Point01",
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_TourDeCrater", Value = 1},
		},
		Actions = 
		{
		},
	};
		
}