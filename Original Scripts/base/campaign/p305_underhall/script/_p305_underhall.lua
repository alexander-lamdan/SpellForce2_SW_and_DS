--*******************************************************
--***                                                 ***
--***                  Underhall                      ***
--***                                                 ***
--*******************************************************

--Kristallstandorte
MinenKristall01X = 259
MinenKristall01Y = 178
MinenKristall02X = 315
MinenKristall02Y = 193
MinenKristall03X = 379
MinenKristall03Y = 155
MinenKristall04X = 404
MinenKristall04Y = 35
MinenKristall05X = 334
MinenKristall05Y = 131
MinenKristall08X = 248
MinenKristall08Y = 60
MinenKristall09X = 243
MinenKristall09Y = 250
MinenKristall10X = 330
MinenKristall10Y = 251


State
{
	StateName = "MainState",
	OnOneTimeEvent
    {
    	-- das Flag "AlwaysTrue" ist immer true sein
    	-- ist als Default-Abfragewert für Sammelscripte gedacht (Spawning etc.)
    	Conditions =
    	{
    		MapFlagIsTrue	{Name = "mf_CutsceneJandrimStartEnded"},
    		
    	},
    	Actions =
    	{
				--FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar02"},
				--FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim05"},
				--FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim06"},
				--FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim07"},
				--FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim08"},
				--FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim09"},
				--FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim10"},
				--FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim11"},
				--FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim12"},
				--FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim13"},

    			FigurePlayerTransfer	{Tag = "Zwerg01", Player = "pl_Neutral"},
    			FigurePlayerTransfer	{Tag = "Zwerg02", Player = "pl_Neutral"},
    			FigurePlayerTransfer	{Tag = "Zwerg03", Player = "pl_Neutral"},
    			FigurePlayerTransfer	{Tag = "Zwerg04", Player = "pl_Neutral"},
    			FigurePlayerTransfer	{Tag = "Zwerg05", Player = "pl_Neutral"},
    			FigurePlayerTransfer	{Tag = "Altar01", Player = "pl_Neutral"},
    			FigurePlayerTransfer	{Tag = "Altar02", Player = "pl_Neutral"},
    			
    			--AvatarFlag welches nur den aller ersten Teleport auslöst
    			MapFlagSetTrue {Name = "mf_AvatarFirstTeleport"},
    			
    			MapTimerStart	{Name = "mt_JandrimWalkingStart"},
    			
    			AvatarFlagSetTrue {Name = "af_P305_WindhammerNotSpoken"},

				-- für outcries auf der GF:
    			AvatarFlagSetTrue {Name = "af_P305_UnderhallVisited"},
    			   			
    			MapFlagSetTrue {Name = "mf_MissionStart"},
    			DialogSetDisabled	{Tag = "Jandrim"},
    			DialogSetDisabled	{Tag = "Pocket"},
    			DialogSetDisabled	{Tag = "MinotaurDead"},
    			
				
				--NQ Die steinernen Riesen
				DialogTypeSetSideQuest	{Tag = "StatueGolem01"},
				--DialogTypeSetSideQuest	{Tag = "StatueGolem02"},
				DialogTypeSetSideQuest	{Tag = "StatueGolem03"},
				DialogTypeSetSideQuest	{Tag = "StatueGolem04"},
				--DialogTypeSetSideQuest	{Tag = "StatueGolem05"},
				DialogTypeSetSideQuest	{Tag = "StatueGolem06"},
				DialogSetEnabled	{Tag = "StatueGolem01" },
				--DialogSetEnabled	{Tag = "StatueGolem02" },
				DialogSetEnabled	{Tag = "StatueGolem03" },
				DialogSetEnabled	{Tag = "StatueGolem04" },
				--DialogSetEnabled	{Tag = "StatueGolem05" },
				DialogSetEnabled	{Tag = "StatueGolem06" },
						
				--NQ Der richtige Dreh
				DialogSetDisabled	{Tag = "Kity"},
				MapFlagSetTrue{Name = "mf_DwarfCitizenStart"},
				
				--Building Add
    			PlayerBuildingAdd{Player = "pl_Human", BuildingId = 121},
    			PlayerBuildingAdd{Player = "pl_Human", BuildingId = 126},
				PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 006},
				PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 013},
				--Avatar GiveAway
				PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 800},
								
				--Mineneingang wird aufgedeckt
				FogOfWarReveal	{X = 125, Y = 226, Range = 15, Height = 145},
				
				--MapFlagSetTrue {Name = "mf_HelfdanDefenderSpawn"},
				--Belagerung aufdecken
				--FogOfWarReveal	{X = 639, Y = 180, Range = 25, Height = 135},		
				
				FigureTeleport	{Tag = "Zwerg01", X = 280, Y = 318},
				FigureTeleport	{Tag = "Zwerg02", X = 282, Y = 315},
				FigureTeleport	{Tag = "Zwerg03", X = 284, Y = 314},
				FigureTeleport	{Tag = "Zwerg04", X = 287, Y = 315},
				FigureTeleport	{Tag = "Zwerg05", X = 289, Y = 319},
				
				
				
				EntityTimerStart	{Name = "et_JandrimWalkingTimer01"},
				FigureLookAtEntity	{Tag = "Jandrim", TargetTag = "pl_HumanAvatar"},
				
				PlayerTravelDisable	{},
				PortalDisable	{Tag = "Portal_Start"},
				PortalDisable	{Tag = "Portal_Crash"},
				--EffectStop {Tag = "Portal_Start"},
				
				 --Bei folgenden Figuren wird das Swapping verhindert
    	   		FigureSwappingDisable {Tag = "Lela"},
    	   		FigureSwappingDisable {Tag = "Thane"},
    	   		

       	},
   	},
   	
----   	 --Debug Achtung Dummy
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			MapFlagIsTrue	{Name = "mf_Qa"},
--		},
--		Actions =
--		{
--			GateSetOpen	{Tag = "IceDoor01"},
--			GateSetOpen	{Tag = "IceDoor02"},
--			GateSetOpen	{Tag = "IceDoor03"},
--			MapFlagSetTrue{Name = "mf_HelfanDialogEnded"},
--			MapFlagSetTrue{Name = "mf_HelfanTalked"},
--			FigureKill	{Tag = "BeastArdan"},
--		},
--		
--	},	


	--Jandrim läuft zur Mine sobald die erste Cutszene vorbei ist.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CutsceneJandrimStartEnded"},
			MapTimerIsElapsed	{Name = "mt_JandrimWalkingStart", Seconds = 2},
		},
		Actions =
		{
			FigureWalk	{Tag = "Jandrim", X = 137, Y = 138},
			FogOfWarReveal	{X = 115, Y = 122, Range = 25, Height = 140},		
			FogOfWarReveal	{X = 137, Y = 149, Range = 25, Height = 140},		
			FogOfWarReveal	{X = 131, Y = 186, Range = 25, Height = 140},		
			FogOfWarReveal	{X = 125, Y = 217, Range = 25, Height = 140},
		},
		
	},	
	
	--Jandrim rennt zur Mine. 
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "Jandrim", Range = 2, X = 137, Y = 138},
			MapFlagIsTrue	{Name = "mf_CutsceneJandrimStartEnded"},
		},
		Actions =
		{
			FigureRun	{Tag = "Jandrim", X = 125, Y = 217},
		},
		
	},	
	
	--Jandrim läuft zur Mine sobald die erste Cutszene vorbei ist.
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRange	{Tag = "Jandrim", Range = 5, X = 124, Y = 217},
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 124, Y = 217},
			}
		},
		Actions =
		{
			GateSetOpen	{Tag = "DwarfGateDoor01"},	
		},
	},		
	--Jandrim läuft zur Mine sobald die erste Cutszene vorbei ist.
	OnOneTimeEvent
	{
		Conditions =
		{
			
				FigureIsInRange	{Tag = "Jandrim", Range = 10, X = 124, Y = 217},
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 15, X = 124, Y = 217},
				MapFlagIsFalse {Name = "mf_AvatarInsideMine"},
				MapFlagIsFalse{Name = "mf_VarianteB"},	
			
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "JandrimMine01", Tag = "Jandrim", TargetTag = "teleporter01"},
			EntityTimerStart	{Name = "et_JandrimWalkingTimer02"},	
			MapFlagSetTrue{Name = "mf_VarianteA"},
		},
	},	
	
	--Jandrim läuft zur Mine sobald die erste Cutszene vorbei ist.
	OnOneTimeEvent
	{
		Conditions =
		{
				MapFlagIsFalse{Name = "mf_VarianteA"},
				MapFlagIsTrue {Name = "mf_AvatarInsideMine"},
				FigureIsInRange	{Tag = "Jandrim", Range = 10, X = 125, Y = 217},
				GateIsOpen	{Tag = "DwarfGateDoor01"},
		},
		Actions =
		{
			FigureRun	{Tag = "Jandrim", X = 125, Y = 233},
			MapFlagSetTrue{Name = "mf_VarianteB"},	
		},
	},			
	

	--Jandrim läuft zur Mine sobald die erste Cutszene vorbei ist.
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_JandrimWalkingTimer02", Seconds = 5},
			GateIsOpen	{Tag = "DwarfGateDoor01"},
		},
		Actions =
		{
			FigureWalk	{Tag = "Jandrim", X = 125, Y = 233},
			EntityTimerStop	{Name = "et_JandrimWalkingTimer02"},
		},
	},		

	OnOneTimeEvent
	{
		Conditions =
		{
			
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 8, X = 137, Y = 195},
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Altar"},    
		},
		
	},
	
    --Altar des Lebens 02 wird aktiviert
      OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 8, X = 381, Y = 139},
    		FigureUnitNpcIsNotInRange	{UnitId = 488, Range = 15, X = 381, Y = 139},
    	},
    	Actions =
    	{
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Altar02"},    
   		},
    },	 

    
     --Outcry von Jandrim sobald er in die Nähe seiner Truppen kommt.
      OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "Jandrim", Range = 18, X = 284, Y = 314},
    		OR
    		{
    			MapFlagIsTrue {Name = "mf_AvatarInsideMine"},
    			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 25, X = 284, Y = 314},
    		},
    	},
    	Actions =
    	{
    		FigureOutcry	{Tag = "Jandrim", TextTag = "JandrimTroops01"},	
    		MapTimerStart	{Name = "mt_JandrimsKumpelTimer"},
    		
    				
   		},
    },	
    --Jandrims Wachen Wechseln Zum Spieler
      OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_JandrimsKumpelTimer", Seconds = 5},
    	},
    	Actions =
    	{
    		FigurePlayerTransfer	{Tag = "Zwerg01", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Zwerg02", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Zwerg03", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Zwerg04", Player = "pl_Human"},
    		FigurePlayerTransfer	{Tag = "Zwerg05", Player = "pl_Human"},	
    		MapFlagSetTrue {Name = "mf_ZwergeBekommen"},
   		},
    },	   

    --Wenn der Jandrim/Spieler in der Nähe von Windhammer Ghost kommt.
      OnOneTimeEvent
    {
    	
    	Conditions =
    	{	
    		FigureIsInRange	{Tag = "Jandrim", Range = 10, X = 286, Y = 297},
    		MapFlagIsTrue {Name = "mf_JandrimsVaterSpawn"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_StopFollowJandrim"},	
			FigureForcedWalk	{Tag = "Jandrim", X = 286, Y = 299},
   		},
    },	
    --Wenn der Jandrim/Spieler in der Nähe von Windhammer Ghost kommt.
      OnOneTimeEvent
    {
    	
    	Conditions =
    	{	
    		MapFlagIsTrue {Name = "mf_JandrimsVaterAlive"},
    		MapFlagIsFalse{Name = "mf_StartCutsceneWindhammer"},
    	},
    	Actions =
    	{
			FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim15"},
			FigureOutcry	{Tag = "Windhammer_Ghost", TextTag = "Ghost01"},
			
   		},
    },	
    --Wenn der Jandrim/Spieler in der Nähe von Windhammer Ghost kommt.
      OnOneTimeEvent
    {
    	
    	Conditions =
    	{	
    		MapFlagIsTrue {Name = "mf_JandrimsVaterAlive"},
    	},
    	Actions =
    	{
			
			MapTimerStart	{Name = "mt_OutryTimerJandrim"},
   		},
    },	
    
      OnOneTimeEvent
    {
    	
    	Conditions =
    	{	
    		MapFlagIsTrue {Name = "mf_JandrimsVaterAlive"},
    		MapTimerIsElapsed	{Name = "mt_OutryTimerJandrim", Seconds = 4},
    	},
    	Actions =
    	{	
			AvatarFlagSetTrue {Name = "af_P305_WindhammerNotSpoken"},
    		DialogTypeSetMainQuest	{Tag = "Windhammer_Ghost"},
			DialogSetEnabled	{Tag = "Windhammer_Ghost" },
    		QuestSetActive {Quest = "SaveThane"},
			
   		},
    },	
   	
   	 OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		OR
    		{
    			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 286, Y = 297},
    			PlayerFigureIsInRange	{Player = "pl_Human", Range = 10, X = 286, Y = 297},
    		},
    	
    	 },
    	Actions = 
    	{
    		MapFlagSetTrue {Name = "mf_JandrimsVaterSpawn"},
    		FogOfWarReveal	{X = 286, Y = 297, Range = 10, Height = 140},
    	},
    }, 
    --Wenn der Jandrim/Spieler den ersten Geist sieht.
      OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		OR
    		{
    			FigureIsInEntityRange	{Tag = "Mine_Ghost90", TargetTag = "Jandrim", Range = 5},
    			FigureIsInEntityRange	{Tag = "Mine_Ghost91", TargetTag = "Jandrim", Range = 5},
    			FigureIsInEntityRange	{Tag = "Mine_Ghost92", TargetTag = "Jandrim", Range = 5},
    			FigureIsInEntityRange	{Tag = "Mine_Ghost93", TargetTag = "Jandrim", Range = 5},
    			FigureIsInEntityRange	{Tag = "Mine_Ghost80", TargetTag = "Jandrim", Range = 5},
    			FigureIsInEntityRange	{Tag = "Mine_Ghost81", TargetTag = "Jandrim", Range = 5},
    			FigureIsInEntityRange	{Tag = "Mine_Ghost82", TargetTag = "Jandrim", Range = 5},
    			FigureIsInEntityRange	{Tag = "Mine_Ghost83", TargetTag = "Jandrim", Range = 5},
    		}
    	},
    	Actions =
    	{
    		FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim14"},
			
   		},
    },	
   
   --Spieler findet Lenya
    OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		AvatarHasItemMisc	{Player = "pl_Human", ItemId = 215, Amount = 1},
    	 },
    	Actions = 
    	{
    		PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 300},
    		AvatarItemMiscTake	{Player = "pl_Human", ItemId = 215, Amount = 1},
    	},
    }, 
    
--*******************************************************
--***                                                 ***
--*** 	Zwerge werden Neutral-Avatar Not in Mine	  ***
--***   Zwerge bekommen Spielerfarben-Avatar In Mine  ***
--***												  ***
--*******************************************************    
	
	 --Zwerge werden Neutral oder Spielerfarben      
	-- auskommentiert, da
	-- 1) Reisesteine nicht beachtet werden
	-- 2) die Zwerge sich nach beenden der Quest selbst neutral schalten, aber dieses event trotzdem weiterlaufen würde!
	-- ergo: Zwerge bleiben einfach immer beim spieler, sobald sie einmal übergeben wurden und bis die quest beendet wurde
	
    --OnToggleEvent	
	--{
	--	EventName = "DwarfChangeEvent",
	--	OnConditions =
	--	{
	--		MapFlagIsTrue {Name = "mf_ZwergeBekommen"},
    --		MapFlagIsFalse {Name = "mf_AvatarInsideMine"},
    --		FigureIsNotInCombat	{Tag = "Zwerg01"},
    --		FigureIsNotInCombat	{Tag = "Zwerg02"},
    --		FigureIsNotInCombat	{Tag = "Zwerg03"},
    --		FigureIsNotInCombat	{Tag = "Zwerg04"},
    --		FigureIsNotInCombat	{Tag = "Zwerg05"},
	--	},
	--	OnActions = 
	--	{
	--		FigurePlayerTransfer	{Tag = "Zwerg01", Player = "pl_Neutral"},
    --		FigurePlayerTransfer	{Tag = "Zwerg02", Player = "pl_Neutral"},
    --		FigurePlayerTransfer	{Tag = "Zwerg03", Player = "pl_Neutral"},
    --		FigurePlayerTransfer	{Tag = "Zwerg04", Player = "pl_Neutral"},
    --		FigurePlayerTransfer	{Tag = "Zwerg05", Player = "pl_Neutral"},
	--	},
	--	OffConditions =
	--	{
	--		MapFlagIsTrue {Name = "mf_ZwergeBekommen"},
    --		MapFlagIsTrue {Name = "mf_AvatarInsideMine"},
    --		FigureIsNotInCombat	{Tag = "Zwerg01"},
    --		FigureIsNotInCombat	{Tag = "Zwerg02"},
    --		FigureIsNotInCombat	{Tag = "Zwerg03"},
    --		FigureIsNotInCombat	{Tag = "Zwerg04"},
    --		FigureIsNotInCombat	{Tag = "Zwerg05"},
	--	},
	--	OffActions = 
	--	{
	--		FigurePlayerTransfer	{Tag = "Zwerg01", Player = "pl_Human"},
    --		FigurePlayerTransfer	{Tag = "Zwerg02", Player = "pl_Human"},
    --		FigurePlayerTransfer	{Tag = "Zwerg03", Player = "pl_Human"},
    --		FigurePlayerTransfer	{Tag = "Zwerg04", Player = "pl_Human"},
    --		FigurePlayerTransfer	{Tag = "Zwerg05", Player = "pl_Human"},
	--	},
	--},

--*******************************************************
--***                                                 ***
--*** 	Zwerge werden Neutral-Avatar Not in Mine	  ***
--***   Zwerge bekommen Spielerfarben-Avatar In Mine  ***
--***					ENDE                          ***
--***												  ***
--******************************************************* 
--*******************************************************
--***                                                 ***
--***   			Weather Change 					  ***
--***												  ***
--******************************************************* 
	
	--Weather Change
    OnToggleEvent	
	{
		EventName = "WeatherEvent",
		OnConditions =
		{
			MapFlagIsFalse {Name = "mf_AvatarInsideMine"},
		},
		OnActions = 
		{
			WeatherChange	{File = "litAtmo_P305_Underhall", FadeDuration = 1},
		},
		OffConditions =
		{
			MapFlagIsTrue {Name = "mf_AvatarInsideMine"},
		},
		OffActions = 
		{
			WeatherSetForever	{File = "litAtmo_P305_Underhall_Mine", FadeDuration = 1},
		},
	},
	
--*******************************************************
--***                                                 ***
--***    Abfrage ob Spieler Reisesteine verwendet     ***
--***       		In der Mine 	                  ***
--***												  ***
--******************************************************* 

 	OnEvent
    {
    	Conditions = 
    	 {	
    		OR
    		{
    			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "ReisesteinMine01", Range = 5},
    			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "ReisesteinMine02", Range = 5},
    		},
    		MapFlagIsFalse {Name = "mf_AvatarInsideMine"},
    	 },
    	Actions = 
    	{
    		MapFlagSetTrue {Name = "mf_AvatarInsideMine"},
    	},
    }, 

	OnEvent
    {
    	Conditions = 
    	 {	
    		OR
    		{
    			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Portal_Start", Range = 5},
    			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "ReisesteinTageslicht01", Range = 5},
    			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "ReisesteinTageslicht02", Range = 5},
    			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "ReisesteinTageslicht03", Range = 5},
    			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "ReisesteinTageslicht04", Range = 5},
    		},
    		MapFlagIsTrue {Name = "mf_AvatarInsideMine"},
    	 },
    	Actions = 
    	{
    		MapFlagSetFalse {Name = "mf_AvatarInsideMine"},
    	},
    }, 



--*******************************************************
--***                                                 ***
--***    Nur aller erster Teleporter des Avatars      ***
--***       In die Mine vom Start	                  ***
--***												  ***
--*******************************************************    	
	
	
	
	--First Time Avatar Teleport
    OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 3, X = 125, Y = 233},
    		MapFlagIsTrue {Name = "mf_AvatarFirstTeleport"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanAvatar", X = 285, Y = 324},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			MapFlagSetTrue {Name = "mf_AvatarInsideMine"},
 			MapFlagSetFalse {Name = "mf_AvatarFirstTeleport"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 0},
 			AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			WeatherChange	{File = "litAtmo_P305_Underhall_Mine", FadeDuration = 1},
 			EntityTimerStart	{Name = "et_AvatarFollowCam01"},
   		},
    },
     --First Time Avatar Teleport
    OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam01", Seconds = 0.5},
    	},
    	Actions =
    	{
 			AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			EntityTimerStop	{Name = "et_AvatarFollowCam01"},
   		},
    },  
	   OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 285, Y = 324},
    	},
    	Actions =
    	{
 			QuestSetSolved	{Quest = "FindWayThroughMine"},
   		},
    },
    
--*******************************************************
--***                                                 ***
--***    Nur aller erster Teleporter des Avatars      ***
--***       In die Mine vom Start					  ***
--***				ENDE			                  ***
--***												  ***
--*******************************************************    	  
--*******************************************************
--***                                                 ***
--***    		Teleporter der Party       			  ***
--***       	In die Mine vom Start				  ***
--***												  ***
--*******************************************************   	
	
	--Jandrim Teleportiert sich zuerst in die Mine 
	OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "Jandrim", Range = 3, X = 125, Y = 233},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "Jandrim", X = 283, Y = 324},
 			EffectStart	{Tag = "Jandrim", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "Jandrim", Direction = 0},
 			MapFlagSetTrue	{Name = "mf_JandrimStartFollow"},
 			MapFlagSetTrue	{Name = "mf_JandrimInTheMine"},
 			QuestSetActive {Quest = "TroughMine"},
   		},
    },
           
     OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 3, X = 125, Y = 233},
    		MapFlagIsFalse {Name = "mf_AvatarFirstTeleport"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanAvatar", X = 285, Y = 324},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 0},
    		EntityTimerStart	{Name = "et_AvatarFollowCam02"},
    		MapFlagSetTrue {Name = "mf_AvatarInsideMine"},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam02", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam02"},
   		},
    },
    
   
    --In die Mine vom Start
    OnEvent
    {
    	
    	Conditions =
    	{	
    		FigureIsInRange	{Tag = "pl_HumanHeroBor", Range = 3, X = 125, Y = 233},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroBor", X = 286, Y = 326},
 			EffectStart	{Tag = "pl_HumanHeroBor", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroBor", Direction = 0},	
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{	
    		FigureIsInRange	{Tag = "pl_HumanHeroLya", Range = 3, X = 125, Y = 233},
    	},
    	Actions =
    	{	
 			FigureTeleport	{Tag = "pl_HumanHeroLya", X = 288, Y = 326},
 			EffectStart	{Tag = "pl_HumanHeroLya", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroLya", Direction = 0},	
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanHeroJared", Range = 3, X = 125, Y = 233},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroJared", X = 284, Y = 326},
 			EffectStart	{Tag = "pl_HumanHeroJared", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroJared", Direction = 0},
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanHeroShae", Range = 3, X = 125, Y = 233},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroShae", X = 288, Y = 328},
 			EffectStart	{Tag = "pl_HumanHeroShae", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroShae", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanHeroMordecay", Range = 3, X = 125, Y = 233},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroMordecay", X = 286, Y = 328},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanHeroKor", Range = 3, X = 125, Y = 233},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroKor", X = 284, Y = 328},
 			EffectStart	{Tag = "pl_HumanHeroKor", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroKor", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanNightsong", Range = 3, X = 125, Y = 233},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanNightsong", X = 287, Y = 328},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 0},
   		},
    },
    
--*******************************************************
--***                                                 ***
--***    Teleporter Avatar und Helden       		  ***
--***       Aus der Mine zum Start                    ***
--***												  ***
--*******************************************************       
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 3, X = 285, Y = 337},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanAvatar", X = 125, Y = 215},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 0},
    		EntityTimerStart	{Name = "et_AvatarFollowCam02"},
    		MapFlagSetFalse {Name = "mf_AvatarInsideMine"},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam02", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam02"},
   		},
    },
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanHeroBor", Range = 3, X = 285, Y = 337},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroBor", X = 126, Y = 215},
 			EffectStart	{Tag = "pl_HumanHeroBor", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroBor", Direction = 0},
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    			FigureIsInRange	{Tag = "pl_HumanHeroLya", Range = 3, X = 285, Y = 337},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroLya", X = 127, Y = 215},
 			EffectStart	{Tag = "pl_HumanHeroLya", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroLya", Direction = 0},		
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
      			FigureIsInRange	{Tag = "pl_HumanHeroJared", Range = 3, X = 285, Y = 337},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroJared", X = 124, Y = 215}, 	
 			EffectStart	{Tag = "pl_HumanHeroJared", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroJared", Direction = 0},				
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
      			FigureIsInRange	{Tag = "pl_HumanHeroShae", Range = 3, X = 285, Y = 337},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroShae", X = 124, Y = 217}, 	
 			EffectStart	{Tag = "pl_HumanHeroShae", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroShae", Direction = 0},				
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
      			FigureIsInRange	{Tag = "pl_HumanHeroMordecay", Range = 3, X = 285, Y = 337},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroMordecay", X = 125, Y = 217}, 	
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 0},				
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
      			FigureIsInRange	{Tag = "pl_HumanHeroKor", Range = 3, X = 285, Y = 337},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroKor", X = 126, Y = 217}, 	
 			EffectStart	{Tag = "pl_HumanHeroKor", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroKor", Direction = 0},				
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
      			FigureIsInRange	{Tag = "pl_HumanNightsong", Range = 3, X = 285, Y = 337},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanNightsong", X = 127, Y = 217}, 	
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 0},				
   		},
    },
--*******************************************************
--***                                                 ***
--***    Teleporter Avatar und Helden       		  ***
--***       Aus der Mine zur Stadt                    ***
--***												  ***
--*******************************************************    

    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 3, X = 345, Y = 64},
    		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanAvatar", X = 466, Y = 58},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			MapFlagSetFalse {Name = "mf_AvatarInsideMine"},
 			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 0},
    		EntityTimerStart	{Name = "et_AvatarFollowCam02"},
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam02", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam02"},
   		},
    },
    
     OnEvent
    {
    	
    	Conditions =
    	{
       		FigureIsInRange	{Tag = "pl_HumanHeroBor", Range = 3, X = 345, Y = 64},
     		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroBor", X = 465, Y = 58},
 			EffectStart	{Tag = "pl_HumanHeroBor", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroBor", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanHeroLya", Range = 3, X = 345, Y = 64},
    		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroLya", X = 467, Y = 58},
 			EffectStart	{Tag = "pl_HumanHeroLya", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroLya", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
       		FigureIsInRange	{Tag = "pl_HumanHeroJared", Range = 3, X = 345, Y = 64},
    		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroJared", X = 468, Y = 58},
 			EffectStart	{Tag = "pl_HumanHeroJared", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroJared", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
       		FigureIsInRange	{Tag = "pl_HumanHeroShae", Range = 3, X = 345, Y = 64},
    		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroShae", X = 468, Y = 60},
 			EffectStart	{Tag = "pl_HumanHeroShae", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroShae", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
       		FigureIsInRange	{Tag = "pl_HumanHeroMordecay", Range = 3, X = 345, Y = 64},
    		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroMordecay", X = 467, Y = 60},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
       		FigureIsInRange	{Tag = "pl_HumanHeroKor", Range = 3, X = 345, Y = 64},
    		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroKor", X = 466, Y = 60},
 			EffectStart	{Tag = "pl_HumanHeroKor", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroKor", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
       		FigureIsInRange	{Tag = "pl_HumanNightsong", Range = 3, X = 345, Y = 64},
    		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanNightsong", X = 465, Y = 60},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 0},
   		},
    },
--*******************************************************
--***                                                 ***
--***    Teleporter Avatar und Helden       		  ***
--***       Aus der Stadt zur Mine                    ***
--***												  ***
--*******************************************************        
    
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 3, X = 466, Y = 65},
       	   	QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanAvatar", X = 345, Y = 54},
 			EffectStart	{Tag = "pl_HumanAvatar", File = "Effect_DeSpawn_Unit"},
 			MapFlagSetTrue {Name = "mf_AvatarInsideMine"},
    		FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 0},
 			EntityTimerStart	{Name = "et_AvatarFollowCam02"},
   		},
    },
    OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_AvatarFollowCam02", Seconds = 0.5},
    	},
    	Actions =
    	{
 			 AvatarFollowCameraDirectionUpdate	{Tag = "pl_HumanAvatar"},
 			 EntityTimerStop	{Name = "et_AvatarFollowCam02"},
   		},
    },
    
     OnEvent
    {
    	
    	Conditions =
    	{
    			FigureIsInRange	{Tag = "pl_HumanHeroBor", Range = 3, X = 466, Y = 65},
    			QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroBor", X = 344, Y = 54},
 			EffectStart	{Tag = "pl_HumanHeroBor", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroBor", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
    			FigureIsInRange	{Tag = "pl_HumanHeroLya", Range = 3, X = 466, Y = 65},
    	   		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroLya", X = 346, Y = 54},
 			EffectStart	{Tag = "pl_HumanHeroLya", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroLya", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
    			FigureIsInRange	{Tag = "pl_HumanHeroJared", Range = 3, X = 466, Y = 65},
    	   		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroJared", X = 347, Y = 54},
 			EffectStart	{Tag = "pl_HumanHeroJared", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroJared", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
    			FigureIsInRange	{Tag = "pl_HumanHeroShae", Range = 3, X = 466, Y = 65},
    	   		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroShae", X = 347, Y = 56},
 			EffectStart	{Tag = "pl_HumanHeroShae", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroShae", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
    			FigureIsInRange	{Tag = "pl_HumanHeroMordecay", Range = 3, X = 466, Y = 65},
    	   		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroMordecay", X = 346, Y = 56},
 			EffectStart	{Tag = "pl_HumanHeroMordecay", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroMordecay", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
    			FigureIsInRange	{Tag = "pl_HumanHeroKor", Range = 3, X = 466, Y = 65},
    	   		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanHeroKor", X = 345, Y = 56},
 			EffectStart	{Tag = "pl_HumanHeroKor", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanHeroKor", Direction = 0},
   		},
    },
     OnEvent
    {
    	
    	Conditions =
    	{
    			FigureIsInRange	{Tag = "pl_HumanNightsong", Range = 3, X = 466, Y = 65},
    	   		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanNightsong", X = 344, Y = 56},
 			EffectStart	{Tag = "pl_HumanNightsong", File = "Effect_DeSpawn_Unit"},
 			FigureLookAtDirection	{Tag = "pl_HumanNightsong", Direction = 0},
   		},
    },
    
--*******************************************************
--***                                                 ***
--***                  Teleporter  End                ***
--***                                                 ***
--******************************************************* 

--*******************************************************
--***                                                 ***
--***    				In der Mine  			      ***
--***                                                 ***
--*******************************************************     
    
     --Wenn Skeletonboss getötet wurde
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "SkeletonBoss01"},
    		MapFlagIsTrue	{Name = "mf_CutsceneJandrimStartEnded"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P305_SkeletonBoss01IsDead"},		
       	},
    },  
     --Wenn Skeletonboss getötet wurde
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "SkeletonBoss02"},
    		MapFlagIsTrue	{Name = "mf_CutsceneJandrimStartEnded"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P305_SkeletonBoss02IsDead"},		
       	},
    },  
    
    --Nach der Cutscene mit Windhammer_Ghost
    OnOneTimeEvent
  	{
    	
   		Conditions =
   		{
   			MapFlagIsTrue	{Name = "mf_CutsceneWindhammerGhostEnded"},
    			
   		},
   		Actions =
    	{	
   			MapFlagSetTrue {Name = "mf_StealHeartMission"},
			QuestSetActive	{Quest = "OperateLeversToOpenInnerMineDoors"},
			QuestSetActive	{Quest = "OperateOtherLever"},
			QuestSetActive {Quest = "StealNiethalfsheart"},
			FogOfWarReveal	{X = 418, Y = 32, Range = 10, Height = 130},
			MinimapAlertSet	{X = 418, Y = 32, Type = 1},
			FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim16"},
			FigureOutcry	{Tag = "Windhammer_Ghost", TextTag = "Ghost02"},
			FigureTeamTransfer	{Tag = "Jandrim", Team = "tm_Neutral"}, 
       	},
    },
     --Die InnerMineGates öffnen sich wenn man beide Hebel betätigt hat
	OnOneTimeLeverEvent
	{
		Lever = "Lever02",
		OnConditions = 
		{
		},
		Actions = 
		{
    		GateSetOpen	{Tag = "InnerMineGate01"},
    		MapFlagSetTrue {Name = "mf_InnerMineGate01Open"},	
    		FogOfWarReveal	{X = 285, Y = 214, Range = 15, Height = 125},
    		QuestSetSolved	{Quest = "OperateOtherLever"},
		},
	};


    --Die InnerMineGates öffnen sich wenn man beide Hebel betätigt hat
	OnOneTimeLeverEvent
	{
		Lever = "Lever01",
		OnConditions = 
		{
		},
		Actions = 
		{
    		GateSetOpen	{Tag = "InnerMineGate02"},
    		MapFlagSetTrue {Name = "mf_InnerMineGate02Open"},
    		FogOfWarReveal	{X = 286, Y = 152, Range = 15, Height = 125},
    		QuestSetSolved	{Quest = "OperateLeversToOpenInnerMineDoors"},
		},
	};
 	          
       --Die InnerMineGates öffnen sich wenn man beide Hebel betätigt hat
      OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_InnerMineGate01Open"},
    		MapFlagIsTrue {Name = "mf_InnerMineGate02Open"},
    	},
    	Actions =
    	{
    	
    		MapFlagSetTrue {Name = "mf_MineGatesOpen"},
   		},
    },	
    --StealHeartMission
  	OnOneTimeEvent
  	{
   		Conditions =
   		{
   			MapFlagIsTrue {Name = "mf_StealHeartMission"},
   			AvatarHasItemMisc	{ItemId = 96, Amount = 1},
   		},
   		Actions =
   		{
   			AvatarFlagSetTrue {Name = "af_P305_NiethalfsHerzFounded"},
   			DialogTypeSetMainQuest	{Tag = "Windhammer_Ghost"},
			DialogSetEnabled	{Tag = "Windhammer_Ghost" },
			FigureForcedWalk	{Tag = "Windhammer_Ghost", X = 286, Y = 144}, 
   			FigureForcedWalk	{Tag = "Jandrim", X = 284, Y = 142}, 
   			QuestSetSolved	{Quest = "StealNiethalfsheart"},
   			QuestSetActive {Quest = "ReturnNiethalfsheart"},
       	},
    },
    --Nach dem zweiten Dialog Mit Windhammer
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			MapTimerIsElapsed	{Name = "mt_StartFightUgnathTimer", Seconds = 0}, 
   			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile! 			
    	},
    	Actions =
   		{
   			--DialogSetDisabled	{Tag = "Windhammer_Ghost"},
   			QuestSetSolved	{Quest = "ReturnNiethalfsheart"},
   			MapFlagSetTrue {Name = "mf_UgnathSpawn"},
   			GateSetOpen	{Tag = "DwarfMineDoor03"},
   			QuestSetActive	{Quest = "KillIuan"},
   			MapTimerStart	{Name = "mt_WinhammerGhostTimer"},
   			
       	},
    },
     --Windhammertimer ist abgelaufen
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			MapTimerIsElapsed	{Name = "mt_WinhammerGhostTimer", Seconds = 2},
   			MapFlagIsTrue {Name = "mf_MineGatesOpen"}, 			
    	},
    	Actions =
   		{
   			
   			FigureForcedWalk	{Tag = "Windhammer_Ghost", X = 291, Y = 53}, 
   			FigureForcedWalk	{Tag = "Jandrim", X = 288, Y = 55}, 
   			FigureTeamTransfer	{Tag = "Windhammer_Ghost", Team = "tm_Team_1"}, 
   			MapFlagSetTrue {Name = "mf_WindhammerGhostPlayerColor"},			
       	},
    },
    
     --Minengeister 1-4 besiegt
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			   FigureIsDead	{Tag = "Mine_Ghost01"},	
   			   FigureIsDead	{Tag = "Mine_Ghost02"},	
   			   FigureIsDead	{Tag = "Mine_Ghost03"},	
   			   FigureIsDead	{Tag = "Mine_Ghost04"},	
    	},
    	Actions =
   		{
   			
   				ObjectLootItemMiscAdd	{Tag = "Crystal01", DropChance = 100, ItemId = 162},
   				MapFlagSetTrue {Name = "mf_P305_Crystal01"},
   			
       	},
    }, 

    
     --Minengeister 10-13 besiegt
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			   FigureIsDead	{Tag = "Mine_Ghost10"},	
   			   FigureIsDead	{Tag = "Mine_Ghost11"},	
   			   FigureIsDead	{Tag = "Mine_Ghost12"},	
   			   FigureIsDead	{Tag = "Mine_Ghost13"},	
    	},
    	Actions =
   		{
   				
   				ObjectLootItemMiscAdd	{Tag = "Crystal02", DropChance = 100, ItemId = 162},
				MapFlagSetTrue {Name = "mf_P305_Crystal02"},
       	},
    },  
    

    
    --Minengeister 20-23 besiegt
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			   FigureIsDead	{Tag = "Mine_Ghost20"},	
   			   FigureIsDead	{Tag = "Mine_Ghost21"},	
   			   FigureIsDead	{Tag = "Mine_Ghost22"},	
   			   FigureIsDead	{Tag = "Mine_Ghost23"},	
    	},
    	Actions =
   		{
   				
   				ObjectLootItemMiscAdd	{Tag = "Crystal03", DropChance = 100, ItemId = 162},
				MapFlagSetTrue {Name = "mf_P305_Crystal03"},
       	},
    },  
    

    --Minengeister 30-33 besiegt
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			   FigureIsDead	{Tag = "Mine_Ghost30"},	
   			   FigureIsDead	{Tag = "Mine_Ghost31"},	
   			   FigureIsDead	{Tag = "Mine_Ghost32"},	
   			   FigureIsDead	{Tag = "Mine_Ghost33"},	
    	},
    	Actions =
   		{		
   				ObjectLootItemMiscAdd	{Tag = "Crystal04", DropChance = 100, ItemId = 162},
       			MapFlagSetTrue {Name = "mf_P305_Crystal04"},
       	},
    },     
    

    --Minengeister 40-43 besiegt
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			   FigureIsDead	{Tag = "Mine_Ghost40"},	
   			   FigureIsDead	{Tag = "Mine_Ghost41"},	
   			   FigureIsDead	{Tag = "Mine_Ghost42"},	
   			   FigureIsDead	{Tag = "Mine_Ghost43"},	
    	},
    	Actions =
   		{
   			
   				ObjectLootItemMiscAdd	{Tag = "Crystal05", DropChance = 100, ItemId = 162},
       			MapFlagSetTrue {Name = "mf_P305_Crystal05"},
       	},
    },     
    

    --Minengeister 70-73 besiegt
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			   FigureIsDead	{Tag = "Mine_Ghost70"},	
   			   FigureIsDead	{Tag = "Mine_Ghost71"},	
   			   FigureIsDead	{Tag = "Mine_Ghost72"},	
   			   FigureIsDead	{Tag = "Mine_Ghost73"},	
    	},
    	Actions =
   		{
   			
   				ObjectLootItemMiscAdd	{Tag = "Crystal08", DropChance = 100, ItemId = 162},
   				MapFlagSetTrue {Name = "mf_P305_Crystal06"},
       	},
    },     

    --Minengeister 80-83 besiegt
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			   FigureIsDead	{Tag = "Mine_Ghost80"},	
   			   FigureIsDead	{Tag = "Mine_Ghost81"},	
   			   FigureIsDead	{Tag = "Mine_Ghost82"},	
   			   FigureIsDead	{Tag = "Mine_Ghost83"},	
    	},
    	Actions =
   		{
   			
   				ObjectLootItemMiscAdd	{Tag = "Crystal09", DropChance = 100, ItemId = 162},
   				MapFlagSetTrue {Name = "mf_P305_Crystal07"},
       	},
    },     

    --Minengeister 90-93 besiegt
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			   FigureIsDead	{Tag = "Mine_Ghost90"},	
   			   FigureIsDead	{Tag = "Mine_Ghost91"},	
   			   FigureIsDead	{Tag = "Mine_Ghost92"},	
   			   FigureIsDead	{Tag = "Mine_Ghost93"},	
    	},
    	Actions =
   		{
   			
   				ObjectLootItemMiscAdd	{Tag = "Crystal10", DropChance = 100, ItemId = 162},
   				MapFlagSetTrue {Name = "mf_P305_Crystal08"},
       	},
    },     
    

     --Kampf zwischen Windhammer Geist und Iuan
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			
   			FigureIsInRange	{Tag = "Windhammer_Ghost", Range = 4, X = 291, Y = 53},			
    	},
    	Actions =
   		{
   			FigureAttackEntity	{Tag = "Windhammer_Ghost", TargetTag = "Ugnath"},   			
   			FigureAttackEntity	{Tag = "Ugnath", TargetTag = "Windhammer_Ghost"},  
       	},
    },
    
   	--Wenn man Ugnath getötet hat
   	OnOneTimeEvent
  	{
   		Conditions =
   		{
   			MapFlagIsTrue  {Name = "mf_UgnathAlive"},
   			FigureIsDead	{Tag = "Ugnath"},
   		},
   		Actions =
   		{	
     		AvatarFlagSetTrue {Name = "af_P305_UgnathsIsDead"},
     		MapFlagSetTrue {Name = "mf_P305_IuanIsDead"},	
    		QuestSetSolved	{Quest = "KillIuan"},
    		QuestSetActive {Quest = "TalkToWindhammerAfterIuan"},
			DialogTypeSetMainQuest	{Tag = "Windhammer_Ghost"},
			DialogSetEnabled	{Tag = "Windhammer_Ghost" },
       	},
    },
    --Rewards für Iuans Wachen
   	OnOneTimeEvent
  	{
   		Conditions =
   		{
   			MapFlagIsTrue  {Name = "mf_UgnathsWache01_Alive"},
   			FigureIsDead	{Tag = "Ugnaths_Wache01"},
   		},
   		Actions =
   		{	
     		MapFlagSetTrue {Name = "mf_P305_IuanSGuard01IsDead"},	
       	},
    },
    OnOneTimeEvent
  	{
   		Conditions =
   		{
   			MapFlagIsTrue  {Name = "mf_UgnathsWache02_Alive"},
   			FigureIsDead	{Tag = "Ugnaths_Wache02"},
   		},
   		Actions =
   		{	
     		MapFlagSetTrue {Name = "mf_P305_IuanSGuard02IsDead"},	
       	},
    },
    OnOneTimeEvent
  	{
   		Conditions =
   		{
   			MapFlagIsTrue  {Name = "mf_UgnathsWache03_Alive"},
   			FigureIsDead	{Tag = "Ugnaths_Wache03"},
   		},
   		Actions =
   		{	
     		MapFlagSetTrue {Name = "mf_P305_IuanSGuard03IsDead"},	
       	},
    },
    OnOneTimeEvent
  	{
   		Conditions =
   		{
   			MapFlagIsTrue  {Name = "mf_UgnathsWache04_Alive"},
   			FigureIsDead	{Tag = "Ugnaths_Wache04"},
   		},
   		Actions =
   		{	
     		MapFlagSetTrue {Name = "mf_P305_IuanSGuard04IsDead"},	
       	},
    },
    --Area aufdecken
    OnOneTimeEvent
  	{
   		Conditions =
   		{
   			PlayerFigureIsInRange	{Player = "pl_Human", Range = 10, X = 316, Y = 134},
   		},
   		Actions =
   		{	
     		FogOfWarReveal	{X = 313, Y = 127, Range = 15, Height = 115},
     		FogOfWarReveal	{X = 341, Y = 119, Range = 15, Height = 115},
     		
       	},
    },
    --Area aufdecken
    OnOneTimeEvent
  	{
   		Conditions =
   		{
   			PlayerFigureIsInRange	{Player = "pl_Human", Range = 10, X = 334, Y = 116},
   		},
   		Actions =
   		{	
     		FogOfWarReveal	{X = 324, Y = 112, Range = 15, Height = 115},
     		FogOfWarReveal	{X = 344, Y = 96, Range = 15, Height = 115},
     		
       	},
    },
    
    --Nach Ugnaths Tod, rennen die Zwerge zum sterbenden Windhammer Ghost.
   	OnOneTimeEvent
 	{
   		Conditions =
   		{
			MapFlagIsTrue{Name = "mf_JandrimWalkPlaceFprPeace"},
   		},
    	Actions =
    	{
    		FigureWalk	{Tag = "Jandrim", X = 288, Y = 37},
    	},
    }, 
    
   	--Nachdem man mit Windhammer gesprochen hat, nach Ugnaths Tod.
   	OnOneTimeEvent
 	{
   		Conditions =
   		{
    		AvatarFlagIsTrue{Name = "af_P305_WindhammerQuestSolved"},
    		AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
   		},
    	Actions =
    	{
    		DialogSetDisabled	{Tag = "Windhammer_Ghost"},
    		QuestSetSolved	{Quest = "TalkToWindhammerAfterIuan"},
    		QuestSetSolved	{Quest = "TroughMine"},
			QuestSetActive {Quest = "LeaveMine"},
			QuestSetActive {Quest = "FreeTown"},
    		FigureKill	{Tag = "Windhammer_Ghost"},
    		PlayerActivate	{Player = "pl_Beast"},
			GateSetOpen	{Tag = "DwarfMineDoor02"},	
			--MapFlagSetTrue {Name = "mf_HelfdanDefenderSpawn"},
			FogOfWarReveal	{X = 346, Y = 60, Range = 15, Height = 110},
			QuestSetActive {Quest = "UnderhallPart3WakeGiants"},
						
    	},
    },
    --Wenn Jandrim bei seinem sterbenden Vater Teil 0
   	OnOneTimeEvent
 	{
   		Conditions =
   		{
   			AvatarFlagIsTrue{Name = "af_P305_WindhammerQuestSolved"},
    		FigureIsInRange	{Tag = "Jandrim", Range = 2, X = 288, Y = 37},
   		},
    	Actions =
    	{
    		FigureLookAtDirection	{Tag = "Jandrim", Direction = 180},
    		FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim17"},
    		FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim18"},
    		MapTimerStart	{Name = "mt_JandrimKneeingTimer"},
    	},
    },
    --Wenn Jandrim bei seinem sterbenden Vater Teil 0
   	OnOneTimeEvent
 	{
   		Conditions =
   		{
   			MapTimerIsElapsed	{Name = "mt_JandrimKneeingTimer", Seconds = 4},
   		},
    	Actions =
    	{
    		FigureAnimPlayOnce	{Tag = "Jandrim", File = "base/gfx/figures/npc/figure_npc_dwarf_emote_kneel_down.ska"},		
    	},
    },
    --Wenn Jandrim bei seinem sterbenden Vater Teil 1
   	OnOneTimeEvent
 	{
   		Conditions =
   		{	
    		MapTimerIsElapsed	{Name = "mt_JandrimKneeingTimer", Seconds = 6.17},
   		},
    	Actions =
    	{
    		FigureAnimPlayOnce	{Tag = "Jandrim", File = "base/gfx/figures/npc/figure_npc_dwarf_emote_kneel_hold.ska"},
    		
    	},
    },

	--Wenn Jandrim bei seinem sterbenden Vater Teil 1 Infodialog wird eingeschaltet
   	OnOneTimeEvent
 	{
   		Conditions =
   		{	
    		MapTimerIsElapsed	{Name = "mt_JandrimKneeingTimer", Seconds = 10},
   		},
    	Actions =
    	{
    		DialogTypeSetSideQuest	{Tag = "Jandrim"},
    		DialogSetEnabled	{Tag = "Jandrim"},
    	},
    },




--*******************************************************
--***                                                 ***
--***    			 Nach der Mine  			      ***
--***                                                 ***
--*******************************************************     
	--Minenverlassen Quest wird gesolved
   	OnOneTimeEvent
 	{
   		Conditions =
   		{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 466, Y = 56},
   		},
    	Actions =
    	{
    		QuestSetSolved	{Quest = "LeaveMine"}, 		
    	},
    },

	--Helfdan Belagerung wird gestartet
   	OnOneTimeEvent
 	{
   		Conditions =
   		{
    		OR
    		{
    			PlayerFigureIsInRange	{Player = "pl_Human", Range = 25, X = 624, Y = 161},
    			PlayerFigureIsInRange	{Player = "pl_Human", Range = 25, X = 645, Y = 201},
    			PlayerFigureIsInRange	{Player = "pl_Human", Range = 25, X = 623, Y = 196},
    			PlayerFigureIsInRange	{Player = "pl_Human", Range = 25, X = 672, Y = 154},
    		},
   		},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_HelfdanDefenderSpawn"},
    		FogOfWarReveal	{X = 653, Y = 177, Range = 25, Height = 135},   		
    	},
    },
    
    

    --Wenn BeastmanHealer getötet wurde
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "BeastArdan15"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P305_BeastmanHealer"},		
       	},
    },  	  	
    
     --Wenn Zwergenspalter getötet wurde
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "DwarfKiller"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P305_DwarfKillerIsDead"},		
       	},
    },  	
     --Wenn Zwergenspalter getötet wurde
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		FigureIsDead	{Tag = "HumanHunter"},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P305_HumanHunterIsDead"},		
       	},
    },  			
    --ZwergenbefreiungsQuest
   	OnOneTimeEvent
 	{
   		Conditions =
   		{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 530, Y = 109},
    		
   		},
    	Actions =
    	{
    		FigureOutcryAlert	{TextTag = "Zwerg01", Tag = "Zwerg", TargetTag = "FenceGate01"},
    	},
    },
   
    OnOneTimeLeverEvent	
    {
    	Lever = "LeverGate01", 
    	OnConditions = 
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 528, Y = 112},
    		PlayerFigureIsNotInRange	{Player = "pl_Beast", Range = 5, X = 530, Y = 109},
    	},
    	Actions = 
    	{
    		GateSetOpen	{Tag = "FenceGate01"},
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_ZwergeBefreiung01"},
    		FigureOutcry	{Tag = "Zwerg", TextTag = "Zwerg02"},
    	},
    },	
   
     --ZwergenbefreiungsQuest
   	OnOneTimeEvent
 	{
   		Conditions =
   		{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 512, Y = 267},
    	
   		},
    	Actions =
    	{
    		FigureOutcryAlert	{TextTag = "Zwerg01", Tag = "Zwerg", TargetTag = "FenceGate02"},
    	},
    },
    OnOneTimeLeverEvent	
    {
    	Lever = "LeverGate02", 
    	OnConditions = 
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 515, Y = 265},
    		PlayerFigureIsNotInRange	{Player = "pl_Beast", Range = 5, X = 512, Y = 267},
    	},
    	Actions = 
    	{
    		GateSetOpen	{Tag = "FenceGate02"},
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_ZwergeBefreiung02"},
    		FigureOutcry	{Tag = "Zwerg", TextTag = "Zwerg02"},
    	},
    },	
   
    
     --ZwergenbefreiungsQuest
   		OnOneTimeEvent
 	{
   		Conditions =
   		{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 634, Y = 144},
    		
   		},
    	Actions =
    	{
    		FigureOutcryAlert	{TextTag = "Zwerg01", Tag = "Zwerg", TargetTag = "FenceGate03"},
    	},
    },
    
   	OnOneTimeLeverEvent	
    {
    	Lever = "LeverGate03", 
    	OnConditions = 
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 630, Y = 141},
    		PlayerFigureIsNotInRange	{Player = "pl_Beast", Range = 5, X = 634, Y = 144},
    	},
    	Actions = 
    	{
    		GateSetOpen	{Tag = "FenceGate03"},
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_ZwergeBefreiung03"},
    		FigureOutcry	{Tag = "Zwerg", TextTag = "Zwerg02"},
    	},
    },	
    
       
    --Nachdem man den ZwergenOutpost gerettet hat.
    OnOneTimeEvent
  	{
    	Conditions =
    	{		
    		FigureIsAlive	{Tag = "HelfdanDefender01"},
    		FigureIsAlive	{Tag = "HelfdanDefender02"},
    		FigureIsAlive	{Tag = "HelfdanDefender03"},
    		FigureIsAlive	{Tag = "HelfdanDefender04"},
    		FigureIsAlive	{Tag = "HelfdanDefender05"},
    		FigureIsAlive	{Tag = "HelfdanDefender06"},
    		FigureIsAlive	{Tag = "HelfdanDefender07"},
    		FigureIsAlive	{Tag = "HelfdanDefender08"},
    		PlayerFigureIsNotInRange	{Player = "pl_Beast", Range = 10, X = 645, Y = 178},
    		PlayerBuildingIsNotInRange	{Player = "pl_Beast", BuildingId = 183, Range = 10, X = 645, Y = 178},
    		QuestIsActive	{Player = "pl_Human", Quest = "FreeTown"},
    		
      	},
    	Actions =
   		{
   			--Sergant Helfans Dialog wird freigeschaltet sobald das ZwergenOutpost befreit wurde
  			--VisualTimerStart	{Seconds = 600},
  			DialogTypeSetMainQuest	{Tag = "Sergeant_Helfdan"},
			DialogSetEnabled	{Tag = "Sergeant_Helfdan" },
		 	MapFlagSetTrue {Name = "mf_DwarfOutpostSecured"},
		 	QuestSetSolved	{Quest = "FreeTown"},
    		QuestSetActive {Quest = "BuildDefense"},
    		PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Helfdan"},
    		FogOfWarReveal	{X = 642, Y = 347, Range = 15, Height = 163},
    		FogOfWarReveal	{X = 599, Y = 345, Range = 15, Height = 160},
    		FogOfWarReveal	{X = 651, Y = 127, Range = 15, Height = 130},
    		FogOfWarReveal	{X = 460, Y = 349, Range = 15, Height = 157},
    		FogOfWarReveal	{X = 493, Y = 383, Range = 15, Height = 157},
   		},
   	},
   	 OnOneTimeEvent
  	{
    	Conditions =
    	{		
    		MapFlagIsTrue {Name = "mf_DwarfOutpostSecured"},
      	},
    	Actions =
   		{
    		MapFlagSetTrue {Name = "mf_HelfdanDefenderRespawnFinish"},
   		},
   	},
   	 OnOneTimeEvent
  	{
    	Conditions =
    	{		
    		MapFlagIsTrue {Name = "mf_DwarfOutpostSecured"}, 
    		MapFlagIsTrue {Name = "mf_HelfanDialogEnded"},   		
      	},
    	Actions =
   		{
    		--GateSetOpen	{Tag = "IceDoor01"},
			GateSetOpen	{Tag = "IceDoor02"},
			GateSetOpen	{Tag = "IceDoor03"},
			QuestSetActive {Quest = "SendRidersToDwarves"},
			FogOfWarReveal	{X = 555, Y = 508, Range = 25, Height = 200},
			MinimapAlertSet	{X = 555, Y = 508, Type = 1},

   		},
   	},
    OnOneTimeEvent
  	{
     	Conditions =
    	{
   			MapFlagIsTrue{Name = "mf_HelfanDialogEnded"},
   			GateIsOpen	{Tag = "IceDoor02"},
   			GateIsOpen	{Tag = "IceDoor03"},
   		},
   		Actions =
    	{
			PlayerActivate	{Player = "pl_IceQueenA"},
			PlayerActivate	{Player = "pl_IceQueenC"},
			MapTimerStart	{Name = "mt_PlayerQueenBTimerStart"},	
       	},
    },
    
    OnOneTimeEvent
  	{
    	Conditions =
    	{		
    		 MapTimerIsElapsed	{Name = "mt_PlayerQueenBTimerStart", Seconds = 900},		
      	},
    	Actions =
   		{
    		GateSetOpen	{Tag = "IceDoor01"},
		
   		},
   	},
    --Zweite Ki wird eingeschaltet Ice Queen B 
    OnOneTimeEvent
  	{
     	Conditions =
    	{
   			
   			GateIsOpen	{Tag = "IceDoor01"},
   			
   		},
   		Actions =
    	{
			PlayerActivate	{Player = "pl_IceQueenB"}, 
			
       	},
    },
    
    
    
    --Wenn ein Reiter den Unterstützungsposten erreicht hat
    OnOneTimeEvent
  	{
     	Conditions =
    	{
			OR
			{
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 15, X = 509, Y = 518},
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 15, X = 502, Y = 508},
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 15, X = 501, Y = 497},
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 15, X = 519, Y = 481},
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 15, X = 555, Y = 508},
			},
			FigureIsAlive	{Tag = "IceQueen"},
    	},
    	Actions =
    	{
    		--Outcries, wenn der Reiter die Zwerge im Norden erreicht hat
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Zwerge2"},
    		PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 016},
			FigureOutcry	{Tag = "Reiter", TextTag = "Reiter01"},
			FigureOutcry	{Tag = "Reiter", TextTag = "Reiter02"},
			FigureOutcryAlert	{TextTag = "Thane_Wulfgar01", Tag = "Thane", TargetTag = "IceQueen"},
	 		QuestSetSolved	{Quest = "BuildDefense"},
	 		QuestSetSolved {Quest = "SaveThane"},
    		QuestSetSolved	{Quest = "SendRidersToDwarves"},
			QuestSetActive {Quest = "KillIceQueen"},
			FogOfWarReveal	{X = 245, Y = 487, Range = 8, Height = 5},
			MinimapAlertSet	{X = 245, Y = 487, Type = 1},
						
       	},
    },
   
   --Wenn ein Reiter den Unterstützungsposten erreicht hat hat aber die Icequeen schon erledigt
    OnOneTimeEvent
  	{
     	Conditions =
    	{
			OR
			{
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 15, X = 509, Y = 518},
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 15, X = 502, Y = 508},
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 15, X = 501, Y = 497},
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 15, X = 519, Y = 481},
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 15, X = 555, Y = 508},
			},
			FigureIsDead	{Tag = "IceQueen"},
			QuestIsNotSolved {Quest = "SaveThane"},
    	},
    	Actions =
    	{
    		
	 		QuestSetSolved	{Quest = "BuildDefense"},
	 		QuestSetSolved {Quest = "SaveThane"},
    		QuestSetSolved	{Quest = "SendRidersToDwarves"},
			QuestSetActive {Quest = "KillIceQueen"},
			QuestSetSolved	{Quest = "KillIceQueen"},
			MapFlagSetTrue  {Name = "mf_CutsceneEndStart"},
			
       	},
    },
   
    --Avatar trifft auf die Eishexe
    OnOneTimeEvent
  	{
       	Conditions =
    	{
    		FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "IceQueen", Range = 15},
    		--PlayerHasNotBuildingAmount	{Player = "pl_IceQueenA", Amount = 1, OnlyCompleted = False},
    		--PlayerHasNotFigureAmount	{Player = "pl_IceQueenA", Amount = 1},
    		--PlayerHasNotBuildingAmount	{Player = "pl_IceQueenB", Amount = 1, OnlyCompleted = False},
    		--PlayerHasNotFigureAmount	{Player = "pl_IceQueenB", Amount = 1},
    		--PlayerHasNotBuildingAmount	{Player = "pl_IceQueenC", Amount = 1, OnlyCompleted = False},
    		--PlayerHasNotFigureAmount	{Player = "pl_IceQueenC", Amount = 1},
    	},
    	Actions =
    	{
    		FigureOutcry {Tag = "IceQueen", TextTag = "Eishexe01"},
       	},
    },  
    	   	
    --Wenn Eiskönigin getötet wurde
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue  {Name = "mf_IceQueenAlive"},
    		FigureIsDead	{Tag = "IceQueen"},
   			QuestIsSolved {Quest = "SaveThane"},
   			MapFlagIsFalse  {Name = "mf_IceQueenDeadBeforeThaneSaved"},
    	},
    	Actions =
    	{
      		FigureKill	{Tag = "IceGolem01"},
      		FigureKill	{Tag = "IceGolem02"},
      		FigureKill	{Tag = "IceGolem03"},
      		FigureKill	{Tag = "IceGolem04"},
      		FigureKill	{Tag = "IceGolem05"},
      		QuestSetSolved	{Quest = "KillIceQueen"},
      		MapTimerStart	{Name = "mt_IceQueenDeadTimer"},
      					
       	},
    },  
    --Wenn Eiskönigin getötet wurde ohne das die Thane quest gesolved wurde
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue  {Name = "mf_IceQueenAlive"},
    		FigureIsDead	{Tag = "IceQueen"},
   			QuestIsNotSolved {Quest = "SaveThane"},
    	},
    	Actions =
    	{
      		FigureKill	{Tag = "IceGolem01"},
      		FigureKill	{Tag = "IceGolem02"},
      		FigureKill	{Tag = "IceGolem03"},
      		FigureKill	{Tag = "IceGolem04"},
      		FigureKill	{Tag = "IceGolem05"},
      		MapFlagSetTrue  {Name = "mf_IceQueenDeadBeforeThaneSaved"},
       	},
    },  
    --Letzte Cutszene wird gestartet
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_IceQueenDeadTimer", Seconds = 2},
    		
    	},
    	Actions =
    	{
      		MapFlagSetTrue  {Name = "mf_CutsceneEndStart"},
       	},
    },  
    
     --Nach der letzten Cutszene
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue	{Name = "mf_CutsceneIceQueenEnded"},
    	},
    	Actions =
    	{
      		MapFlagSetTrue  {Name = "mf_SpawnAman"},	
      		MapFlagSetTrue  {Name = "mf_SpawnIuan"},	
       	},
    },  
       
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_AmanOutcryTimer", Seconds = 4},
    	},
    	Actions =
    	{
      		FigureOutcry	{Tag = "Iuan", TextTag = "Iuan02"},
      		MapTimerStart	{Name = "mt_IuanEndcutszeneTimer"},
       	},
    },  
    
    --Wenn Eiskönigin getötet wurde
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_IuanEndcutszeneTimer", Seconds = 5},
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_P305_AmanIsDead"},
       	},
    },  
    
     --Wenn die letzte Cutszene vorbei ist.
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue  {Name = "mf_P305_AmanIsDead"},
    	},
    	Actions =
    	{
			QuestSetActive {Quest = "ReturnGF"},	
			AvatarFlagSetTrue {Name = "af_P305_JandrimSpawnOnWestguard"},
			PortalEnable	{Tag = "Portal_Start_Underhall"},
			EffectStart {Tag = "Portal_Start", File = "Effect_Spawn_Gate"},
			AvatarFlagSetTrue{Name = "af_P304_FirstReturnToGoldenFields"},
			PlayerTravelEnable	{},
			PortalEnable	{Tag = "Portal_Start"},
       	},
    },  		
    	
--*******************************************************
--***                                                 ***
--***             NQ Steinriesen	                  ***
--***                                                 ***
--*******************************************************  	    	
    	
     --Wenn alle Steinriesen aus ihrem Stein befreit wurden
    OnOneTimeEvent
  	{
      	Conditions =
    	{  		
    		MapFlagIsTrue  {Name = "mf_Riese01Alive"},
    		MapFlagIsTrue  {Name = "mf_Riese03Alive"},	
    		MapFlagIsTrue  {Name = "mf_Riese04Alive"},
    		MapFlagIsTrue  {Name = "mf_Riese06Alive"},	
    	},
    	Actions =
    	{
			MapFlagSetTrue  {Name = "mf_AllGiantsAwake"},
			MapFlagSetTrue  {Name = "mf_P305_AllGiantsAlive"},
       	},
    },  
    --Steinriesenqueste wird gesolved
    OnOneTimeEvent
  	{
      	Conditions =
    	{  		
    		OR
    		{
    			MapFlagIsTrue  {Name = "mf_AllGiantsAwake"},
    			MapFlagIsTrue	{Name = "mf_CutsceneIceQueenEnded"},		
    		},
    	},
    	Actions =
    	{
			QuestSetSolved {Quest = "UnderhallPart3WakeGiants"},		
       	},
    },  	 	 	
    
      --Stein01 bricht auseinander und Anim wird abgespielt
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_SteinGolem01Aktiv"},
    	},
    	Actions =
    	{
			ObjectChange	{Tag = "StatueGolem01", ObjectId = 1157, X = 616, Y = 74, Direction = 354},
			SoundGlobalPlayOnce	{File = "05_destruction/impact_catapult2"},
			MapTimerStart	{Name = "mt_Stone01Vanish"},
       	},
    },  	 		
    
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_Stone01Vanish", Seconds = 20},
    	},
    	Actions =
    	{
			ObjectVanish	{Tag = "StatueGolem01"},
			MapFlagSetTrue {Name = "mf_P305_Giant01Alive"},		
       	},
    },  	 		

      --Stein03 bricht auseinander und Anim wird abgespielt
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_SteinGolem03Aktiv"},
    	},
    	Actions =
    	{
			ObjectChange	{Tag = "StatueGolem03", ObjectId = 1157, X = 626, Y = 74, Direction = 354},
			SoundGlobalPlayOnce	{File = "05_destruction/impact_catapult2"},
			MapTimerStart	{Name = "mt_Stone03Vanish"},
       	},
    },  	 		
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_Stone03Vanish", Seconds = 20},
    	},
    	Actions =
    	{
			ObjectVanish	{Tag = "StatueGolem03"},
			MapFlagSetTrue {Name = "mf_P305_Giant03Alive"},
			
       	},
    },  	 		
    	
     --Stein04 bricht auseinander und Anim wird abgespielt
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_SteinGolem04Aktiv"},
    	},
    	Actions =
    	{
			ObjectChange	{Tag = "StatueGolem04", ObjectId = 1157, X = 463, Y = 53, Direction = 22},
			SoundGlobalPlayOnce	{File = "05_destruction/impact_catapult2"},
			MapTimerStart	{Name = "mt_Stone04Vanish"},
       	},
    },  	 		
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_Stone04Vanish", Seconds = 20},
    	},
    	Actions =
    	{
			ObjectVanish	{Tag = "StatueGolem04"},
			MapFlagSetTrue {Name = "mf_P305_Giant04Alive"},
			
       	},
    },  	 		

     --Stein06 bricht auseinander und Anim wird abgespielt
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_SteinGolem06Aktiv"},
    	},
    	Actions =
    	{
			ObjectChange	{Tag = "StatueGolem06", ObjectId = 1157, X = 477, Y = 38, Direction = 222},
			SoundGlobalPlayOnce	{File = "05_destruction/impact_catapult2"},
			MapTimerStart	{Name = "mt_Stone06Vanish"},
       	},
    },  	 		
	OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_Stone06Vanish", Seconds = 20},
    	},
    	Actions =
    	{
			ObjectVanish	{Tag = "StatueGolem06"},
			MapFlagSetTrue {Name = "mf_P305_Giant06Alive"},
			
       	},
    },  	 		
    	
--*******************************************************
--***                                                 ***
--***             NQ Der richtige Dreh                ***
--***                                                 ***
--*******************************************************  	
    	--Wenn die NQ aktiv ist. 
      OnOneTimeEvent
    {
      	Conditions =
    	{
    		QuestIsActive	{Quest = "TheRightTwistPart1"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_LelaSpawn"}, 
			--AvatarFlagSetTrue {Name = "af_P304_LelaQuestGiven"},
			MapFlagSetTrue {Name = "mf_LelaQuestGiven"},
			DialogTypeSetSideQuest	{Tag = "Lela"},
			DialogSetEnabled	{Tag = "Lela" },
			DialogTypeSetSideQuest	{Tag = "MinotaurDead"},
			DialogSetEnabled	{Tag = "MinotaurDead" },
			
   		},
   	},	
    	  	
		--Dialog mit Lela wird beendet sobald alle Infodialoge gesetzt wurden. 
      OnOneTimeEvent
    {
      	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_InfoDialogLela01"},
    		MapFlagIsTrue{Name = "mf_InfoDialogLela02"},
    		MapFlagIsTrue{Name = "mf_InfoDialogLela03"},
    		MapFlagIsTrue{Name = "mf_InfoDialogLela04"},
    		MapFlagIsTrue{Name = "mf_InfoDialogLela05"},
    	},
    	Actions =
    	{
    		DialogSetDisabled	{Tag = "Lela"},
   		},
   	},
		--Der Dialog von Kity wird freigeschaltet wenn man mit Lela gesprochen hat. 
    OnOneTimeEvent
    {
       	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_LelaTalkFirstTime"},
    		AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
    	},
    	Actions =
    	{
     		MapFlagSetTrue {Name = "mf_P305_LelaDiscovered"},
     		DialogTypeSetSideQuest	{Tag = "Kity"},
    		DialogSetEnabled	{Tag = "Kity"},
    		QuestSetActive	{Quest = "GetKittyFromDwarfcamp"},
    		FogOfWarReveal	{X = 33, Y = 143, Range = 10, Height = 165},
    		
   		},
    },
    --Outcry Jandrim nach dem Dialog mit Lela.
    OnOneTimeEvent
    {
       	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_LelaTalkFirstTime"},
    		AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
    		FigureIsAlive	{Tag = "Jandrim"},
    	},
    	Actions =
    	{	
     		FigureOutcryAlert	{TextTag = "Jandrim02", Tag = "Jandrim", TargetTag = "Kity"},
   		},
    },
    --Outcry eines Zwerges nach dem Dialog mit Lela, wenn es Jandrim gar nicht mehr gibt auf der Karte.
    OnOneTimeEvent
    {
       	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_LelaTalkFirstTime"},
    		AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
    		FigureIsDead	{Tag = "Jandrim"},
    		QuestIsActive	{Quest = "GetKittyFromDwarfcamp"},
    	},
    	Actions =
    	{
     		FigureOutcryAlert	{TextTag = "Jandrim02", Tag = "Citizen01", TargetTag = "Kity"},
   		},
    },
    
   		--Kity folg dem Spieler/Dummy Kity geht alleine aufs Zielfeld
   	OnOneTimeEvent
   	{
      	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_KityFollow"},
    		AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
    		
    	},
    	Actions =
    	{
    		QuestSetSolved	{Quest = "GetKittyFromDwarfcamp"},
    		QuestSetActive	{Quest = "BringKittyToMonster"},
    		MapFlagSetTrue{Name = "mf_KityFollowAvatar01"},
      	},
    },
        
    	--Wenn Kity und der Avatar im Zielbereich beim Minotaur stehen wird Dialog2 mit Kity freigeschaltet.
    OnOneTimeEvent
    {
      	Conditions =
    	{
    		
    		FigureIsInRange	{Tag = "Kity", Range = 10, X = 327, Y = 204},
   			
   		},
   		Actions =
   		{
   			MapFlagSetTrue{Name = "mf_KityAttackZone"},
			DialogTypeSetSideQuest	{Tag = "Kity"},
			DialogSetEnabled	{Tag = "Kity"},
       	},
    },
		--Kity jagd Minotaur.
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_KityAttackMinotaur"},
   		},
   		Actions =
   		{
   			QuestSetSolved	{Quest = "BringKittyToMonster"},
   			MapFlagSetTrue{Name = "mf_MinotaurRunStart"},
			DialogTypeSetSideQuest	{Tag = "Pocket"},
   			DialogSetEnabled	{Tag = "Pocket"},
   		},
   	},
    	--Outcry Lela, wenn Kity den Minotaur jagd. 
    OnOneTimeEvent
   	{
       	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_KityAttackMinotaur"},
    		AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
    		AvatarHasNotItemMisc	{Player = "pl_Human", ItemId = 88, Amount = 1},
    	},
    	Actions =
    	{
    		FigureOutcryAlert	{TextTag = "Lela01", Tag = "Lela", TargetTag = "Pocket"},
    		QuestSetActive	{Quest = "UnlockLelasChains"},	
       	},
    },
    --Nachdem der Lederbeutelgeleert wurde wird er gevanished.
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_PocketOpen"},
    		AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!	
    	},
   		Actions =
   		{
   			ObjectVanish	{Tag = "Pocket"},				
       	},
    },
    --Lela nach Dialog verschwindet sie.
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_LelaWalkNow", Seconds = 1},
    		AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
    	},
   		Actions =
   		{
   			FigureRun	{Tag = "Lela", X = 285, Y = 337},
   			AvatarFlagSetTrue{Name = "af_P305_LelaFree"},
       	},
    },
	--Wenn Lela das Portal erreicht hat, verschwindet sie.
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "Lela", Range = 5, X = 285, Y = 337},
    	},
   		Actions =
   		{
   			FigureVanish{Tag = "Lela"},		
       	},
    },
       
};