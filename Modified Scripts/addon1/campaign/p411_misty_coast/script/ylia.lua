State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			QuestIsKnown	{Quest = "MistyCoastTalkToYliaOnMistyCoast"},
			MapFlagIsTrue {Name = "mf_CS01Ended"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P411_YliaHasMovedToMistyCoast"},
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = true,
	};

	OnIdleGoHomeFake
	{
		EventName = "YliaGoHome",
		X = GetEntityX("SQTidalLords_YliaLocation"),
		Y = GetEntityY("SQTidalLords_YliaLocation"),
		Range = 3,
		UpdateInterval = 30,
		Conditions = 
		{
			QuestIsNotSolved	{Quest = "MistyCoastTidalLords"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			FigureDirectionSet	{Direction = 270},
		},
		OneTimeHomeActions = 
		{
		},
	};

	OnEvent
	{
		EventName = "QuestCompleteGoto",
		Conditions = 
		{
			QuestIsSolved	{Quest = "MistyCoastTidalLords"},
		},
		Actions = 
		{
			FigureForcedWalkToEntity	{TargetTag = "StartPortal"},
		},
		GotoState = "QuestComplete",
	};
};

State
{
	StateName = "QuestComplete",

	OnEvent
	{
		EventName = "QuestCompleteGoto",
		Conditions = 
		{
			FigureIsIdle	{},
			FigureIsNotInEntityRange	{TargetTag = "StartPortal", Range = 3},
		},
		Actions = 
		{
			FigureForcedWalkToEntity	{TargetTag = "StartPortal"},
		},
	};

	OnOneTimeEvent
	{
		EventName = "InRangeToPortalEffect",
		Conditions = 
		{
			FigureIsInEntityRange	{TargetTag = "StartPortal", Range = 3},
		},
		Actions = 
		{
			EffectStart	{File = "Effect_DeSpawn_Unit"},
			EntityTimerStart	{Name = "et_DespawnMe"},
			AvatarFlagSetFalse	{Name = "af_P411_YliaHasMovedToMistyCoast"},
		},
	};

	OnEvent
	{
		EventName = "InRangeToPortalVanish",
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_DespawnMe", Seconds = 2.5},
		},
		Actions = 
		{
			FigureVanish	{},
		},
		GotoState = "ENDE",
	};
};

State
{
	StateName = "ENDE",
};