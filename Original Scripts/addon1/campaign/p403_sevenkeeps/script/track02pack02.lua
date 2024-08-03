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
			--DebugMessage	{Caption = "Vorhut", Message = "InitState"},
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
		MapTimerIsElapsed	{Name = "mt_Track02StartSyncTimer", Seconds = 21},
	}, 
	Actions = 
	{
 		--DebugMessage	{Caption = "Vorhut", Message = "PathState"},
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
			FigureIsInEntityRange	{TargetTag = "Track2PathEndpoint08", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		--{Point = "Track2PathPointStart02", WaitTime = 0, Range = 3},
   		--{Point = "01LStartPathPoint", WaitTime = 0},
        {Point = "Track2PathPoint01r",WaitTime = 0, Range = 3},
        {Point = "Track2PathPoint02r",},
        {Point = "Track2PathPoint03r",},
        {Point = "Track2PathPoint04r",},
        {Point = "Track2PathPoint05r",},
        {Point = "Track2PathPoint06r",},
        {Point = "Track2PathPoint07r",},
        {Point = "Track2PathPoint08r",},
        {Point = "Track2PathPoint09r",},
        {Point = "Track2PathPoint10r",},
        {Point = "Track2PathPoint11r",},
        {Point = "Track2PathPoint12r",},
        {Point = "Track02CityWaitingPoint08",WaitTime = 10},
        {Point = "Track2PathPoint13r",WaitTime = 0},
        {Point = "Track2PathPoint14r",},
        {Point = "Track2PathPoint15r",},
        {Point = "Track2PathPoint16r",},
        {Point = "Track2PathPoint17r",},
        {Point = "Track2PathPoint18r",},
        {Point = "Track2PathPoint19r",},
        {Point = "Track2PathPoint20r",},
        {Point = "Track2PathPoint21r",},
        {Point = "Track2PathPoint22r",},
        {Point = "Track2PathPoint23r",},
        {Point = "Track2PathPoint24r",},
        {Point = "Track2PathPoint25r",},
        {Point = "Track2PathEndpoint08",},
       
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
		MapTimerIsElapsed	{Name = "mt_Track02EndSyncTimer", Seconds = 21},
	}, 
	Actions = 
	{
		--DebugMessage	{Caption = "Vorhut", Message = "PathStateReturn"},
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
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart02", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		{Point = "Track2PathEndpoint04", WaitTime = 0, Range = 3},
        {Point = "Track2PathPoint26r", WaitTime = 0},
        {Point = "Track2PathPoint27r",},
        {Point = "Track2PathPoint28r",},
        {Point = "Track2PathPoint25r",},
        {Point = "Track2PathPoint24r",},
        {Point = "Track2PathPoint23r",},
        {Point = "Track2PathPoint22r",},
        {Point = "Track2PathPoint21r",},
        {Point = "Track2PathPoint20r",},
        {Point = "Track2PathPoint19r",},
        {Point = "Track2PathPoint18r",},
        {Point = "Track2PathPoint17r",},
        {Point = "Track2PathPoint16r",},
        {Point = "Track2PathPoint15r",},
        {Point = "Track2PathPoint14r",},
        {Point = "Track2PathPoint13r",},
        {Point = "Track02CityWaitingPoint08", WaitTime = 10},
        {Point = "Track2PathPoint12r",WaitTime = 0},
        {Point = "Track2PathPoint11r",},
        {Point = "Track2PathPoint10r",},
        {Point = "Track2PathPoint09r",},
        {Point = "Track2PathPoint08r",},
        {Point = "Track2PathPoint07r",},
        {Point = "Track2PathPoint06r",},
        {Point = "Track2PathPoint05r",},
        {Point = "Track2PathPoint04r",},
        {Point = "Track2PathPoint03r",},
        {Point = "Track2PathPoint02r",},
        {Point = "Track2PathPoint01r",},
        {Point = "Track2PathPointStart02",},
   
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
		MapTimerIsElapsed	{Name = "mt_Track02StartSyncTimer", Seconds = 21},
	}, 
	Actions = 
	{
		--DebugMessage	{Caption = "Vorhut", Message = "PathState2"},
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
			FigureIsInEntityRange	{TargetTag = "Track02CityWaitingPoint08", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		--{Point = "Track2PathPointStart02", WaitTime = 0, Range = 3},
        {Point = "Track2PathPoint01r",WaitTime = 0, Range = 3},
        {Point = "Track2PathPoint02r",},
        {Point = "Track2PathPoint03r",},
        {Point = "Track2PathPoint04r",},
        {Point = "Track2PathPoint05r",},
        {Point = "Track2PathPoint06r",},
        {Point = "Track2PathPoint07r",},
        {Point = "Track2PathPoint08r",},
        {Point = "Track2PathPoint09r",},
        {Point = "Track2PathPoint10r",},
        {Point = "Track2PathPoint11r",},
        {Point = "Track2PathPoint12r",},
        {Point = "Track02CityWaitingPoint08",},
     
       
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
		MapTimerIsElapsed	{Name = "mt_Track02EndSyncTimer", Seconds = 21},
	}, 
	Actions = 
	{
		--DebugMessage	{Caption = "Vorhut", Message = "PathState2Return"},
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
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart02", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
		Points = 
	{
		DontTeleportToStartPosition = true,
        {Point = "Track02CityWaitingPoint04", WaitTime = 0, Range = 3},
        {Point = "Track2Return1r",WaitTime = 0},
        {Point = "Track2Return2r",},
        {Point = "Track2Return3r",},
        {Point = "Track2Return4r",},
        {Point = "Track2Return5r",},
        {Point = "Track2Return6r",},
        {Point = "Track2PathPoint08r",},
        {Point = "Track2PathPoint07r",},
        {Point = "Track2PathPoint06r",},
        {Point = "Track2PathPoint05r",},
        {Point = "Track2PathPoint04r",},
        {Point = "Track2PathPoint03r",},
        {Point = "Track2PathPoint02r",},
        {Point = "Track2PathPoint01r",},
        {Point = "Track2PathPointStart02",},
   
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
			FigureIsInEntityRange	{TargetTag = "Track2PathEndpoint08", Range = 15},
			--MapFlagIsFalse	{Name = "mf_Camp04Destroyed"}, 
		},
		Actions =
		{
			--DebugMessage	{Caption = "Vorhut", Message = "CheckState"},
		},	
		GotoState = "PathStateReturn",
	},	
	OnEvent
	{
		Conditions =
		{
			MapFlagIsFalse	{Name = "mf_Camp04Destroyed"}, 
			MapFlagIsFalse {Name = "mf_FollowTrack02Start"},
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart02", Range = 15},
		},
		Actions =
		{
			--DebugMessage	{Caption = "Vorhut", Message = "CheckState"},
		},	
		GotoState = "PathState",
	},	
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Camp04Destroyed"}, 
			MapFlagIsFalse {Name = "mf_FollowTrack02Start"},
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart02", Range = 15},
		},
		Actions =
		{
			--DebugMessage	{Caption = "Vorhut", Message = "CheckState"},
		},	
		GotoState = "PathState2",
	},	
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Camp04Destroyed"}, 
			MapFlagIsFalse {Name = "mf_FollowTrack02Start"},
			FigureIsInEntityRange	{TargetTag = "Track02CityWaitingPoint08", Range = 15},
		},
		Actions =
		{
			--DebugMessage	{Caption = "Vorhut", Message = "CheckState"},
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
			--DebugMessage	{Caption = "Vorhut", Message = "CheckState"},
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
	--	 	--DebugMessage	{Caption = "Vorhut", Message = "FightState"},
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
			MapTimerIsElapsed	{Name = "mt_FollowTrack02StartTimer", Seconds = 2.7},
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

