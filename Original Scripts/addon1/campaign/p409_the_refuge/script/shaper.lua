State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_CS_03_Actors_Spawn"},
				QuestIsActive {Quest = "Refuge_KillRiddengard"},
			},
		},
		Actions = 
		{
		},
	};
}
