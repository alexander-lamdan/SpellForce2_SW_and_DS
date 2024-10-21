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
	OnFigureRespawnEvent	
	{
		WaitTime = RespawnTimer,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_Track02Vanish"},
			PlayerFigureIsNotInRange	{Player = "pl_Human", Range = 31, X = 628, Y = 103},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_StartTeleport"},
			EntityFlagSetFalse	{Name = "ef_GotoSchalter"},
			EntityFlagSetFalse {Name = "ef_PonyFollow"},
			EntityFlagSetFalse {Name = "ef_LeadAtHome"},
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
			MapFlagIsTrue	{Name = "mf_Camp04Destroyed"}, 
			EntityFlagIsFalse {Name = "ef_StartTeleport"},
			EntityFlagIsFalse	{Name = "ef_GotoSchalter"},
			MapFlagIsFalse {Name = "mf_FollowTrack02Start"},
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
			MapFlagIsFalse	{Name = "mf_Camp04Destroyed"}, 
			EntityFlagIsFalse {Name = "ef_StartTeleport"},
			EntityFlagIsFalse	{Name = "ef_GotoSchalter"},
			MapFlagIsFalse {Name = "mf_FollowTrack02Start"},
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
		MapTimerIsElapsed	{Name = "mt_Track02StartSyncTimer", Seconds = 27},
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
				MapTimerIsElapsed	{Name = "mt_FollowTrack02StartTimer", Seconds = math.random() * 2},
				MapFlagIsTrue {Name = "mf_FollowTrack02Start"},
			},
			FigureIsInEntityRange	{TargetTag = "Track2PathEndpoint13", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		--{Point = "Track2PathPointStart07", WaitTime = 0, Range = 3},
   		--{Point = "01LStartPathPoint", WaitTime = 0},
        {Point = "Track2PathPoint01l",WaitTime = 0, Range = 3},
        {Point = "Track2PathPoint02l",},
        {Point = "Track2PathPoint03l",},
        {Point = "Track2PathPoint04l",},
        {Point = "Track2PathPoint05l",},
        {Point = "Track2PathPoint06l",},
        {Point = "Track2PathPoint07l",},
        {Point = "Track2PathPoint08l",},
        {Point = "Track2PathPoint09l",},
        {Point = "Track2PathPoint10l",},
        {Point = "Track2PathPoint11l",},
        {Point = "Track2PathPoint12l",},
        {Point = "Track02CityWaitingPoint13",WaitTime = 10},
        {Point = "Track2PathPoint13l",WaitTime = 0},
        {Point = "Track2PathPoint14l",},
        {Point = "Track2PathPoint15l",},
        {Point = "Track2PathPoint16l",},
        {Point = "Track2PathPoint17l",},
        {Point = "Track2PathPoint18l",},
        {Point = "Track2PathPoint19l",},
        {Point = "Track2PathPoint20l",},
        {Point = "Track2PathPoint21l",},
        {Point = "Track2PathPoint22l",},
        {Point = "Track2PathPoint23l",},
        {Point = "Track2PathPoint24l",},
        {Point = "Track2PathPoint25l",},
        {Point = "Track2PathEndpoint13",},
       
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
		MapTimerIsElapsed	{Name = "mt_Track02EndSyncTimer", Seconds = 27},
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
				MapTimerIsElapsed	{Name = "mt_FollowTrack02StartTimer", Seconds = math.random() * 2},
				MapFlagIsTrue {Name = "mf_FollowTrack02Start"},
			},
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart07", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		{Point = "Track2PathEndpoint09", WaitTime = 0, Range = 3},
        {Point = "Track2PathPoint26", WaitTime = 0},
        {Point = "Track2PathPoint27",},
        {Point = "Track2PathPoint28",},
        {Point = "Track2PathPoint25l",},
        {Point = "Track2PathPoint24l",},
        {Point = "Track2PathPoint23l",},
        {Point = "Track2PathPoint22l",},
        {Point = "Track2PathPoint21l",},
        {Point = "Track2PathPoint20l",},
        {Point = "Track2PathPoint19l",},
        {Point = "Track2PathPoint18l",},
        {Point = "Track2PathPoint17l",},
        {Point = "Track2PathPoint16l",},
        {Point = "Track2PathPoint15l",},
        {Point = "Track2PathPoint14l",},
        {Point = "Track2PathPoint13l",},
        {Point = "Track02CityWaitingPoint03", WaitTime = 10},
        {Point = "Track2PathPoint12l",WaitTime = 0},
        {Point = "Track2PathPoint11l",},
        {Point = "Track2PathPoint10l",},
        {Point = "Track2PathPoint09l",},
        {Point = "Track2PathPoint08l",},
        {Point = "Track2PathPoint07l",},
        {Point = "Track2PathPoint06l",},
        {Point = "Track2PathPoint05l",},
        {Point = "Track2PathPoint04l",},
        {Point = "Track2PathPoint03l",},
        {Point = "Track2PathPoint02l",},
        {Point = "Track2PathPoint01l",},
        {Point = "Track2PathPointStart07",},
   
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
		MapTimerIsElapsed	{Name = "mt_Track02StartSyncTimer", Seconds = 27},
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
				MapTimerIsElapsed	{Name = "mt_FollowTrack02StartTimer", Seconds = math.random() * 2},
				MapFlagIsTrue {Name = "mf_FollowTrack02Start"},
			},
			FigureIsInEntityRange	{TargetTag = "Track02CityWaitingPoint13", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		--{Point = "Track2PathPointStart07", WaitTime = 0, Range = 3},
        {Point = "Track2PathPoint01l",WaitTime = 0, Range = 3},
        {Point = "Track2PathPoint02l",},
        {Point = "Track2PathPoint03l",},
        {Point = "Track2PathPoint04l",},
        {Point = "Track2PathPoint05l",},
        {Point = "Track2PathPoint06l",},
        {Point = "Track2PathPoint07l",},
        {Point = "Track2PathPoint08l",},
        {Point = "Track2PathPoint09l",},
        {Point = "Track2PathPoint10l",},
        {Point = "Track2PathPoint11l",},
        {Point = "Track2PathPoint12l",},
        {Point = "Track02CityWaitingPoint13",},
     
       
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
		MapTimerIsElapsed	{Name = "mt_Track02EndSyncTimer", Seconds = 27},
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
				MapTimerIsElapsed	{Name = "mt_FollowTrack02StartTimer", Seconds = math.random() * 2},
				MapFlagIsTrue {Name = "mf_FollowTrack02Start"},
			},
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart07", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
		Points = 
	{
		DontTeleportToStartPosition = true,
        {Point = "Track02CityWaitingPoint09", WaitTime = 0, Range = 3},
        {Point = "Track2Return1",WaitTime = 0},
        {Point = "Track2Return2",},
        {Point = "Track2Return3",},
        {Point = "Track2Return4",},
        {Point = "Track2Return5",},
        {Point = "Track2Return6",},
        {Point = "Track2PathPoint08l",},
        {Point = "Track2PathPoint07l",},
        {Point = "Track2PathPoint06l",},
        {Point = "Track2PathPoint05l",},
        {Point = "Track2PathPoint04l",},
        {Point = "Track2PathPoint03l",},
        {Point = "Track2PathPoint02l",},
        {Point = "Track2PathPoint01l",},
        {Point = "Track2PathPointStart07",},
   
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
			MapFlagIsFalse {Name = "mf_FollowTrack02Start"},
			FigureIsInEntityRange	{TargetTag = "Track2PathEndpoint13", Range = 15},
			--MapFlagIsFalse	{Name = "mf_Camp04Destroyed"}, 
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
			MapFlagIsFalse	{Name = "mf_Camp04Destroyed"}, 
			MapFlagIsFalse {Name = "mf_FollowTrack02Start"},
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart07", Range = 15},
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
			MapFlagIsTrue	{Name = "mf_Camp04Destroyed"}, 
			MapFlagIsFalse {Name = "mf_FollowTrack02Start"},
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart07", Range = 15},
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
			MapFlagIsTrue	{Name = "mf_Camp04Destroyed"}, 
			MapFlagIsFalse {Name = "mf_FollowTrack02Start"},
			FigureIsInEntityRange	{TargetTag = "Track02CityWaitingPoint13", Range = 15},
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
			MapFlagIsTrue {Name = "mf_FollowTrack02Start"},
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
	--	 TargetTag = "Track02Lead",
	--	 OnConditions = 
	--	 {
	--		EntityFlagIsTrue {Name = "ef_PonyFollow"},
	--	 },
	--	 Actions =
	--	 {
	--	 	
	--	 }
	--},
	----Sobald der Lead stirbt wird der Goto abgebrochen
	--OnEvent
	--{
	--	Conditions =
	--	{
	--		EntityFlagIsTrue {Name = "ef_PonyFollow"},
	--		EntityFlagIsFalse {Name = "ef_LeadAtHome"},
	--		FigureIsDead	{Tag = "Track02Lead"},
	--	},
	--	Actions =
	--	{
	--		EntityFlagSetFalse {Name = "ef_PonyFollow"},
	--		FigureForcedWalkToEntity	{TargetTag = "SouthPonyEnd"},
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
	--		FigureIsInEntityRange	{Tag = "Track02Lead", TargetTag = "SouthCamp", Range = 15},
	--	},
	--	Actions =
	--	{
	--		EntityFlagSetTrue {Name = "ef_LeadAtHome"},
	--		FigureForcedRunToEntity	{TargetTag = "SouthPonyEnd"},
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
			--OR
			--{
			--	FigureIsDead	{Tag = "Track02Lead"},
			--	FigureIsInEntityRange	{Tag = "Track02Lead", TargetTag = "SouthCamp", Range = 15},
			--},
			MapTimerIsElapsed	{Name = "mt_FollowTrack02StartTimer", Seconds = 4.2},
			FigureIsIdle	{},
			EntityFlagIsFalse {Name = "ef_StateChange"},
		},
		Actions =
		{
			FigureForcedWalkToEntity	{TargetTag = "SouthPonyEnd"},
			--EntityFlagSetTrue {Name = "ef_OneTimeCheck"},
		},	
		
	},	
	--OnEvent
	--{
	--	Conditions =
	--	{
	--		EntityFlagIsFalse {Name = "ef_StateChange"},
	--		FigureIsNotIdle	{},
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
			FigureIsInEntityRange	{TargetTag = "SouthPonyEnd", Range = 10},
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
			MapFlagIsFalse {Name = "mf_Track02Vanish"},
			PlayerFigureIsNotInRange	{Player = "pl_Human", Range = 31, X = 628, Y = 103},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_StateChange"},
			EntityFlagSetFalse {Name = "ef_LeadAtHome"},
			EntityFlagSetFalse {Name = "ef_PonyFollow"},
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

