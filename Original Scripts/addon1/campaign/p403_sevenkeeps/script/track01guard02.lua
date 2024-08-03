RespawnTimer = 10 --+ (math.random(60))
--Ponytrack Nummer 01 Guard 2 (Linktsfuss)

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
		MapTimerIsElapsed	{Name = "mt_TrackStartSyncTimer", Seconds = 16},
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
			FigureIsInEntityRange	{TargetTag = "Track1Rider5", Range = 5},
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
		--{Point = "03LStartPathPoint", WaitTime = 0, Range = 3},
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
        {Point = "Track1Stop3", WaitTime = 10},
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
        {Point = "Track1Rider5",},
     
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
		MapTimerIsElapsed	{Name = "mt_TrackEndSyncTimer", Seconds = 16},
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
			FigureIsInEntityRange	{TargetTag = "03LStartPathPoint", Range = 5},
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
		{Point = "Track1Rider1", WaitTime = 0, Range = 3},
		{Point = "PathPoint25", WaitTime = 0, Range = 3},
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
        {Point = "Track1_2Stopp5", WaitTime = 10},
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
        {Point = "03LStartPathPoint",},
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
		MapTimerIsElapsed	{Name = "mt_TrackStartSyncTimer", Seconds = 16},
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
			FigureIsInEntityRange	{TargetTag = "Track1Stop5", Range = 5},
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
		--{Point = "03LStartPathPoint", WaitTime = 0, Range = 3},
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
       	{Point = "Track1Stop5",},
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
		MapTimerIsElapsed	{Name = "mt_TrackEndSyncTimer", Seconds = 16},
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
			FigureIsInEntityRange	{TargetTag = "03LStartPathPoint", Range = 5},
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
        {Point = "Track1Stop1", WaitTime = 0, Range = 3},
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
        {Point = "03LStartPathPoint",},
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
			FigureIsInEntityRange	{TargetTag = "Track1Rider5", Range = 15},
		--	MapFlagIsFalse	{Name = "mf_Camp05Destroyed"},
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
			FigureIsInEntityRange	{TargetTag = "03LStartPathPoint", Range = 15},
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
			FigureIsInEntityRange	{TargetTag = "03LStartPathPoint", Range = 15},
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
			FigureIsInEntityRange	{TargetTag = "Track1Stop5", Range = 15},
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
			SetUpdateInterval	{Steps = 21},
			MapTimerIsElapsed	{Name = "mt_FollowStartTimer", Seconds = 3},

			EntityFlagIsFalse {Name = "ef_StateChange"},
			OR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack01", TargetTag = "04LStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack01"},
			},
			
			OR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack02", TargetTag = "04RStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack02"},
			},
			
			OR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack03", TargetTag = "05LStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack03"},
			},
			
			OR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack04", TargetTag = "05RStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack04"},
			},
			
			OR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack05", TargetTag = "06LStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack05"},
			},
			
			OR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack06", TargetTag = "06RStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack06"},
			},
			
			OR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack07", TargetTag = "07LStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack07"},
			},
			
			OR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack08", TargetTag = "07RStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack08"},
			},
		},
		OnActions = 
		{
			FigureForcedRunToEntity	{TargetTag = "PathPoint11"},
		},
		OffConditions =
		{
			SetUpdateInterval	{Steps = 21},
			MapTimerIsElapsed	{Name = "mt_FollowStartTimer", Seconds = 3},

			EntityFlagIsFalse {Name = "ef_StateChange"},
			NotOR	
			{
				FigureIsInEntityRange	{Tag = "Track01Pack01", TargetTag = "04LStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack01"},
			},
			
			NotOR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack02", TargetTag = "04RStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack02"},
			},
			
			NotOR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack03", TargetTag = "05LStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack03"},
			},
			
			NotOR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack04", TargetTag = "05RStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack04"},
			},
			
			NotOR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack05", TargetTag = "06LStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack05"},
			},
			
			NotOR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack06", TargetTag = "06RStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack06"},
			},
			
			NotOR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack07", TargetTag = "07LStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack07"},
			},
			
			NotOR
			{
				FigureIsInEntityRange	{Tag = "Track01Pack08", TargetTag = "07RStartPathPoint", Range = 10},
				FigureIsDead	{Tag = "Track01Pack08"},
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
			EntityFlagIsFalse {Name = "ef_StateChange"},
			FigureIsInEntityRange	{TargetTag = "PathPoint11", Range = 6},
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


