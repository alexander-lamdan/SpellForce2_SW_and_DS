State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			QuestIsActive {Quest = "StoneGodDefeatEastCamp"}
		},
		Actions =
		{
		}
	}
}