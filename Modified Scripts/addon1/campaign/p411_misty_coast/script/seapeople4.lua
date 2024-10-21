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
		},
		Actions = 
		{
		},
		GotoState = "ALIVE",
	};
};

State
{	
	StateName = "ALIVE",
};