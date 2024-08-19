State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "HeartOfIceGotoWinterlight"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_SQHeart_SkjadirHasSpawned"},
			FigureTeleportToEntity	{Tag = "default", TargetTag = "pl_HumanAvatar"},
			FigureLevelSet	{Tag = "default", Level = 25},
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = true,
	};

	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "HeartOfIceConquerWinterlight"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "SQHeartSkjadir"},
			FigurePlayerTransfer	{},
		},
		GotoState = "Follow",
	};
};

State
{
	StateName = "Follow",

	--OnFollowEvent
	--{
	--	Tag = "SQHeart_Skjadir",
	--	TargetTag = "pl_HumanAvatar",
	--	OnConditions = 
	--	{
	--		QuestIsNotSolved	{Quest = "HeartOfIceKillFinalBoss"},
	--	},
	--	Actions = 
	--	{
	--	},
	--};
	OnOneTimeDeadEvent
	{
		EventName = "SkjadirDead",
		Conditions = 
		{
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P401_SkjadirHasDiedOnWinterlight"},
		},
	};

	OnEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "HeartOfIceKillFinalBoss"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "HeartOfIceGetRewardFromSkjadir"},
			FigurePlayerTransfer	{Player = "pl_Skjadir"},
			FigureTeamTransfer	{Team = "tm_Neutral"},
			FigureStop	{},
			
			DialogSetEnabled	{Tag = "SQHeart_Skjadir"},
			DialogTypeSetSideQuest	{Tag = "SQHeart_Skjadir"},
		},
		GotoState = "Patrol",
	};
};


State
{
	StateName = "Patrol",

	OnFollowEvent
	{
		Tag = "SQHeart_Skjadir",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			QuestIsNotSolved	{Quest = "HeartOfIce"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
		},
	};

	OnEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "HeartOfIce"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureTeamTransfer	{Team = "tm_Team1"},
			FigurePathGoto
			{
			    Goto = FigurePatrolWalkToEntity {Tag = "SQHeart_Skjadir", TargetTag = "SQHeart_SkjadirPatrol1"}, 
			    Tags =
			    {
			        "SQHeart_SkjadirPatrol2",
			        "SQHeart_SkjadirPatrol3",
			        "SQHeart_SkjadirPatrol4",
			        "SQHeart_SkjadirPatrol5",
			        "SQHeart_SkjadirPatrol6",
			        "SQHeart_SkjadirPatrol1",
			    },
			},
		},
		GotoState = "END",
	};
};


State	{StateName = "END"};

