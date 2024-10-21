

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
   			FigureTeleport	{Tag = "TothLar", X = 57.7523, Y = 127.852},
   		},
   		-- nach der 1. Cutscene wird TothLar in den Ozean geworfen
   		-- (muﬂ auf Karte wegen Outcries bleiben)
   },
   
};


