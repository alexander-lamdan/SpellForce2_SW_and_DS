RespawnTimer = 45 --+ (math.random(60))
--Ponytrack Nummer 01 Guard 1 (Rechtsfuss)

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
			--DebugMessage	{Caption = "Guard1_Track01", Message = "InitState"},
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
		MapTimerIsElapsed	{Name = "mt_TrackStartSyncTimer", Seconds = 14},
	},
	Actions =
	{
		--DebugMessage	{Caption = "Guard1_Track01", Message = "PathState"},
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
			FigureIsInEntityRange	{TargetTag = "Track1Rider4", Range = 5},
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
   		--{Point = "02RStartPathPoint", WaitTime = 0, Range = 3},
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
        {Point = "Track1Stop4", WaitTime = 10},
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
        {Point = "Track1Rider4",},

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
		MapTimerIsElapsed	{Name = "mt_TrackEndSyncTimer", Seconds = 14},
	},
	Actions =
	{
		--DebugMessage	{Caption = "Guard1_Track01", Message = "PathStateReturn"},
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
			FigureIsInEntityRange	{TargetTag = "02RStartPathPoint", Range = 5},
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
		{Point = "PathPoint25r", WaitTime =  0, Range = 3},
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
        {Point = "Track1_2Stopp4", WaitTime = 10},
        {Point = "PathPoint10r", WaitTime = 0},
        {Point = "PathPoint09r",},
        {Point = "PathPoint08r",},
        {Point = "PathPoint07r",},
        {Point = "PathPoint06r",},
        {Point = "PathPoint05r",},
        {Point = "PathPoint04r",},
        {Point = "PathPoint03r",},
        {Point = "PathPoint02r",},
       -- {Point = "01RStartPathPoint",},
        {Point = "02RStartPathPoint",},

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
		MapTimerIsElapsed	{Name = "mt_TrackStartSyncTimer", Seconds = 14},
	},
	Actions =
	{
		--DebugMessage	{Caption = "Guard1_Track01", Message = "PathState2"},
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
			FigureIsInEntityRange	{TargetTag = "Track1Stop4", Range = 5},
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
   		--{Point = "02RStartPathPoint", WaitTime = 0, Range = 3},
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
        {Point = "Track1Stop4",},

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
		MapTimerIsElapsed	{Name = "mt_TrackEndSyncTimer", Seconds = 14},
	},
	Actions =
	{
		--DebugMessage	{Caption = "Guard1_Track01", Message = "PathState2Return"},
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
			FigureIsInEntityRange	{TargetTag = "02RStartPathPoint", Range = 5},
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
       -- {Point = "01RStartPathPoint",},
        {Point = "02RStartPathPoint",},

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
			MapFlagIsFalse {Name = "mf_FollowStart"},
			FigureIsInEntityRange	{TargetTag = "Track1Rider4", Range = 15},
			--MapFlagIsFalse	{Name = "mf_Camp05Destroyed"},
		},
		Actions =
		{
			--DebugMessage	{Caption = "Guard1_Track01", Message = "CheckState"},
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
			FigureIsInEntityRange	{TargetTag = "02RStartPathPoint", Range = 15},
		},
		Actions =
		{
			--DebugMessage	{Caption = "Guard1_Track01", Message = "CheckState"},
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
			FigureIsInEntityRange	{TargetTag = "02RStartPathPoint", Range = 15},
		},
		Actions =
		{
			--DebugMessage	{Caption = "Guard1_Track01", Message = "CheckState"},
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
			FigureIsInEntityRange	{TargetTag = "Track1Stop4", Range = 15},
		},
		Actions =
		{
			--DebugMessage	{Caption = "Guard1_Track01", Message = "CheckState"},
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
			--DebugMessage	{Caption = "Guard1_Track01", Message = "CheckState"},
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
			SetUpdateInterval	{Steps = 20},
			MapTimerIsElapsed	{Name = "mt_FollowStartTimer", Seconds = 3.3},

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
			--DebugMessage	{Caption = "Guard1_Track01", Message = "FightState"},
		},
		OffConditions =
		{
			SetUpdateInterval	{Steps = 20},
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
			--DebugMessage	{Caption = "Guard1_Track01", Message = "FightState"},
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
