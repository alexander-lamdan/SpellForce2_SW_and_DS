gtSpawnCoords =
{
	-- Die Koordinaten, an denen die Banditen im BanditCamp respawnen
	
	[1] = { X = 45,6, Y = 66 },
	[2] = { X = 62.7, Y = 52.3 },
	[3] = { X = 45,6, Y = 66 },
 	[4] = { X = 62.7, Y = 52.3 },
 	[5] = { X = 45,6, Y = 66 },
} 
  
  
  
  

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = gtSpawnCoords[IAppearAt].X,
		Y = gtSpawnCoords[IAppearAt].Y,
		NoSpawnEffect = true,
		Conditions =
		{
			QuestIsKnown{Quest = "FindTheLostDeliveries"},
			-- Spawning beginnt erst, sobald der Spieler die Quest hat
			-- "Suche Flann Gondersens Kiste"
			AvatarValueIsGreater {Name = "av_P204_BanditCampKillCounter", Value = (ISpawnWhen)-1},
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
		GotoState = "MainBanditScript"
	},
}

State
{
	StateName = "MainBanditScript",
   
   OnFigureRespawnEvent
	{
		WaitTime = 30,
		X = gtSpawnCoords[IAppearAt].X,
		Y = gtSpawnCoords[IAppearAt].Y,
		Conditions = 
		{
			EntityValueIsLess	{Name = "ev_IDiedSoOften", Value = (ISpawnUntil)+1},
		},
		Actions = 
		{
		},
		DeathActions = 
		{
			EntityValueAdd	{Name = "ev_IDiedSoOften", Value = 1},
			AvatarValueAdd {Name = "av_P204_BanditCampKillCounter", Value = 1},
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
