gtMyHomeCoords =
{
	-- Die Koordinaten der 8 Häuser
	
	[1] = { X = 218.2, Y = 317.64 }, -- Bente (Fem2)
	[2] = { X = 372.2, Y = 236.8 }, -- Ole/Olar (Male4)
	[3] = { X = 207.4, Y = 342.7 }, -- Hedda/Hana (Fem4)
 	[4] = { X = 287.2, Y = 227.9 }, -- Gunnar (Male1)
 	[5] = { X = 181.7, Y = 243.9  }, -- Freja (Fem3)
 	[6] = { X = 624.247, Y = 323.284 }, -- Ingevert (Male3)
 	[7] = { X = 364.2, Y = 380.5 }, -- Tuva/Turja (Fem1)
 	[8] = { X = 303.7, Y = 278.4 }, -- Haldor (Male2)
} 

SacrificeCoordsX = 55.2858
SacrificeCoordsY = 417.925

gtMyWayPointA =
{
	-- Der 1. Wegpunkt für die 8 Verdächtigen
	
	[1] = { X = 202.246, Y = 325.159 }, -- Bente (Fem2)XXX
	[2] = { X = 411.962, Y = 236.982 }, -- Ole/Olar (Male4) XXX
	[3] = { X = 202.252, Y = 320.774 }, -- Hedda/Hana (Fem4) XXX
 	[4] = { X = 286.096, Y = 192.021 }, -- Gunnar (Male1) XXX
 	[5] = { X = 168.103, Y = 246.717 }, -- Freja (Fem3) XXX
 	[6] = { X = 621.12, Y = 305.744 }, -- Ingevert (Male3) XXX
 	[7] = { X = 349.099, Y = 373.356 }, -- Tuva/Turja (Fem1) XXX
 	[8] = { X = 297.096, Y = 298.674 }, -- Haldor (Male2) XXX
} 

gtMyWayPointB =
{
	-- Der 2. Wegpunkt für die 8 Verdächtigen
	
	[1] = { X = 232.418, Y = 342.809 }, -- Bente (Fem2) XXX
	[2] = { X = 410.878, Y = 274.803 }, -- Ole/Olar (Male4) XXX
	[3] = { X = 237.255, Y = 311.637 }, -- Hedda/Hana (Fem4) XXX
 	[4] = { X = 319.364, Y = 192.379 }, -- Gunnar (Male1) XXX
 	[5] = { X = 168.541, Y = 273.103 }, -- Freja (Fem3) XXX
 	[6] = { X = 609.098, Y = 292.436 }, -- Ingevert (Male3) XXX
 	[7] = { X = 340.883, Y = 335.012 }, -- Tuva/Turja (Fem1) XXX
 	[8] = { X = 331.362, Y = 290.051 }, -- Haldor (Male2) XXX
} 

gtMyWayPointC =
{
	-- Der 3. Wegpunkt für die 8 Verdächtigen
	
	[1] = { X = 236.717, Y = 312.533 }, -- Bente (Fem2) XXX
	[2] = { X = 411.962, Y = 236.98 }, -- Ole/Olar (Male4) XXX
	[3] = { X = 230.849, Y = 336.11 }, -- Hedda/Hana (Fem4) XXX
 	[4] = { X = 301.465, Y = 223.133 }, -- Gunnar (Male1) XXX
 	[5] = { X = 168.103, Y = 246.717 }, -- Freja (Fem3) XXX
 	[6] = { X = 621.12, Y = 305.744 }, -- Ingevert (Male3) XXX
 	[7] = { X = 349.099, Y = 373.356 }, -- Tuva/Turja (Fem1) XXX
 	[8] = { X = 297.096, Y = 298.674 }, -- Haldor (Male2) XXX
} 

  

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = gtMyHomeCoords[MyHomePlace].X,
		Y = gtMyHomeCoords[MyHomePlace].Y,
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_SuspectQuestGiven"},
			-- wenn der Avatar die Suspect-Quest hat
			TimeIsNotBetween{StartHour = 6, EndHour = 20},
			-- wenn es Nacht ist
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10,
			X = gtMyHomeCoords[MyHomePlace].X, Y = gtMyHomeCoords[MyHomePlace].Y},
			-- Avatar ist in der Nähe
		},
		Actions =
		{
			MapFlagSetTrue {Name = MyWatchedFlag},
			EntityFlagSetTrue {Name = "ef_Spawned"},
		},
		NoSpawnEffect = true,
	},
	

	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "DecideGuiltyOrNotGuilty"
	},
}

State
{
	StateName = "DecideGuiltyOrNotGuilty",
	
	
   	OnOneTimeEvent
   	{
   		Conditions =
   		{
   			MapFlagIsTrue{Name = MyGuiltyFlag },
   		},
   		Actions =
   		{
   		},
   		GotoState = "Guilty"
   	},
   	
   	OnOneTimeEvent
   	{
   		Conditions =
   		{
   			MapFlagIsFalse{Name = MyGuiltyFlag },
   		},
   		Actions =
   		{
   		},
   		GotoState = "NotGuilty"
   	},
   	
}



State
{
	StateName = "NotGuilty",

	OnIdleGoHomeFake
	{
		X = gtMyWayPointA[MyHomePlace].X,
		Y = gtMyWayPointA[MyHomePlace].Y,
		Range = 10,
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_MyPath", Value = 0},
		},
		OneTimeHomeActions = 
		{
			EntityValueSet {Name = "ev_MyPath", Value = 1},
		},
	}, -- 1. Wegpunkt
	
	OnIdleGoHomeFake
	{
		X = gtMyWayPointA[MyHomePlace].X,
		Y = gtMyWayPointA[MyHomePlace].Y,
		Range = 10,
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_MyPath", Value = 1},
		},
		OneTimeHomeActions = 
		{
			EntityValueSet {Name = "ev_MyPath", Value = 2},
		},
	}, -- 2. Wegpunkt
   	
   	OnIdleGoHomeFake
	{
		X = gtMyWayPointC[MyHomePlace].X,
		Y = gtMyWayPointC[MyHomePlace].Y,
		Range = 10,
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_MyPath", Value = 2},
		},
		OneTimeHomeActions = 
		{
			EntityValueSet {Name = "ev_MyPath", Value = 3},
		},
	}, -- 3. Wegpunkt
	
	OnIdleGoHomeFake
	{
		X = gtMyHomeCoords[MyHomePlace].X,
		Y = gtMyHomeCoords[MyHomePlace].Y,
		Range = 10,
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_MyPath", Value = 3},
		},
		OneTimeHomeActions = 
		{
			FigureVanish{},
		},
	}, -- zurück nach Haus
   	
}

State
{
	StateName = "Guilty",

	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigureUnitChange	{Tag = "default", UnitId = MyGender, Level = 10 },
			-- weibliche Verdächtige
		},
	},

	OnIdleGoHomeFake
	{
		X = SacrificeCoordsX,
		Y = SacrificeCoordsY,
		Range = 10,
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_MyPath", Value = 0},
		},
		OneTimeHomeActions = 
		{
			EntityValueSet {Name = "ev_MyPath", Value = 1},
		},
	}, -- Ritualplatz
	
	
	OnIdleGoHomeFake
	{
		X = gtMyHomeCoords[MyHomePlace].X,
		Y = gtMyHomeCoords[MyHomePlace].Y,
		Range = 10,
		Conditions = 
		{
			EntityValueIsEqual{Name = "ev_MyPath", Value = 1},
		},
		OneTimeHomeActions = 
		{
			FigureVanish{},
		},
	}, -- zurück nach Haus
   	
}