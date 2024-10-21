State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P309_IronLord_Army_Spawn_C"},
		},
		Actions = 
		{
		},
	};
	OnIdleRunHomeFake
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_RagnarsArmyDead"},
		},
		Actions =
		{
			FigureVanish {},
		},
	}
}

State
{
	StateName = "EndScript",
}