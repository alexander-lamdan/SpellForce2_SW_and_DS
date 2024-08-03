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
    		
    		QuestSetSolved {Quest = "MistyCoast_FollowTheRealFormer"},	
			QuestSetActive {Quest = "Palace_FightShaper"},
			QuestSetActive {Quest = "Palace_SearchWayIntoLivingQuarters"},	
			QuestSetActive {Quest = "Palace_KillBlessed"},	
		},
		
	},
	
	--Wenn man zuerst mit Karan und dann mit Ulf redet.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_KingUlfSpoken"},
			MapFlagIsTrue {Name = "mf_KingUlfsQuestStart"},
		},
		Actions =
		{
			QuestSetActive {Quest = "Palace_FreeKingUlf"},
		},
		
	},
	
	--Wenn man zuerst mit Karan und dann mit Ulf redet.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_KingUlfSpoken"},
			MapFlagIsTrue {Name = "mf_KingUlfsQuestSolved"},
			QuestIsActive {Quest = "Palace_FreeKingUlf"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Palace_FreeKingUlf"},
		},
		
	},
	
	--Wenn man zuerst mit Karan und dann mit Ulf redet.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_KingUlfSpoken"},
			MapFlagIsTrue {Name = "mf_KingUlfsQuestSolved"},
			QuestIsNotActive {Quest = "Palace_FreeKingUlf"},
		},
		Actions =
		{
			QuestSetActive {Quest = "Palace_FreeKingUlf"},
			QuestSetSolved {Quest = "Palace_FreeKingUlf"},
		},
		
	},
	--Wenn man zuerst mit Karan und dann mit Ulf redet.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsDead	{Tag = "Illusionist"},
			FigureIsDead	{Tag = "Necromancer"},
			FigureIsDead	{Tag = "ElementalMage"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Palace_KillBlessed"},	
		},
		
	},
	
	--sobald der Spieler in die Räume des Königs vorgedrungen ist.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_StartIntroCS"},
			FigureIsDead	{Tag = "Necromancer"},
			FigureIsDead	{Tag = "Illusionist"},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 121, Y = 177},
			
		},
		Actions =
		{
    		
    		QuestSetSolved {Quest = "Palace_SearchWayIntoLivingQuarters"},	
			QuestSetActive {Quest = "Palace_FindWayToThroneRoom"},
			
			
		},
		
	},
	--sobald der Spieler den Thronsaal betritt.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "GateThroneRoom"},
		},
		Actions =
		{
    		
    		QuestSetSolved {Quest = "Palace_FindWayToThroneRoom"},	
			QuestSetActive {Quest = "Palace_DefeatShaper"},
			
			
		},
		
	},
	
	--sobald der Former tot ist.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_StartIntroCS"},
			FigureIsDead	{Tag = "Former"},
		},
		Actions =
		{
    		
    		QuestSetSolved {Quest = "Palace_DefeatShaper"},	
			QuestSetSolved {Quest = "Palace_FightShaper"},	
			QuestSetSolved {Quest = "SF2A1_3_Akt_Kapitel2"},	
			QuestSetSolved {Quest = "SF2A1_3_Akt"},	
			
		},
		
	},
	
};