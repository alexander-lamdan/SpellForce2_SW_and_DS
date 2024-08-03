

State
{
	StateName = "Fake_DemonKingSpawn",
   	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SpawnCitizen"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Citizen", TextTag = "UntoterBewohnerNQ"},
			EntityTimerStart	{Name = "et_Citizen"},
		},
	},
 	OnOneTimeEvent
    {
    	   
    	Conditions =
    	{
			EntityTimerIsElapsed	{Name = "et_Citizen", Seconds = 10},
    	},
    	Actions =
    	{
    		FigureVanish	{Tag = "Citizen"},
       	},
    },	

};
