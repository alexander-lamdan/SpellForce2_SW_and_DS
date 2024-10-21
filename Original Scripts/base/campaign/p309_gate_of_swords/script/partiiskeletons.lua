State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			QuestIsSolved {Quest = "3_KapitelAkt2"},
		},
		Actions =
		{
		},
	}
	
}