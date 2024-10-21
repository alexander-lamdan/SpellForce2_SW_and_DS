--Ponytrack Nummer 02 Nachhut 1 (Linksfuss)

--*******************************************************
--***                                                 ***
--***               	InitState   		          ***
--***                                                 ***
--*******************************************************		

RespawnTimer = 10 --+ (math.random(60))



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
			EntityFlagSetFalse {Name = "ef_StateChange"},
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
		MapTimerIsElapsed	{Name = "mt_Track02StartSyncTimer", Seconds = 32},
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
		FigureIsInEntityRange	{TargetTag = "Track2PathEndpoint16", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		--{Point = "Track2PathPointStart16", WaitTime = 0, Range = 3},
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
        {Point = "Track02CityWaitingPoint16",WaitTime = 10},
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
        {Point = "Track2PathEndpoint16",},
       
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
		MapTimerIsElapsed	{Name = "mt_Track02EndSyncTimer", Seconds = 32},
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
FigureIsInEntityRange	{TargetTag = "Track2PathPointStart16", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		{Point = "Track2PathEndpoint12", WaitTime = 0, Range = 3},
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
        {Point = "Track02CityWaitingPoint02", WaitTime = 10},
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
        {Point = "Track2PathPointStart16",},
   
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
		MapTimerIsElapsed	{Name = "mt_Track02StartSyncTimer", Seconds = 32},
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

			FigureIsInEntityRange	{TargetTag = "Track02CityWaitingPoint16", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
	Points = 
	{
		DontTeleportToStartPosition = true,
		--{Point = "Track2PathPointStart16", WaitTime = 0, Range = 3},
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
        {Point = "Track02CityWaitingPoint16",},
     
       
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
		MapTimerIsElapsed	{Name = "mt_Track02EndSyncTimer", Seconds = 32},
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
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart16", Range = 5},
		},
	}, 
	StopActions = 
	{
		FigureStop{},
		
	}, 
		Points = 
	{
		DontTeleportToStartPosition = true,
        {Point = "Track02CityWaitingPoint12", WaitTime = 0, Range = 3},
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
        {Point = "Track2PathPointStart16",},
   
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
			FigureIsInEntityRange	{TargetTag = "Track2PathEndpoint16", Range = 15},
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
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart16", Range = 15},
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
			FigureIsInEntityRange	{TargetTag = "Track2PathPointStart16", Range = 15},
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
			FigureIsInEntityRange	{TargetTag = "Track02CityWaitingPoint16", Range = 15},
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
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_FollowTrack02StartTimer", Seconds = 3.3},
			EntityFlagIsFalse {Name = "ef_StateChange"},
			EntityFlagIsFalse	{Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureRunToEntity	{TargetTag = "Track02LeadEndpointCity"},
			EntityFlagSetTrue	{Name = "ef_EinmalSchalter"},
		},	
	},
	
	
	
	--Reiter vanished nach einem Angriff auf den Tross im mittleren Camp.
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_StateChange"},
			FigureIsInEntityRange	{TargetTag = "Track02LeadEndpointCity", Range = 3},
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
	
	--Figure wird in den PathState gezwungen
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_StateChange"},
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_StateChange"},
			EntityFlagSetFalse	{Name = "ef_GotoSchalter"},
		},	
		GotoState = "InitState",
	},		
};



