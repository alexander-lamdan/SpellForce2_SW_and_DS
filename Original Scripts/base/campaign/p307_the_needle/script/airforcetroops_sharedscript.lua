-- Änderungen nach QA/GameDesign-Besprechung:
-- Keine Spawn-Gebäude mehr, kein Hinfliegen zum HQ, nachdem Greifen befreit wurden 
-- Stattdessen gibt es Mutterspritisten: Solange diese am Leben sind, spawnen die Greifen nach


HomeBaseX = {	A = 362,
				B = 291}
HomeBaseY = {	A = 608,
				B = 552}
--BuildingTag = { A = "AirForceQ1",
--				B = "AirForceQ2"}			
---- Angaben des eigenen Camps

FigureTag = {	
				A = "SpiritistMother01",
				B = "SpiritistMother02"
			}

AttackCoordX = 217
AttackCoordY = 262
-- Angriffskoordinate: Hierhin fliegen die Flugeinheiten
-- (es sind die Koordinaten des Spieler-Haupthauses)

--AttackAfterMatricusAwayX = 588.52
--AttackAfterMatricusAwayY = 497.084

-- Hierhin fliegen die Spiritisten, sobald Matricus weg ist (die Greifen befreit sind)
  

State
{
	StateName = "MainScript",

   
	OnFigureRespawnEvent
		{
			WaitTime = 120,
			X = GetEntityX(),
			Y = GetEntityY(),
			Conditions = 
			{
				--BuildingIsAlive{Tag = BuildingTag[MyCamp]},
				FigureIsAlive{Tag = FigureTag[MyCamp]},
				AvatarFlagIsFalse{ Name = "af_P307_GriffonsFree" },
			},
			Actions = 
			{
			},
			DeathActions = 
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
				--BuildingIsAlive{Tag = BuildingTag[MyCamp]},
				FigureIsAlive{Tag = FigureTag[MyCamp]},
				AvatarFlagIsTrue{ Name = "af_P307_GriffonsFree" },
			},
			Actions = 
			{
			},
			DeathActions = 
			{
			},
		};
  
  
	OnIdleRunHomeFake
  	{
  		UpdateInterval = 50,
  		X = AttackCoordX, Y = AttackCoordY,
  		Conditions = 
  		{
  			MapFlagIsTrue {Name = "mf_AirForceAttackStart"},
  			--AvatarFlagIsFalse{ Name = "af_P307_GriffonsFree" },
  		},
  		Actions = 
		{
		},
  	},
  	
--  	OnIdleRunHomeFake
--  	{
--  		UpdateInterval = 50,
--  		X = AttackAfterMatricusAwayX, Y = AttackAfterMatricusAwayY,
--  		Conditions = 
--  		{
--  			MapFlagIsTrue {Name = "mf_AirForceAttackStart"},
--  			AvatarFlagIsTrue{ Name = "af_P307_GriffonsFree" },
--  		},
--  		Actions = 
--		{
--		},
--		-- nachdem Matricus weg ist (Greifen befreit), fliegen sie hoch zum Bulwark
--  	},

	
	
  
   
};
