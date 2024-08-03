State 
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(), 
		Y = GetEntityY(),
		Conditions =
		{
			MapFlagIsTrue  {Name = "mf_P303_ConvoyKiller"}
		},
		Actions =
		{
		},
		DelayedActions =
		{
			FigureAttackEntity {TargetTag = "Falkmar"}
		}
	},
}