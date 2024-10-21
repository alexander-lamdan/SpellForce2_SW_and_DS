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
			MapFlagIsTrue {Name = "mf_SpawnDemonAttackWaves"},
		},
		Actions = 
		{
		},

	},
	StateName = "DemonTowerWache02",
   
   	--Angriffswellen
   	OnEvent
	{
		Conditions = 
		{
			CUpdateInterval,
			EntityFlagIsFalse	{Name = "ef_EinmalSchalter"},	
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_Angriffswelle01"},
			EntityFlagSetTrue	{Name = "ef_EinmalSchalter"},
		},
	},
	--Angrifswellen
	OnEvent
	{
		Conditions = 
		{
			CUpdateInterval,
			EntityTimerIsElapsed	{Name = "et_Angriffswelle01", Seconds = AngriffswelleTimerTower02},	
			EntityFlagIsTrue	{Name = "ef_EinmalSchalter"},
		},
		Actions = 
		{
			FigureRun	{X = 196, Y = 131},
			EntityFlagSetFalse	{Name = "ef_EinmalSchalter"},
			EntityTimerStop	{Name = "et_Angriffswelle01"},
		},
	},
	
	
   --Respawn solange der DemonTower existiert
 	OnFigureRespawnEvent
	{
		WaitTime = 30,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			CUpdateInterval,
			MapFlagIsFalse {Name = "mf_DemonTower02destoyed"},
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
