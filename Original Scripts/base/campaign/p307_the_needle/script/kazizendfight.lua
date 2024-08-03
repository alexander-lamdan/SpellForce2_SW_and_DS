

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
				MapFlagSetTrue {Name = "mf_KazizEndFight_Has_Spawned"},
			},
			DelayedActions =
			{
				FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "default"},
			},
		};
   
   OnOneTimeEvent
   {
 		  Conditions =
   		{
   			AvatarFlagIsTrue {Name = "af_P307_CS03Finished"},
   		},
   		Actions =
   		{
   			FigureTeamTransfer	{Team = "tm_Team3Darkelves"},
   			MapFlagSetTrue {Name = "mf_KazizEndFightIsAggro"},
   		},
   		-- nach der 3. Cutscene wird Kaziz aggro auf Kor
   },
   
};

