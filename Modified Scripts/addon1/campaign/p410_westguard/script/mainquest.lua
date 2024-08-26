--*******************************************************
--***                                                 ***
--***             		QuestBook                     ***
--***                   Quest01		                  ***
--*******************************************************

-- SingleMapLoadEvent einladen
dofile("addon1/script/TestCampaignSingleMapLoadEvents.lua")

State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			
		},
		Actions =
		{
			QuestSetSolved {Quest = "Refuge_ToWestguard"},	
			QuestSetSolved {Quest = "CityShip4_TeleportWestguard"},	
			QuestSetActive {Quest = "WestguardA1_DefendCamp"},
		},
	
	GotoState = "QuestState01",
	},
}

State
{	
	StateName = "QuestState01",
	
	--VisualTimer ist abgelaufen
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P410_StartDwarvesAndElvesCS"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "WestguardA1_DefendCamp"},		
		},
	GotoState = "QuestState02",
	},
}	
 
State
{	
	StateName = "QuestState02",
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			OR
			{
				QuestIsSolved {Quest = "WestguardA1_DefendCamp"},
				AND
				{
					FigureIsDead{Tag = "Geweihter01"},
					FigureIsDead{Tag = "Geweihter02"},
					FigureIsDead{Tag = "Geweihter03"},
				},
			},
			
		},
		Actions =
		{
			QuestSetActive {Quest = "WestguardA1_DestroyAttackers"},
			
			
			QuestSetActive {Quest = "WestguardA1_DefeatNorthCommander"},
			QuestSetActive {Quest = "WestguardA1_DefeatSouthCommander"},
			QuestSetActive {Quest = "WestguardA1_DefeatWestCommander"},
			
			MapFlagSetTrue {Name = "mf_MainQuestStart"},
		},
		GotoState = "QuestState03",
	},   		 
}


    
State
{	
	StateName = "QuestState03",
     	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "WestguardA1_DefendCamp"},	
			QuestIsActive {Quest = "WestguardA1_DefeatNorthCommander"},
			FigureIsDead	{Tag = "Geweihter01"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "WestguardA1_DefeatNorthCommander"},
		},
	},   	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "WestguardA1_DefendCamp"},	
			QuestIsActive {Quest = "WestguardA1_DefeatSouthCommander"},
			FigureIsDead {Tag = "Geweihter02"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "WestguardA1_DefeatSouthCommander"},
		},
	},   	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "WestguardA1_DefendCamp"},	
			QuestIsActive {Quest = "WestguardA1_DefeatWestCommander"},
			FigureIsDead {Tag = "Geweihter03"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "WestguardA1_DefeatWestCommander"},
		},
	},   	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "WestguardA1_DefeatNorthCommander"},
			QuestIsSolved {Quest = "WestguardA1_DefeatSouthCommander"},
			QuestIsSolved {Quest = "WestguardA1_DefeatWestCommander"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "WestguardA1_DestroyAttackers"},
    		MapFlagSetTrue {Name = "mf_AllSorcererDead"},
		},
	},
		
   	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue  {Name = "mf_EndbossAlive"},	
		},
		Actions =
		{
    		QuestSetActive {Quest = "WestguardA1_DefeatDevourer"},
    		--FigureAbilityAdd	{Tag = "Monster", AbilityId = 094},	
		},
	},	
		
	OnOneTimeEvent
	
	{	
		Conditions =
		{
			MapFlagIsTrue  {Name = "mf_EndbossAlive"},
			OR
			{
				FigureHasNotHealth{Tag = "Monster", Percent = 20},
				FigureIsDead{Tag = "Monster"},
			},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "WestguardA1_DefeatDevourer"},
		},
	},
		
	
	OnOneTimeEvent
	{
	
		Conditions =
		{
			
			-- ... also muss man auch nur auf "DestroyAttackers" abfragen:
			QuestIsSolved {Quest = "WestguardA1_DestroyAttackers"},
			QuestIsSolved {Quest = "WestguardA1_DefeatDevourer"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_SQWarrior_MainQuestIsSolved"},
		},
		GotoState = "QuestState04",
	},
}

State
{	
	StateName = "QuestState04",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			MapFlagSetTrue  {Name = "mf_TeleporterActivate"},
			ObjectSpawn	{ObjectId = 1432, X = 627.18, Y = 57.2842, Direction = 0, Tag = "TeleporterMistyCoast"},
			QuestSetActive {Quest = "WestguardA1_FollowEscapeRoute"},
				
		},
		
	},
	
	OnOneTimeEvent
	{
	
		Conditions =
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 6, X = 23, Y = 659},
		},
		Actions =
		{
			QuestSetSolved {Quest = "WestguardA1_FollowEscapeRoute"},
			QuestSetActive {Quest = "WestguardA1_GotoMistyCoast"},	
			DialogSetEnabled	{Tag = "Halicos"},	-- sidequest für misty coast freischalten
		},
		GotoState = "END",
	},
}


State{StateName = "END"}
