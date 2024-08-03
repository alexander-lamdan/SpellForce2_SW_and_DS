

State
{
	StateName = "MainScript",
   
   
   OnOneTimeEvent
   {
 		Conditions =
   		{
   			AvatarFlagIsTrue {Name = "af_P307_CS01Finished"},
   		},
   		Actions =
   		{
   			FigureVanish	{},
   			FigureTeleport	{Tag = "ChiefKor", X = 50.5958, Y = 136.97},
   		},
   		-- nach der 1. Cutscene wird Kor in den Ozean geworfen
   		-- (muﬂ auf Karte wegen Outcries bleiben)
   },
   
};

