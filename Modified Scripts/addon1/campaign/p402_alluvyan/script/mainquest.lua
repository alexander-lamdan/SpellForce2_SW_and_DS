--*******************************************************
--***                                                 ***
--***             		QuestBook                     ***
--***                   Quest01-03                   ***
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
    		
    		QuestSetSolved {Quest = "WinterlightPeak_OnToAlluvyan"},	
			QuestSetSolved {Quest = "SF2A1_1_Akt_Kapitel1"},	
			QuestSetActive {Quest = "SF2A1_1_Akt_Kapitel2"},
			QuestSetActive {Quest = "Alluvyan_ProtectDwarves"},
			QuestSetActive {Quest = "Alluvyan_ProtectTreants"},
			QuestSetActive {Quest = "Alluvyan_StormCity"},
			QuestSetActive {Quest = "Alluvyan_TearDownGate1"},
			
			
		},
		
	},
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_DestroyMagicDefense"},		
		},
		Actions =
		{
    		QuestSetSolved {Quest = "Alluvyan_ProtectTreants"},	
		},
	},   	
	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},	
		},
		Actions =
		{
    		QuestSetActive {Quest = "Alluvyan_BuildCamp"},	
		},
	},   	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			PlayerHasBuildingAmount	{Player = "pl_Human", Amount = 3, OnlyCompleted = default},	
			QuestIsActive {Quest = "Alluvyan_BuildCamp"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "Alluvyan_BuildCamp"},
		},
		
	}, 
	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "Alluvyan_BuildCamp"},
			QuestIsNotKnown {Quest = "Alluvyan_DestroyCamp1"},	
			QuestIsNotKnown {Quest = "Alluvyan_DestroyCamp2"},	
		},
		Actions =
		{
    		QuestSetActive {Quest = "Alluvyan_DestroyCamp1"},
			QuestSetActive {Quest = "Alluvyan_DestroyCamp2"},	
		},
		
	}, 
	 
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},	
		},
		Actions =
		{
    		QuestSetSolved {Quest = "Alluvyan_TearDownGate1"},	
		},
		
	},   
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},
			BuildingIsDead	{Tag = "HaupthausOrc2"},
			BuildingIsDead	{Tag = "HaupthausOrc2_1"},
			QuestIsActive {Quest = "Alluvyan_DestroyCamp1"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "Alluvyan_DestroyCamp1"},	
    		FigureKill	{Tag = "CatapultOrc01"},
    		FigureKill	{Tag = "CatapultOrc02"},
		},
		
	},   	

	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},
			BuildingIsDead	{Tag = "HaupthausOrc1"},
			BuildingIsDead	{Tag = "HaupthausOrc1_1"},
			QuestIsActive {Quest = "Alluvyan_DestroyCamp2"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "Alluvyan_DestroyCamp2"},
    		FigureKill	{Tag = "CatapultOrc04"},
    		FigureKill	{Tag = "CatapultOrc03"},	
		},
		
	},   	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "Alluvyan_DestroyCamp1"},
			QuestIsSolved {Quest = "Alluvyan_DestroyCamp2"},
			QuestIsSolved {Quest = "Alluvyan_DefendCamp"},		
			
		},
		Actions =
		{
    		QuestSetActive {Quest = "Alluvyan_SearchOutOfTown"},
			QuestSetActive {Quest = "Alluvyan_TearDownInnerGate1"},
			QuestSetActive {Quest = "Alluvyan_TearDownInnerGate2"},	
			AIUnitTimerSet	{Player = "pl_Realm1", Value = 300},
			AIUnitTimerSet	{Player = "pl_Realm2", Value = 300},	
		},
		
	},   
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsActive {Quest = "Alluvyan_SearchOutOfTown"},
			MapFlagIsTrue {Name = "mf_HaldorFree"},
			MapFlagIsFalse {Name = "mf_HaldorNotAccepted"},
		},
		Actions =
		{
    		DialogSetEnabled	{Tag = "Haldor" },   
			DialogTypeSetMainQuest	{Tag = "Haldor"},
		},
		
	},   
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsActive {Quest = "Alluvyan_SearchOutOfTown"},
			MapFlagIsTrue {Name = "mf_MasterBuilder"},
		},
		Actions =
		{
    		DialogSetEnabled	{Tag = "Master_Builder" },   
			DialogTypeSetMainQuest	{Tag = "Master_Builder"},
		},
		
	},   
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},
			--AvatarHasItemMisc	{Player = "pl_Human", ItemId = 305, Amount = 1},
			MapFlagIsTrue {Name = "mf_MapGiven"},
		},
		Actions =
		{
    	--	QuestSetSolved {Quest = "Alluvyan_SearchOutOfTown"},
    		ObjectSpawn	{ObjectId = 1089, X = 335.469, Y = 438.515, Direction = 180, Tag = "LeverSecret"},
		},
		
	},   	

	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},
			GateIsOpen	{Tag = "InnerGate01"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "Alluvyan_TearDownInnerGate1"},	
    		QuestSetSolved {Quest = "Alluvyan_TearDownInnerGate2"},	
    		QuestSetSolved {Quest = "Alluvyan_SearchOutOfTown"},
    		FigureVanish	{Tag = "GateGuard"},
		},
		
	},   	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},
			GateIsOpen	{Tag = "InnerGate02"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "Alluvyan_TearDownInnerGate2"},
    		QuestSetSolved {Quest = "Alluvyan_TearDownInnerGate1"},	
    		QuestSetSolved {Quest = "Alluvyan_SearchOutOfTown"},	
		},
		
	},
	
	--Wenn das erste oder zweite Innere Tor geöffnet wurde. 
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},
			OR
			{
				QuestIsSolved {Quest = "Alluvyan_TearDownInnerGate1"},	
    			QuestIsSolved {Quest = "Alluvyan_TearDownInnerGate2"},
    		},	
		},
		Actions =
		{
    		MapFlagSetTrue {Name = "mf_EndSideQuests"},
		},
		
	},   	
	   	
	--Wenn das erste oder zweite Innere Tor geöffnet wurde. 
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMainGateCS"},
			QuestIsSolved {Quest = "Alluvyan_TearDownInnerGate1"},	
    		QuestIsSolved {Quest = "Alluvyan_TearDownInnerGate2"},	
		},
		Actions =
		{
    		QuestSetActive {Quest = "Alluvyan_KillOffLast2Camps"},
		},
		
	},   	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			BuildingIsDead	{Tag = "HaupthausOrc3"},
			BuildingIsDead	{Tag = "HaupthausOrc3_1"},
			BuildingIsDead	{Tag = "HaupthausOrc4"},
			BuildingIsDead	{Tag = "HaupthausOrc4_1"},
		},
		Actions =
		{
    		QuestSetSolved {Quest = "Alluvyan_KillOffLast2Camps"},	
		},
		
	},   	
		
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "Alluvyan_TearDownGate1"},	
			QuestIsSolved {Quest = "Alluvyan_DestroyCamp1"},	
			QuestIsSolved {Quest = "Alluvyan_DestroyCamp2"},
			QuestIsSolved {Quest = "Alluvyan_TearDownInnerGate1"},	
			QuestIsSolved {Quest = "Alluvyan_TearDownInnerGate2"},
			QuestIsSolved {Quest = "Alluvyan_KillOffLast2Camps"},	
		},
		Actions =
		{
    		QuestSetSolved {Quest = "Alluvyan_StormCity"},		
		},
		
	},   	

   	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_OrcAmbush"},
		},
		Actions =
		{
    		QuestSetActive {Quest = "Alluvyan_DefendCamp"},					
		},
		
	},   	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_OrcAmbush"},
			--GateIsOpen	{Tag = "OrcGateSouth01"},
			--GateIsOpen	{Tag = "OrcGateSouth02"},
			FigureIsDead	{Tag = "01WolfPack01"},
			FigureIsDead	{Tag = "01WolfPack02"},
			FigureIsDead	{Tag = "01WolfPack03"},
			FigureIsDead	{Tag = "01WolfPack04"},
			FigureIsDead	{Tag = "02WolfPack05"},
			FigureIsDead	{Tag = "02WolfPack01"},
			FigureIsDead	{Tag = "02WolfPack02"},
			FigureIsDead	{Tag = "02WolfPack03"},
			FigureIsDead	{Tag = "02WolfPack04"},
			FigureIsDead	{Tag = "02WolfPack05"},
			FigureIsDead	{Tag = "03WolfPack01"},
			FigureIsDead	{Tag = "03WolfPack02"},
			FigureIsDead	{Tag = "03WolfPack03"},
			FigureIsDead	{Tag = "03WolfPack04"},
			FigureIsDead	{Tag = "03WolfPack05"},
			FigureIsDead	{Tag = "04WolfRider01"},
			FigureIsDead	{Tag = "04WolfRider02"},
			FigureIsDead	{Tag = "04WolfRider03"},
			FigureIsDead	{Tag = "04WolfRider04"},
			FigureIsDead	{Tag = "04WolfRider05"},
			FigureIsDead	{Tag = "04WolfRider06"},
			FigureIsDead	{Tag = "04WolfRider07"},
			FigureIsDead	{Tag = "04WolfRider08"},
			FigureIsDead	{Tag = "05OrcTroop01"},
			FigureIsDead	{Tag = "05OrcTroop02"},
			FigureIsDead	{Tag = "05OrcTroop03"},
			FigureIsDead	{Tag = "05OrcTroop04"},
			FigureIsDead	{Tag = "05OrcTroop05"},
			FigureIsDead	{Tag = "05OrcTroop06"},
			FigureIsDead	{Tag = "05OrcTroop07"},
			FigureIsDead	{Tag = "05OrcTroop08"},
			FigureIsDead	{Tag = "05OrcTroop09"},
			FigureIsDead	{Tag = "05OrcTroop10"},
			FigureIsDead	{Tag = "05OrcTroop11"},
			FigureIsDead	{Tag = "05OrcTroop12"},
			FigureIsDead	{Tag = "05OrcTroop13"},
			FigureIsDead	{Tag = "06OrcTroop01"},
			FigureIsDead	{Tag = "06OrcTroop02"},
			FigureIsDead	{Tag = "06OrcTroop03"},
			FigureIsDead	{Tag = "06OrcTroop04"},
			FigureIsDead	{Tag = "06OrcTroop05"},
			FigureIsDead	{Tag = "06OrcTroop06"},
			FigureIsDead	{Tag = "06OrcTroop07"},
			FigureIsDead	{Tag = "06OrcTroop08"},
			FigureIsDead	{Tag = "06OrcTroop09"},
			FigureIsDead	{Tag = "06OrcTroop10"},
			FigureIsDead	{Tag = "06OrcTroop11"},
			FigureIsDead	{Tag = "06OrcTroop12"},
			FigureIsDead	{Tag = "06OrcTroop13"},
			QuestIsNotActive {Quest = "Alluvyan_DestroyCamp1"},
			QuestIsNotActive {Quest = "Alluvyan_DestroyCamp2"},	
			QuestIsNotSolved {Quest = "Alluvyan_DestroyCamp1"},
			QuestIsNotSolved {Quest = "Alluvyan_DestroyCamp2"},	
			
			
		},
		Actions =
		{
    		QuestSetSolved {Quest = "Alluvyan_DefendCamp"},	
    		QuestSetActive {Quest = "Alluvyan_DestroyCamp1"},
			QuestSetActive {Quest = "Alluvyan_DestroyCamp2"},				
		},
		
	},   	
	
	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_OrcAmbush"},
			--GateIsOpen	{Tag = "OrcGateSouth01"},
			--GateIsOpen	{Tag = "OrcGateSouth02"},
			FigureIsDead	{Tag = "01WolfPack01"},
			FigureIsDead	{Tag = "01WolfPack02"},
			FigureIsDead	{Tag = "01WolfPack03"},
			FigureIsDead	{Tag = "01WolfPack04"},
			FigureIsDead	{Tag = "02WolfPack05"},
			FigureIsDead	{Tag = "02WolfPack01"},
			FigureIsDead	{Tag = "02WolfPack02"},
			FigureIsDead	{Tag = "02WolfPack03"},
			FigureIsDead	{Tag = "02WolfPack04"},
			FigureIsDead	{Tag = "02WolfPack05"},
			FigureIsDead	{Tag = "03WolfPack01"},
			FigureIsDead	{Tag = "03WolfPack02"},
			FigureIsDead	{Tag = "03WolfPack03"},
			FigureIsDead	{Tag = "03WolfPack04"},
			FigureIsDead	{Tag = "03WolfPack05"},
			FigureIsDead	{Tag = "04WolfRider01"},
			FigureIsDead	{Tag = "04WolfRider02"},
			FigureIsDead	{Tag = "04WolfRider03"},
			FigureIsDead	{Tag = "04WolfRider04"},
			FigureIsDead	{Tag = "04WolfRider05"},
			FigureIsDead	{Tag = "04WolfRider06"},
			FigureIsDead	{Tag = "04WolfRider07"},
			FigureIsDead	{Tag = "04WolfRider08"},
			FigureIsDead	{Tag = "05OrcTroop01"},
			FigureIsDead	{Tag = "05OrcTroop02"},
			FigureIsDead	{Tag = "05OrcTroop03"},
			FigureIsDead	{Tag = "05OrcTroop04"},
			FigureIsDead	{Tag = "05OrcTroop05"},
			FigureIsDead	{Tag = "05OrcTroop06"},
			FigureIsDead	{Tag = "05OrcTroop07"},
			FigureIsDead	{Tag = "05OrcTroop08"},
			FigureIsDead	{Tag = "05OrcTroop09"},
			FigureIsDead	{Tag = "05OrcTroop10"},
			FigureIsDead	{Tag = "05OrcTroop11"},
			FigureIsDead	{Tag = "05OrcTroop12"},
			FigureIsDead	{Tag = "05OrcTroop13"},
			FigureIsDead	{Tag = "06OrcTroop01"},
			FigureIsDead	{Tag = "06OrcTroop02"},
			FigureIsDead	{Tag = "06OrcTroop03"},
			FigureIsDead	{Tag = "06OrcTroop04"},
			FigureIsDead	{Tag = "06OrcTroop05"},
			FigureIsDead	{Tag = "06OrcTroop06"},
			FigureIsDead	{Tag = "06OrcTroop07"},
			FigureIsDead	{Tag = "06OrcTroop08"},
			FigureIsDead	{Tag = "06OrcTroop09"},
			FigureIsDead	{Tag = "06OrcTroop10"},
			FigureIsDead	{Tag = "06OrcTroop11"},
			FigureIsDead	{Tag = "06OrcTroop12"},
			FigureIsDead	{Tag = "06OrcTroop13"},
			OR
			{
				QuestIsActive {Quest = "Alluvyan_DestroyCamp1"},
				QuestIsSolved {Quest = "Alluvyan_DestroyCamp1"},
			},
			OR
			{
				QuestIsActive {Quest = "Alluvyan_DestroyCamp2"},
				QuestIsSolved {Quest = "Alluvyan_DestroyCamp2"},		
			},
			
		},
		Actions =
		{
    		QuestSetSolved {Quest = "Alluvyan_DefendCamp"},	
    			
		},
		
	},   	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "Alluvyan_DefendCamp"},
			QuestIsNotSolved	{Quest = "Alluvyan_BuildCamp"},	
		},
		Actions =
		{
    		QuestSetSolved {Quest = "Alluvyan_BuildCamp"},				
		},
		
	},   	
	
	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "Alluvyan_BuildCamp"},	
			QuestIsSolved {Quest = "Alluvyan_StormCity"},	
			QuestIsSolved {Quest = "Alluvyan_ProtectTreants"},	
			QuestIsSolved {Quest = "Alluvyan_DefendCamp"},	
		},
		Actions =
		{
    					
		},
		GotoState = "Quest04",
	},   	
};
   

--*******************************************************
--***                                                 ***
--***                	Quest04		                  ***
--***                                                 ***
--*******************************************************  

State
{
	StateName = "Quest04",
   	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndcutszeneCS"},	
		},
		Actions =
		{
			QuestSetActive {Quest = "Alluvyan_KillEndboss"},
    		QuestSetActive {Quest = "Alluvyan_SaveSatras"},		
		},
		
	},   	
		
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndMonsterAlive"},
			FigureIsDead	{Tag = "EndMonster"},
			FigureIsDead	{Tag = "ShamanEndfight01"},
			FigureIsDead	{Tag = "ShamanEndfight02"},
			FigureIsDead	{Tag = "ShamanEndfight03"},
			FigureIsDead	{Tag = "ShamanEndfight04"},
		},
		Actions =
		{
			QuestSetSolved  {Quest = "Alluvyan_KillEndboss"},
    		
		},
		
	},   	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "Gate_Prison"},
		},
		Actions =
		{
    		QuestSetSolved  {Quest = "Alluvyan_SaveSatras"},
    		QuestSetActive {Quest = "Alluvyan_GuideDwarvesToSevenkeeps"},	
    		ObjectSpawn	{ObjectId = 2253, X = 379.435, Y = 590.698,  Direction = 0, Tag = "Landmarc"},	
		},
		
	},   	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapValueIsGreaterOrEqual	{Name = "mv_DwarfCounter", Value = 15},	
		},
		Actions =
		{
    		QuestSetSolved {Quest = "Alluvyan_ProtectDwarves"},
    		QuestSetSolved {Quest = "Alluvyan_GuideDwarvesToSevenkeeps"},
    		ObjectVanish	{Tag = "Landmarc"},
    		QuestSetActive {Quest = "Alluvyan_ToSevenkeeps"},	
    		FogOfWarCloak	{FogOfWarId = 1},
    		PortalEnable	{Tag = "Alluvyan_Winterlight"},
    		PortalEnable	{Tag = "Alluvyan_GoldenFields"},	
    		PlayerTravelEnable	{},
    		
		},
		
	},   	
 
     
};   

