

State
{
	StateName = "Fake_DemonKingSpawn",
   	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CutsceneTorBeendet"},
    		OR
    		{
    			BuildingIsDead	{Tag = "DemonEnergyTower01"},
    			BuildingIsDead	{Tag = "DemonEnergyTower02"},
    			BuildingIsDead	{Tag = "DemonEnergyTower03"},
    			BuildingIsDead	{Tag = "DemonEnergyTower04"},
    			BuildingIsDead	{Tag = "DemonEnergyTower05"},
    			BuildingIsDead	{Tag = "DemonEnergyTower06"},
    		},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar02"},
		 	FigureOutcry	{Tag = "Malac", TextTag = "Malacay04"}, 
			EntityTimerStart	{Name = "et_Malacay"},
		},
	},
 	OnOneTimeEvent
    {
    	   
    	Conditions =
    	{
			EntityTimerIsElapsed	{Name = "et_Malacay", Seconds = 10},
    	},
    	Actions =
    	{
    		FigureVanish	{Tag = "Malac"},
       	},
    },	

};
