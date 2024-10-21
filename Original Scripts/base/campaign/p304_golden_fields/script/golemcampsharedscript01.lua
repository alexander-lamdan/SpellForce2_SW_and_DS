
State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_QuarryQuestGiven"},
		},
		Actions =
		{
		},
	},
}

