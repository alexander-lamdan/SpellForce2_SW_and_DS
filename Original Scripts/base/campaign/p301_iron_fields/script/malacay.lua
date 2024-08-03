State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(), 
		Y = GetEntityY(),
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P301_OutcriesAfterShadowFight", Seconds = 5}
		},
		Actions =
		{
		}
	},
}