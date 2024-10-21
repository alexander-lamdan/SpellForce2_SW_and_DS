
--*******************************************************
--***                                                 ***
--***         		 GargoyleCommander        	      ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	--wird erst gespawned wenn der Spieler von der Dragh lur kommt.
	OnFigureSpawnOnlyWhenEvent	
	{
		X = GetEntityX(), Y = GetEntityY(),
		Conditions = 
		{
			OR
			{
				QuestIsSolved {Quest = "DraghLurA1_TalkToNightsong"},
				AvatarFlagIsTrue {Name = "af_P406_Part2"},
			},
		},
		Actions = 
		{
			DialogSetEnabled	{},
		}, 
		DelayedActions = 
		{
			
		}, 
		NoSpawnEffect = false
		
	},
	
	
	
};

