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
			ObjectSpawn	{ObjectId = 1154, X = GetEntityX(), Y = GetEntityY(), Direction = default, Tag = "CS_01_Orc_Sorceress06_Corpse"},FigureVanish {Tag = "default"},
		},
	},
}