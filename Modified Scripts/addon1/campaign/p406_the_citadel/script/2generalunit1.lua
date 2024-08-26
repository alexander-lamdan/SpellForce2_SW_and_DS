AttackPointCamp1X = 439 + (math.random(8)-4)
AttackPointCamp1Y = 434 + (math.random(8)-4)
AttackPointCamp2X = 250 + (math.random(8)-4)
AttackPointCamp2Y =	428 + (math.random(8)-4)
AttackPointCamp3X = 449	+ (math.random(8)-4)
AttackPointCamp3Y = 358 + (math.random(8)-4)
AttackPointCamp4X = 456 + (math.random(8)-4)
AttackPointCamp4Y = 266 + (math.random(8)-4)
AttackPointCamp5X = 250 + (math.random(8)-4)
AttackPointCamp5Y = 253 + (math.random(8)-4)
--*******************************************************
--***                                                 ***
--***          General2UnitsSammelscript              ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	--wird erst gespawned wenn der Spieler von der Dragh lur kommt.
	OnFigureSpawnOnlyWhenEvent	
	{
		X = GetEntityX(), Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P406_GeneralsReady"},
		},
		Actions = 
		{
			FigureHoldPosition	{},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = false
		
	},
	
	--Unit kehrt zur Basis zurück, wenn sich der ANgriffsbefehl verändert hat.
	OnIdleGoHomeFake
  	{
  		UpdateInterval = 50,
  		X = GetEntityX(), Y = GetEntityY(),
  		StopFigureWhenConditionsAreFalse = true, 
  		Conditions = 
  		{
  			MapFlagIsFalse {Name = "mf_AttackAim1"},
  			MapFlagIsFalse {Name = "mf_AttackAim2"},
  			MapFlagIsFalse {Name = "mf_AttackAim3"},
  			MapFlagIsFalse {Name = "mf_AttackAim4"},
  			OR
  			{
  				MapFlagIsFalse	{Name = "mf_AttackGuardian"},
  				FigureIsDead	{Tag = "GateMonster"},
  			},
  		},
  		Actions = 
		{
			
		},
  	}, -- wenn kein Auftrag, dann zurück zum Homepoint
  
  
	OnIdleRunHomeFake
  	{
  		UpdateInterval = 50,
  		X = AttackPointCamp1X, Y = AttackPointCamp1Y,
  		StopFigureWhenConditionsAreFalse = true,
  		Conditions = 
  		{
  			MapFlagIsTrue {Name = "mf_AttackAim1"},
  		},
  		Actions = 
		{
		}, -- Wenn Auftrag "greife Camp 1 an", dann geh zu Camp 1
  	},

	
	OnIdleRunHomeFake
  	{
  		UpdateInterval = 50,
  		X = AttackPointCamp2X, Y = AttackPointCamp2Y,
  		StopFigureWhenConditionsAreFalse = true,
  		Conditions = 
  		{
  			MapFlagIsTrue {Name = "mf_AttackAim2"},
  		},
  		Actions = 
		{
		}, -- Wenn Auftrag "Greif Camp 2 an", dann geh zu Camp 2
  	},

	OnIdleRunHomeFake
  	{
  		UpdateInterval = 50,
  		X = AttackPointCamp3X, Y = AttackPointCamp3Y,
  		StopFigureWhenConditionsAreFalse = true,
  		Conditions = 
  		{
  			MapFlagIsTrue {Name = "mf_AttackAim3"},
  		},
  		Actions = 
		{
		}, -- Wenn Auftrag "Greif Camp 3 an", dann geh zu Camp 3
  	}, 
  	
  	OnIdleRunHomeFake
  	{
  		UpdateInterval = 50,
  		X = AttackPointCamp4X, Y = AttackPointCamp4Y,
  		StopFigureWhenConditionsAreFalse = true,
  		Conditions = 
  		{
  			MapFlagIsTrue {Name = "mf_AttackAim4"},
  		},
  		Actions = 
		{
		}, -- Wenn Auftrag "Greif Camp 4 an", dann geh zu Camp 4
  	}, 
  	
--  	OnIdleRunHomeFake
--  	{
--  		UpdateInterval = 50,
--  		X = AttackPointCamp5X, Y = AttackPointCamp5Y,
--  		StopFigureWhenConditionsAreFalse = true,
--  		Conditions = 
--  		{
--  			MapFlagIsTrue	{Name = "mf_AttackGuardian"},
--  		},
--  		Actions = 
--		{
--			FigureForceAttackEntity	{TargetTag = "GateMonster"},
--		}, -- Wenn Auftrag "Greif Torwächter an", dann geh zum Torwächter
--  	}, 
	
	OnEvent
	{
		Conditions =
		{
			FigureIsAlive	{Tag = "GateMonster"},
			MapFlagIsTrue	{Name = "mf_AttackGuardian"},
			EntityFlagIsFalse	{Name = "ef_OneTimeAttack"},
		},
		Actions =
		{
			FigureForceAttackEntity	{TargetTag = "GateMonster"},
			EntityFlagSetTrue	{Name = "ef_OneTimeAttack"},
		},
		
	},
		
	OnFigureRespawnEvent	
	{
		WaitTime = 8,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportEndMarkerCitadel", Range = 2},
		},
		Actions = 
		{
			EntityFlagSetFalse	{Name = "ef_OneTimeAttack"},
		},
		DeathActions = 
		{
			
		}, 
		DelayedActions = 
		{
		}, 
		NoSpawnEffect = false, 
		IsSpawnOnlyWhen = false,
	},
	
};

