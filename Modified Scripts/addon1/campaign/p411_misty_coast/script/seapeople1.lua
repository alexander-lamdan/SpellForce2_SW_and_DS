State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX("SQTidalLords_SpawnSeaPeople"),
		Y = GetEntityY("SQTidalLords_SpawnSeaPeople"),
		Conditions = 
		{
			QuestIsActive	{Quest = "MistyCoastTalkToUndeadSailors"},
		},
		Actions = 
		{
			FigureWalk	{X = GetEntityX(), Y = GetEntityY()},
			DialogSetEnabled	{},
			FigureRoamingEnable	{Tag = "default"},
		},
		DelayedActions = 
		{
		},
	};
	
	OnEvent
	{
		Conditions = 
		{
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "HornTried1", Tag = "default"},
			FigureOutcry	{TextTag = "HornTried2", Tag = "default"},
		},
		GotoState = "ALIVE",
	};
};

State
{	
	StateName = "ALIVE",
};