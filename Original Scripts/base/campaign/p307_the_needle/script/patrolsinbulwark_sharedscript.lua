


SpawnBuildingTag = { A = "PatrolSpawnA",
					 B = "PatrolSpawnB",
					 C = "FoeHQBulwark",
					 D = "PatrolSpawnD",
					 E = "PatrolSpawnE",
					}
  

PatrolPoint01X = { 	A = 522.354,
					B = 522.354,
					C = 522.354,
					D = 522.354,
					E = 522.354,
				}
PatrolPoint01Y = { 	A = 432.158,
					B = 432.158,
					C = 432.158,
					D = 432.158,
					E = 432.158,
				}
					
PatrolPoint02 = { 	A = "474.762, 471.773",
					B = "474.762, 471.773",
					C = "474.762, 471.773",
					D = "563.297, 389.029",
					E = "563.297, 389.029",
				}
					
PatrolPoint03 = { 	A = "458.75, 449.543",
					B = "458.75, 449.543",
					C = "458.75, 449.543",
					D = "542.349, 364.544",
					E = "542.349, 364.544",
				}
					
PatrolPoint04 = { 	A = "498.729, 407.655",
					B = "498.729, 407.655",
					C = "498.729, 407.655",
					D = "498.729, 407.655",
					E = "498.729, 407.655",
				}
					
PatrolPoint05 = { 	A = "479.08, 389.858",
					B = "479.08, 389.858",
					C = "479.08, 389.858",
					D = "479.08, 389.858",
					E = "479.08, 389.858",
				}
					

State
{
	StateName = "MainScript",

   
   	OnOneTimeEvent
   	{
   		Conditions =
   		{
   		},
   		Actions =
   		{
   			FigurePathGoto
				{
				    Goto = FigurePatrolWalk{Tag = "default", X = PatrolPoint01X[MyCamp], Y = PatrolPoint01Y[MyCamp]}, 
				    Points = 
				    {
				        PatrolPoint02[MyCamp],
				        PatrolPoint03[MyCamp],
				        PatrolPoint04[MyCamp],
				        PatrolPoint05[MyCamp],
				        PatrolPoint04[MyCamp],
				        PatrolPoint03[MyCamp],
				        PatrolPoint02[MyCamp],
				    },
				}, 
   		},
   	},
   
	OnFigureRespawnEvent
		{
			WaitTime = 300,
			X = GetEntityX(),
			Y = GetEntityY(),
			Conditions = 
			{
				BuildingIsAlive{Tag = SpawnBuildingTag[MyCamp]},
			},
			Actions = 
			{
				FigurePathGoto
				{
				    Goto = FigurePatrolWalk{Tag = "default", X = PatrolPoint01X[MyCamp], Y = PatrolPoint01Y[MyCamp]}, 
				    Points = 
				    {
				        PatrolPoint02[MyCamp],
				        PatrolPoint03[MyCamp],
				        PatrolPoint04[MyCamp],
				        PatrolPoint05[MyCamp],
				        PatrolPoint04[MyCamp],
				        PatrolPoint03[MyCamp],
				        PatrolPoint02[MyCamp],
				    },
				}, 
			},
			DeathActions = 
			{
			},
		};
		
  
   
};
