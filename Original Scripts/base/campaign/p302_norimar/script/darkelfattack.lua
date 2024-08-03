State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		GotoState = "BeginAssault",
		
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_StartDarkElfAttack"},
		},
		
		Actions = 
		{
		},
			
	},
};
State
{
	StateName = "BeginAssault",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		
		Actions = 
		{
			VisualTimerStart {Seconds = 240},
			MapTimerStart    {Name 	  = "mt_DarkElfAttackTimer"},
			FigureOutcry	 {Tag = "GateGuard", TextTag = "SoldierHorn1"},
			FigureOutcry	 {Tag = "GateGuard", TextTag = "SoldierHorn2"},
			FigureOutcry	 {Tag = "GateGuard", TextTag = "SoldierHorn3"},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed 	{Name = "mt_DarkElfAttackTimer", Seconds = 60},
			QuestIsNotSolved 	{Quest = "BlowTheHorn"},
		},
		Actions =
		{
			FigureOutcry	 {Tag = "GateGuard", TextTag = "SoldierHorn4"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed 	{Name = "mt_DarkElfAttackTimer", Seconds = 120},
			QuestIsNotSolved 	{Quest = "BlowTheHorn"},
		},
		Actions =
		{
			FigureOutcry	 {Tag = "GateGuard", TextTag = "SoldierHorn5"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed 	{Name = "mt_DarkElfAttackTimer", Seconds = 220},
			QuestIsNotSolved 	{Quest = "BlowTheHorn"},
		},
		Actions =
		{
			FigureOutcry	 {Tag = "GateGuard", TextTag = "SoldierHorn6"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsNotElapsed 	{Name = "mt_DarkElfAttackTimer", Seconds = 240},
			QuestIsSolved 			{Quest = "BlowTheHorn"},
			VisualTimerIsActive		{},
		},
		Actions =
		{
			MapTimerStop 	{Name = "mt_DarkElfAttackTimer"},
			VisualTimerStop {},
		},

	},
	
	-- Wenn der Timer abgelaufen ist, startet Cutscene, die zeigt wie DE in den Falkenhorst stürmen
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed 	{Name = "mt_DarkElfAttackTimer", Seconds = 240},
			QuestIsNotSolved 	{Quest = "BlowTheHorn"},
		},
		Actions =
		{
			MapFlagSetTrue		{Name = "mf_P302_GameOver_Cutscene"},
		},
	},
	
	-- Nach Ablausf der Cutscene -> Game Over
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue		{Name = "mf_P302_GameOver_Cutscene_Done"},
		},
		Actions =
		{
			PlayerGameOver	{Player = "default", Tag = "Ortbrand", LocaTag = "GameOverSF2NorimarHorn"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsInRange	{Tag = "pl_HumanAvatar", 	X = 470, Y = 575,Range = 7},
				FigureIsInRange	{Tag = "Shadowsong", 		X = 470, Y = 575,Range = 7},
				FigureIsInRange	{Tag = "pl_HumanHeroLya", 	X = 470, Y = 575,Range = 7},
				FigureIsInRange	{Tag = "pl_HumanHeroBor", 	X = 470, Y = 575,Range = 7},
				FigureIsInRange	{Tag = "HorseArcher1", 		X = 470, Y = 575,Range = 7},
				FigureIsInRange	{Tag = "HorseArcher2", 		X = 470, Y = 575,Range = 7},
				FigureIsInRange	{Tag = "HorseArcher3", 		X = 470, Y = 575,Range = 7},
				FigureIsInRange	{Tag = "HorseArcher4", 		X = 470, Y = 575,Range = 7},
				FigureIsInRange	{Tag = "HorseArcher5", 		X = 470, Y = 575,Range = 7},
				FigureIsInRange	{Tag = "HorseArcher6", 		X = 470, Y = 575,Range = 7},
				FigureIsInRange	{Tag = "HorseArcher7", 		X = 470, Y = 575,Range = 7},
				FigureIsInRange	{Tag = "HorseArcher8", 		X = 470, Y = 575,Range = 7},
			},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_DarkElvesGo"},
		},
	},
	
	-- Hier werden die Angriffswellen gespawned
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DarkElfAttackTimer", Seconds = 60},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "PactWave01Attacker01", TargetTag = "DarkElfBlocker01"},
			FigureRunToEntity	{Tag = "PactWave01Attacker02", TargetTag = "DarkElfBlocker02"},
			FigureRunToEntity	{Tag = "PactWave01Attacker03", TargetTag = "Ortbrand"},
			FigureRunToEntity	{Tag = "PactWave01Attacker04", TargetTag = "Ortbrand"},
			FigureRunToEntity	{Tag = "PactWave01Attacker05", TargetTag = "Ortbrand"},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DarkElfAttackTimer", Seconds = 90},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "PactWave02Attacker01", TargetTag = "DarkElfBlocker04"},
			FigureRunToEntity	{Tag = "PactWave02Attacker02", TargetTag = "DarkElfBlocker05"},
			FigureRunToEntity	{Tag = "PactWave02Attacker03", TargetTag = "Ortbrand"},
			FigureRunToEntity	{Tag = "PactWave02Attacker04", TargetTag = "Ortbrand"},
			FigureRunToEntity	{Tag = "PactWave02Attacker05", TargetTag = "Ortbrand"},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DarkElfAttackTimer", Seconds = 120},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "PactWave03Attacker01", TargetTag = "DarkElfBlocker07"},
			FigureRunToEntity	{Tag = "PactWave03Attacker02", TargetTag = "DarkElfBlocker08"},
			FigureRunToEntity	{Tag = "PactWave03Attacker03", TargetTag = "Ortbrand"},
			FigureRunToEntity	{Tag = "PactWave03Attacker04", TargetTag = "Ortbrand"},
			FigureRunToEntity	{Tag = "PactWave03Attacker05", TargetTag = "Ortbrand"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DarkElfAttackTimer", Seconds = 150},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "PactWave04Attacker01", TargetTag = "DarkElfBlocker10"},
			FigureRunToEntity	{Tag = "PactWave04Attacker02", TargetTag = "DarkElfBlocker11"},
			FigureRunToEntity	{Tag = "PactWave04Attacker03", TargetTag = "Ortbrand"},
			FigureRunToEntity	{Tag = "PactWave04Attacker04", TargetTag = "Ortbrand"},
			FigureRunToEntity	{Tag = "PactWave04Attacker05", TargetTag = "Ortbrand"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DarkElfAttackTimer", Seconds = 200},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "PactWave05Attacker01", TargetTag = "Ortbrand"},
			FigureRunToEntity	{Tag = "PactWave05Attacker02", TargetTag = "Ortbrand"},
			FigureRunToEntity	{Tag = "PactWave05Attacker03", TargetTag = "Ortbrand"},
			FigureRunToEntity	{Tag = "PactWave05Attacker04", TargetTag = "Ortbrand"},
			FigureRunToEntity	{Tag = "PactWave05Attacker05", TargetTag = "Ortbrand"},
		},
	},	
	
	-- Hier wird die Pseudoarmee gespawnet

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DarkElfAttackTimer", Seconds = 1},
		},
		Actions = 
		{
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP01"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP02"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP03"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP04"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP05"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DarkElfAttackTimer", Seconds = 2},
		},
		Actions = 
		{
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP06"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP07"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP08"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP09"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP10"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DarkElfAttackTimer", Seconds = 1},
		},
		Actions = 
		{
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP11"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP12"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP13"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP14"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP15"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DarkElfAttackTimer", Seconds = 3},
		},
		Actions = 
		{
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP16"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP17"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP18"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP19"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP20"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DarkElfAttackTimer", Seconds = 4},
		},
		Actions = 
		{
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP21"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP22"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP23"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP24"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP25"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DarkElfAttackTimer", Seconds = 6},
		},
		Actions = 
		{
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP26"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP27"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP28"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP29"},
			FigureRtsSpawnToEntity	{UnitId = 96, Level = 5, Player = "pl_Pact", TargetTag = "DeSP30"},
		},
	},	
	
	
};  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    