State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_CastleCutsceneEnd"},	
		},
		Actions =
		{
			AvatarFlagSetFalse {Name = "af_P303_OrcPrisonAttackWP1"},
			AvatarFlagSetFalse {Name = "af_P303_OrcPrisonAttackDead"},
			EntityValueSet	   {Name = "ev_Attackstate", Value = 0},
		},
		GotoState = "Attack"
	},
};

State
{
	StateName = "Attack",
	
	----------------------------------Prisoner Attack----------------------------------------
	-- Erst wenn alle Orks wieder auferstanden sind laufen sie zum Angriff
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange {Range = 10, X = 599, Y = 536, Tag = "PrisonerAttack1"},		
			FigureIsInRange {Range = 10, X = 599, Y = 536, Tag = "PrisonerAttack2"},		
			FigureIsInRange {Range = 10, X = 599, Y = 536, Tag = "PrisonerAttack3"},		
			FigureIsInRange {Range = 10, X = 599, Y = 536, Tag = "PrisonerAttack4"},		
			FigureIsInRange {Range = 10, X = 599, Y = 536, Tag = "PrisonerAttack5"},		
			FigureIsInRange {Range = 10, X = 599, Y = 536, Tag = "PrisonerAttack6"},		
			FigureIsInRange {Range = 10, X = 599, Y = 536, Tag = "PrisonerAttack7"},
			AvatarFlagIsFalse {Name = "af_P303_OrcPrisonAttackHome"},
		},
		Actions = 
		{
			AvatarFlagSetTrue {Name = "af_P303_OrcPrisonAttackHome"},
		}
		
	},
	
	
	OnEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P303_PrisonerAttackDelay", Seconds = 5},
		},
		Actions = 
		{
			MapTimerStop   {Name = "mt_P303_PrisonerAttackDelay"},	
			--AvatarFlagSetTrue {Name = "af_P303_OrcPrisonAttackWP1"},
			AvatarFlagSetFalse {Name = "af_P303_OrcPrisonAttackBlocker"},		
		},
	},

	-- Check ob alle PrisonAttack Orcs Tod sind (für Respawn)

	OnEvent
	{
		Conditions = 
		{
			AvatarFlagIsFalse  {Name = "af_P303_OrcPrisonAttackDead"},
			FigureIsDead {Tag = "PrisonerAttack1"},
			FigureIsDead {Tag = "PrisonerAttack2"},
			FigureIsDead {Tag = "PrisonerAttack3"},
			FigureIsDead {Tag = "PrisonerAttack4"},
			FigureIsDead {Tag = "PrisonerAttack5"},
			FigureIsDead {Tag = "PrisonerAttack6"},
			FigureIsDead {Tag = "PrisonerAttack7"},
			
		},
		Actions = 
		{
			AvatarFlagSetTrue  {Name = "af_P303_OrcPrisonAttackDead"},	
			AvatarFlagSetFalse {Name = "af_P303_OrcPrisonAttackWP1"},				
		},
			
	},
	
	OnEvent
	{
		
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P303_OrcPrisonAttackDead"},	
			FigureIsAlive {Tag = "PrisonerAttack1"},
			FigureIsAlive {Tag = "PrisonerAttack2"},
			FigureIsAlive {Tag = "PrisonerAttack3"},
			FigureIsAlive {Tag = "PrisonerAttack4"},
			FigureIsAlive {Tag = "PrisonerAttack5"},
			FigureIsAlive {Tag = "PrisonerAttack6"},
			FigureIsAlive {Tag = "PrisonerAttack7"},
			
		},        
	   	Actions = 
		{         
			AvatarFlagSetFalse {Name = "af_P303_OrcPrisonAttackDead"},	
		},         
		          
		          
	},
	
	OnIdleRunHomeFake
	{
		X = 619 + offsetX, Y = 230 + offsetY,
		
		Conditions =
		{
			EntityValueIsEqual	{Name = "ev_Attackstate", Value = 0},
			AvatarFlagIsTrue {Name = "af_P303_OrcPrisonAttackHome"},	
		},
		Actions =
		{       
		},				
		HomeActions = 
		{
			EntityValueSet {Name = "ev_Attackstate", Value = 1},
			AvatarFlagSetFalse {Name = "af_P303_OrcPrisonAttackHome"},	
		},
	},
	-- Zur Sicherheit wird mal ein Timer gesetzt, mit dem einzelne Orks notfalls in den Tod laufen
	OnEvent
	{
		Conditions =
		{
			FigureIsInRange {Range = 10, X = 619, Y = 226, Tag = "PrisonerAttack" .. myNumber},
			EntityFlagIsFalse {Name = "ef_P303_Attacker" .. myNumber .. "InRange"}
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P303_RunOn"},
			EntityFlagSetTrue {Name = "ef_P303_Attacker" .. myNumber .. "InRange"}
		}
	},
	-- Check ob alle PrisonAttack Orcs den ersten WP erreicht haben
	OnEvent
	{
		Conditions =
		{
			OR
			{
				EntityTimerIsElapsed {Name = "et_P303_RunOn", Seconds = 60},
				AND
				{
					FigureIsInRange {Range = 10, X = 619, Y = 226, Tag = "PrisonerAttack1"},		
					FigureIsInRange {Range = 10, X = 619, Y = 226, Tag = "PrisonerAttack2"},		
					FigureIsInRange {Range = 10, X = 619, Y = 226, Tag = "PrisonerAttack3"},		
					FigureIsInRange {Range = 10, X = 619, Y = 226, Tag = "PrisonerAttack4"},		
					FigureIsInRange {Range = 10, X = 619, Y = 226, Tag = "PrisonerAttack5"},		
					FigureIsInRange {Range = 10, X = 619, Y = 226, Tag = "PrisonerAttack6"},		
					FigureIsInRange {Range = 10, X = 619, Y = 226, Tag = "PrisonerAttack7"},
				}
			},
			AvatarFlagIsFalse {Name = "af_P303_OrcPrisonAttackBlocker"},		
		},
		
		Actions = 
		{
			AvatarFlagSetTrue {Name = "af_P303_OrcPrisonAttackWP1"},
			--MapTimerStart	{Name = "mt_P303_PrisonerAttackDelay"},
			AvatarFlagSetTrue {Name = "af_P303_OrcPrisonAttackBlocker"},
			EntityTimerStop {Name = "et_P303_RunOn"},
			EntityFlagSetFalse {Name = "ef_P303_Attacker" .. myNumber .. "InRange"}	
		}
		
	},
	OnIdleRunHomeFake
	{
		X = 607 + offsetX, Y = 123 + offsetY,
		
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_OrcPrisonAttackWP1"},
			EntityValueIsEqual	{Name = "ev_Attackstate", Value = 1},
		},
		Actions =
		{
		},
		HomeActions =
		{
			--EntityValueSet {Name = "ev_Attackstate", Value = 2},	
		},		
	},
	
	OnFigureRespawnEvent
	{
		WaitTime = 120,
		X = GetEntityX(),
		Y = GetEntityY(),
		
		Conditions = 
		{
			--AvatarFlagIsTrue {Name = "af_P303_OrcPrisonAttackDead"},
			AvatarFlagIsFalse {Name = "af_P303_PrisonerFreed"},
			BuildingIsInRange {Tag = "OrcHeadquater", X = 570, Y = 561, Range = 20}
		},
		Actions = 
		{
			EntityValueSet {Name = "ev_Attackstate", Value = 0},
			AvatarFlagSetFalse {Name = "af_P303_OrcPrisonAttackWP1"},
			AvatarFlagSetFalse {Name = "af_P303_OrcPrisonAttackHome"},	
			AvatarFlagSetFalse {Name = "af_P303_OrcPrisonAttackBlocker"},
		},
		DeathActions = 
		{
		},
	},
	-- Wenn Osal frei ist enden die Angriffe
	OnOneTimeEvent
	{
		GotoState = "End",
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_PrisonerFreed"},
		},
		Actions = 
		{
		},
	}
};

State
{
	StateName = "End",
	OnIdleRunHomeFake
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
		},
		Actions =
		{
		},
		HomeActions =
		{
			--EntityValueSet {Name = "ev_Attackstate", Value = 2},	
		},		
	},
}