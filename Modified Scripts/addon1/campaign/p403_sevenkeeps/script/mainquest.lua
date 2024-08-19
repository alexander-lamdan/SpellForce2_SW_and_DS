--*******************************************************
--***                                                 ***
--***             		QuestBook                     ***
--***                    Quest01                      ***
--*******************************************************

-- SingleMapLoadEvent einladen
dofile("addon1/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "Quest01",
		
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			
		},
		Actions =
		{
			QuestSetSolved {Quest = "Alluvyan_ToSevenkeeps"},	
			QuestSetActive {Quest = "SevenkeepsA1_GetToTown"},	
			QuestSetActive {Quest = "SevenkeepsA1_GetPowder"},	
			QuestSetActive {Quest = "SevenkeepsA1_GetPastTowers"},
			QuestSetActive {Quest = "SevenkeepsA1_OpenCityGate"},
			QuestSetActive {Quest = "SevenkeepsA1_GetFugitivesIntoTown"},	
		},
		
	},
	--wenn der Spieler die Fässer geholt hat.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_PouderTake02"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "SevenkeepsA1_GetPowder"},
    		QuestSetActive {Quest = "SevenkeepsA1_BringSkajdirPowder"},			
		},
		
	},   	
	--wenn der Spieler die Fässer Skjaldir übergibt.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_PowderReady"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "SevenkeepsA1_BringSkajdirPowder"},	
		},
		
	},   	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "DwarfGate02"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "SevenkeepsA1_OpenCityGate"},		
		},
		
	},   	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			BuildingIsDead	{Tag = "Tower01"},
			BuildingIsDead	{Tag = "Tower02"},
			BuildingIsDead	{Tag = "Tower03"},
			BuildingIsDead	{Tag = "Tower04"},
			BuildingIsDead	{Tag = "Tower05"},
			BuildingIsDead	{Tag = "Tower06"},
			BuildingIsDead	{Tag = "Tower07"},
			BuildingIsDead	{Tag = "Tower08"},
			BuildingIsDead	{Tag = "Tower09"},
			BuildingIsDead	{Tag = "Tower10"},
			BuildingIsDead	{Tag = "Tower11"},
			BuildingIsDead	{Tag = "Tower12"},
			BuildingIsDead	{Tag = "Tower13"},
			BuildingIsDead	{Tag = "Tower14"},
			BuildingIsDead	{Tag = "Tower15"},
			BuildingIsDead	{Tag = "Tower16"},
			BuildingIsDead	{Tag = "Tower17"},
			BuildingIsDead	{Tag = "Tower18"},
			BuildingIsDead	{Tag = "Tower19"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "SevenkeepsA1_GetPastTowers"},
		},
		
	},   	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapValueIsGreaterOrEqual	{Name = "mv_DwarfCounter", Value = 10},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "SevenkeepsA1_GetFugitivesIntoTown"},
    		DialogSetDisabled	{Tag = "Skjadir"},	
    		AvatarItemMiscTake	{Player = "pl_Human", ItemId = 284, Amount = 900},	
    		AvatarItemMiscTake	{Player = "pl_Human", ItemId = 283, Amount = 900},	
		},
		
	},   	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsActive {Quest = "SevenkeepsA1_GetPastTowers"},		
			QuestIsSolved {Quest = "SevenkeepsA1_GetFugitivesIntoTown"},	
		},
		Actions =
		{
    		QuestSetSolved {Quest = "SevenkeepsA1_GetPastTowers"},		
		},
	},   	
	
	--Falls die Questen mit dem Powder nicht gesolved wurden.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "SevenkeepsA1_GetFugitivesIntoTown"},	
			OR
			{
				QuestIsActive {Quest = "SevenkeepsA1_GetPowder"},	
				QuestIsActive {Quest = "SevenkeepsA1_GetPastTowers"},
			},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "SevenkeepsA1_GetPowder"},
    		QuestSetSolved {Quest = "SevenkeepsA1_GetPastTowers"},		
		},
		
	},   	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "SevenkeepsA1_GetPastTowers"},	
			QuestIsSolved {Quest = "SevenkeepsA1_OpenCityGate"},	
			QuestIsSolved {Quest = "SevenkeepsA1_GetFugitivesIntoTown"},	
		},
		Actions =
		{
    		QuestSetSolved {Quest = "SevenkeepsA1_GetToTown"},		
		},
		GotoState = "Quest02",
	},   	
};	
--*******************************************************
--***                                                 ***
--***                Quest02		                  ***
--***                                                 ***
--*******************************************************


State
{
	StateName = "Quest02",
   	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_KingUlfCS"},
		},
		Actions =
		{
    		QuestSetActive {Quest = "SevenkeepsA1_BreakSiege"},
			QuestSetActive {Quest = "SevenkeepsA1_GetToRedmund"},
		},
		
	},   	
	
	--Nachdem man mit Redmund gesprochen hat   
   	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_RedmundKnown"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "SevenkeepsA1_GetToRedmund"},
    		QuestSetActive {Quest = "SevenkeepsA1_GetFood"},	
    		QuestSetActive {Quest = "SevenkeepsA1_WipeCamps"},			
		},
		
	},   	





   	OnOneTimeEvent
	{
    	
		Conditions =
		{
			BuildingIsDead	{Tag = "Camp03"},
			BuildingIsDead	{Tag = "TrainingGroundCamp3"},
			BuildingIsDead	{Tag = "DarkFortressCamp3"},
			BuildingIsDead	{Tag = "GargoyleHorst03"},
			BuildingIsDead	{Tag = "Camp05"},
			BuildingIsDead	{Tag = "Building1Camp5"},
			BuildingIsDead	{Tag = "Building2Camp5"},
			BuildingIsDead	{Tag = "GargoyleHorst02"},
			BuildingIsDead	{Tag = "Camp02"},
			BuildingIsDead	{Tag = "Building1Camp2"},
			BuildingIsDead	{Tag = "Building2Camp2"},
			BuildingIsDead	{Tag = "GargoyleHorst04"},
			BuildingIsDead	{Tag = "Camp04"},
			BuildingIsDead	{Tag = "Building1Camp4"},
			BuildingIsDead	{Tag = "Building2Camp4"},
			FigureIsDead	{Tag = "ChefCamp2"},
			FigureIsDead	{Tag = "ChefCamp3"},
			FigureIsDead	{Tag = "ChefCamp4"},
			FigureIsDead	{Tag = "ChefCamp5"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "SevenkeepsA1_GetFood"},	
			QuestSetSolved {Quest = "SevenkeepsA1_WipeCamps"},	
		},
		
	}, 
	
	
   	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "SevenkeepsA1_GetFood"},	
			QuestIsSolved {Quest = "SevenkeepsA1_WipeCamps"},	
			--QuestIsSolved {Quest = "SevenkeepsA1_ClearUpArea"},	
		},
		Actions =
		{
    		QuestSetSolved {Quest = "SevenkeepsA1_BreakSiege"},		
			--QuestSetActive {Quest = "SevenkeepsA1_ReturnToUlf"},
			--QuestSetActive {Quest = "SevenkeepsA1_TalkToHalicos"},
			QuestSetActive {Quest = "SevenkeepsA1_TalkAskan"},	
		},
		
	},   	  	
	--Nachdem man mit Askan gesprochen hat   
   	OnOneTimeEvent
	{
    	
		Conditions =
		{
			 MapFlagIsTrue {Name = "mf_TravelStartGhostwatch"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "SevenkeepsA1_TalkAskan"},	
    		QuestSetActive {Quest = "SevenkeepsA1_PortToGhostwatch"},
    		PortalEnable	{Tag = "GoldenFields_Alluvyan"},
			--PortalEnable	{Tag = "GoldenFields_Westguard"},
			PlayerTravelEnable	{},		
		},
		
	},   	
      
};   	


