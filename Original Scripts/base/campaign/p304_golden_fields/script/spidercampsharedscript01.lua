gtSpawnCoords =
{
	-- Die Koordinaten, an denen die Spinnen im SpiderCamp respawnen
	
	[1] = { X = 200, Y = 26 },
	[2] = { X = 222, Y = 46 },
	[3] = { X = 194, Y = 67 },
 	[4] = { X = 173, Y = 72 },
 	[5] = { X = 173, Y = 72 },
} 
  
  
  
  

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = gtSpawnCoords[IAppearAt].X,
		Y = gtSpawnCoords[IAppearAt].Y,
		Conditions =
		{
			AvatarValueIsGreater {Name = "av_P204_SpiderCampKillCounter", Value = (ISpawnWhen)-1},
			AvatarFlagIsTrue{Name = MySpawnFlag },
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_Spawned"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "MainSpiderScript"
	},
}

State
{
	StateName = "MainSpiderScript",
   
   OnFigureRespawnEvent
	{
		WaitTime = 30,
		X = gtSpawnCoords[IAppearAt].X,
		Y = gtSpawnCoords[IAppearAt].Y,
		Conditions = 
		{
			EntityValueIsLess	{Name = "ev_IDiedSoOften", Value = ISpawnUntil},
		},
		Actions = 
		{
		},
		DeathActions = 
		{
			EntityValueAdd	{Name = "ev_IDiedSoOften", Value = 1},
			AvatarValueAdd {Name = "av_P204_SpiderCampKillCounter", Value = 1},
		},
	};


   
  
   OnIdleGoHomeFake
   {
   	X = GetEntityX(),
   	Y = GetEntityY(),
   	Conditions = 
   		{
   		},
   	Actions = 
		{
		},
   },


  
   
};
