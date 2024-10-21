State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			QuestIsActive {Quest = "MistyCoast_KillFormer"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_FormerDoubleSpawned"},
		},
	};
	
	
};

