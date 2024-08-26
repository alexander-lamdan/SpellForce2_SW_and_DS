State
{
	StateName = "INIT",
	
	-- erst aktiv wenn auch die Quest gestartet wurde
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQCitadel_WidegantRewardA"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "SQ_Citadel_Elemental", Level = 20, UnitId = 1544, TargetTag = "Widegant", Team = "tm_Team1"},
			FigurePlayerTransfer	{Tag = "SQ_Citadel_Elemental"},
		},
		GotoState = "END",
	};
}

State	{StateName = "END"};
