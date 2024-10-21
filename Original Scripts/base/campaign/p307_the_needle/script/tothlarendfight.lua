

State
{
	StateName = "MainScript",
  
  OnFigureSpawnOnlyWhenEvent
		{
			X 	 = spawnX,
			Y 	 = spawnY,
			NoSpawnEffect = true,
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_Spawn_3rd_Cutscene"},
			},
			Actions = 
			{
			},
		}; 
		
-- Wird in der Cutscene auf Vanish gesetzt
   
--   OnOneTimeEvent
--   {
-- 		Conditions =
--   		{
--   			AvatarFlagIsTrue {Name = "af_P307_CS03Finished"},
--   		},
--   		Actions =
--   		{
--   			FigureVanish	{},
--   		},
--   		-- nach der 3. Cutscene verschwindet TothLar
--   },
   
};

