State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Cutscene01_BattleRoyal_Everyone_Is_Going_Down"},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1151, X = GetEntityX(), Y = GetEntityY(), Direction = default, Tag = "CS_01_Orc_Schaman09_Corpse"},FigureVanish {Tag = "default"},
		},
	},
}