State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			QuestIsActive {Quest = "SearchPortalStone"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P303_DumbSkeletonAlive"}
		}
	},
}