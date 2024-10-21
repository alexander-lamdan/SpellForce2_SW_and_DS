State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_SQWarrior_SpawnNiethalf"},
			--GameInterfaceIsVisible	{},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_Init"},
			FigureDirectionSetToEntity	{TargetTag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "SQWarrior01", Tag = "Falida"},
			FigureOutcry	{TextTag = "SQWarrior02", Tag = "Niethalf"},
			FigureOutcry	{TextTag = "SQWarrior03", Tag = "Niethalf"},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_Init", Seconds = 1},
		},
		Actions = 
		{
			DialogSetEnabled	{},
		},
		GotoState = "WaitForEnd",
	};
};

State	
{
	StateName = "WaitForEnd",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "WarriorEpicCourage"},
			--GameInterfaceIsVisible	{},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_Vanish"},
			FigureHoldPosition	{Tag = "default"},
			FigureSwappingDisable	{Tag = "default"},
			EffectStart	{File = "Effect_DeSpawn_Unit"},
		},
	};
	
	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_Vanish", Seconds = 2.5},
		},
		Actions = 
		{
			FigureVanish	{},
		},
		GotoState = "END",
	};
};


State	{StateName = "END"};
