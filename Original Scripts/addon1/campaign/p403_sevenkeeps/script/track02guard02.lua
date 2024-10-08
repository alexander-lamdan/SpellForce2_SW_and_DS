RespawnTimer = 10 --+ (math.random(60))
--Ponytrack Nummer 02 Guard 1 (Rechtsfuss)

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
		MapTimerIsElapsed	{Name = "mt_Track02StartSyncTimer", Seconds = 16},
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
			FigureIsInEntityRange	{TargetTag = "Track2PathEndpoint05", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		--{Point = "Track2PathPointStart13", WaitTime = 0, Range = 3},
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
        {Point = "Track02CityWaitingPoint05",WaitTime = 10},
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
        {Point = "Track2PathEndpoint05",},
       
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
		MapTimerIsElapsed	{Name = "mt_Track02EndSyncTimer", Seconds = 16},
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
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart13", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		{Point = "Track2PathEndpoint01", WaitTime = 0, Range = 3},
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
        {Point = "Track02CityWaitingPoint11", WaitTime = 10},
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
        {Point = "Track2PathPointStart13",},
   
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
		MapTimerIsElapsed	{Name = "mt_Track02StartSyncTimer", Seconds = 16},
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
			FigureIsInEntityRange	{TargetTag = "Track02CityWaitingPoint05", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		--{Point = "Track2PathPointStart13", WaitTime = 0, Range = 3},
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
        {Point = "Track02CityWaitingPoint05",},
     
       
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
		MapTimerIsElapsed	{Name = "mt_Track02EndSyncTimer", Seconds = 16},
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
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart13", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
		Points = 
	{
		DontTeleportToStartPosition = true,
        {Point = "Track02CityWaitingPoint01", WaitTime = 0, Range = 3},
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
        {Point = "Track2PathPointStart13",},
   
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
			FigureIsInEntityRange	{TargetTag = "Track2PathEndpoint05", Range = 15},
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
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart13", Range = 15},
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
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart13", Range = 15},
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
			FigureIsInEntityRange	{TargetTag = "Track02CityWaitingPoint05", Range = 15},
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
	--Angriff auf den Tross, Vorhut begibt sich zum Schutz der Packpferde
	
     OnToggleEvent	
	{
		EventName = "HoldPosition",
		OnConditions =
		{
			SetUpdateInterval	{Steps = 31},
			MapTimerIsElapsed	{Name = "mt_FollowTrack02StartTimer", Seconds = 4.5},
			EntityFlagIsFalse {Name = "ef_StateChange"},
			OR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack01", TargetTag = "Track2PathPointStart01", Range = 10},
				FigureIsDead	{Tag = "Track02Pack01"},
			},
			
			OR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack02", TargetTag = "Track2PathPointStart02", Range = 10},
				FigureIsDead	{Tag = "Track02Pack02"},
			},
			
			OR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack03", TargetTag = "Track2PathPointStart03", Range = 10},
				FigureIsDead	{Tag = "Track02Pack03"},
			},
			
			OR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack04", TargetTag = "Track2PathPointStart04", Range = 10},
				FigureIsDead	{Tag = "Track02Pack04"},
			},
			
			OR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack05", TargetTag = "Track2PathPointStart05", Range = 10},
				FigureIsDead	{Tag = "Track02Pack05"},
			},
			
			OR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack06", TargetTag = "Track2PathPointStart06", Range = 10},
				FigureIsDead	{Tag = "Track02Pack06"},
			},
			
			OR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack07", TargetTag = "Track2PathPointStart07", Range = 10},
				FigureIsDead	{Tag = "Track02Pack07"},
			},
			
			OR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack08", TargetTag = "Track2PathPointStart08", Range = 10},
				FigureIsDead	{Tag = "Track02Pack08"},
			},
		},
		OnActions = 
		{
			FigureForcedRunToEntity	{TargetTag = "Track02LeadEndpointCity"},
		},
		OffConditions =
		{
			SetUpdateInterval	{Steps = 31},
			EntityFlagIsFalse {Name = "ef_StateChange"},
			NotOR	
			{
				FigureIsInEntityRange	{Tag = "Track02Pack01", TargetTag = "Track2PathPointStart01", Range = 10},
				FigureIsDead	{Tag = "Track02Pack01"},
			},
			
			NotOR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack02", TargetTag = "Track2PathPointStart02", Range = 10},
				FigureIsDead	{Tag = "Track02Pack02"},
			},
			
			NotOR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack03", TargetTag = "Track2PathPointStart03", Range = 10},
				FigureIsDead	{Tag = "Track02Pack03"},
			},
			
			NotOR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack04", TargetTag = "Track2PathPointStart04", Range = 10},
				FigureIsDead	{Tag = "Track02Pack04"},
			},
			
			NotOR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack05", TargetTag = "Track2PathPointStart05", Range = 10},
				FigureIsDead	{Tag = "Track02Pack05"},
			},
			
			NotOR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack06", TargetTag = "Track2PathPointStart06", Range = 10},
				FigureIsDead	{Tag = "Track02Pack06"},
			},
			
			NotOR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack07", TargetTag = "Track2PathPointStart07", Range = 10},
				FigureIsDead	{Tag = "Track02Pack07"},
			},
			
			NotOR
			{
				FigureIsInEntityRange	{Tag = "Track02Pack08", TargetTag = "Track2PathPointStart08", Range = 10},
				FigureIsDead	{Tag = "Track02Pack08"},
			},
		},
		OffActions = 
		{
			FigureStop	{},
		},
	},
	
	--Reiter vanished nach einem Angriff auf den Tross im mittleren Camp.
	OnEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{TargetTag = "Track02LeadEndpointCity", Range = 6},
			EntityFlagIsFalse {Name = "ef_StateChange"},
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
			EntityFlagSetTrue {Name = "ef_StartTeleport"},
			EntityFlagSetFalse	{Name = "ef_EinmalSchalter"},
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
