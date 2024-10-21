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
			AvatarFlagIsFalse{Name = "af_P307_EinarDiedOnNeedle"},
			MapFlagIsTrue {Name = "mf_P301_Stoned"}
		},
		Actions = 
		{
			DialogTypeSetMainQuest {},
			DialogSetEnabled {},
		},
	},
	OnIdleGoHomeFake
	{
		X = 287,
		Y = 32,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_GiveArmor"},
		},
		HomeActions =
		{
			FigureVanish {},
		}
	}
}