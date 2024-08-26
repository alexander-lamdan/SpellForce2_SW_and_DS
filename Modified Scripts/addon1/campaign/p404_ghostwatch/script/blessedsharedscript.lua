
State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_BlessedAttack"},
			MapFlagIsTrue {Name = "mf_CS03Ended"},
		},
		Actions = 
		{
			EntityTimerStart{Name = "et_Spawned"},
			MapFlagSetTrue{Name = "mf_AnyBlessedSpawned"},
			MapValueAdd{Name = "mv_CounterOfBlessedSpawned", Value = 1},
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};


		
	OnIdleRunHomeFake
	{
		X = 228.856, Y = 143.491, 
		-- KOORDINATEN MÜSSEN ANGEPASST WERDEN, SOBALD SIDONIE DIE GEBÄUDE RICHTIG
		-- GESETZT HAT
		Range = 15,
		GotoForced = false,
		UpdateInterval = 0,
		Conditions = 
		{
			EntityTimerIsElapsed{Name = "et_Spawned", Seconds = 15},
		},
		Actions = 
		{
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "OwnBuildCastle"},
			BuildingIsDead{Tag = "OwnBuildOrderStronghold"},
			BuildingIsDead{Tag = "OwnBuildWarriorGuild"},
			BuildingIsDead{Tag = "OwnBuildBlacksmith"},
			BuildingIsDead{Tag = "OwnBuildDwarvenForge"},
		},
		Actions =
		{
			EntityFlagSetTrue{Name = "ef_Building01Cleared"},
			EntityTimerStart{Name = "et_Timer01"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_Building01Cleared"},
			EntityTimerIsElapsed{Name = "et_Timer01", Seconds = 20},
		},
		Actions =
		{
		},
		GotoState = "State02"
	},
}

State
{	
	StateName = "State02",
	OnIdleGoHomeFake
	{
		X = 256.489, Y = 78.0249, 
		-- KOORDINATEN MÜSSEN ANGEPASST WERDEN, SOBALD SIDONIE DIE GEBÄUDE RICHTIG
		-- GESETZT HAT
		Range = 15,
		GotoForced = false,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "OwnBuildElvenFortress"},
			BuildingIsDead{Tag = "OwnBuildElenShrine"},
			BuildingIsDead{Tag = "OwnBuildFarm"},
			BuildingIsDead{Tag = "OwnBuildStonemason"},
		},
		Actions =
		{
			EntityFlagSetTrue{Name = "ef_Building02Cleared"},
			EntityTimerStart{Name = "et_Timer02"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_Building02Cleared"},
			EntityTimerIsElapsed{Name = "et_Timer02", Seconds = 30},
		},
		Actions =
		{
		},
		GotoState = "State03"
	},
}
	
State
{	
	StateName = "State03",
	OnIdleGoHomeFake
	{
		X = 427.609, Y = 441.138, 
		-- KOORDINATEN MÜSSEN ANGEPASST WERDEN, SOBALD SIDONIE DIE GEBÄUDE RICHTIG
		-- GESETZT HAT
		Range = 15,
		GotoForced = false,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
	};

	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "PlayerFarm01"},
			BuildingIsDead{Tag = "PlayerFarm02"},
			BuildingIsDead{Tag = "PlayerSoulforge"},
			BuildingIsDead{Tag = "PlayerNexus"},
		},
		Actions =
		{
			EntityFlagSetTrue{Name = "ef_Building03Cleared"},
			EntityTimerStart{Name = "et_Timer03"},
		},
	}, 
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_Building03Cleared"},
			EntityTimerIsElapsed{Name = "et_Timer03", Seconds = 30},
		},
		Actions =
		{
		},
		GotoState = "State04"
	},
};


State
{	
	StateName = "State04",
	OnIdleGoHomeFake
	{
		X = 421.384, Y = 403.689, 
		-- KOORDINATEN MÜSSEN ANGEPASST WERDEN, SOBALD SIDONIE DIE GEBÄUDE RICHTIG
		-- GESETZT HAT
		Range = 15,
		GotoForced = false,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
	};

	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "PlayerHQ"},
		},
		Actions =
		{
			EntityFlagSetTrue{Name = "ef_Building04Cleared"},
			EntityTimerStart{Name = "et_Timer04"},
		},
	}, 
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_Building04Cleared"},
			EntityTimerIsElapsed{Name = "et_Timer04", Seconds = 45},
		},
		Actions =
		{
			EntityFlagRandomize	{Name = "ef_AttackPointA"},
		},
		GotoState = "State05"
	},
};


State
{	
	StateName = "State05",
	
	OnIdleGoHomeFake
	{
		X = 336.417, Y = 496.101,
		Range = 15,
		GotoForced = false,
		UpdateInterval = 0,
		Conditions = 
		{
			EntityTimerIsElapsed{Name = "et_Spawned", Seconds = 60},
			EntityFlagIsTrue{Name = "ef_AttackPointA"},
		},
		Actions = 
		{
		},
	};
	
	OnIdleGoHomeFake
	{
		X = 418.444, Y = 412.575,
		Range = 15,
		GotoForced = false,
		UpdateInterval = 0,
		Conditions = 
		{
			EntityTimerIsElapsed{Name = "et_Spawned", Seconds = 60},
			EntityFlagIsFalse{Name = "ef_AttackPointA"},
		},
		Actions = 
		{
		},
	};

	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead{Tag = "PlayerFarm03"},
			BuildingIsDead{Tag = "PlayerFarm04"},
		},
		Actions =
		{
		},
		GotoState = "State06"
	}, 
};


State
{	
	StateName = "State06",
	

 
};
