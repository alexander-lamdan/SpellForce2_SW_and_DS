
State
{	
	StateName = "INIT",
	
   --*******************************************************
--***                                                 ***
--***        		NQ Aonirs Augen	                  ***
--***                                                 ***
--*******************************************************    
    	
     --Die NebenQuest Aonirs Auge wird gestartet sobald der Spieler die Statue untersucht oder die erste Infotafel entdeckt
    OnOneTimeEvent
    {
    	   
    	Conditions =
    	{
			OR 
			{
    		MapFlagIsTrue{Name = "mf_AonirStatueTalked"},
			MapFlagIsTrue{Name = "mf_Schrifttafel01Read"}, 
			},
			QuestIsNotActive	{Quest = "UramGorPart2EyesOfAonir"},
			--AvatarIsNotTalking	{},	GameInterfaceIsVisible	{},
    	},
    	Actions =
    	{
    		QuestSetActive {Quest = "UramGorPart2EyesOfAonir"},
       	},
    },	
    
	 --Wenn Die NebenQuest Aonirs Auge gesolved wurde
    OnOneTimeEvent
    {
    	   
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_AonirsDialogEnded"},
			AvatarIsNotTalking	{},	GameInterfaceIsVisible	{},
    	},
    	Actions =
    	{
    		QuestSetSolved	{Player = "pl_Human", Quest = "UramGorPart2EyesOfAonir"},
    		ObjectChange	{Tag = "AonirStatue", ObjectId = 1169, X = 263.2, Y = 621.6, Direction = 0},
    		MapFlagSetTrue {Name = "mf_SpawnCitizen"},
    		--FigureOutcry	{Tag = "Citizen", TextTag = "UntoterBewohnerNQ"},
    		DialogSetDisabled	{Tag = "Schrifttafel01"},
    		DialogSetDisabled	{Tag = "Schrifttafel02"},
    		DialogSetDisabled	{Tag = "Schrifttafel03"},
    		DialogSetDisabled	{Tag = "Schrifttafel04"},
    		
       	},
    },	
    
--*******************************************************
--***                                                 ***
--***        	NQ Aonirs Augen End	                  ***
--***                                                 ***
--*******************************************************        
 
 
};