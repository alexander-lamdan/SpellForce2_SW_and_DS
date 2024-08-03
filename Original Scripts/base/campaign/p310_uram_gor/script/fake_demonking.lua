

State
{
	StateName = "Fake_DemonKingSpawn",
   	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Fake_DemonKingSpawn"},
		},
		Actions = 
		{
		},
	},
};
