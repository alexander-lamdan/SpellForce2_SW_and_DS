

State
{
	StateName = "Fake_DemonKingSpawn",
   	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			PlayerFigureIsInRange	{Player = "pl_Human", Range = 20, X = 330, Y = 128},
    		MapFlagIsTrue {Name = "mf_CutsceneTorBeendet"},	
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_Malacay2"},
		},
	},

 	OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_Malacay2", Seconds = 1},
    	},
    	Actions =
    	{
			FigureOutcry	{Tag = "Malac2", TextTag = "Malacay01"},	
		 	FigureOutcry	{Tag = "Malac2", TextTag = "Malacay02"},
		 	FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar01"},
		 	FigureOutcry	{Tag = "Malac2", TextTag = "Malacay03"}, 
       	},
    },	

 	OnOneTimeEvent
    {
    	   
    	Conditions =
    	{
			EntityTimerIsElapsed	{Name = "et_Malacay2", Seconds = 30},
    	},
    	Actions =
    	{
    		FigureVanish	{Tag = "Malac2"},
       	},
    },	

};
