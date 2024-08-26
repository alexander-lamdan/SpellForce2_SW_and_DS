local iWyrmLevel = 20

State
{
	StateName = "WaitForTransfer",

	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "DragonCityShipFreeWyrm"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			FigureUnitChange	{Tag = "SQDragon_Wyrm", UnitId = 1494, Level = iWyrmLevel},
			-- Dialog muss hier nochmal gestartet werden
			-- da er beim UnitChange immer verloren geht
			DialogTypeSetMainQuest	{Tag = "SQDragon_Wyrm"},
    		DialogSetEnabled	{Tag = "SQDragon_Wyrm"},
		},
	};

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQDragon_TransferWyrm"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			--FigureTeamTransfer	{Tag = "SQDragon_Wyrm", Team = "tm_Team1"},
			--FigurePlayerTransfer	{Tag = "SQDragon_Wyrm"},
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = "SQDragon_Wyrm2", Level = iWyrmLevel, UnitId = 1383, TargetTag = "SQDragon_Wyrm", Team = "tm_Team1"}},
			FigureVanish	{Tag = "SQDragon_Wyrm"},
			MapFlagSetTrue	{Name = "mf_SQDragon_Reward"},
		},
		GotoState = "Follow",
	};
};
State
{
	StateName = "Follow",
	
	OnFollowEvent
	{
		Tag = "SQDragon_Wyrm2",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			FigureIsAlive	{Tag = "SQDragon_Wyrm2"},
		},
		Actions = 
		{
		},
	};

	OnEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "SQDragon_Wyrm2"},
		},
		Actions =
		{
		},
		GotoState = "END",
	};
};

State	{StateName = "END"};
