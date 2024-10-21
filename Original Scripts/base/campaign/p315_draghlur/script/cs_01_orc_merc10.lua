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
			--FigureStop {Tag = "default"},FigureKill {Tag = "default"},
			ObjectSpawn	{ObjectId = 852, X = GetEntityX(), Y = GetEntityY(), Direction = default, Tag = "CS_01_Orc_Merc10_Corpse"},FigureVanish {Tag = "default"}
		},
	},
}