
State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P409_SQWind_RefugeVisited"},
		},
		GotoState = "QuestCheck",
	};
};


State
{
	StateName = "QuestCheck",

	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "HeroWindFightEastWindRefugeUnknown"},
			-- da zu Kartenstart ausgeführt, ist es nicht nötigt auf Alive abzufragen ...
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "SQWind1", Tag = "pl_HumanHeroWind"},
			--FigureOutcry	{TextTag = "SQWind2", Tag = "pl_HumanAvatar"},
			
			QuestSetSolved	{Quest = "HeroWindFightEastWindRefugeUnknown"},
			QuestSetActive	{Quest = "HeroWindFightEastWind"},
		},
	};

	OnEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
		},
		GotoState = "SpawnWind",
	};
};

dofile(GetScriptPath() .. "SQWind_FightShared.lua")
