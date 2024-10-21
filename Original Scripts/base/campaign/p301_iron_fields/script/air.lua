State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Mission"},
		},
		Actions =
		{
		},
	},
	OnFigureRespawnEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		WaitTime = 10,
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P301_Iron_Fields_B04_SOUND_Play_Devourer_Scream"},
		},
	}
}