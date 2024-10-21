State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_NoTutorial"},
		},
		Actions =
		{
		}
	},
}