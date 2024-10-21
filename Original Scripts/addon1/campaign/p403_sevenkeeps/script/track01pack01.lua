RespawnTimer = 180 --+ (math.random(60))
--Ponytrack Nummer 01 Pony 1,3,5,7

--*******************************************************
--***                                                 ***
--***               	InitState   		          ***
--***                                                 ***
--*******************************************************		

State
{	
	StateName = "InitState",
	--Figure wird gevanished wenn er den Resetbefehl erhält.
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
			FigureIsInEntityRange	{TargetTag = "Track1Pony1", Range = 5},
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
		
		--{Point = "04LStartPathPoint", WaitTime = 0, Range = 3},
   		--{Point = "01LStartPathPoint", WaitTime = 0},
        {Point = "PathPoint02",WaitTime = 0, Range = 3},
        {Point = "PathPoint03",},
        {Point = "PathPoint04",},
        {Point = "PathPoint05",},
        {Point = "PathPoint06",},
        {Point = "PathPoint07",},
        {Point = "PathPoint08",},
        {Point = "PathPoint09",},
        {Point = "PathPoint10",},
        {Point = "PathPoint11",},
        {Point = "Track1Stop7", WaitTime = 10},
        {Point = "PathPoint11_5", WaitTime = 0},
        {Point = "PathPoint12",},
        {Point = "PathPoint13",},
        {Point = "PathPoint14",},
        {Point = "PathPoint15",},
        {Point = "PathPoint16",},
        {Point = "PathPoint17",},
        {Point = "PathPoint18",},
        {Point = "PathPoint19",},
        {Point = "PathPoint20",},
        {Point = "PathPoint21",},
        {Point = "PathPoint22",},
        {Point = "PathPoint23",},
        {Point = "Track1Pony1",},
       
        
   	
   	},
	GotoState = "CheckState",
};

--*******************************************************
--***                                                 ***
--***                PathStateReturn                  ***
--***                                                 ***
--*******************************************************	

PathStates	
{
	StateName = "PathStateReturn",
	Conditions = 
	{
		MapTimerIsElapsed	{Name = "mt_TrackEndSyncTimer", Seconds = 20},
	}, 
	Actions = 
	{
	
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
			FigureIsInEntityRange	{TargetTag = "04LStartPathPoint", Range = 5},
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

		{Point = "Track1Rider3", WaitTime = 0,Range = 3},
        {Point = "PathPoint25", WaitTime = 0,},
        {Point = "PathPoint22",WaitTime = 0},
        {Point = "PathPoint21",},
        {Point = "PathPoint20",},
        {Point = "PathPoint19",},
        {Point = "PathPoint18",},
        {Point = "PathPoint17",},
        {Point = "PathPoint16",},
        {Point = "PathPoint15",},
        {Point = "PathPoint14",},
        {Point = "PathPoint13",},
        {Point = "PathPoint12",},
        {Point = "Track1_2Stopp7", WaitTime = 10},
        {Point = "PathPoint10", WaitTime = 0},
        {Point = "PathPoint09",},
        {Point = "PathPoint08",},
        {Point = "PathPoint07",},
        {Point = "PathPoint06",},
        {Point = "PathPoint05",},
        {Point = "PathPoint04",},
        {Point = "PathPoint03",},
        {Point = "PathPoint02",},
       -- {Point = "01LStartPathPoint",},
        {Point = "04LStartPathPoint",},
   	
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
			FigureIsInEntityRange	{TargetTag = "Track1Stop7", Range = 5},
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

		--{Point = "04LStartPathPoint", WaitTime = 0, Range = 3},
   		--{Point = "01LStartPathPoint", WaitTime = 0},
        {Point = "PathPoint02",WaitTime = 0, Range = 3},
        {Point = "PathPoint03",},
        {Point = "PathPoint04",},
        {Point = "PathPoint05",},
        {Point = "PathPoint06",},
        {Point = "PathPoint07",},
        {Point = "PathPoint08",},
        {Point = "PathPoint09",},
        {Point = "PathPoint10",},
        {Point = "PathPoint11",},
        {Point = "Track1Stop7",},
        
   	
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
			FigureIsInEntityRange	{TargetTag = "04LStartPathPoint", Range = 5},
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

		{Point = "Track1Stop3", WaitTime = 0, Range = 3},
        {Point = "Track1Return1", WaitTime = 0, },
        {Point = "Track1Return2", WaitTime = 0, },
        {Point = "Track1Return3",},
        {Point = "PathPoint10",},
        {Point = "PathPoint09",},
        {Point = "PathPoint08",},
        {Point = "PathPoint07",},
        {Point = "PathPoint06",},
        {Point = "PathPoint05",},
        {Point = "PathPoint04",},
        {Point = "PathPoint03",},
        {Point = "PathPoint02",},
       -- {Point = "01LStartPathPoint",},
        {Point = "04LStartPathPoint",},
   	
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
			FigureIsInEntityRange	{TargetTag = "Track1Pony1", Range = 15},
			--MapFlagIsFalse	{Name = "mf_Camp05Destroyed"}, 
		},
		Actions =
		{
			
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
			FigureIsInEntityRange	{TargetTag = "04LStartPathPoint", Range = 15},
		},
		Actions =
		{
			
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
			FigureIsInEntityRange	{TargetTag = "04LStartPathPoint", Range = 15},
		},
		Actions =
		{
			
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
			FigureIsInEntityRange	{TargetTag = "Track1Stop7", Range = 15},
		},
		Actions =
		{
			
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
	--	 	--DebugMessage	{Message = "Packesel folgen dem Lead nach Hause..."},
	--	 }
	--},
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
	--	 	--DebugMessage	{Message = "Lead ist tot, Packesel gehen gemütlich nach Hause..."},
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
	--	 	--DebugMessage	{Message = "Lead ist im Camp angekommen, Packesel rennen weiter Richtung Camp..."},
	--	},	
	--	
	--},	
	--Wenn die Ponys Idle werden gehen sie zurück ins Lager
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_FollowStartTimer", Seconds = 2.5},
			EntityFlagIsFalse {Name = "ef_StateChange"},
			--EntityFlagIsFalse {Name = "ef_OneTimeCheck"},
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

