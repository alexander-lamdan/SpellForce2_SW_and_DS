State 
{
	StateName = "Init",
	OnFigureRespawnEvent
	{
		WaitTime = 10,
		X = GetEntityX(), 
		Y = GetEntityY(),
		Conditions =
		{
			FigureIsAlive {Tag = Boss}
		},
		Actions =
		{
		},
		
	},
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(), 
		Y = GetEntityY(),
		Conditions =
		{
			QuestIsActive {Quest = "SearchPortalStone"}
		},
		Actions =
		{
		},
		DelayedActions =
		{
		}
	},
}