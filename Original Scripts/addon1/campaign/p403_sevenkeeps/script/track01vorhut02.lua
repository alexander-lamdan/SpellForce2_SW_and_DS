RespawnTimer = 10 --+ (math.random(60))
--Ponytrack Nummer 01 Vorhut 2 (Rechtsfuss)

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
		MapTimerIsElapsed	{Name = "mt_TrackStartSyncTimer", Seconds = 10},	
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
			FigureIsInEntityRange	{TargetTag = "Track1Rider2", Range = 5},
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
   		--{Point = "01RStartPathPoint", WaitTime = 0, Range = 3},
        {Point = "PathPoint02r", WaitTime = 0, Range = 3},
        {Point = "PathPoint03r",},
        {Point = "PathPoint04r",},
        {Point = "PathPoint05r",},
        {Point = "PathPoint06r",},
        {Point = "PathPoint07r",},
        {Point = "PathPoint08r",},
        {Point = "PathPoint09r",},
        {Point = "PathPoint10r",},
        {Point = "PathPoint11r",},
        {Point = "Track1Stop2", WaitTime = 10},
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
        {Point = "Track1Rider2",},
      
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
		MapTimerIsElapsed	{Name = "mt_TrackEndSyncTimer", Seconds = 10},	
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
			FigureIsInEntityRange	{TargetTag = "01RStartPathPoint", Range = 5},
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
		{Point = "PathPoint25r", WaitTime = 0, Range = 3},
        {Point = "PathPoint22r",WaitTime = 0,},
        {Point = "PathPoint21r",WaitTime = 0},
        {Point = "PathPoint20r",},
        {Point = "PathPoint19r",},
        {Point = "PathPoint18r",},
        {Point = "PathPoint17r",},
        {Point = "PathPoint16r",},
        {Point = "PathPoint15r",},
        {Point = "PathPoint14r",},
        {Point = "PathPoint13r",},
        {Point = "PathPoint12r",},
        {Point = "Track1_2Stopp2", WaitTime = 10},
        {Point = "PathPoint10r", WaitTime = 0},
        {Point = "PathPoint09r",},
        {Point = "PathPoint08r",},
        {Point = "PathPoint07r",},
        {Point = "PathPoint06r",},
        {Point = "PathPoint05r",},
        {Point = "PathPoint04r",},
        {Point = "PathPoint03r",},
        {Point = "PathPoint02r",},
        {Point = "01RStartPathPoint",},
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
		MapTimerIsElapsed	{Name = "mt_TrackStartSyncTimer", Seconds = 10},	
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
			FigureIsInEntityRange	{TargetTag = "Track1Stop2", Range = 5},
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
   		--{Point = "01RStartPathPoint", WaitTime = 0, Range = 3},
        {Point = "PathPoint02r", WaitTime = 0, Range = 3},
        {Point = "PathPoint03r",},
        {Point = "PathPoint04r",},
        {Point = "PathPoint05r",},
        {Point = "PathPoint06r",},
        {Point = "PathPoint07r",},
        {Point = "PathPoint08r",},
        {Point = "PathPoint09r",},
        {Point = "PathPoint10r",},
        {Point = "PathPoint11r",},
        {Point = "Track1Stop2",},
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
		MapTimerIsElapsed	{Name = "mt_TrackEndSyncTimer", Seconds = 10},	
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
			FigureIsInEntityRange	{TargetTag = "01RStartPathPoint", Range = 5},
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
        {Point = "Track1Return1r", WaitTime = 0, Range = 3},
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
        {Point = "01RStartPathPoint",},
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
			FigureIsInEntityRange	{TargetTag = "Track1Rider2", Range = 15},
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
			FigureIsInEntityRange	{TargetTag = "01RStartPathPoint", Range = 15},
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
			FigureIsInEntityRange	{TargetTag = "01RStartPathPoint", Range = 15},
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
			FigureIsInEntityRange	{TargetTag = "Track1Stop2", Range = 15},
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
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_FollowStartTimer", Seconds = 2.6},
			EntityFlagIsFalse {Name = "ef_StateChange"},
			EntityFlagIsFalse	{Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureRunToEntity	{TargetTag = "PathPoint11"},
			EntityFlagSetTrue	{Name = "ef_EinmalSchalter"},
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
			EntityFlagSetFalse	{Name = "ef_EinmalSchalter"},
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






