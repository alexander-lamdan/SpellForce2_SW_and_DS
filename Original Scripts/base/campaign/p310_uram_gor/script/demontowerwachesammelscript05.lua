local CUpdateInterval = SetUpdateInterval {Steps = math.random(10, 20)}



State
{	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			CUpdateInterval,
			MapFlagIsTrue {Name = "mf_CutsceneTorBeendet"},
			--MapFlagIsTrue {Name = "mf_SpawnDemonAttackWaves"},
		},
		Actions = 
		{
		},

	},

	StateName = "DemonTowerWache05",
    
	
	
	 --Respawn solange der DemonTower existiert
   	
 	OnFigureRespawnEvent
	{
		WaitTime = 30,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			CUpdateInterval,
			MapFlagIsFalse {Name = "mf_DemonTower05destoyed"},
		},
		Actions = 
		{
			
		},
		DeathActions = 
		{
			
		},
	},
	
 	OnOneTimeEvent
	{
		Conditions =
		{
			CUpdateInterval,
			MapFlagIsTrue	{Name = "mf_DemonKingDeath"},
			MapFlagIsTrue {Name = "mf_CutsceneTorBeendet"},	
		},
		Actions =
		{
			FigureKill	{},
		},
		
	},
 

};
