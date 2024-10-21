RespawnTimer = 15 --+ (math.random(60))
--Ponytrack Nummer 01 Nachhut 1 (Linksfuss)

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
		MapTimerIsElapsed	{Name = "mt_TrackStartSyncTimer", Seconds = 34},
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
			FigureIsInEntityRange	{TargetTag = "Track1Rider7", Range = 5},
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
		--{Point = "08LStartPathPoint", WaitTime = 0, Range = 3},
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
        {Point = "Track1Stop15", WaitTime = 10},
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
        {Point = "Track1Rider7",},

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
		MapTimerIsElapsed	{Name = "mt_TrackEndSyncTimer", Seconds = 34},
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
			FigureIsInEntityRange	{TargetTag = "08LStartPathPoint", Range = 5},
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
		{Point = "Track1Pony5", WaitTime = 0, Range = 3},
		{Point = "PathPoint25", WaitTime = 0, },
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
        {Point = "Track1_2Stopp15", WaitTime = 10},
        {Point = "PathPoint10", WaitTime = 0},
        {Point = "PathPoint09",},
        {Point = "PathPoint08",},
        {Point = "PathPoint07",},
        {Point = "PathPoint06",},
        {Point = "PathPoint05",},
        {Point = "PathPoint04",},
        {Point = "PathPoint03",},
        {Point = "PathPoint02",},
        --{Point = "01LStartPathPoint",},
        {Point = "08LStartPathPoint",},
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
		MapTimerIsElapsed	{Name = "mt_TrackStartSyncTimer", Seconds = 34},
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
			FigureIsInEntityRange	{TargetTag = "Track1Stop15", Range = 5},
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
		--{Point = "08LStartPathPoint", WaitTime = 0, Range = 3},
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
        {Point = "Track1Stop15",},
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
		MapTimerIsElapsed	{Name = "mt_TrackEndSyncTimer", Seconds = 34},
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
			FigureIsInEntityRange	{TargetTag = "08LStartPathPoint", Range = 5},
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
		{Point = "Track1Stop11", WaitTime = 0, Range = 3},
        {Point = "Track1Return1", WaitTime = 0,},
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
        --{Point = "01LStartPathPoint",},
        {Point = "08LStartPathPoint",},
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
			FigureIsInEntityRange	{TargetTag = "Track1Rider7", Range = 15},
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
			FigureIsInEntityRange	{TargetTag = "08LStartPathPoint", Range = 15},
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
			FigureIsInEntityRange	{TargetTag = "08LStartPathPoint", Range = 15},
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
			FigureIsInEntityRange	{TargetTag = "Track1Stop15", Range = 15},
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
			MapTimerIsElapsed	{Name = "mt_FollowStartTimer", Seconds = 2.3},
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



