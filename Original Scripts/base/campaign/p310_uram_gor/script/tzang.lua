local CUpdateInterval = SetUpdateInterval {Steps = math.random(7, 9)}

 --Wenn einer der Dämonentürme zerstört wurde

State
{
	StateName = "TzangSpawn",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			CUpdateInterval,
			QuestIsActive	{Quest = "RevengeKillTzang"},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 348, Y = 634},
			
		},
		Actions = 
		{
			 MapFlagSetTrue {Name = "mf_TzangAlive"},
			 MapValueSet	{Name = "mv_WichtelGroupA", Value = 0},
 			 MapValueSet	{Name = "mv_WichtelGroupB", Value = 0},
 			 MapValueSet	{Name = "mv_WichtelGroupC", Value = 0},
 			 MapValueSet	{Name = "mv_WichtelGroupD", Value = 0},
		},
	}, 

};
