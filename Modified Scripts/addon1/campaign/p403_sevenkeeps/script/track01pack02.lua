RespawnTimer = 180 --+ (math.random(60))
--Ponytrack Nummer 01 Pony 2,4,6,8

--*******************************************************
--***                                                 ***
--***               	InitState   		          ***
--***                                                 ***
--*******************************************************		

State
{	
	StateName = "InitState",
	OnFigureRespawnEvent	
	{
		WaitTime = RespawnTimer,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_Track01Vanish"},
			PlayerFigureIsNotInRange	{Player = "pl_Human", Range = 31, X = 126, Y = 666},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_StartTeleport"},
			EntityFlagSetFalse	{Name = "ef_GotoSchalter"},
			EntityFlagSetFalse {Name = "ef_LeadAtHome"},
			EntityFlagSetFalse {Name = "ef_PonyFollow"},
		},
		DeathActions = 
		{
			EntityFlagSetFalse {Name = "ef_PonyFollow"},
		}, 
		DelayedActions = 
		{
		}, 
		NoSpawnEffect = true, 
		IsSpawnOnlyWhen = false,
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_StartTeleport"},
		},
		Actions =
		{
			CutsceneFigureTeleport	{X = GetEntityX(), Y = GetEntityY()},
			EntityFlagSetFalse {Name = "ef_StartTeleport"},
		},	
		
	},	
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Camp05Destroyed"}, 
			MapFlagIsFalse {Name = "mf_FollowStart"},
			EntityFlagIsFalse {Name = "ef_StartTeleport"},
			EntityFlagIsFalse	{Name = "ef_GotoSchalter"},
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = "ef_GotoSchalter"},
		},
		GotoState = "PathState2",	
	},	
	
	OnEvent
	
	{
		Conditions =
		{
			MapFlagIsFalse	{Name = "mf_Camp05Destroyed"}, 
			MapFlagIsFalse {Name = "mf_FollowStart"},
			EntityFlagIsFalse {Name = "ef_StartTeleport"},
			EntityFlagIsFalse	{Name = "ef_GotoSchalter"},
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = "ef_GotoSchalter"},
			--DebugMessage	{Caption = "Vorhut_Track01", Message = "InitState"},
		},
		GotoState = "PathState",	
	},	

};

	
--*******************************************************
--***                                                 ***
--***                PathState		                  ***
--***                                                 ***
--*******************************************************	

PathStates	
{
	StateName = "PathState",
	Conditions = 
	{
		MapTimerIsElapsed	{Name = "mt_TrackStartSyncTimer", Seconds = 20},
	}, 
	Actions = 
	{
		--DebugMessage	{Caption = "Vorhut_Track01", Message = "PathState"},
	}, 
	StopConditions =
	{
		OR
		{
			AND
			{
				MapTimerIsElapsed	{Name = "mt_FollowStartTimer", Seconds = math.random() * 2},
				MapFlagIsTrue {Name = "mf_FollowStart"},
			},
			FigureIsInEntityRange	{TargetTag = "Track1Pony2", Range = 5},
			--MapFlagIsTrue	{Name = "mf_ResetTrack01"}, 
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		--{Point = "04RStartPathPoint", WaitTime = 0, Range = 3},
   		--{Point = "01RStartPathPoint", WaitTime = 0},
        {Point = "PathPoint02r",WaitTime = 0, Range = 3},
        {Point = "PathPoint03r",},
        {Point = "PathPoint04r",},
        {Point = "PathPoint05r",},
        {Point = "PathPoint06r",},
        {Point = "PathPoint07r",},
        {Point = "PathPoint08r",},
        {Point = "PathPoint09r",},
        {Point = "PathPoint10r",},
        {Point = "PathPoint11r",},
        {Point = "Track1Stop8", WaitTime = 10},
        {Point = "PathPoint11_5r", WaitTime = 0},
        {Point = "PathPoint12r",},
        {Point = "PathPoint13r",},
        {Point = "PathPoint14r",},
        {Point = "PathPoint15r",},
        {Point = "PathPoint16r",},
        {Point = "PathPoint17r",},
        {Point = "PathPoint18r",},
        {Point = "PathPoint19r",},
        {Point = "PathPoint20r",},
        {Point = "PathPoint21r",},
        {Point = "PathPoint22r",},
        {Point = "PathPoint23r",},
        {Point = "Track1Pony2",},
       
        
   	
   	},
	GotoState = "CheckState",
};

----*******************************************************
----***                                                 ***
----***                PathStateReturn                  ***
----***                                                 ***
----*******************************************************	

PathStates	
{
	StateName = "PathStateReturn",
	Conditions = 
	{
		MapTimerIsElapsed	{Name = "mt_TrackEndSyncTimer", Seconds = 20},
	}, 
	Actions = 
	{
		--DebugMessage	{Caption = "Vorhut_Track01", Message = "PathStateReturn"},
	}, 
	StopConditions =
	{
		OR
		{
			AND
			{
				MapTimerIsElapsed	{Name = "mt_FollowStartTimer", Seconds = math.random() * 2},
				MapFlagIsTrue {Name = "mf_FollowStart"},
			},
			FigureIsInEntityRange	{TargetTag = "04RStartPathPoint", Range = 5},
			--MapFlagIsTrue	{Name = "mf_ResetTrack01"}, 
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
        {Point = "Track1Rider4", WaitTime = 0,Range = 3},
        {Point = "PathPoint25r",WaitTime = 0,},
        {Point = "PathPoint22r",WaitTime = 0},
        {Point = "PathPoint21r",},
        {Point = "PathPoint20r",},
        {Point = "PathPoint19r",},
        {Point = "PathPoint18r",},
        {Point = "PathPoint17r",},
        {Point = "PathPoint16r",},
        {Point = "PathPoint15r",},
        {Point = "PathPoint14r",},
        {Point = "PathPoint13r",},
        {Point = "PathPoint12r",},
        {Point = "Track1_2Stopp8", WaitTime = 10},
        {Point = "PathPoint10r", WaitTime = 0},
        {Point = "PathPoint09r",},
        {Point = "PathPoint08r",},
        {Point = "PathPoint07r",},
        {Point = "PathPoint06r",},
        {Point = "PathPoint05r",},
        {Point = "PathPoint04r",},
        {Point = "PathPoint03r",},
        {Point = "PathPoint02r",},
        --{Point = "01RStartPathPoint",},
        {Point = "04RStartPathPoint",},
   	
   	},
	GotoState = "CheckState",
};

--*******************************************************
--***                                                 ***
--***                PathState2		                  ***
--***                                                 ***
--*******************************************************	

PathStates	
{
	StateName = "PathState2",
	Conditions = 
	{
		MapTimerIsElapsed	{Name = "mt_TrackStartSyncTimer", Seconds = 20},
	}, 
	Actions = 
	{
		--DebugMessage	{Caption = "Vorhut_Track01", Message = "PathState2"},
	}, 
	StopConditions =
	{
		OR
		{
			AND
			{
				MapTimerIsElapsed	{Name = "mt_FollowStartTimer", Seconds = math.random() * 2},
				MapFlagIsTrue {Name = "mf_FollowStart"},
			},
			FigureIsInEntityRange	{TargetTag = "Track1Stop8", Range = 5},
			--MapFlagIsTrue	{Name = "mf_ResetTrack01"}, 
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		--{Point = "04RStartPathPoint", WaitTime = 0, Range = 3},
   		--{Point = "01RStartPathPoint", WaitTime = 0},
        {Point = "PathPoint02r",WaitTime = 0, Range = 3},
        {Point = "PathPoint03r",},
        {Point = "PathPoint04r",},
        {Point = "PathPoint05r",},
        {Point = "PathPoint06r",},
        {Point = "PathPoint07r",},
        {Point = "PathPoint08r",},
        {Point = "PathPoint09r",},
        {Point = "PathPoint10r",},
        {Point = "PathPoint11r",},
        {Point = "Track1Stop8",},
   	},
	GotoState = "CheckState",
};

--*******************************************************
--***                                                 ***
--***                PathState2Return                  ***
--***                                                 ***
--*******************************************************	

PathStates	
{
	StateName = "PathState2Return",
	Conditions = 
	{
		MapTimerIsElapsed	{Name = "mt_TrackEndSyncTimer", Seconds = 20},
	}, 
	Actions = 
	{
		--DebugMessage	{Caption = "Vorhut_Track01", Message = "PathState2Return"},
	}, 
	StopConditions =
	{
		OR
		{
			AND
			{
				MapTimerIsElapsed	{Name = "mt_FollowStartTimer", Seconds = math.random() * 2},
				MapFlagIsTrue {Name = "mf_FollowStart"},
			},
			FigureIsInEntityRange	{TargetTag = "04RStartPathPoint", Range = 5},
			--MapFlagIsTrue	{Name = "mf_ResetTrack01"}, 
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		{Point = "Track1Stop4", WaitTime = 0, Range = 3},
        {Point = "Track1Return1r", WaitTime = 0,},
        {Point = "Track1Return2r", WaitTime = 0, },
        {Point = "Track1Return3r",},
        {Point = "PathPoint10r",},
        {Point = "PathPoint09r",},
        {Point = "PathPoint08r",},
        {Point = "PathPoint07r",},
        {Point = "PathPoint06r",},
        {Point = "PathPoint05r",},
        {Point = "PathPoint04r",},
        {Point = "PathPoint03r",},
        {Point = "PathPoint02r",},
        --{Point = "01RStartPathPoint",},
        {Point = "04RStartPathPoint",},
   	
   	},
	GotoState = "CheckState",
};

--*******************************************************
--***                                                 ***
--***               	CheckState   		          ***
--***                                                 ***
--*******************************************************		
State
{	
	StateName = "CheckState",	
	OnEvent
	{
		Conditions =
		{
			--MapFlagIsFalse	{Name = "mf_ResetTrack01"},
			MapFlagIsFalse {Name = "mf_FollowStart"},
			FigureIsInEntityRange	{TargetTag = "Track1Pony2", Range = 15},
			--MapFlagIsFalse	{Name = "mf_Camp05Destroyed"}, 
		},
		Actions =
		{
			--DebugMessage	{Caption = "Vorhut_Track01", Message = "CheckState"},
		},	
		GotoState = "PathStateReturn",
	},	
	OnEvent
	{
		Conditions =
		{
			MapFlagIsFalse	{Name = "mf_Camp05Destroyed"}, 
			--MapFlagIsFalse	{Name = "mf_ResetTrack01"},
			MapFlagIsFalse {Name = "mf_FollowStart"},
			FigureIsInEntityRange	{TargetTag = "04RStartPathPoint", Range = 15},
		},
		Actions =
		{
			--DebugMessage	{Caption = "Vorhut_Track01", Message = "CheckState"},
		},	
		GotoState = "PathState",
	},	
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Camp05Destroyed"}, 
			--MapFlagIsFalse	{Name = "mf_ResetTrack01"},
			MapFlagIsFalse {Name = "mf_FollowStart"},
			FigureIsInEntityRange	{TargetTag = "04RStartPathPoint", Range = 15},
		},
		Actions =
		{
			--DebugMessage	{Caption = "Vorhut_Track01", Message = "CheckState"},
		},	
		GotoState = "PathState2",
	},	
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Camp05Destroyed"}, 
			--MapFlagIsFalse	{Name = "mf_ResetTrack01"},
			MapFlagIsFalse {Name = "mf_FollowStart"},
			FigureIsInEntityRange	{TargetTag = "Track1Stop8", Range = 15},
		},
		Actions =
		{
			--DebugMessage	{Caption = "Vorhut_Track01", Message = "CheckState"},
		},	
		GotoState = "PathState2Return",
	},	
	OnEvent
	{
		Conditions =
		{
				MapFlagIsTrue {Name = "mf_FollowStart"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_PonyFollow"},
			--DebugMessage	{Caption = "Vorhut_Track01", Message = "CheckState"},
		},	
		GotoState = "FightState",
	},	
};

--*******************************************************
--***                                                 ***
--***               	FightState   		          ***
--***                                                 ***
--*******************************************************		
State
{	
	StateName = "FightState",	
	--OnFollowEvent	
	--{
	--	 TargetTag = "Track01Lead",
	--	 OnConditions = 
	--	 {
	--		EntityFlagIsTrue {Name = "ef_PonyFollow"},
	--	 },
	--	 Actions =
	--	 {
	--	 	--DebugMessage	{Caption = "Vorhut_Track01", Message = "FightState"},
	--	 }
	--},
	--
	----Sobald der Lead stirbt wird der Goto abgebrochen
	--OnEvent
	--{
	--	Conditions =
	--	{
	--		EntityFlagIsTrue {Name = "ef_PonyFollow"},
	--		EntityFlagIsFalse {Name = "ef_LeadAtHome"},
	--		FigureIsDead	{Tag = "Track01Lead"},
	--	},
	--	Actions =
	--	{
	--		EntityFlagSetFalse {Name = "ef_PonyFollow"},
	--		FigureForcedWalkToEntity	{TargetTag = "NorthPonyEnd"},
	--	},	
	--	
	--},	
	--
	----Sobald der Lead stirbt wird der Goto abgebrochen
	--OnEvent
	--{
	--	Conditions =
	--	{
	--		EntityFlagIsTrue {Name = "ef_PonyFollow"},
	--		EntityFlagIsFalse {Name = "ef_LeadAtHome"},
	--		FigureIsInEntityRange	{Tag = "Track01Lead", TargetTag = "NorthCamp", Range = 15},
	--	},
	--	Actions =
	--	{
	--		EntityFlagSetTrue {Name = "ef_LeadAtHome"},
	--		FigureForcedRunToEntity	{TargetTag = "NorthPonyEnd"},
	--		
	--	},	
	--	
	--},	
	--Wenn die Ponys Idle werden gehen sie zurück ins Lager
	OnEvent
	{
		Conditions =
		{
			--EntityFlagIsFalse {Name = "ef_OneTimeCheck"},
			MapTimerIsElapsed	{Name = "mt_FollowStartTimer", Seconds = 2.8},
			EntityFlagIsFalse {Name = "ef_StateChange"},
			--OR
			--{
			--	FigureIsDead	{Tag = "Track01Lead"},
			--	FigureIsInEntityRange	{Tag = "Track01Lead", TargetTag = "NorthCamp", Range = 15},
			--},
			FigureIsIdle	{},
			
		},
		Actions =
		{
			FigureForcedWalkToEntity	{TargetTag = "NorthPonyEnd"},
			EntityFlagSetTrue {Name = "ef_OneTimeCheck"},
		},	
		
	},	
	--OnEvent
	--{
	--	Conditions =
	--	{
	--		FigureIsNotIdle	{},
	--		EntityFlagIsFalse {Name = "ef_StateChange"},
	--		EntityFlagIsTrue {Name = "ef_OneTimeCheck"},
	--	},
	--	Actions =
	--	{
	--		EntityFlagSetFalse {Name = "ef_OneTimeCheck"},
	--	},	
	--	
	--},		
		
	
	--Figure wird gevanished sobald sie nach einem Angriff im Zielfeld angekommen ist.
	OnEvent
	{
		Conditions =
		{
					EntityFlagIsFalse {Name = "ef_StateChange"},
					FigureIsInEntityRange	{TargetTag = "NorthPonyEnd", Range = 10},
		},
		Actions =
		{
			FigureVanish	{},
		},	
		
	},	
	--Wenn die Einheit umgebracht wird/oder gevanished wird springt sie in den PathState
	OnFigureRespawnEvent	
	{
		WaitTime = RespawnTimer,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_Track01Vanish"},
			PlayerFigureIsNotInRange	{Player = "pl_Human", Range = 31, X = 126, Y = 666},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_StateChange"},
			EntityFlagSetFalse {Name = "ef_PonyFollow"},
			EntityFlagSetFalse {Name = "ef_LeadAtHome"},
			EntityFlagSetTrue {Name = "ef_StartTeleport"},
		},
		DeathActions = 
		{
			
		}, 
		DelayedActions = 
		{
		}, 
		NoSpawnEffect = true, 
		IsSpawnOnlyWhen = false,
		
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_StartTeleport"},
		},
		Actions =
		{
			CutsceneFigureTeleport	{X = GetEntityX(), Y = GetEntityY()},
			EntityFlagSetFalse {Name = "ef_StartTeleport"},
		},	
		
	},	
	--Figure wird in den PathState gezwungen
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_StateChange"},
			EntityFlagIsFalse {Name = "ef_StartTeleport"},
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_StateChange"},
			EntityFlagSetFalse	{Name = "ef_GotoSchalter"},
		},	
		GotoState = "InitState",
	},	
};

