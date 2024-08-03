
State
{
	StateName = "IuanStart",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue  {Name = "mf_SpawnIuan"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Iuan", TextTag = "Iuan01"},
			MapFlagSetTrue  {Name = "mf_IuanAlive"},
			MapTimerStart	{Name = "mt_IuanOutcryTimer"},
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
 			EffectStart	{Tag = "Iuan", File = "Effect_DeSpawn_Unit"},
 			EntityTimerStart	{Name = "et_IuanDespawnTimer"},
   		},
    },
    
    OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_IuanDespawnTimer", Seconds = 2.5},
    	},
    	Actions =
    	{
 			FigureVanish	{},
 			EffectStop	{Tag = "Iuan"},
 			EntityTimerStop	{Name = "et_IuanDespawnTimer"},
   		},
    },

};
