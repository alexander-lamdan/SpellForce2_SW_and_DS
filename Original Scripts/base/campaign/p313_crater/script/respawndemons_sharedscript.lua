Coords = 
{
	A = {X = 496.79, Y = 101.349},
	B = {X = 372.21, Y = 85.4601},
	C = {X = 388.221, Y = 167.799},
	D = {X = 243.741, Y = 112.751},
	E = {X = 260.219, Y = 162.167},
	F = {X = 298.561, Y = 199.838},
	G = {X = 553.583, Y = 125.976},
	Ha = {X = 365.42, Y = 373.571},
	Hb = {X = 386.392, Y = 377.745},
	Hc = {X = 377.971, Y = 354.451},
	Hd = {X = 385.943, Y = 364.667},
	He = {X = 415.652, Y = 369.59},
	I = {X = 391.975, Y = 293.55},
	J = {X = 258.704, Y = 321.392},
	K = {X = 389.769, Y = 454.181},
	L = {X = 476.203, Y = 426.632},
	M = {X = 492.442, Y = 351.571},
}

BuildingTag =
{
	A = "DemonPortalA",
	B = "DemonPortalB",
	C = "DemonPortalC",
	D = "DemonPortalD",
	E = "DemonPortalE",
	F = "DemonPortalF",
	G = "DemonPortalG",
	Ha = "RaptorNestHa",
	Hb = "RaptorNestHb",
	Hc = "RaptorNestHc",
	Hd = "RaptorNestHd",
	He = "RaptorNestHe",
	I = "RaptorNestI",
	J = "UndeadCampJ",
	K = "UndeadCampK",
	L = "UndeadCampL",
	M = "UndeadCampM",
}


State
{
	StateName = "Main",
	
	OnFigureRespawnEvent
	{
		WaitTime = MyRespawnTime,
		X = Coords[MyCamp].X,
		Y = Coords[MyCamp].Y,
		Conditions = 
		{
			BuildingIsAlive{Tag = BuildingTag[MyCamp]},
		},
		Actions = 
		{
		},
		DeathActions = 
		{
		},
		DelayedActions = 
		{
		},
	};
	
	OnIdleGoHomeFake
	{
		X = GetEntityX(),
		Y = GetEntityY(),
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
		},
		OneTimeHomeActions = 
		{
		},
	};




	
	
}