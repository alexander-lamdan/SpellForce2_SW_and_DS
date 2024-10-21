---------------------
-- P406_The_Citadel
-- Explorers Sidequest
-- Späher JonJon
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
			MapTimerIsElapsed	{Name = "mt_SQCitadel_ExplorerFight", Seconds = 4},
		},
		Actions = 
		{
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
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_KillMe", Seconds = 2},
		},
		Actions = 
		{
			DialogSetDisabled	{},
			--FigureKill	{},
		},
	};

	-- JonJon Kampf vorbei ... Dialog wieder an?
	OnOneTimeEvent
	{
		EventName = "JonJonFightOver_DialogEnable",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SQCitadel_ExplorerFightOver", Seconds = 3},
		},
		Actions = 
		{
			DialogSetEnabled	{},
		},
	};

};
