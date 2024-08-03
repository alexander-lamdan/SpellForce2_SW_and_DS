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
			ObjectSpawn	{ObjectId = 1153, X = GetEntityX(), Y = GetEntityY(), Direction = default, Tag = "deCS_01_Orc_Necromancer09_Corpsefault"},FigureVanish {Tag = "default"},
		},
	},
}