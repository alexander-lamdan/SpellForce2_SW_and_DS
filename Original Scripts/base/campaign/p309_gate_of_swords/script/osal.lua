-- Osal hat ein Script, damit er sich nach der Eisenfürst CS in die Stadt verpissen kann
State
{
	StateName = "Init",
	OnIdleGoHomeFake
	{
		X = 513,
		Y = 420,
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P309_CutsceneIronLordEnd"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			FigureLookAtDirection {Direction = 320}
		}
	}
}