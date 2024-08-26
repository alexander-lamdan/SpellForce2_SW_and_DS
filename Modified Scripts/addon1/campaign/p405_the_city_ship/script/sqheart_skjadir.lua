State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "HeartOfIceTalkToSkjadirOnCityShip"},
		},
		Actions = 
		{
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
			QuestIsActive	{Quest = "HeartOfIceTalkToSkjadirOnCityShip"},
		},
		Actions =
		{
			DialogSetEnabled	{},
		},
		GotoState = "END",
	};
};

State	{StateName = "END"};
