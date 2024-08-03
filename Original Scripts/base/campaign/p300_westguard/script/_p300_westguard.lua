--*******************************************************
--***                                                 ***
--***                 Westguard                       ***
--***                                                 ***
--*******************************************************




State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
    	-- das Flag "AlwaysTrue" ist immer true sein
    	-- ist als Default-Abfragewert für Sammelscripte gedacht (Spawning etc.)
		Conditions =
		{
		},
		Actions =
		{
    			--Geldübergabe zum testen
    			--AvatarGoldGive	{Player = "pl_Human", Amount = 5000},
    			--Brunnenbauflag gesetzt
    			--MapFlagSetTrue{Name = "mf_BrunnenKostenVorhanden"}, 
    			
    			--Statuenbau gesetzt
    			--MapFlagSetTrue{Name = "mf_DenkmalkostenVorhanden"}, 
    			--BurgMauer gesetzt
    			--MapFlagSetTrue{Name = "mf_CastleKostenVorhanden"}, 
    			
    			--Warrads Dialog wird freigeschaltet
				DialogTypeSetSideQuest	{Tag = "Warrad"},
				DialogSetEnabled	{Tag = "Warrad" },
				
				--Utrechts Dialog wird freigeschaltet
    			DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
				DialogSetEnabled	{Tag = "VerwalterUtrecht" },
							
				--Brennende Gebäude
				--BuildingHealthSet	{Tag = "Castle", Percent = 20},
				BuildingHealthSet	{Tag = "Farm01", Percent = 70},
				--BuildingHealthSet	{Tag = "Farm02", Percent = 20},
				BuildingHealthSet	{Tag = "Farm03", Percent = 70},
				--BuildingHealthSet	{Tag = "Farm04", Percent = 20},
				BuildingHealthSet	{Tag = "Farm05", Percent = 70},
				BuildingHealthSet	{Tag = "Sawmill01", Percent = 70},
				BuildingHealthSet	{Tag = "Lenia01", Percent = 70},
				--BuildingHealthSet	{Tag = "Steinbruch01", Percent = 20},
				BuildingHealthSet	{Tag = "Moonsilverbuilding01", Percent = 70},
    			--BuildingHealthSet	{Tag = "Schmelze01", Percent = 70},
				
				--Erste Quest
				MapFlagSetTrue{Name = "mf_DemonSpawn"},  
				MapFlagSetTrue{Name = "mf_PlayerkitStart"}, 
				
				--Timer initialisierung für Brunnen/Ylia und Denkmal
				MapTimerStart	{Name = "mt_TimerHeilungYlia"},
				MapTimerStart	{Name = "mt_TimerHeilungBrunnen"},	
				MapTimerStart	{Name = "mt_TimerDenkmal"},	
				
				--Ressourcenübergabe Dummy
				PlayerResourceStoneGive	{Player = "pl_Human", Amount = 500},	
				PlayerResourceSilverGive	{Player = "pl_Human", Amount = 500},
				PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 500},
				
				
--				BuildingAbilityAdd	{Tag = "Farm01", AbilityId = 338},
--				BuildingAbilityAdd	{Tag = "Farm03", AbilityId = 338},
--				BuildingAbilityAdd	{Tag = "Farm05", AbilityId = 338},
--				BuildingAbilityAdd	{Tag = "Sawmill01", AbilityId = 338},
--				BuildingAbilityAdd	{Tag = "Lenia01", AbilityId = 338},
--				BuildingAbilityAdd	{Tag = "Moonsilverbuilding01", AbilityId = 338},
				
				--Kultanhänger
				FigureVanish	{Tag = "Cultist01"},
				FigureVanish	{Tag = "Cultist02"},
				FigureVanish	{Tag = "Cultist03"},
				FigureVanish	{Tag = "Cultist04"},
				
				--TestArne 3 Rezepte gleichzeitig
				--AvatarFlagSetTrue {Name = "af_P305_JandrimSpawnOnWestguard"},	
				--AvatarItemMiscGive	{Player = "pl_Human", ItemId = 201, Amount = 1},
				--AvatarItemMiscGive	{Player = "pl_Human", ItemId = 202, Amount = 1},
				--AvatarItemMiscGive	{Player = "pl_Human", ItemId = 203, Amount = 1},
				
				---Skeleton Arbeiter
				MapTimerStart	{Name = "mt_SkeletonWorker01Start"},
				MapTimerStart	{Name = "mt_SkeletonWorker02Start"},
				MapTimerStart	{Name = "mt_SkeletonWorker03Start"},
				MapTimerStart	{Name = "mt_SkeletonWorker04Start"},
				
				---Beast Arbeiter
				MapTimerStart	{Name = "mt_BeastWorker01Start"},
				MapTimerStart	{Name = "mt_BeastWorker02Start"},
				MapTimerStart	{Name = "mt_BeastWorker03Start"},
				MapTimerStart	{Name = "mt_BeastWorker04Start"},
				
				 --Bei folgenden Figuren wird das Swapping verhindert
    	   		FigureSwappingDisable {Tag = "VerwalterUtrecht"},
    	   		FigureSwappingDisable {Tag = "Warrad"},
    	   		FigureSwappingDisable {Tag = "Ausruferin"},
    	   		FigureSwappingDisable {Tag = "Merchant02"},
    	   		FigureSwappingDisable {Tag = "Merchant03"},
    	   		FigureSwappingDisable {Tag = "Merchant04"},
    	   		FigureSwappingDisable {Tag = "Merchant05"},
    	   		FogOfWarReveal	{X = 402, Y = 402, Range = 15, Height = 140},
    	   		
		},
		GotoState = "MainState",
	},
}

-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "MainState",
   --Westguard PlattformChange
   OnEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsFalse	{Name = "mf_EinmalPlattformSchalter"},
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    		
    	},
    	Actions =
    	{
    		
    		MapTimerStart	{Name = "mt_PlattformVariable"},
    		MapFlagSetTrue	{Name = "mf_EinmalPlattformSchalter"},
    		
       	},
  },  
  OnEvent
   {
    	
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_PlattformVariable", Seconds = 3},
    		MapFlagIsTrue	{Name = "mf_EinmalPlattformSchalter"},
    	},
    	Actions =
    	{
    		
    	
    		AvatarFlagSetFalse {Name = "af_P300_WestguardPlattformChange"},
    		MapFlagSetFalse	{Name = "mf_EinmalPlattformSchalter"},
       	},
  },  
  
--*******************************************************
--***                                                 ***
--***          Utrecht wird immer aufgedeckt          ***
--***                                                 ***
--******************************************************* 
  
  --Utrecht wird immer aufgedeckt
  OnEvent
  {
    	
    	Conditions =
    	{
    		MapFlagIsTrue	{Name = "mf_EinmalPlattformSchalter"},
    		MapFlagIsFalse	{Name = "mf_EinmalUtrechtSchalter"},
    	},
    	Actions =
    	{
    		FogOfWarRevealAtEntity	{Tag = "VerwalterUtrecht", Range = 10, Height = 135},
    		MapFlagSetTrue	{Name = "mf_EinmalUtrechtSchalter"},
       	},
  },  
  
   --Utrecht wird immer aufgedeckt
  OnEvent
  {
    	
    	Conditions =
    	{
    		MapFlagIsFalse	{Name = "mf_EinmalPlattformSchalter"},
    		MapFlagIsTrue	{Name = "mf_EinmalUtrechtSchalter"},
    	},
    	Actions =
    	{
    		MapFlagSetFalse	{Name = "mf_EinmalUtrechtSchalter"},
       	},
  },  
  
--*******************************************************
--***                                                 ***
--***         Utrecht wird immer aufgedeckt End       ***
--***                                                 ***
--*******************************************************  

   --Jandim Outcry wenn Jandrim gespawned
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_WindhammerAlive"},
    		FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Jandrim_Windhammer", Range = 6},
    	},
    	Actions =
    	{
    		FigureOutcry	{Tag = "Jandrim_Windhammer", TextTag = "Jandrim01"},
    		FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar02"},	
       	},
  }, 
  --Ylia Outcry wenn Ylia gespawned
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_YliaAlive"},
    		FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Ylia", Range = 6},
    	},
    	Actions =
    	{
    		FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar03"},
    		FigureOutcry	{Tag = "Ylia", TextTag = "Ylia01"},
    		FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar04"},	
       	},
  }, 
  --Söldner Halicos Outcry wenn Halicos gespawned
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_Halicos_Spawn"},
    		FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "TorHalicos", Range = 6},
    	},
    	Actions =
    	{
    		
    		FigureOutcry	{Tag = "TorHalicos", TextTag = "Halicos01"},
    		FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar05"},	
       	},
  }, 

--*******************************************************
--***                                                 ***
--***           		NQ House of Greys	          ***
--***                                                 ***
--*******************************************************

  --Karas Dialog wird angeschaltet sobald sie die NQ Info zu den Greys besitzt.
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		QuestIsActive {Quest = "HouseOfGreyLethosApology1"},
    		MapFlagIsTrue {Name = "mf_P300_SpeakToKara"},
    	},
    	Actions =
    	{
    		DialogSetEnabled {Tag = "Kara" },
    		DialogTypeSetSideQuest {Tag = "Kara"},
       	},
 	}, 
 
 --Und abgeschaltet sobald sie die NQ Info gegeben hat und Gromp rekrutiert wurde.
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		QuestIsSolved {Quest = "HouseOfGreyLethosApology1"},
    		AvatarFlagIsTrue{Name = "af_P300_GrompRecruit"},
    	},
    	Actions =
    	{
    		DialogSetDisabled	{Tag = "Kara"},
       	},
 	 }, 
 
--*******************************************************
--***                                                 ***
--***           NQ House of Greys End  			      ***
--***                                                 ***
--******************************************************* 
 
   OnOneTimeEvent
   {
    	--Nach dem ersten Dialog mit Utrecht
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P300_WestguardUtrechtTalked"},
    		MapFlagIsFalse{Name = "mf_DemonsDefeatedWithoutQuest"},	
    		AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
    		
    	},
    	Actions =
    	{
    		QuestSetSolved{Player = "pl_Human", Quest = "WestguardTalkToUtrecht"},
    		QuestSetActive{Quest = "WestguardDefeatDemons"},
    		FogOfWarRevealAtEntity	{Tag = "Demon01", Range = 15, Height = 125},
    		FogOfWarRevealAtEntity	{Tag = "Demon02", Range = 15, Height = 125},
    		FogOfWarRevealAtEntity	{Tag = "Demon03", Range = 15, Height = 125},
    		FogOfWarRevealAtEntity	{Tag = "Demon04", Range = 15, Height = 125},
    		FogOfWarRevealAtEntity	{Tag = "Demon05", Range = 15, Height = 125},
    		FogOfWarRevealAtEntity	{Tag = "Demon06", Range = 15, Height = 125},
    		FogOfWarRevealAtEntity	{Tag = "Demon07", Range = 15, Height = 125},
    		MinimapAlertSetToEntity	{Tag = "Demon01", Type = 5},
    		MinimapAlertSetToEntity	{Tag = "Demon02", Type = 5},
    		MinimapAlertSetToEntity	{Tag = "Demon03", Type = 5},
    		MinimapAlertSetToEntity	{Tag = "Demon04", Type = 5},
    		MinimapAlertSetToEntity	{Tag = "Demon05", Type = 5},
    		MinimapAlertSetToEntity	{Tag = "Demon06", Type = 5},
    		MinimapAlertSetToEntity	{Tag = "Demon07", Type = 5},
    		QuestSetActive {Quest = "WestguardRepairBuildings1"},	
    			
       	},
  }, 
   OnOneTimeEvent
   {
    	--Nach dem ersten Dialog mit Utrecht Dämonen gesolved ohne Quest 
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P300_WestguardUtrechtTalked"},
    		MapFlagIsTrue{Name = "mf_DemonsDefeatedWithoutQuest"},	
    		
    	},
    	Actions =
    	{
    		QuestSetSolved{Player = "pl_Human", Quest = "WestguardTalkToUtrecht"},    	
    		QuestSetActive	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},		
       	},
  }, 
--*******************************************************
--***                                                 ***
--***           		XP Vergabe  		          ***
--***                                                 ***
--*******************************************************
--Seven_Demons
 OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		FigureIsDead	{Tag = "Demon01"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P300_Demon01Killed"},	
       	},
  }, 
 OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		FigureIsDead	{Tag = "Demon02"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P300_Demon02Killed"},	
       	},
  }, 
 OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		FigureIsDead	{Tag = "Demon03"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P300_Demon03Killed"},	
       	},
  }, 
 OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		FigureIsDead	{Tag = "Demon04"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P300_Demon04Killed"},	
       	},
  }, 
 OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		FigureIsDead	{Tag = "Demon05"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P300_Demon05Killed"},	
       	},
  }, 
 OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		FigureIsDead	{Tag = "Demon06"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P300_Demon06Killed"},	
       	},
  }, 
  OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		FigureIsDead	{Tag = "Demon07"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P300_Demon07Killed"},	
       	},
  }, 
--Five_Houses
OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		BuildingHasHealth	{Tag = "Farm01", Percent = 100},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P300_RepairBuilding01"},		
       	},
  }, 
OnOneTimeEvent
  {
    	
    	Conditions =
    	{
    		BuildingHasHealth	{Tag = "Farm03", Percent = 100},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P300_RepairBuilding02"},		
       	},
  }, 
 OnOneTimeEvent
  {
    	
    	Conditions =
    	{
    		BuildingHasHealth	{Tag = "Farm05", Percent = 100},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P300_RepairBuilding03"},		
       	},
  }, 
OnOneTimeEvent
  {
    	
    	Conditions =
    	{
    		BuildingHasHealth	{Tag = "Sawmill01", Percent = 100},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P300_RepairBuilding04"},		
       	},
  }, 	
OnOneTimeEvent
  {
    	
    	Conditions =
    	{
    		BuildingHasHealth	{Tag = "Lenia01", Percent = 100},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P300_RepairBuilding05"},		
       	},
  }, 
OnOneTimeEvent
  {
    	
    	Conditions =
    	{
    		BuildingHasHealth	{Tag = "Moonsilverbuilding01", Percent = 100},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P300_RepairBuilding06"},		
       	},
  },  

		
--*******************************************************
--***                                                 ***
--***         	 	XP Vergabe Ende		  	          ***
--***                                                 ***
--******************************************************* 

--*******************************************************
--***                                                 ***
--***         	 		NQ Kara				          ***
--***                                                 ***
--******************************************************* 


 --Die Kara Quest wird gestartet, wenn der Spieler Kara noch nicht befreit hat.
  OnOneTimeEvent
  {
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_TochterAuftrag"},
    		AvatarFlagIsFalse{Name = "af_P307_KaraAndGrompGoHome"},
    	},
    	Actions =
    	{
 			QuestSetActive {Quest = "WestguardFindDaughter"},
			QuestSetActive {Quest = "TalkToBaruGF"},
			AvatarValueSet{Name = "av_P300_WarradsDaughterQuest", Value = 1},   		
       	},
  },  
  
   --Warrads Dialog auf der Westguard wird enabled sobald der Spieler Westguard betritt und Kara Ohne Quest gerettet hat.  
  OnOneTimeEvent
  {
    	
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P307_KaraAndGrompGoHome"},
    		QuestIsNotKnown	{Quest = "WestguardFindDaughter"},
    	},
    	Actions =
    	{
 			DialogTypeSetSideQuest	{Tag = "Warrad"},
			DialogSetEnabled	{Tag = "Warrad" },			
       	},
  },  
   
  
  --Karas Dialog auf der Westguard wird enabled sobald der Spieler mit Warrad geredet hat.  
  OnOneTimeEvent
  {
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_TochterAuftrag"},
    		AvatarFlagIsTrue{Name = "af_P307_KaraAndGrompGoHome"},
    		QuestIsNotKnown	{Quest = "WestguardFindDaughter"},
    	},
    	Actions =
    	{
 			MapFlagSetTrue{Name = "mf_KaraSpawn"},
       	},
  },  
   
  
  OnOneTimeEvent
  {
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_GromSpawn"}, 
    		QuestIsActive	{Player = "pl_Human", Quest = "TalkToBaruGF"},
    		QuestIsActive	{Player = "pl_Human", Quest = "WestguardFindDaughter"},
    	},
    	Actions =
    	{
    		QuestSetSolved	{Player = "pl_Human", Quest = "TalkToBaruGF"},
			QuestSetActive	{Quest = "BringNewsToWarrad"},
       	},
  },  
   
   
  --Kara Quest solved
  OnOneTimeEvent
  {
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_KaraQuestSolved"},
    		QuestIsActive	{Player = "pl_Human", Quest = "BringNewsToWarrad"},
    		QuestIsActive	{Player = "pl_Human", Quest = "WestguardFindDaughter"},
    	},
    	Actions =
    	{
    		QuestSetSolved	{Player = "pl_Human", Quest = "BringNewsToWarrad"},
			QuestSetSolved	{Player = "pl_Human", Quest = "WestguardFindDaughter"},	
       	},
  },  
  
  --Warrads First Talk wird gesetzt sobald er von Kara erzählt hat.
  OnOneTimeEvent
  {
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_TochterAuftrag"},
    	},
    	Actions =
    	{
    		AvatarFlagSetTrue{Name = "af_P300_WarradTalkFirstTime"}, 	
       	},
  },  
  
--*******************************************************
--***                                                 ***
--***          		Kara ENDE				          ***
--***                                                 ***
--******************************************************* 

 
--*******************************************************
--***                                                 ***
--***           Stadtentwicklung Gebäudebau           ***
--***                                                 ***
--******************************************************* 

  OnOneTimeEvent
   {
    	
    	--01 Einwohnerbau 01/02
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_Einwohner01"},
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    	},
    	Actions =
    	{
    		FigureOutcry	{Tag = "VerwalterUtrecht", TextTag = "Verwalter01"},
    		ObjectVanish	{Tag = "Smoke01"},
    		ObjectVanish	{Tag = "Smoke02"},
    		--EffectStop	{Tag = "02Ruine02"},
    		
    		ObjectVanish	{Tag = "01Ruine01"},
    		ObjectVanish	{Tag = "01Ruine02"},
    		ObjectVanish	{Tag = "01Ruine03"},
    		ObjectVanish	{Tag = "01Ruine04"},
    		
    		ObjectVanish	{Tag = "02Ruine01"},
    		ObjectVanish	{Tag = "02Ruine02"},
    		ObjectVanish	{Tag = "02Ruine03"},
    		ObjectVanish	{Tag = "02Ruine04"},
    		
    		
    		--Gebäude 1 und 2
    		ObjectSpawn	{ObjectId = 60, X = 387.8, Y = 327.6, Direction = 0, Tag = "EinwohnerBuilding01"},
    		ObjectSpawn	{ObjectId = 60, X = 394.8, Y = 364, Direction = 180, Tag = "EinwohnerBuilding02"},
    		AvatarFlagSetTrue{Name = "af_P300_WestguardNewFolks"},
    		--MapValueSubtract	{Name = "mv_PlattformChange", Value = 1},
       	},
  },
  
  OnOneTimeEvent
   {
    	
    	--02 Einwohnerbau 01/02
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_Einwohner02"}, 
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    	},
    	Actions =
    	{
    		FigureOutcry	{Tag = "VerwalterUtrecht", TextTag = "Verwalter01"},
    		
    		--EffectStop	{Tag = "03Ruine06"},
			--EffectStop	{Tag = "04Ruine08"},
			ObjectVanish	{Tag = "Smoke03"},
			ObjectVanish	{Tag = "Smoke04"},
    		
    		ObjectVanish	{Tag = "03Ruine01"},
    		ObjectVanish	{Tag = "03Ruine02"},
    		ObjectVanish	{Tag = "03Ruine03"},
    		ObjectVanish	{Tag = "03Ruine04"},
    		ObjectVanish	{Tag = "03Ruine05"},
    		ObjectVanish	{Tag = "03Ruine06"},
    		ObjectVanish	{Tag = "03Ruine07"},
    		
    		ObjectVanish	{Tag = "04Ruine01"},
    		ObjectVanish	{Tag = "04Ruine02"},
    		ObjectVanish	{Tag = "04Ruine03"},
    		ObjectVanish	{Tag = "04Ruine04"},
    		ObjectVanish	{Tag = "04Ruine05"},
    		ObjectVanish	{Tag = "04Ruine06"},
    		ObjectVanish	{Tag = "04Ruine07"},
    		ObjectVanish	{Tag = "04Ruine08"},
    		
    		
    		--Gebäude 1 und 2
    		ObjectSpawn	{ObjectId = 62, X = 357.0, Y = 277.2, Direction = 90, Tag = "EinwohnerBuilding03"},
    		ObjectSpawn	{ObjectId = 61, X = 364.0, Y = 292.6, Direction = 270, Tag = "EinwohnerBuilding04"},
    		AvatarGoldGive	{Amount = 500},
    		--MapValueSubtract	{Name = "mv_PlattformChange", Value = 1},
    		
    					
       	},
  },
  
  OnOneTimeEvent
   {
    	
    	--03 Einwohnerbau 01/02
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_Einwohner03"}, 
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    	},
    	Actions =
    	{
    		FigureOutcry	{Tag = "VerwalterUtrecht", TextTag = "Verwalter01"},
    		
    		--EffectStop	{Tag = "05Ruine08"},
			--EffectStop	{Tag = "06Ruine03"},
			ObjectVanish	{Tag = "Smoke05"},
			ObjectVanish	{Tag = "Smoke06"},
    		
    		ObjectVanish	{Tag = "05Ruine01"},
    		ObjectVanish	{Tag = "05Ruine02"},
    		ObjectVanish	{Tag = "05Ruine03"},
    		ObjectVanish	{Tag = "05Ruine04"},
    		ObjectVanish	{Tag = "05Ruine05"},
    		ObjectVanish	{Tag = "05Ruine06"},
    		ObjectVanish	{Tag = "05Ruine07"},
    		ObjectVanish	{Tag = "05Ruine08"},
    		ObjectVanish	{Tag = "05Ruine09"},
    		ObjectVanish	{Tag = "05Ruine10"},
    		
    		ObjectVanish	{Tag = "06Ruine01"},
    		ObjectVanish	{Tag = "06Ruine02"},
    		ObjectVanish	{Tag = "06Ruine03"},
    		ObjectVanish	{Tag = "06Ruine04"},
    		
    		
    		
    		--Gebäude 1 und 2
    		ObjectSpawn	{ObjectId = 61, X = 345.8, Y = 246.4, Direction = 90, Tag = "EinwohnerBuilding05"},
    		ObjectSpawn	{ObjectId = 59, X = 361.2, Y = 257.6, Direction = 270, Tag = "EinwohnerBuilding06"},
    		AvatarGoldGive	{Amount = 1000},
    		--MapValueSubtract	{Name = "mv_PlattformChange", Value = 1},
    					
       	},
  },
  
   OnOneTimeEvent
   {
    	
    	--04 Einwohnerbau 01/02
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_Einwohner04"}, 
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    	},
    	Actions =
    	{
    		FigureOutcry	{Tag = "VerwalterUtrecht", TextTag = "Verwalter01"},
    		
    		--EffectStop	{Tag = "07Ruine04"},
    		
    		
    		ObjectVanish	{Tag = "07Ruine01"},
    		ObjectVanish	{Tag = "07Ruine02"},
    		ObjectVanish	{Tag = "07Ruine03"},
    		ObjectVanish	{Tag = "07Ruine04"},
    		ObjectVanish	{Tag = "07Ruine05"},
    		ObjectVanish	{Tag = "07Ruine06"},
    		
    		
    		ObjectVanish	{Tag = "08Ruine01"},
    		ObjectVanish	{Tag = "08Ruine02"},
    		ObjectVanish	{Tag = "08Ruine03"},
    		ObjectVanish	{Tag = "08Ruine04"},
    		ObjectVanish	{Tag = "08Ruine05"},
    		ObjectVanish	{Tag = "08Ruine06"},
    		
    		
    		--Gebäude 1 und 2
    		ObjectSpawn	{ObjectId = 57, X = 338.8, Y = 246.4, Direction = 0, Tag = "EinwohnerBuilding07"},
    		ObjectSpawn	{ObjectId = 57, X = 331.8, Y = 231.0, Direction = 90, Tag = "EinwohnerBuilding08"},
    		AvatarGoldGive	{Amount = 1500},
    		--MapValueSubtract	{Name = "mv_PlattformChange", Value = 1},
    					
       	},
  },
  
   OnOneTimeEvent
   {
    	
    	--05 Einwohnerbau 01/02/03
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_Einwohner05"}, 
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    	},
    	Actions =
    	{
    		FigureOutcry	{Tag = "VerwalterUtrecht", TextTag = "Verwalter01"},
    		
    		--EffectStop	{Tag = "10Ruine05"},
			--EffectStop	{Tag = "09Ruine03"},
			ObjectVanish	{Tag = "Smoke09"},
			ObjectVanish	{Tag = "Smoke10"},
    		
    		ObjectVanish	{Tag = "11Ruine09"},
    		ObjectVanish	{Tag = "09Ruine01"},
    		ObjectVanish	{Tag = "09Ruine02"},
    		ObjectVanish	{Tag = "09Ruine03"},
    		ObjectVanish	{Tag = "09Ruine04"},
    		ObjectVanish	{Tag = "09Ruine05"},
    		ObjectVanish	{Tag = "09Ruine06"},
    		ObjectVanish	{Tag = "09Ruine07"},
    		ObjectVanish	{Tag = "09Ruine08"},
    		
     		ObjectVanish	{Tag = "10Ruine01"},
    		ObjectVanish	{Tag = "10Ruine02"},
    		ObjectVanish	{Tag = "10Ruine03"},
    		ObjectVanish	{Tag = "10Ruine04"},
    		ObjectVanish	{Tag = "10Ruine05"},
    		ObjectVanish	{Tag = "10Ruine06"},
    		ObjectVanish	{Tag = "10Ruine07"},
    		
    		ObjectVanish	{Tag = "11Ruine01"},
    		ObjectVanish	{Tag = "11Ruine02"},
    		ObjectVanish	{Tag = "11Ruine03"},
    		ObjectVanish	{Tag = "11Ruine04"},
    		ObjectVanish	{Tag = "11Ruine05"},
    		ObjectVanish	{Tag = "11Ruine06"},
    		ObjectVanish	{Tag = "11Ruine07"},
    		ObjectVanish	{Tag = "11Ruine08"},
    		ObjectVanish	{Tag = "11Ruine09"},
    		
    		
    	
    		--Gebäude 1/2/3
    		ObjectSpawn	{ObjectId = 62, X = 430.455, Y = 403.791, Direction = 90, Tag = "EinwohnerBuilding09"},
    		ObjectSpawn	{ObjectId = 63, X = 414.4, Y = 352.8, Direction = 0, Tag = "EinwohnerBuilding10"},
    		ObjectSpawn	{ObjectId = 62, X = 393.4, Y = 308, Direction = 90, Tag = "EinwohnerBuilding11"},
    	    AvatarGoldGive	{Amount = 3000},	
    	   --MapValueSubtract	{Name = "mv_PlattformChange", Value = 1},
    	   
    	  
    	   				
       	},
  },
   
  OnOneTimeEvent
   {
    	
    	--Elfenbau 
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_ElfeSpawn"}, 
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    	},
    	Actions =
    	{
    		ObjectVanish	{Tag = "Smoke_Elfe"},
    		--EffectStop	{Tag = "ElfenRuine05"},	  
    		ObjectVanish	{Tag = "ElfenRuine01"},
    		ObjectVanish	{Tag = "ElfenRuine02"},
    		ObjectVanish	{Tag = "ElfenRuine03"},
    		ObjectVanish	{Tag = "ElfenRuine04"},
    		ObjectVanish	{Tag = "ElfenRuine05"},
    		ObjectVanish	{Tag = "ElfenRuine06"},
    		ObjectVanish	{Tag = "ElfenRuine07"},
    		ObjectVanish	{Tag = "ElfenRuine08"},
    		ObjectVanish	{Tag = "ElfenRuine09"},
    		ObjectVanish	{Tag = "ElfenRuine10"},
    		ObjectVanish	{Tag = "ElfenRuine11"},
    		ObjectVanish	{Tag = "ElfenRuine12"},
    		ObjectVanish	{Tag = "ElfenRuine13"},
    		 		
    		
    		--Gebäude 
    		ObjectSpawn	{ObjectId = 59, X = 435.976, Y = 430.321, Direction = 225, Tag = "ElfenHaus01"},
    		ObjectSpawn	{ObjectId = 58, X = 438.917, Y = 417.458, Direction = 45, Tag = "ElfenHaus02"},	
    		--MapValueSubtract	{Name = "mv_PlattformChange", Value = 1},
    		   					
       	},
  },
  
  OnOneTimeEvent
   {
    	
    	--Zwergenbau 
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_ZwergenSpawn"},
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    		
    	},
    	Actions =
    	{
    		--EffectStop	{Tag = "ZwergenRuine02"},
    		ObjectVanish	{Tag = "ZwergenRuine01"},
    		ObjectVanish	{Tag = "ZwergenRuine02"},
    		ObjectVanish	{Tag = "ZwergenRuine03"},
    		ObjectVanish	{Tag = "ZwergenRuine04"},
    		ObjectVanish	{Tag = "ZwergenRuine05"},
    		ObjectVanish	{Tag = "ZwergenRuine06"},
    		 		    		
    		--Gebäude 
    		ObjectSpawn	{ObjectId = 88, X = 413.822, Y = 317.562, Direction = 90, Tag = "ZwergenHaus01"},
    		--MapValueSubtract	{Name = "mv_PlattformChange", Value = 1},
						
       	},
  },
  
  OnOneTimeEvent
   {
    	
    	--Kaufmannshaus 
    	Conditions =
    	{
    		AvatarFlagIsTrue {Name = "af_P300_MerchantSpawn"},
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue{Name = "mf_KaufmannSpawn"}, 
      		ObjectVanish	{Tag = "Smoke_Kaufmann"},
    		
    		--EffectStop	{Tag = "KaufmannsRuine04"},
    		ObjectVanish	{Tag = "KaufmannsRuine01"},
    		ObjectVanish	{Tag = "KaufmannsRuine02"},
    		ObjectVanish	{Tag = "KaufmannsRuine03"},
    		ObjectVanish	{Tag = "KaufmannsRuine04"},
    		ObjectVanish	{Tag = "KaufmannsRuine05"},
    		ObjectVanish	{Tag = "KaufmannsRuine06"},
    		ObjectVanish	{Tag = "KaufmannsRuine07"},
    		ObjectVanish	{Tag = "KaufmannsRuine08"},
    		 		    		
    		--Gebäude 
    		ObjectSpawn	{ObjectId = 61, X = 382.2, Y = 389.2, Direction = 270, Tag = "KaufmannsHaus01"},
    		ObjectSpawn	{ObjectId = 46, X = 393.454, Y = 394.675, Direction = 15.5155, Tag = "KaufmannsOhbjekte01"},
    		ObjectSpawn	{ObjectId = 346, X = 390.426, Y = 393.662, Direction = 358.327, Tag = "KaufmannsOhbjekte02"},
    		ObjectSpawn	{ObjectId = 42, X = 391.766, Y = 394.712, Direction = 180, Tag = "KaufmannsOhbjekte03"},
    		ObjectSpawn	{ObjectId = 346, X = 391.761, Y = 393.431, Direction = 272.383, Tag = "KaufmannsOhbjekte04"},	
    		--MapValueSubtract	{Name = "mv_PlattformChange", Value = 1},
			
								
       	},
  },
  
   --Spieler kauft Stein beim Kaufmann
    OnEvent
    {
    	Conditions =
    	 {
    		AvatarHasItemMisc	{Player = "pl_Human", ItemId = 251, Amount = 1},
    		MapFlagIsTrue{Name = "mf_KaufmannSpawn"}, 
    	 },
    	Actions =
    	{
    		PlayerResourceStoneGive	{Player = "pl_Human", Amount = 300},
    		AvatarItemMiscTake	{Player = "pl_Human", ItemId = 251, Amount = 1},
    	},
    },
  
  OnOneTimeEvent
   {
    	
    	--SöldnerHaus 
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_Halicos_Spawn"},
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    	},
    	Actions =
    	{
    		ObjectVanish	{Tag = "SoeldnerRuine01"},
    		ObjectVanish	{Tag = "SoeldnerRuine02"},
    		ObjectVanish	{Tag = "SoeldnerRuine03"},
    		ObjectVanish	{Tag = "SoeldnerRuine04"},
    		ObjectVanish	{Tag = "SoeldnerRuine05"},
    		ObjectVanish	{Tag = "SoeldnerRuine06"},
    		ObjectVanish	{Tag = "SoeldnerRuine07"},
    		ObjectVanish	{Tag = "SoeldnerRuine08"},
    		ObjectVanish	{Tag = "SoeldnerRuine09"},
    		ObjectVanish	{Tag = "SoeldnerRuine10"},
    		    		 		    		
    		--Gebäude 
    		ObjectSpawn	{ObjectId = 61, X = 371, Y = 292.6, Direction = 90, Tag = "SoeldnerHaus01"},
    						
       	},
  },
  
  OnOneTimeEvent
   {
    	
    	--NachtwächterTurm 
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_GromSpawn"}, 
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    	},
    	Actions =
    	{
    		ObjectVanish	{Tag = "GromRuine01"},
    		  		 		    		
    		--Gebäude 
    		ObjectSpawn	{ObjectId = 267, X = 413, Y = 371, Direction = 180, Tag = "GromHaus01"},
    		--MapValueSubtract	{Name = "mv_PlattformChange", Value = 1},
    						
       	},
  },
  
  OnOneTimeEvent
   {
    	
    	-- Brunnenbau sofort
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P300_BrunnenBauActiv"},
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    		
    	},
    	Actions =
    	{
    		--Brunnen
    		--ObjectSpawn	{ObjectId = 1988, X = 288, Y = 342, Direction = 0, Tag = "BrunnenWestguard"},
    		    		
    		ObjectVanish	{Tag = "RockWell"},
    		--BuildingAbilityAdd	{Tag = "BrunnenWestguard", AbilityId = 371},
    		
    		MapFlagSetTrue {Name = "mf_BrunnenFertigGebaut"},
    		AvatarFlagSetTrue {Name = "af_P300_MerchantSpawn"},
    		AvatarFlagSetTrue{Name = "af_P300_WestguardWellThanksGiving"},
    		MapTimerStart	{Name = "mt_TimerHeilungBrunnen"},
    		DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			DialogSetEnabled	{Tag = "VerwalterUtrecht" },
			--MapValueSubtract	{Name = "mv_PlattformChange", Value = 1},
			
			--Startet die Cutszene
			MapFlagSetTrue {Name = "mf_P300_Cutscene_Expansion_Fountain"},
       	},
  }, 
   OnOneTimeEvent
   {
    	
    	-- Statuenbau sofort
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P300_DenkmalBauActiv"},
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    	},
    	Actions =
    	{
    		--BuildingAbilityAdd	{Tag = "StatueWestguard", AbilityId = 372},
    		--Statue
    		--ObjectSpawn	{ObjectId = 1989, X = 402.8, Y = 275.8, Direction = 0, Tag = "StatueWestguard"},
			ObjectVanish	{Tag = "RockStatue"},
    		MapFlagSetTrue {Name = "mf_DenkmalFertigGebaut"},
    		MapTimerStart	{Name = "mt_TimerDenkmal"},
    		--MapValueSubtract	{Name = "mv_PlattformChange", Value = 1},
    		
    		    		
    		--Startet die Cutszene
			MapFlagSetTrue {Name = "mf_P300_Cutscene_Expansion_Monument"},
       	},
  }, 
  OnOneTimeEvent
   {
    	
    	-- Sobald der Statuenbau und die Armee gebaut wurde geht die Quest bei Utrecht weiter
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_DenkmalFertigGebaut"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuildMonument"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuild60Soldiers"},
    		
    	},
    	Actions =
    	{
    		--Statue
    		AvatarFlagSetTrue {Name = "af_P300_WestguardSet55Built"},
    		AvatarFlagSetTrue{Name = "af_P300_WestguardStatueThanksGiving"},
    		DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			DialogSetEnabled	{Tag = "VerwalterUtrecht" },
       	},
  }, 
  
  
  
  			
  OnOneTimeEvent
   {
    	
    	-- Stadtmauerbau 
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P300_StadmauerBauActiv"}, 
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    	},
    	Actions =
    	{
    		ObjectVanish	{Tag = "Smoke_Stadtmauer01"},
    		ObjectVanish	{Tag = "Smoke_Stadtmauer02"},
    		ObjectVanish	{Tag = "Smoke_Stadtmauer03"},
    		ObjectVanish	{Tag = "Smoke_Stadtmauer04"},
    		ObjectVanish	{Tag = "Smoke_Stadtmauer05"},
    		ObjectVanish	{Tag = "Smoke_Stadtmauer06"},
    		ObjectVanish	{Tag = "Smoke_Stadtmauer07"},
    		ObjectVanish	{Tag = "Smoke_Stadtmauer08"},
    		ObjectVanish	{Tag = "Smoke_Stadtmauer09"},
    		ObjectVanish	{Tag = "Smoke_Stadtmauer10"},
    		
    		--Stadtmauer
    		ObjectChange	{Tag = "Stadtmauer01", ObjectId = 1986, X = 303.8, Y = 211.4, Direction = 0},
    		ObjectChange	{Tag = "Stadtmauer02", ObjectId = 1986, X = 316.4, Y = 211.4, Direction = 0},
    		ObjectChange	{Tag = "Stadtmauer03", ObjectId = 1986, X = 329.0, Y = 211.4, Direction = 0},
    		ObjectChange	{Tag = "Stadtmauer04", ObjectId = 1986, X = 551.6, Y = 166.6, Direction = 0},
    		ObjectChange	{Tag = "Stadtmauer05", ObjectId = 1986, X = 564.2, Y = 166.6, Direction = 0},
    		ObjectChange	{Tag = "Stadtmauer06", ObjectId = 1986, X = 600.6, Y = 166.6, Direction = 0},
    		ObjectChange	{Tag = "Stadtmauer10", ObjectId = 1987, X = 525.0, Y = 387.8, Direction = 180},
    		ObjectChange	{Tag = "Stadtmauer11", ObjectId = 1987, X = 537.6, Y = 387.8, Direction = 180},
    		ObjectChange	{Tag = "Stadtmauer09", ObjectId = 1987, X = 576.8, Y = 387.8, Direction = 180},
    		ObjectChange	{Tag = "Stadtmauer08", ObjectId = 1987, X = 589.4, Y = 387.8, Direction = 180},
    		ObjectChange	{Tag = "Stadtmauer07", ObjectId = 1987, X = 602.0, Y = 387.8, Direction = 180},
    		ObjectChange	{Tag = "Stadtmauer12", ObjectId = 1986, X = 481.6, Y = 467.6, Direction = 90},  
    		--Türme   		
    		ObjectChange	{Tag = "Tower01", ObjectId = 1985, X = 299.6, Y = 215.6, Direction = 180},
    		ObjectChange	{Tag = "Tower02", ObjectId = 1985, X = 353.585, Y = 216.084, Direction = 180},
    		ObjectChange	{Tag = "Tower03", ObjectId = 1985, X = 378.001, Y = 250.686, Direction = 180},
    		ObjectChange	{Tag = "Tower04", ObjectId = 1985, X = 414.068, Y = 318.891, Direction = 0},
    		ObjectChange	{Tag = "Tower05", ObjectId = 1985, X = 478.948, Y = 463.475, Direction = 0},
    		ObjectChange	{Tag = "Tower06", ObjectId = 1985, X = 492.8, Y = 446.6, Direction = 315},
    		ObjectChange	{Tag = "Tower07", ObjectId = 1985, X = 550.2, Y = 173.6, Direction = 180},
    		ObjectChange	{Tag = "Tower08", ObjectId = 1985, X = 576.8, Y = 173.6, Direction = 180},
    		ObjectChange	{Tag = "Tower09", ObjectId = 1985, X = 604.8, Y = 173.6, Direction = 180},
    		ObjectChange	{Tag = "Tower11", ObjectId = 1985, X = 537.6, Y = 385, Direction = 0},
    		ObjectChange	{Tag = "Tower12", ObjectId = 1985, X = 560, Y = 385, Direction = 0},
    		ObjectChange	{Tag = "Tower13", ObjectId = 1985, X = 287.311, Y = 305.361, Direction = 90},
    		ObjectChange	{Tag = "Tower14", ObjectId = 1985, X = 323.055, Y = 308.782, Direction = 180},
    		ObjectChange	{Tag = "Tower15", ObjectId = 1985, X = 246.506, Y = 349.77, Direction = 180},
    		ObjectChange	{Tag = "Tower16", ObjectId = 1985, X = 408.073, Y = 287.513, Direction = 180},
    		
    		
    	
    		AvatarFlagSetTrue{Name = "af_P300_WestguardSet6Built"},
    		AvatarFlagSetTrue{Name = "af_P300_WestguardSet6ThanksGiving"},
    		DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			DialogSetEnabled	{Tag = "VerwalterUtrecht" },
  			--MapValueSubtract	{Name = "mv_PlattformChange", Value = 1},
  			
  			--Startet die Cutszene
			MapFlagSetTrue {Name = "mf_P300_Cutscene_Expansion_Walls"},
       	},
  },
  OnOneTimeEvent
   {
    	
    	-- Burgbau  sofort
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P300_BurgBauActiv"}, 
    		AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
    	},
    	Actions =
    	{
    		
    	
    		--Burgmauer
    		ObjectSpawn	{ObjectId = 1979, X = 308, Y = 321, Direction = 0, Tag = "BurgmauerTeil01"},
    		ObjectSpawn	{ObjectId = 1981, X = 336, Y = 349, Direction = 90, Tag = "BurgmauerTeil02"},
    		ObjectSpawn	{ObjectId = 1979, X = 336, Y = 357, Direction = 90, Tag = "BurgmauerTeil03"},
    		ObjectSpawn	{ObjectId = 1980, X = 308, Y = 385, Direction = 0, Tag = "BurgmauerTeil04"},
    		ObjectSpawn	{ObjectId = 1982, X = 300, Y = 385, Direction = 0, Tag = "BurgmauerTeil05"},
    		ObjectSpawn	{ObjectId = 1981, X = 272, Y = 357, Direction = 270, Tag = "BurgmauerTeil06"},
    		ObjectSpawn	{ObjectId = 1982, X = 272, Y = 349, Direction = 90, Tag = "BurgmauerTeil07"},
    		ObjectSpawn	{ObjectId = 1981, X = 300, Y = 321, Direction = 0, Tag = "BurgmauerTeil08"},
			
			--BurgmauerTürme
			ObjectSpawn	{ObjectId = 1985, X = 316, Y = 324, Direction = 270, Tag = "BurgmauerTurml01"},
			ObjectSpawn	{ObjectId = 1985, X = 337, Y = 340, Direction = 180, Tag = "BurgmauerTurml02"},
			ObjectSpawn	{ObjectId = 1985, X = 333, Y = 365, Direction = 0, Tag = "BurgmauerTurml03"},
			ObjectSpawn	{ObjectId = 1985, X = 316, Y = 386, Direction = 270, Tag = "BurgmauerTurml04"},
			ObjectSpawn	{ObjectId = 1985, X = 287, Y = 386, Direction = 270, Tag = "BurgmauerTurml05"},
			ObjectSpawn	{ObjectId = 1985, X = 270.5, Y = 365, Direction = 0, Tag = "BurgmauerTurml06"},
			ObjectSpawn	{ObjectId = 1985, X = 274.7, Y = 340, Direction = 180, Tag = "BurgmauerTurml07"},
			ObjectSpawn	{ObjectId = 1985, X = 287, Y = 324, Direction = 270, Tag = "BurgmauerTurml08"},
			AvatarFlagSetTrue{Name = "af_P300_WestguardCastleWallThanksGiving"},
			DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			DialogSetEnabled	{Tag = "VerwalterUtrecht" },
			--MapValueSubtract	{Name = "mv_PlattformChange", Value = 1},
			
			--Startet die Cutszene
			MapFlagSetTrue {Name = "mf_P300_Cutscene_Expansion_Castle"},
       	},
  },
   --Dialogabschalten Warrad
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_Infodialog01Finished"},
			MapFlagIsTrue{Name = "mf_Infodialog02Finished"},
     		AvatarFlagIsFalse{Name = "af_P300_WestguardStartBuildingQuestWell"},
     		MapFlagIsTrue{Name = "mf_WalkHome"},
   		}, 		
    	Actions =
    	{
    		DialogSetDisabled	{Tag = "Warrad"},
    		
       	},
   }, 
   --Dialogabschalten Warrad, wenn Kara angenommena ber keine Buildquest
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_Infodialog01Finished"},
			MapFlagIsTrue{Name = "mf_Infodialog02Finished"},
     		AvatarFlagIsFalse{Name = "af_P300_WestguardStartBuildingQuestWell"},
     		AvatarFlagIsFalse{Name = "af_P300_WestguardStartBuildingQuestSet55"},
				AvatarFlagIsFalse{Name = "af_P300_WestguardStartBuildingQuestSet6"},
				AvatarFlagIsFalse{Name = "af_P300_WestguardStartBuildingQuestCastleWalls"},
    		OR{
    			QuestIsKnown{Quest = "TalkToBaruGF"},
    			MapFlagIsTrue{Name = "mf_KaraQuestSolved"},
    		},
   		}, 		
    	Actions =
    	{
    		DialogSetDisabled	{Tag = "Warrad"},
    		
       	},
   },


      --Dialogabschalten Warrad, Annahme Brunnenbau
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_Infodialog01Finished"},
			MapFlagIsTrue{Name = "mf_Infodialog02Finished"},
     		AvatarFlagIsTrue{Name = "af_P300_BrunnenBauActiv"},
     		OR{
    			QuestIsKnown{Quest = "TalkToBaruGF"},
    			MapFlagIsTrue{Name = "mf_KaraQuestSolved"},
    		},
   		}, 		
    	Actions =
    	{
    		DialogSetDisabled	{Tag = "Warrad"},
    		
       	},
   }, 
   
         --Dialogabschalten Warrad
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_Infodialog01Finished"},
			MapFlagIsTrue{Name = "mf_Infodialog02Finished"},
     		AvatarFlagIsTrue{Name = "af_P300_DenkmalBauActiv"},
     		OR{
    			QuestIsKnown{Quest = "TalkToBaruGF"},
    			MapFlagIsTrue{Name = "mf_KaraQuestSolved"},
    		},
   		}, 		
    	Actions =
    	{
    		DialogSetDisabled	{Tag = "Warrad"},
    		
       	},
   }, 
  
           --Dialogabschalten Warrad
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_Infodialog01Finished"},
			MapFlagIsTrue{Name = "mf_Infodialog02Finished"},
     		AvatarFlagIsTrue{Name = "af_P300_StadmauerBauActiv"},
     		OR{
    			QuestIsKnown{Quest = "TalkToBaruGF"},
    			MapFlagIsTrue{Name = "mf_KaraQuestSolved"},
    		},
   		}, 		
    	Actions =
    	{
    		DialogSetDisabled	{Tag = "Warrad"},
    		
       	},
   }, 
   
              --Dialogabschalten Warrad
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_Infodialog01Finished"},
			MapFlagIsTrue{Name = "mf_Infodialog02Finished"},
     		AvatarFlagIsTrue{Name = "af_P300_BurgBauActiv"},
     		OR{
    			QuestIsKnown{Quest = "TalkToBaruGF"},
    			MapFlagIsTrue{Name = "mf_KaraQuestSolved"},
    		},
   		}, 		
    	Actions =
    	{
    		DialogSetDisabled	{Tag = "Warrad"},
    		
       	},
   }, 
  
   --Ende der Bauquests bei Warrad
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_Infodialog01Finished"},
			MapFlagIsTrue{Name = "mf_Infodialog02Finished"},
     		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuildWell"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuildMonument"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuild6"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuildCastleWalls"},
   		}, 		
    	Actions =
    	{
    		DialogSetDisabled	{Tag = "Warrad"},
    		
       	},
   }, 
  
--*******************************************************
--***                                                 ***
--***           Stadtentwicklung Gebäudebau Ende      ***
--***                                                 ***
--*******************************************************   
  
  
  --Westguard von den Dämonen befreit
  OnOneTimeEvent
   {
    	Conditions =
    	{
    		SetUpdateInterval {Steps = 10},
    		QuestIsActive	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},
    		MapFlagIsTrue {Name = "mf_DemonSpawn01Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_DemonSpawn02Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_DemonSpawn03Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_DemonSpawn04Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_DemonSpawn05Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_DemonSpawn06Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_DemonSpawn07Gestartet"}, 
    		FigureIsDead	{Tag = "Demon01"},
    		FigureIsDead	{Tag = "Demon02"},
    		FigureIsDead	{Tag = "Demon03"},
    		FigureIsDead	{Tag = "Demon04"},
    		FigureIsDead	{Tag = "Demon05"},
    		FigureIsDead	{Tag = "Demon06"},
    		FigureIsDead	{Tag = "Demon07"},
       	},
    	Actions =
    	{
    		AvatarFlagSetTrue {Name = "af_P300_WestguardDemonsDefeated"},
    		MapFlagSetTrue{Name = "mf_Infodialog01Finished"},  	
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},
       	},
  }, 
  --Westguard von den Dämonen befreit aber ohne von Warrad den Auftrag bekommen zu haben
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		SetUpdateInterval {Steps = 10},
    		MapFlagIsTrue {Name = "mf_DemonSpawn01Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_DemonSpawn02Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_DemonSpawn03Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_DemonSpawn04Gestartet"},
    		MapFlagIsTrue {Name = "mf_DemonSpawn05Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_DemonSpawn06Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_DemonSpawn07Gestartet"}, 
    		FigureIsDead	{Tag = "Demon01"},
    		FigureIsDead	{Tag = "Demon02"},
    		FigureIsDead	{Tag = "Demon03"},
    		FigureIsDead	{Tag = "Demon04"},
    		FigureIsDead	{Tag = "Demon05"},
    		FigureIsDead	{Tag = "Demon06"},
    		FigureIsDead	{Tag = "Demon07"},
    	},
    	Actions =
    	{
    		
    		AvatarFlagSetTrue {Name = "af_P300_WestguardDemonsDefeated"},
    		--AvatarFlagSetTrue{Name = "af_P300_WestguardUtrechtTalked"}, 
    		AvatarFlagSetTrue{Name = "af_P300_StartBuildingQuestsUtrecht"}, 
    		MapFlagSetTrue{Name = "mf_Infodialog01Finished"},  
    		MapFlagSetTrue{Name = "mf_DemonsDefeatedWithoutQuest"},	
       	},
  }, 
  
  --Spieler bekommt Einheiten, wenn er die Dämonen getötet hat ohne eine Quest
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_DemonsDefeatedWithoutQuest"},
    		QuestIsActive	{Player = "pl_Human", Quest = "WestguardRepairBuildings1"},
    		MapFlagIsTrue{Name = "mf_EinmalNoRepair"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue{Name = "mf_Worker01Spawn"},  
    		MapFlagSetTrue{Name = "mf_Worker02Spawn"},	
    		MapFlagSetTrue{Name = "mf_Worker03Spawn"},  
    		MapFlagSetTrue{Name = "mf_Worker04Spawn"},	
    		MapFlagSetTrue{Name = "mf_Worker05Spawn"},  
    		MapFlagSetTrue{Name = "mf_Worker06Spawn"},	
    		MapFlagSetTrue{Name = "mf_Worker07Spawn"},  
    		MapFlagSetTrue{Name = "mf_Worker08Spawn"},	
    		MapFlagSetTrue{Name = "mf_Worker09Spawn"},	
    		MapFlagSetTrue{Name = "mf_Worker10Spawn"},  
    		MapFlagSetTrue{Name = "mf_Worker11Spawn"},	
    		MapFlagSetTrue{Name = "mf_Worker12Spawn"}, 
    		
       	},
  }, 
  --Spieler bekommt Einheiten, wenn er die Dämonen getötet hat ohne eine Quest
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		SetUpdateInterval {Steps = 10},
    		MapFlagIsTrue{Name = "mf_DemonsDefeatedWithoutQuest"},
    		QuestIsActive	{Player = "pl_Human", Quest = "WestguardRepairBuildings1"},
    		MapFlagIsTrue {Name = "mf_WorkerSpawn01Gestartet"},
    		MapFlagIsTrue {Name = "mf_WorkerSpawn02Gestartet"},
    		MapFlagIsTrue {Name = "mf_WorkerSpawn03Gestartet"},
    		MapFlagIsTrue {Name = "mf_WorkerSpawn04Gestartet"},
    		MapFlagIsTrue {Name = "mf_WorkerSpawn05Gestartet"},
    		MapFlagIsTrue {Name = "mf_WorkerSpawn06Gestartet"},
    		MapFlagIsTrue {Name = "mf_WorkerSpawn07Gestartet"},
    		MapFlagIsTrue {Name = "mf_WorkerSpawn08Gestartet"},
    		MapFlagIsTrue {Name = "mf_WorkerSpawn09Gestartet"},
    		MapFlagIsTrue {Name = "mf_WorkerSpawn10Gestartet"},
    		MapFlagIsTrue {Name = "mf_WorkerSpawn11Gestartet"},
    		MapFlagIsTrue {Name = "mf_WorkerSpawn12Gestartet"},
    		MapFlagIsTrue{Name = "mf_EinmalNoRepair"},
    		 
    	},
    	Actions =
    	{
    	
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerWorker01"}, 
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerWorker02"}, 
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerWorker03"}, 
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerWorker04"}, 
    		MapFlagSetTrue{Name = "mf_WorkerGoWorking"},  
       	},
  }, 
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_WorkerGoWorking"},
    		QuestIsActive	{Player = "pl_Human", Quest = "WestguardRepairBuildings1"},
    	},
    	Actions =
    	{
    		FigureRun	{Tag = "Worker03", X = 646, Y = 530},  
    		FigureRun	{Tag = "Worker04", X = 559, Y = 540},
    		FigureRun	{Tag = "Worker08", X = 421, Y = 63}, 
       	},
  }, 
     --Schutz für Gebäude Mondsilberschmiede
  OnEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_DemonSpawn"}, 
    		BuildingHasNotHealth	{Tag = "Moonsilverbuilding01", Percent = 30},
    		--QuestIsActive	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},
    	},
    	Actions =
    	{
    		BuildingHealthSet	{Tag = "Moonsilverbuilding01", Percent = 70},
    		
       	},
  }, 
      --Schutz für Gebäude Farm 01
  OnEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_DemonSpawn"}, 
    		BuildingHasNotHealth	{Tag = "Farm01", Percent = 30},
    		--QuestIsActive	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},
    	},
    	Actions =
    	{
    		BuildingHealthSet	{Tag = "Farm01", Percent = 70},
    		
       	},
  }, 
       --Schutz für Gebäude Farm 05
  OnEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_DemonSpawn"}, 
    		BuildingHasNotHealth	{Tag = "Farm05", Percent = 30},
    		--QuestIsActive	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},
    	},
    	Actions =
    	{
    		BuildingHealthSet	{Tag = "Farm05", Percent = 70},
    		
       	},
  }, 
   --Sobald ein Dämon getötet wurde spawnen Arbeiter, nach Outcry werden sie dem Spieler übergeben
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_DemonSpawn01Gestartet"}, 
    		MapFlagIsFalse{Name = "mf_DemonsDefeatedWithoutQuest"},
    		FigureIsDead	{Tag = "Demon01"},
    		QuestIsActive	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},
    		
    		
    	},
    	Actions =
    	{
    		MapFlagSetTrue{Name = "mf_Worker05Spawn"},  
    		MapFlagSetTrue{Name = "mf_Worker06Spawn"},	
    		
       	},
  }, 
  
   --Sobald alle Worker gespawned sind kommt ein Outcry vom Spieler und die Worker machen sich wieder an die Arbeit
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_WorkerSpawn05Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_WorkerSpawn06Gestartet"}, 
    		QuestIsActive	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},
    		MapFlagIsFalse{Name = "mf_DemonsDefeatedWithoutQuest"},
    	},
    	Actions =
    	{
    		FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar01"},
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerWorker01"},    
       	},
  }, 
  
    --Sobald Dämon 02 getötet wurde spawnen Arbeiter, nach Outcry werden sie dem Spieler übergeben
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_DemonSpawn02Gestartet"}, 
    		FigureIsDead	{Tag = "Demon02"},
    		QuestIsActive	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},
    		MapFlagIsFalse{Name = "mf_DemonsDefeatedWithoutQuest"},
    		
    	},
    	Actions =
    	{
    		MapFlagSetTrue{Name = "mf_Worker01Spawn"},  
    		MapFlagSetTrue{Name = "mf_Worker02Spawn"},	
    		MapFlagSetTrue{Name = "mf_Worker03Spawn"},  
    		MapFlagSetTrue{Name = "mf_Worker04Spawn"},	
    		
       	},
  }, 
    --Sobald alle Worker gespawned sind kommt ein Outcry vom Spieler und die Worker machen sich wieder an die Arbeit
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_WorkerSpawn01Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_WorkerSpawn02Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_WorkerSpawn03Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_WorkerSpawn04Gestartet"}, 
    		QuestIsActive	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},
    		MapFlagIsFalse{Name = "mf_DemonsDefeatedWithoutQuest"},
    	},
    	Actions =
    	{
    		FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar01"},
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerWorker02"},    
    		FigureRun	{Tag = "Worker03", X = 646, Y = 530},  
    		FigureRun	{Tag = "Worker04", X = 559, Y = 540},
       	},
  }, 
    --Sobald Dämon 03 getötet wurde spawnen Arbeiter, nach Outcry werden sie dem Spieler übergeben
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_DemonSpawn03Gestartet"}, 
    		FigureIsDead	{Tag = "Demon03"},
    		QuestIsActive	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},
    		MapFlagIsFalse{Name = "mf_DemonsDefeatedWithoutQuest"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue{Name = "mf_Worker07Spawn"},  
    		MapFlagSetTrue{Name = "mf_Worker08Spawn"},	
    		MapFlagSetTrue{Name = "mf_Worker09Spawn"},	
       	},
  },
    --Sobald alle Worker gespawned sind kommt ein Outcry vom Spieler und die Worker machen sich wieder an die Arbeit
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_WorkerSpawn07Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_WorkerSpawn08Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_WorkerSpawn09Gestartet"}, 
    		QuestIsActive	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},
    		MapFlagIsFalse{Name = "mf_DemonsDefeatedWithoutQuest"},
    		
    	},
    	Actions =
    	{
    		FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar01"},
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerWorker03"},  
    		FigureRun	{Tag = "Worker08", X = 421, Y = 63},  
       	},
  },  
    --Sobald Dämon 04 getötet wurde spawnen Arbeiter, nach Outcry werden sie dem Spieler übergeben
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_DemonSpawn04Gestartet"}, 
    		FigureIsDead	{Tag = "Demon04"},
    		QuestIsActive	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},
    		MapFlagIsFalse{Name = "mf_DemonsDefeatedWithoutQuest"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue{Name = "mf_Worker10Spawn"},  
    		MapFlagSetTrue{Name = "mf_Worker11Spawn"},	
    		MapFlagSetTrue{Name = "mf_Worker12Spawn"},  
    	
       	},
  }, 
   --Sobald alle Worker gespawned sind kommt ein Outcry vom Spieler und die Worker machen sich wieder an die Arbeit
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_WorkerSpawn10Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_WorkerSpawn11Gestartet"}, 
    		MapFlagIsTrue {Name = "mf_WorkerSpawn12Gestartet"}, 
    		QuestIsActive	{Player = "pl_Human", Quest = "WestguardDefeatDemons"},
    		MapFlagIsFalse{Name = "mf_DemonsDefeatedWithoutQuest"},
    		
    	},
    	Actions =
    	{
    		FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar01"},
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerWorker04"},    
       	},
  },  
   --Playerkitübergabe nachdem der Verwalter dem Spieler das Lehen übergibt
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_PlayerkitStart"},
    	},
    	Actions =
    	{
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerBuilding"},    
    		--Brennende Gebäude
				--BuildingHealthSet	{Tag = "Castle", Percent = 20},
				BuildingHealthSet	{Tag = "Farm01", Percent = 70},
				--BuildingHealthSet	{Tag = "Farm02", Percent = 20},
				BuildingHealthSet	{Tag = "Farm03", Percent = 70},
				--BuildingHealthSet	{Tag = "Farm04", Percent = 20},
				BuildingHealthSet	{Tag = "Farm05", Percent = 70},
				BuildingHealthSet	{Tag = "Sawmill01", Percent = 70},
				BuildingHealthSet	{Tag = "Lenia01", Percent = 70},
				--BuildingHealthSet	{Tag = "Steinbruch01", Percent = 20},
				BuildingHealthSet	{Tag = "Moonsilverbuilding01", Percent = 70},
    			--BuildingHealthSet	{Tag = "Schmelze01", Percent = 20},	
    			
       	},
  }, 
    --Playerkitübergabe nach der Repair Queste
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardRepairBuildings1"},
    	},
    	Actions =
    	{
 			 MapFlagSetTrue{Name = "mf_PlayerkitStart2"}, 
 			 AvatarFlagSetTrue{Name = "af_P300_RepairThanksGiving"},
 			 BuildingAbilityRemove	{Tag = "Farm01", AbilityId = Ability.Immortal},
 			 BuildingAbilityRemove	{Tag = "Farm03", AbilityId = Ability.Immortal},
 			 BuildingAbilityRemove	{Tag = "Farm05", AbilityId = Ability.Immortal},
 			 BuildingAbilityRemove	{Tag = "Sawmill01", AbilityId = Ability.Immortal}, 			
 			 BuildingAbilityRemove	{Tag = "Lenia01", AbilityId = Ability.Immortal},
 			 --BuildingAbilityRemove	{Tag = "Schmelze01", AbilityId = Ability.Immortal},
 			 BuildingAbilityRemove	{Tag = "Moonsilverbuilding01", AbilityId = Ability.Immortal},
       	},
  }, 
  
 
  --Playerkitübergabe fürs Haupthaus nachdem der Verwalter dem Spieler das Lehen übergibt
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_PlayerkitStart2"},
    	},
    	Actions =
    	{
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerBuilding2"},    
    		FigureRtsKitSpawn	{UnitId = 69, Level = 5, X = 513, Y = 352, PlayerKit = "pk_NewWorker"},	 
 			FigureRtsKitSpawn	{UnitId = 69, Level = 5, X = 513, Y = 350, PlayerKit = "pk_NewWorker"},	 
 			FigureRtsKitSpawn	{UnitId = 69, Level = 5, X = 513, Y = 348, PlayerKit = "pk_NewWorker"},	 
 			FigureRtsKitSpawn	{UnitId = 69, Level = 5, X = 513, Y = 346, PlayerKit = "pk_NewWorker"},	 
 			FigureRtsKitSpawn	{UnitId = 69, Level = 5, X = 513, Y = 344, PlayerKit = "pk_NewWorker"},	 
 			MapTimerStart	{Name = "mt_playerkitNewWorkerTimer"},
       	},
  }, 
   --Playerkitübergabe für New Worker
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_playerkitNewWorkerTimer", Seconds = 3},
    	},
    	Actions =
    	{
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_NewWorker"},    
       	},
  }, 
   --Gebäude repariert 
    OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		AvatarFlagIsTrue {Name = "af_P300_WestguardDemonsDefeated"},  
    		--BuildingHasHealth	{Tag = "Castle", Percent = 100},
    		BuildingHasHealth	{Tag = "Farm01", Percent = 100},
    		--BuildingHasHealth	{Tag = "Farm02", Percent = 100},
    		BuildingHasHealth	{Tag = "Farm03", Percent = 100},
    		--BuildingHasHealth	{Tag = "Farm04", Percent = 100},
    		BuildingHasHealth	{Tag = "Farm05", Percent = 100},
    		BuildingHasHealth	{Tag = "Sawmill01", Percent = 100},
    		BuildingHasHealth	{Tag = "Lenia01", Percent = 100},
    		--BuildingHasHealth	{Tag = "Steinbruch01", Percent = 100},
    		BuildingHasHealth	{Tag = "Moonsilverbuilding01", Percent = 100},
    		--BuildingHasHealth	{Tag = "Schmelze01", Percent = 100},
    		
      	},
    	Actions =
    	{
    		AvatarFlagSetTrue{Name = "af_P300_WestguardBuildingsWesthomeRepaired"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardRepairBuildings1"},
    		DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			DialogSetEnabled	{Tag = "VerwalterUtrecht" },
       	},
  }, 
   
  --BuiltQuest01 Schmiede gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet1"},
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 128, Amount = 1, OnlyCompleted = true},
    		
    	},
    	Actions =
    	{
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuildSmithy"},		
       	},
  }, 
   --BuiltQuest01 Alchemist gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet1"},
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 118, Amount = 1, OnlyCompleted = true},
    	},
    	Actions =
    	{
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuildAlchemist"},		
       	},
  }, 
   --BuiltQuest01 Altar des Lebens gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet1"},
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 122, Amount = 1, OnlyCompleted = true},
    	},
    	Actions =
    	{
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuildAltarOfLife"},		
       	},
  }, 
    --BuiltQuest01 erfüllt
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsFalse{Name = "mf_BuiltQuest01withoutQuestsolved"},	
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet1"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuildSmithy"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuildAlchemist"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuildAltarOfLife"},
    		
    	},
    	Actions =
    	{
    		 --AvatarFlagSetTrue{Name = "af_P300_WestguardSet1Built"},
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuild1"},
    		 AvatarFlagSetTrue{Name = "af_P300_WestguardSet1ThanksGiving"},	
    		 DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			 DialogSetEnabled	{Tag = "VerwalterUtrecht" },	
       	},
  }, 
  --BuiltQuest01 alles ohne Quest gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 118, Amount = 1, OnlyCompleted = true},
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 128, Amount = 1, OnlyCompleted = true},
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 122, Amount = 1, OnlyCompleted = true},
    		
    	},
    	Actions =
    	{
    		MapFlagSetTrue{Name = "mf_BuiltQuest01withoutQuestsolved"},	
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuild1"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuildSmithy"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuildAlchemist"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuildAltarOfLife"},	
    		
    		DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			DialogSetEnabled	{Tag = "VerwalterUtrecht" },	
    		
       	},
  }, 
  --BuiltQuest02 erfüllt 20 Units gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet2"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet1Built"},	
    		PlayerHasFigureAmountEx	{Player = "pl_Human", Amount = 20, CountWorkers = false, CountAvatarAndHeroes = false},
    	},
    	Actions =
    	{
    		  QuestSetSolved	{Player = "pl_Human", Quest = "WestguardRecruit20Units"},		
       	},
  },  
  --BuiltQuest02 erfüllt 5 Türme gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet2"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet1Built"},	
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 120, Amount = 5, OnlyCompleted = true},	
    	},
    	Actions =
    	{
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuildTowers"},		
       	},
  },  
    
  --BuiltQuest02 erfüllt
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsFalse{Name = "mf_BuiltQuest02withoutQuestsolved"},	
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet2"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet1Built"},	
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardRecruit20Units"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuildTowers"},
    		
    	},
    	Actions =
    	{
    		--AvatarFlagSetTrue{Name = "af_P300_WestguardSet2Built"},	
    		 AvatarFlagSetTrue{Name = "af_P300_WestguardSet2ThanksGiving"},		
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuild2"},
    		 MapFlagSetTrue{Name = "mf_Einwohner01"},
    		 MapValueAdd	{Name = "mv_PlattformChange", Value = 1}, 	
    		 
    		 DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			 DialogSetEnabled	{Tag = "VerwalterUtrecht" },
			 	
       	},
  }, 
   --BuiltQuest02 alles ohne Quest gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		PlayerHasFigureAmountEx	{Player = "pl_Human", Amount = 20, CountWorkers = false, CountAvatarAndHeroes = false},
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 120, Amount = 5, OnlyCompleted = true},	
    	},
    	Actions =
    	{
    		MapFlagSetTrue{Name = "mf_BuiltQuest02withoutQuestsolved"},	
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuild2"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardRecruit20Units"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuildTowers"},
    		MapFlagSetTrue{Name = "mf_Einwohner01"},
    		MapValueAdd	{Name = "mv_PlattformChange", Value = 1},	
    		
    		DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			DialogSetEnabled	{Tag = "VerwalterUtrecht" },	
       	},
  }, 
  --BuiltQuest03 Farmupgrade gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		
      		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet3"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet2Built"},	
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 130, UpgradeId = 009, Amount = 2, OnlyCompleted = true},
    	},
    	Actions =
    	{
       		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardCattleUpgrades"},	
       	},
  }, 
  --BuiltQuest03 Zwergenupgrade Haupthaus gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
      		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet3"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet2Built"},	
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 131, UpgradeId = 013, Amount = 1, OnlyCompleted = true},
    	},
    	Actions =
    	{
       		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardDwarfUpgrade"},	
       	},
  }, 
   --BuiltQuest03 Elfenupgrade Haupthaus gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
      		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet3"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet2Built"},	
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 131, UpgradeId = 012, Amount = 1, OnlyCompleted = true},
    	},
    	Actions =
    	{
       		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardElfUpgrade"},	
       	},
  }, 
  
  --BuiltQuest03 erfüllt
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsFalse{Name = "mf_BuiltQuest03withoutQuestsolved"},
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet3"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet2Built"},	
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardCattleUpgrades"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardDwarfUpgrade"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardElfUpgrade"},
    		
    	},
    	Actions =
    	{
    		 AvatarFlagSetTrue{Name = "af_P300_WestguardSet3ThanksGiving"},
    		 AvatarFlagSetTrue{Name = "af_P300_WestguardSet3Built"},	
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuild3"},	
    		 AvatarFlagSetTrue{Name = "af_P300_YliaSpawn"}, 
    		 AvatarFlagSetTrue{Name = "af_P300_WindhammerSpawn"}, 
    		 DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			 DialogSetEnabled	{Tag = "VerwalterUtrecht" },
       	},
  }, 
   --BuiltQuest03 alles ohne Quest gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 130, UpgradeId = 009, Amount = 2, OnlyCompleted = true},
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 131, UpgradeId = 013, Amount = 1, OnlyCompleted = true},
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 131, UpgradeId = 012, Amount = 1, OnlyCompleted = true},
    	},
    	Actions =
    	{
    		MapFlagSetTrue{Name = "mf_BuiltQuest03withoutQuestsolved"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuild3"},	
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardCattleUpgrades"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardDwarfUpgrade"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardElfUpgrade"},
    				
    		DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			DialogSetEnabled	{Tag = "VerwalterUtrecht" },	
       	},
  }, 
  --BuiltQuest04 Elfenfestung gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet4"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet3Built"},	
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 123, Amount = 1, OnlyCompleted = true},
    	},
    	Actions =
    	{
    		
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuildElvenFortress"},		
       	},
  }, 
  
   --BuiltQuest04 Kriegerhalle gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet4"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet3Built"},	
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 121, Amount = 1, OnlyCompleted = true},
    	},
    	Actions =
    	{
    		
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuildWarriorGuild"},		
       	},
  }, 
   

  --BuiltQuest04 erfüllt
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsFalse{Name = "mf_BuiltQuest04withoutQuestsolved"},	
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet4"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet3Built"},	
     		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuildElvenFortress"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuildWarriorGuild"},
    	},
    	Actions =
    	{
    		 AvatarFlagSetTrue{Name = "af_P300_WestguardSet4Built"},
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuild4"},	
    		 MapFlagSetTrue{Name = "mf_Einwohner02"}, 	
    		 FigureOutcry	{Tag = "VerwalterUtrecht", TextTag = "Verwalter01"},
    		 AvatarFlagSetTrue{Name = "af_P300_WestguardSet4ThanksGiving"},
    		 DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			 DialogSetEnabled	{Tag = "VerwalterUtrecht" },
       	},
  }, 
   --BuiltQuest04 alles ohne Quest gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    	
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 123, Amount = 1, OnlyCompleted = true},
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 121, Amount = 1, OnlyCompleted = true},
    	},
    	Actions =
    	{
    		MapFlagSetTrue{Name = "mf_BuiltQuest04withoutQuestsolved"},	
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuild4"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuildElvenFortress"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuildWarriorGuild"},
    		MapFlagSetTrue{Name = "mf_Einwohner02"}, 	
    		MapValueAdd	{Name = "mv_PlattformChange", Value = 1},
    		
    		DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			DialogSetEnabled	{Tag = "VerwalterUtrecht" },	
       	},
  }, 
  --BuiltQuest05 ZwergenSchmiede errichtet
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet5"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet4Built"},	
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 126, Amount = 1, OnlyCompleted = true},
    	},
    	Actions =
    	{
    		
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestgruradBuildDwarvenForge"},		
       	},
  },  
  
  --BuiltQuest05 ElenSchrein errichtet
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet5"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet4Built"},	
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 125, Amount = 1, OnlyCompleted = true},
    	},
    	Actions =
    	{
    		
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuildElenshrine"},		
       	},
  },  
  --   BuiltQuest05 Zwergenturmupgrades gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet5"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet4Built"},
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 120, UpgradeId = 006, Amount = 1, OnlyCompleted = true},
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 120, UpgradeId = 008, Amount = 1, OnlyCompleted = true},
    	},
    	Actions =
    	{
    		
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardImproveDefense"},		
       	},
  }, 
  --BuiltQuest05 erfüllt
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		MapFlagIsFalse{Name = "mf_BuiltQuest05withoutQuestsolved"},	
    		AvatarFlagIsTrue	{Name = "af_P300_WestguardStartBuildingQuestSet5"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet4Built"},	
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardImproveDefense"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestgruradBuildDwarvenForge"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuildElenshrine"},
    	},
    	Actions =
    	{
    		
    		 AvatarFlagSetTrue{Name = "af_P300_WestguardSet5ThanksGiving"},
    		 AvatarFlagSetTrue{Name = "af_P300_WestguardSet5Built"},
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuild5"},
    		 DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			 DialogSetEnabled	{Tag = "VerwalterUtrecht" },
    		
    		
				
    		
       	},
  }, 
   --BuiltQuest05 alles ohne Quest gebaut
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 126, Amount = 1, OnlyCompleted = true},
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 125, Amount = 1, OnlyCompleted = true},
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 120, UpgradeId = 006, Amount = 1, OnlyCompleted = true},
    		PlayerHasBuilding	{Player = "pl_Human", BuildingId = 120, UpgradeId = 008, Amount = 1, OnlyCompleted = true},
    		
    	},
    	Actions =
    	{
    		MapFlagSetTrue{Name = "mf_BuiltQuest05withoutQuestsolved"},	
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuild5"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardImproveDefense"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestgruradBuildDwarvenForge"},
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuildElenshrine"},	
    		AvatarFlagSetTrue{Name = "af_P300_WestguardSet5Built"},
    		DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			DialogSetEnabled	{Tag = "VerwalterUtrecht" },	
       	},
  }, 

  --Westguard Armee wurde gebaut
  OnOneTimeEvent
   {
    	Conditions =
    	{
    		PlayerHasFigureAmountEx	{Player = "pl_Human", Amount = 60, CountWorkers = false, CountAvatarAndHeroes = false},
    	},
    	Actions =
    	{
    		QuestSetSolved	{Player = "pl_Human", Quest = "WestguardBuild60Soldiers"},
			
       	},
  }, 
  
--*******************************************************
--***                                                 ***
--***           	KI Angriffe    			          ***
--***                                                 ***
--******************************************************* 

    --Untote greifen an, wenn die Schutztruppen gebaut wurden
  OnOneTimeEvent
   {
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P300_WestguardSet5RewardReceived"},
    	},
    	Actions =
    	{
    		--AvatarFlagSetTrue{Name = "af_P300_WestguardUndeadAttack"},
    		DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			DialogSetEnabled	{Tag = "VerwalterUtrecht" },
			
       	},
  }, 
    --Untote greifen an nach Dialog mit Utrecht
  OnOneTimeEvent
   {
    	
    	
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P300_WestguardStartQuestUndeadDefense"}, 
    		AvatarIsNotTalking	{},	GameInterfaceIsVisible	{},
    	},
    	Actions =
    	{
    		
    		--Untotenangriff
    		FigureVanish	{Tag = "SkeletonWorker01"},
    		FigureVanish	{Tag = "SkeletonWorker02"},
    		FigureVanish	{Tag = "SkeletonWorker03"},
    		FigureVanish	{Tag = "SkeletonWorker04"},
    		--QuestSetActive {Quest = "WestguardDefeatUndead"},
    		MapFlagSetTrue {Name = "mf_UndeadActive"},
    		ObjectVanish	{Tag = "UntotenSperre01"},
    		ObjectVanish	{Tag = "UntotenSperre02"},
    		ObjectVanish	{Tag = "UntotenSperre03"},
    		PlayerActivate	{Player = "pl_Untote"},
    		
    		--Reisesteine und Portale werden deaktiviert
    		PlayerTravelDisable	{},
			PortalDisable	{Tag = "Start_Portal_Westguard"},
       	},
  }, 
 
   --Defeat Undead Quest
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		
    		PlayerHasNotFigureAmount{Player = "pl_Untote", Amount = 5},
    		PlayerHasNotBuildingAmount	{Player = "pl_Untote", Amount = 1, OnlyCompleted = False},
       	},
    	Actions =
    	{
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardDefeatUndead"},	
    		 MapFlagSetTrue {Name = "mf_SkeletonQuestSolved"},
    		 MapFlagSetTrue{Name = "mf_Einwohner03"}, 
    		 MapValueAdd	{Name = "mv_PlattformChange", Value = 1},
    		 AvatarFlagSetTrue{Name = "af_P300_WestguardSetStatueStart"},
    		 DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			 DialogSetEnabled	{Tag = "VerwalterUtrecht" },
			 
			 --Portal und Reisesteine werden wieder begehbar gemacht
			 PlayerTravelEnable	{},
			 PortalEnable	{Tag = "Start_Portal_Westguard"},
       	},
  }, 
    
  --Defeat WacheSiebenburg Quest
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapValueIsGreater	{Name = "mv_EnemyCounter", Value = 65}, 
       	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_EinheitenSiebenburg_gesetzt"},
       	},
  },
   
   --Defeat WacheSiebenburg Quest
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_EinheitenSiebenburg_gesetzt"},
    		MapValueIsLessOrEqual	{Name = "mv_EnemyCounter", Value = 5},
       	},
    	Actions =
    	{
    		 
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardFightForFreedom"},	
    		 MapFlagSetTrue {Name = "mf_FreedomQuestSolved"},
    		 MapFlagSetTrue{Name = "mf_Einwohner04"},
    		 MapValueAdd	{Name = "mv_PlattformChange", Value = 1},
    		 AvatarFlagSetTrue{Name = "af_P300_WestguardCastleWallStart"},
    		 DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			 DialogSetEnabled	{Tag = "VerwalterUtrecht" },
			 
			 --Portal und Reisesteine werden wieder begehbar gemacht
			 PlayerTravelEnable	{},
			 PortalEnable	{Tag = "Start_Portal_Westguard"},
       	},
  }, 


   --Angriff der Ritter von Siebenburg nach Dialog mit Utrecht
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P300_WestguardStartQuestRoyalsDefense"},
    		AvatarIsNotTalking	{},	GameInterfaceIsVisible	{},
    	},	
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_WacheSiebenburgSpawn"},
    		QuestSetActive {Quest = "WestguardFightForFreedom"},
    		ObjectVanish	{Tag = "Gitter1"},
    		GateSetOpen	{Tag = "BuildingGate01"},
    		
    		--Reisesteine und Portale werden deaktiviert
    		PlayerTravelDisable	{},
			PortalDisable	{Tag = "Start_Portal_Westguard"},
			
       	},
  }, 
   
   --Defeat Beast Quest
   OnOneTimeEvent
   {
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P300_WestguardCastleWallRewardReceived"},
    	},
    	Actions =
    	{
    		DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			DialogSetEnabled	{Tag = "VerwalterUtrecht" },
			
       	},
  }, 
   
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		
    		PlayerHasNotFigureAmount{Player = "pl_Beasts", Amount = 5},
    		PlayerHasNotBuildingAmount	{Player = "pl_Beasts", Amount = 1, OnlyCompleted = False},
       	},
    	Actions =
    	{
    		 QuestSetSolved	{Player = "pl_Human", Quest = "WestguardDefeatBeasts"},	
    		 MapFlagSetTrue {Name = "mf_BeastQuestSolved"},
    		 MapFlagSetTrue{Name = "mf_Einwohner05"}, 
    		 MapValueAdd	{Name = "mv_PlattformChange", Value = 1},
    		 DialogTypeSetSideQuest	{Tag = "VerwalterUtrecht"},
			 DialogSetEnabled	{Tag = "VerwalterUtrecht" },
			 
			  --Portal und Reisesteine werden wieder begehbar gemacht
			 PlayerTravelEnable	{},
			 PortalEnable	{Tag = "Start_Portal_Westguard"},
       	},
  }, 
  
    --Angriff der Beasts
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardFightForFreedom"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuildCastleWalls"},
    		QuestIsSolved	{Player = "pl_Human", Quest = "WestguardBuild6"},
    		AvatarFlagIsTrue{Name = "af_P300_WestguardCastleWallRewardReceived"},
   		}, 		
    	Actions =
    	{
    		AvatarFlagSetTrue{Name = "af_P300_WestguardBeastsAttack"},
       	},
   }, 
    --Angriff der Beasts nach Dialog mit Utrecht
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P300_WestguardStartQuestBeastDefense"}, 
    		AvatarIsNotTalking	{},	GameInterfaceIsVisible	{},
   		}, 		
    	Actions =
    	{
    		FigureVanish	{Tag = "BeastWorker01"},
    		FigureVanish	{Tag = "BeastWorker02"},
    		FigureVanish	{Tag = "BeastWorker03"},
    		FigureVanish	{Tag = "BeastWorker04"},
    		MapFlagSetTrue {Name = "mf_BeastStart"},
    		QuestSetActive {Quest = "WestguardDefeatBeasts"},
    		ObjectVanish	{Tag = "BeastRock01"},
    		ObjectVanish	{Tag = "BeastRock02"},
    		ObjectVanish	{Tag = "BeastRock03"},
    		PlayerActivate	{Player = "pl_Beasts"},
						
			--Reisesteine und Portale werden deaktiviert
    		PlayerTravelDisable	{},
			PortalDisable	{Tag = "Start_Portal_Westguard"},
				
			--Ressourcen werden freigegeben
			ObjectVanish	{Tag = "RessourceBlock01"},
			ObjectVanish	{Tag = "RessourceBlock02"},
       	},
   }, 

  --Ende von Westguard Utrecht Dialog wird disabled
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_BeastQuestSolved"},
    		
   		}, 		
    	Actions =
    	{
    		AvatarFlagSetTrue{Name = "af_P300_WestguardSilenceUtrecht"},
    		DialogSetDisabled	{Tag = "VerwalterUtrecht"},
    		FigureOutcry	{Tag = "Ausruferin", TextTag = "Ausruferin01"},
    		FigureOutcry	{Tag = "Ausruferin", TextTag = "Ausruferin02"},
       	},
   }, 


--*******************************************************
--***                                                 ***
--***           Ylia die Elfenbotschafterin           ***
--***                                                 ***
--******************************************************* 
  
  
    --Ylia heilt verwundete Einheiten
   OnEvent
   {
    	
    	Conditions =
    	{
    		AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
    		AvatarFlagIsTrue{Name = "af_P300_YliaRecruit"},
    		MapTimerIsElapsed	{Name = "mt_TimerHeilungYlia", Seconds = 20},  
    		EntityFlagIsTrue	{Name = "ef_HeilungYliaEinmal"},
    		--FigureRaceIsInRange	{Race = 0, Range = 8, X = 447, Y = 414},
   		}, 		
    	Actions =
    	{
    		--TeamCastSpellToEntity	{Spell = 53, Power = 9, Team = "tm_Team1", TargetTag = "Ylia"},
    		FigureCastSpellToEntity	{Tag = "Ylia", Spell = 53, Power = 9, TargetTag = "Ylia"},
    		MapTimerStop	{Name = "mt_TimerHeilungYlia"},
    		EntityFlagSetFalse	{Name = "ef_HeilungYliaEinmal"},
       	},
   }, 
     --Ylia heilt verwundete Einheiten
   OnEvent
   {
    	
    	Conditions =
    	{
    		AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
    		EntityFlagIsFalse	{Name = "ef_HeilungYliaEinmal"},
    		AvatarFlagIsTrue{Name = "af_P300_YliaRecruit"},
    		
   		}, 		
    	Actions =
    	{
    		MapTimerStart	{Name = "mt_TimerHeilungYlia"},
    		EntityFlagSetTrue	{Name = "ef_HeilungYliaEinmal"},
    		
       	},
   }, 
   
   
    --Brunnen heilt Krankheien/Gift
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_YliaSegnetBrunnenFinish"},
   		}, 		
    	Actions =
    	{
    		BuildingAbilityAdd	{Tag = "BrunnenWestguard", AbilityId = 371},
       	},
   }, 
   
   
    --Denkmal verteilt MotivationsSpells
   OnOneTimeEvent
   {
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_YliaSegnetDenkmalFinish"},
   		}, 		
    	Actions =
    	{
    		--EffectStart	{Tag = "StatueWestguard", File = "Effect_Benefactions_Hit"},
    		--TeamCastSpellToEntity	{Spell = 53, Power = 15, Team = "tm_Team1", TargetTag = "StatueWestguard"},
    		--PlayerTeamTransfer	{Player = "pl_Monument", Team = "tm_Team1"},
    		--PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Monument"}, 
    		BuildingAbilityAdd	{Tag = "StatueWestguard", AbilityId = 372},
       	},
   }, 
   
--*******************************************************
--***                                                 ***
--***         Ylia die Elfenbotschafterin End         ***
--***                                                 ***
--******************************************************* 



   -- Der Spieler hat beide Entschuldigungen (Kara und Eremit) überbracht, also Quest solven und neue starten
	OnOneTimeEvent
   	{
   		Conditions =
   		{
   			QuestIsSolved {Quest = "HouseOfGreyLethosApology1"},
   			QuestIsSolved {Quest = "HouseOfGreyLethosApology2"},
   		},
   		Actions =
   		{
   			QuestSetActive {Quest = "HouseOfGreyReturnToLetho"},
   		}	
	},

--*******************************************************
--***                                                 ***
--***         			NQ Der Kult	                  ***
--***                                                 ***
--******************************************************* 
--Reisestein wird aktiviert
	OnOneTimeEvent
   	{
   		Conditions =
   		{
   			 FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Cultshrine", Range = 12},	
   		},
   		Actions =
   		{
   			PlayerTravelStoneAdd	{Tag = "KultReisestein"},
   			FogOfWarReveal	{X = 637, Y = 283, Range = 15, Height = 162},
   			MinimapAlertSetToEntity	{Tag = "KultReisestein", Type = 5},
   			
   		}	
	}, 
 
 -- Der Spieler hat beide Bücher gefunden und kommt auf die Westguard zurück.
		
	OnOneTimeEvent
   	{
   		Conditions =
   		{
   			AvatarHasItemMisc	{ItemId = 158, Amount = 1},
   			QuestIsActive	{Quest = "CultBookOfTheRedHorde"},
   			QuestIsNotSolved {Quest = "CultBookOfTheRedHorde"},
   		},
   		Actions =
   		{
   			QuestSetSolved {Quest = "CultBookOfTheRedHorde"},
   		}	
	},
	
	OnOneTimeEvent
   	{
   		Conditions =
   		{
   			AvatarHasItemMisc	{ItemId = 159, Amount = 1},
   			QuestIsActive	{Quest = "CultProphecyOfTheStewart"},
   			QuestIsNotSolved	{Quest = "CultProphecyOfTheStewart"},
   		},
   		Actions =
   		{
   			QuestSetSolved {Quest = "CultProphecyOfTheStewart"},
   		}	
	},
	
	OnOneTimeEvent
   	{
   		Conditions =
   		{
   			QuestIsSolved {Quest = "CultBookOfTheRedHorde"},
   			QuestIsSolved {Quest = "CultProphecyOfTheStewart"},
   			QuestIsNotActive {Quest = "CultReturnBooksThur"},
   	
   		
   		},
   		Actions =
   		{
   			QuestSetActive {Quest = "CultReturnBooksThur"},
   			
   		}	
	},
	OnOneTimeEvent
   	{
   		Conditions =
   		{			
   			QuestIsActive {Quest = "CultReturnBooksThur"},
   		},
   		Actions =
   		{
   			DialogTypeSetSideQuest	{Tag = "Thur"},
			DialogSetEnabled	{Tag = "Thur"},
   		}	
	},
	--SummonDemon is dead
	OnOneTimeEvent
   	{
   		Conditions =
   		{
   			QuestIsActive {Quest = "CultKillStewart"},
   			MapFlagIsTrue {Name = "mf_SummonDemonAlive"},
   			FigureIsDead	{Tag = "SummonDemon"},   	
   		},
   		Actions =
   		{
   			QuestSetSolved {Quest = "CultKillStewart"},		
   			QuestSetSolved {Quest = "WestguardTheCult"},		
   		}	
	},
	
--*******************************************************
--***                                                 ***
--***         		NQ Der Kult	End                   ***
--***                                                 ***
--******************************************************* 

--*******************************************************
--***                                                 ***
--***        Arbeitende Skeletons und Beasts          ***
--***                                                 ***
--*******************************************************   

--Arbeitendes Skelett 01
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_SkeletonWorker01Start", Seconds = 1.2},
			MapFlagIsFalse {Name = "mf_SkeletonWorker01Once"},
			FigureIsAlive	{Tag = "SkeletonWorker01"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "SkeletonWorker01", File = "base/gfx/figures/npc/figure_undead_skeleton_worker_chop_stone.ska"},
			MapFlagSetTrue {Name = "mf_SkeletonWorker01Once"},
			MapTimerStop	{Name = "mt_SkeletonWorker01Start"},
			MapTimerStart	{Name = "mt_SkeletonWorker01"},
			
		},
	},
	--Arbeitendes Skelett 01
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_SkeletonWorker01", Seconds = 1.2},
			MapFlagIsTrue {Name = "mf_SkeletonWorker01Once"},
			FigureIsAlive	{Tag = "SkeletonWorker01"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "SkeletonWorker01", File = "base/gfx/figures/npc/figure_undead_skeleton_worker_chop_stone.ska"},
			MapFlagSetFalse {Name = "mf_SkeletonWorker01Once"},
			MapTimerStop	{Name = "mt_SkeletonWorker01"},
			MapTimerStart	{Name = "mt_SkeletonWorker01Start"},
		},
	}, 
 
 --Arbeitendes Skelett 02
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_SkeletonWorker02Start", Seconds = 0.9},
			MapFlagIsFalse {Name = "mf_SkeletonWorker02Once"},
			FigureIsAlive	{Tag = "SkeletonWorker02"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "SkeletonWorker02", File = "base/gfx/figures/npc/figure_undead_skeleton_worker_chop_stone.ska"},
			MapFlagSetTrue {Name = "mf_SkeletonWorker02Once"},
			MapTimerStop	{Name = "mt_SkeletonWorker02Start"},
			MapTimerStart	{Name = "mt_SkeletonWorker02"},
			
		},
	},
	--Arbeitendes Skelett 02
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_SkeletonWorker02", Seconds = 0.9},
			MapFlagIsTrue {Name = "mf_SkeletonWorker02Once"},
			FigureIsAlive	{Tag = "SkeletonWorker02"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "SkeletonWorker02", File = "base/gfx/figures/npc/figure_undead_skeleton_worker_chop_stone.ska"},
			MapFlagSetFalse {Name = "mf_SkeletonWorker02Once"},
			MapTimerStop	{Name = "mt_SkeletonWorker02"},
			MapTimerStart	{Name = "mt_SkeletonWorker02Start"},
		},
	}, 
	
	--Arbeitendes Skelett 03
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_SkeletonWorker03Start", Seconds = 1.4},
			MapFlagIsFalse {Name = "mf_SkeletonWorker03Once"},
			FigureIsAlive	{Tag = "SkeletonWorker03"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "SkeletonWorker03", File = "base/gfx/figures/npc/figure_undead_skeleton_worker_chop_stone.ska"},
			MapFlagSetTrue {Name = "mf_SkeletonWorker03Once"},
			MapTimerStop	{Name = "mt_SkeletonWorker03Start"},
			MapTimerStart	{Name = "mt_SkeletonWorker03"},
			
		},
	},
	--Arbeitendes Skelett 01
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_SkeletonWorker03", Seconds = 1.4},
			MapFlagIsTrue {Name = "mf_SkeletonWorker03Once"},
			FigureIsAlive	{Tag = "SkeletonWorker03"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "SkeletonWorker03", File = "base/gfx/figures/npc/figure_undead_skeleton_worker_chop_stone.ska"},
			MapFlagSetFalse {Name = "mf_SkeletonWorker03Once"},
			MapTimerStop	{Name = "mt_SkeletonWorker03"},
			MapTimerStart	{Name = "mt_SkeletonWorker03Start"},
		},
	}, 
 	
 	--Arbeitendes Skelett 04
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_SkeletonWorker04Start", Seconds = 1},
			MapFlagIsFalse {Name = "mf_SkeletonWorker04Once"},
			FigureIsAlive	{Tag = "SkeletonWorker04"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "SkeletonWorker04", File = "base/gfx/figures/npc/figure_undead_skeleton_worker_chop_stone.ska"},
			MapFlagSetTrue {Name = "mf_SkeletonWorker04Once"},
			MapTimerStop	{Name = "mt_SkeletonWorker04Start"},
			MapTimerStart	{Name = "mt_SkeletonWorker04"},
			
		},
	},
	--Arbeitendes Skelett 01
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_SkeletonWorker04", Seconds = 1},
			MapFlagIsTrue {Name = "mf_SkeletonWorker04Once"},
			FigureIsAlive	{Tag = "SkeletonWorker04"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "SkeletonWorker04", File = "base/gfx/figures/npc/figure_undead_skeleton_worker_chop_stone.ska"},
			MapFlagSetFalse {Name = "mf_SkeletonWorker04Once"},
			MapTimerStop	{Name = "mt_SkeletonWorker04"},
			MapTimerStart	{Name = "mt_SkeletonWorker04Start"},
		},
	}, 
	
	
	
	
	--Arbeitendes Beast 01
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_BeastWorker01Start", Seconds = 1},
			MapFlagIsFalse {Name = "mf_BeastWorker01Once"},
			FigureIsAlive	{Tag = "BeastWorker01"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "BeastWorker01", File = "base/gfx/figures/npc/figure_beast_beastman_worker_chop_stone.ska"},
			MapFlagSetTrue {Name = "mf_BeastWorker01Once"},
			MapTimerStop	{Name = "mt_BeastWorker01Start"},
			MapTimerStart	{Name = "mt_BeastWorker01"},
			
		},
	},
	--Arbeitendes Beast 01
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_BeastWorker01", Seconds = 1},
			MapFlagIsTrue {Name = "mf_BeastWorker01Once"},
			FigureIsAlive	{Tag = "BeastWorker01"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "BeastWorker01", File = "base/gfx/figures/npc/figure_beast_beastman_worker_chop_stone.ska"},
			MapFlagSetFalse {Name = "mf_BeastWorker01Once"},
			MapTimerStop	{Name = "mt_BeastWorker01"},
			MapTimerStart	{Name = "mt_BeastWorker01Start"},
		},
	}, 
 
 --Arbeitendes Beast 02
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_BeastWorker02Start", Seconds = 1.2},
			MapFlagIsFalse {Name = "mf_BeastWorker02Once"},
			FigureIsAlive	{Tag = "BeastWorker02"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "BeastWorker02", File = "base/gfx/figures/npc/figure_beast_beastman_worker_chop_stone.ska"},
			MapFlagSetTrue {Name = "mf_BeastWorker02Once"},
			MapTimerStop	{Name = "mt_BeastWorker02Start"},
			MapTimerStart	{Name = "mt_BeastWorker02"},
			
		},
	},
	--Arbeitendes Beast 02
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_BeastWorker02", Seconds = 1.2},
			MapFlagIsTrue {Name = "mf_BeastWorker02Once"},
			FigureIsAlive	{Tag = "BeastWorker02"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "BeastWorker02", File = "base/gfx/figures/npc/figure_beast_beastman_worker_chop_stone.ska"},
			MapFlagSetFalse {Name = "mf_BeastWorker02Once"},
			MapTimerStop	{Name = "mt_BeastWorker02"},
			MapTimerStart	{Name = "mt_BeastWorker02Start"},
		},
	}, 
	
	--Arbeitendes Beast 03
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_BeastWorker03Start", Seconds = 1.4},
			MapFlagIsFalse {Name = "mf_BeastWorker03Once"},
			FigureIsAlive	{Tag = "BeastWorker03"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "BeastWorker03", File = "base/gfx/figures/npc/figure_beast_beastman_worker_chop_stone.ska"},
			MapFlagSetTrue {Name = "mf_BeastWorker03Once"},
			MapTimerStop	{Name = "mt_BeastWorker03Start"},
			MapTimerStart	{Name = "mt_BeastWorker03"},
			
		},
	},
	--Arbeitendes Beast 01
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_BeastWorker03", Seconds = 1.4},
			MapFlagIsTrue {Name = "mf_BeastWorker03Once"},
			FigureIsAlive	{Tag = "BeastWorker03"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "BeastWorker03", File = "base/gfx/figures/npc/figure_beast_beastman_worker_chop_stone.ska"},
			MapFlagSetFalse {Name = "mf_BeastWorker03Once"},
			MapTimerStop	{Name = "mt_BeastWorker03"},
			MapTimerStart	{Name = "mt_BeastWorker03Start"},
		},
	}, 
 	
 	--Arbeitendes Beast 04
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_BeastWorker04Start", Seconds = 0.9},
			MapFlagIsFalse {Name = "mf_BeastWorker04Once"},
			FigureIsAlive	{Tag = "BeastWorker04"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "BeastWorker04", File = "base/gfx/figures/npc/figure_beast_beastman_worker_chop_stone.ska"},
			MapFlagSetTrue {Name = "mf_BeastWorker04Once"},
			MapTimerStop	{Name = "mt_BeastWorker04Start"},
			MapTimerStart	{Name = "mt_BeastWorker04"},
			
		},
	},
	--Arbeitendes Beast 01
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_BeastWorker04", Seconds = 0.9},
			MapFlagIsTrue {Name = "mf_BeastWorker04Once"},
			FigureIsAlive	{Tag = "BeastWorker04"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "BeastWorker04", File = "base/gfx/figures/npc/figure_beast_beastman_worker_chop_stone.ska"},
			MapFlagSetFalse {Name = "mf_BeastWorker04Once"},
			MapTimerStop	{Name = "mt_BeastWorker04"},
			MapTimerStart	{Name = "mt_BeastWorker04Start"},
		},
	}, 
    
};

                                                                                                                                                                                             