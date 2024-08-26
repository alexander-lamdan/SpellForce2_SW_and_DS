
MyValue =
{
	Hate = "mv_CounterHateThoughts",
	Fear = "mv_CounterFearThoughts",
	Wrath = "mv_CounterWrathThoughts",
	Madness = "mv_CounterMadnessThoughts",
	Gross = "mv_CounterGrossThoughts",
}

MyGoHomeFlag =
{
	Hate = "mf_HassGeisterGerufen",
	Fear = "mf_AngstGeisterGerufen",
	Wrath = "mf_ZornGeisterGerufen",
	Madness = "mf_WahnsinnGeisterGerufen",
	Gross = "mf_AbscheuGeisterGerufen",
}

MindEntityX = 266.496 
MindEntityY = 380.328 

State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			QuestIsActive {Quest = "CityShip4_CallGrossThoughts"},
		},
		Actions = 
		{
			EntityFlagSetTrue{Name = "ef_Spawned"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "GoingHome",
	},
}


State
{
	StateName = "GoingHome",
	
	OnIdleRunHomeFake
	{
		X = MindEntityX,
		Y = MindEntityY,
		Range = 8,
		UpdateInterval = 0,
		StopFigureWhenConditionsAreFalse = true,
		Conditions = 
		{
			MapFlagIsTrue{Name = MyGoHomeFlag[MyKind]},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			FigureVanish	{Tag = "default"},
		},
	};
	
	OnIdleRunHomeFake
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Range = 8,
		UpdateInterval = 0,
		StopFigureWhenConditionsAreFalse = true,
		Conditions = 
		{
			MapFlagIsFalse{Name = MyGoHomeFlag[MyKind]},
		},
		Actions = 
		{
		},
	};



	OnFigureRespawnEvent
	{
		WaitTime = 10,
		X = GetEntityX(),
		Y = GetEntityX(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_ThisWillNeverBeTrue"},
		},
		Actions = 
		{
		},
		DeathActions = 
		{
			MapValueIncrease {Name = MyValue[MyKind]},
		},
	};

}
