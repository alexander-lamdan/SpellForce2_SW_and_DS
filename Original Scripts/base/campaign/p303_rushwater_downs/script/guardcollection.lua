--Die Wachen gehen wieder nach Hause, nachdem der Angriff auf die Stadt gelaufen ist

State
{	
	StateName = "INIT",
	
	OnIdleGoHomeFake
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Range = 3,
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P303_CutsceneShown"}, 
		},
   		Actions = 
		{
		},
		OneTimeHomeActions =
		{
			FigureLookAtDirection {Direction = 0}
		}
   	},
}