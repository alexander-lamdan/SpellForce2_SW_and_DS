

AttackPointCamp1X = 191 + (math.random(8)-4)
AttackPointCamp1Y = 500 + (math.random(8)-4)
AttackPointCamp2X = 418 + (math.random(8)-4)
AttackPointCamp2Y = 323 + (math.random(8)-4)
AttackPointCamp3X = 448 + (math.random(8)-4)
AttackPointCamp3Y = 150 + (math.random(8)-4)
AttackPointBulwarkX = 563 + (math.random(8)-4)
AttackPointBulwarkY = 472 + (math.random(8)-4)
-- die Attackpunkt der drei Camps und des Bulwarks


POSHQX = {Einar = 171,
		  Karan = 254}
POSHQY = {Einar = 362,
		  Karan = 147}
NameHQ = {Einar = "HQEinar",
		  Karan = "HQKaran"}
---- X- und Y-Koordinaten der Haupthauser von Einar und Karan

 
State
{
	StateName = "MainScript",

	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarFlagIsTrue {Name = Attack1Condition},
				AvatarFlagIsTrue {Name = Attack2Condition},
  				AvatarFlagIsTrue {Name = Attack3Condition},
  				AvatarFlagIsTrue {Name = AttackBulwarkCondition},
			},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "default", Team = "tm_Team1"},
		},
	},
   
	OnFigureRespawnEvent
		{
			WaitTime = 10,
			X = GetEntityX(),
			Y = GetEntityY(),
			Conditions = 
			{
				BuildingIsAlive	{Tag = NameHQ[MyTroop]},
				--BuildingIsInRange {Tag = NameHQ[MyTroop], Range = 5 , X = POSHQX[MyTroop], Y = POSHQY[MyTroop]},
			},
			Actions = 
			{
			},
			DeathActions = 
			{
				EntityFlagSetFalse {Name = "ef_PersonalGo"},
				EntityFlagSetFalse {Name = "ef_NoLongerWaitingForGo"},
			},
		};


	OnEvent
	{	
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P307_GlobalTroopsGo"},
			EntityFlagIsFalse {Name = "ef_NoLongerWaitingForGo"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_PersonalGo"},
			EntityFlagSetTrue {Name = "ef_NoLongerWaitingForGo"},
		},
	},

   
   OnIdleGoHomeFake
  	{
  		UpdateInterval = 50,
  		X = GetEntityX(), Y = GetEntityY(),
  		StopFigureWhenConditionsAreFalse = true, 
  		Conditions = 
  		{
  			AvatarFlagIsFalse {Name = Attack1Condition},
  			AvatarFlagIsFalse {Name = Attack2Condition},
  			AvatarFlagIsFalse {Name = Attack3Condition},
  			AvatarFlagIsFalse {Name = AttackBulwarkCondition},
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
  			AvatarFlagIsTrue {Name = Attack1Condition},
  			EntityFlagIsTrue {Name = "ef_PersonalGo"},
  			AvatarFlagIsFalse {Name = "af_P307_Camp1Busted"},
  		},
  		Actions = 
		{
		}, -- Wenn Auftrag "Greif Camp 1 an", dann geh zu Camp 1
  	},

	
	OnIdleRunHomeFake
  	{
  		UpdateInterval = 50,
  		X = AttackPointCamp2X, Y = AttackPointCamp2Y,
  		StopFigureWhenConditionsAreFalse = true,
  		Conditions = 
  		{
  			AvatarFlagIsTrue {Name = Attack2Condition},
  			EntityFlagIsTrue {Name = "ef_PersonalGo"},
  			AvatarFlagIsFalse {Name = "af_P307_Camp2Busted"},
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
  			AvatarFlagIsTrue {Name = Attack3Condition},
  			EntityFlagIsTrue {Name = "ef_PersonalGo"},
  			AvatarFlagIsFalse {Name = "af_P307_Camp3Busted"},
  		},
  		Actions = 
		{
		}, -- Wenn Auftrag "Greif Camp 3 an", dann geh zu Camp 3
  	}, 
  
   OnIdleRunHomeFake
  	{
  		UpdateInterval = 50,
  		X = AttackPointBulwarkX, Y = AttackPointBulwarkY,
  		StopFigureWhenConditionsAreFalse = true,
  		Conditions = 
  		{
  			AvatarFlagIsTrue {Name = AttackBulwarkCondition},
  			EntityFlagIsTrue {Name = "ef_PersonalGo"},
  			AvatarFlagIsFalse {Name = "af_P307_BulwarkBusted"},
  		},
  		Actions = 
		{
		}, -- Wenn Auftrag "Greif Bulwark an", dann geh zu Bulwark
	},
   
};


