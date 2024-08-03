
State
{
	StateName = "AmanStart",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue  {Name = "mf_SpawnAman"},	
			MapTimerIsElapsed	{Name = "mt_IuanOutcryTimer", Seconds = 4},
		},
		Actions = 
		{
			MapFlagSetTrue  {Name = "mf_AmanAlive"},
			FigureOutcry	{Tag = "Aman", TextTag = "Aman01"},
			MapTimerStart	{Name = "mt_AmanOutcryTimer"},
		},
	},
	
	OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		MapFlagIsTrue  {Name = "mf_P305_AmanIsDead"},
    	},
    	Actions =
    	{
 			EffectStart	{Tag = "Aman", File = "Effect_DeSpawn_Unit"},
 			EntityTimerStart	{Name = "et_AmanDespawnTimer"},
   		},
    },
    
    OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AmanDespawnTimer", Seconds = 2.5},
    	},
    	Actions =
    	{
 			FigureVanish	{},
 			EffectStop	{Tag = "Aman"},
 			EntityTimerStop	{Name = "et_AmanDespawnTimer"},
   		},
    },


};
