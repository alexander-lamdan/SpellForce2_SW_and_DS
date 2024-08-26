---------------------
-- P406_The_Citadel
-- Explorers Sidequest
-- Doktor Widegant
---------------------

State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CitadelExplorers"},
		},
		Actions = 
		{
			FigureLootItemMiscAdd	{Tag = "Widegant", DropChance = 100, ItemId = 300},	-- dem sein Schädel
		},
		DelayedActions = 
		{
		},
	};
	
	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CitadelExplorers"},
		},
		Actions = 
		{
		},
		GotoState = "MAIN",
	};
};


State
{
	StateName = "MAIN",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQCitadel_WidegantGoesAggro"},
		},
		Actions = 
		{
			FigureTeamTransfer	{Team = "tm_ExplorerAggroToAvatar"},
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SQCitadel_ExplorerFight", Seconds = 1},
		},
		Actions = 
		{
			FigureDirectionSetToEntity	{TargetTag = "JonJon"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SQCitadel_ExplorerFight", Seconds = 4},
		},
		Actions = 
		{
			FigureTeamTransfer	{Team = "tm_ExplorerAggro"},
			FigureAttackEntity	{TargetTag = "JonJon"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal},
		},
	};

	OnIdleGoHomeFake
	{
		Range = 1,
		--GotoForced = true,
		UpdateInterval = 10,
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_SQCitadel_ExplorersFighting"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			FigureDirectionSet	{},
		},
		OneTimeHomeActions = 
		{
		},
	};


	-- den Folianten für Widegant gelootet
	OnOneTimeEvent
	{
		EventName = "WidegantWantsFoliant_Looted",
		Conditions = 
		{
			QuestIsActive	{Quest = "CitadelWidegantWantsFoliant"},
			AvatarHasItemMisc	{ItemId = 297, Amount = 1},
		},
		Actions = 
		{
			DialogSetEnabled	{},
		},
	};

	-- JonJon Kampf vorbei ... Dialog wieder an?
	OnOneTimeEvent
	{
		EventName = "JonJonFightOver_DialogEnable",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SQCitadel_ExplorerFightOver", Seconds = 3},
			OR
			{
				QuestIsActive	{Quest = "CitadelBirnbaumKnowsWhatWidegantDid"},
				QuestIsNotKnown	{Quest = "CitadelWidegantWantsFoliant"},
			},
		},
		Actions = 
		{
			DialogSetEnabled	{},
		},
	};
};
