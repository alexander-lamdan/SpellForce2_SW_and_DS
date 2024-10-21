State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_KnightsAtWP1"},
		},
		GotoState = "Attack",
	},
};

State
{
	StateName = "Attack",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X 	 = spawnX,
		Y 	 = spawnY,
		Team = "tm_BadGuys",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_StartDarkElfAttack"},
		},
		Actions = 
		{
		},
	},
	

	
	OnIdleRunHomeFake 
	{
		X = wp1X,
		Y = wp1Y,
		
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_KnightsGo"},
		},
		
		Actions = 
		{
		},
		
		HomeActions =
		{
		},
		
		OneTimeHomeActions =
		{
			MapFlagSetFalse {Name = "mf_KnightsGo"},
			MapFlagSetFalse {Name = "mf_StartDarkElfAttack"},
			FigureLookAtDirection	{Direction = 175},
		}
		
	},
	
	-- Wenn alle Death Knights ihren Waypoint 1 erreicht haben gehts weiter zu Waypoint 2
	-- Die Map Flag dazu wird in DarkElfAttack.lua gesetzt
	
	OnIdleRunHomeFake 
	{
		X = wp2X,
		Y = wp2Y,
		
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_KnightsAtWP1"},
		},
		
		Actions = 
		{
		},
		
		HomeActions =
		{
		},
		
		OneTimeHomeActions =
		{
			MapFlagSetFalse {Name = "mf_KnightsAtWP1"},
		}
		
	},


};

