


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
			DelayedActions =
			{
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "default"},
			},
		},
   
   OnIdleGoHomeFake
	{
		X = 604.014,
		Y = 428.368,
		Range = 5,
		GotoForced = true,
		UpdateInterval = 0,
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P307_CS04Finished"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			FigureVanish{Tag = "default"},
		},
	},


   
};

