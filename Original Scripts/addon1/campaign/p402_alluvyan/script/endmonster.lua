--*******************************************************
--***                                                 ***
--***             	EndfightMonster		              ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent	
	{
		X = GetEntityX(), 
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_05_Actors_Spawn"},
		},
		Actions = 
		{	
			MapFlagSetTrue {Name = "mf_EndMonsterAlive"},
		}, 
		DelayedActions = 
		{
			CutsceneFigureTeleport {Tag = "default", X = GetEntityX(), Y = GetEntityY(), },
			FigureLookAtDirection {Tag = "default", Direction = 0},
		}, 
		NoSpawnEffect = true,
		
	},
	
};

