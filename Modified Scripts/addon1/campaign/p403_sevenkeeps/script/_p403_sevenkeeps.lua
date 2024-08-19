--*******************************************************
--***                                                 ***
--***               Sevenkeeps Addon1                 ***
--***                                                 ***
--*******************************************************

--Die Mission ist wie folgt auf die Lua Scripte verteilt:

--*******************************************************
--***                                                 ***
--***               Globale Scripte		              ***
--***                                                 ***
--*******************************************************

--_P403_Sevenkeeps
--MainQuest
--Outcries
--Rewards

--*******************************************************
--***                                                 ***
--***        Akt1 Zwerge in die Stadt bringen	      ***
--***                                                 ***
--*******************************************************

--BlackPouderPosition1-10
--Dwarf01-20
--DwarfSammelscript
--Pact01Pat1_01-03
--Pact01Pat1_Lead

--*******************************************************
--***                                                 ***
--***  Akt2 King Ulf und die Befreiung Siebenburgs	  ***
--***                                                 ***
--*******************************************************

--Gates
--Track01
--Track01Guard01-03
--Track01Lead
--Track01Nachhut01-02
--Track01Vorhit01-02
--Track01Pack01-08


--*******************************************************
--***                                                 ***
--***         Init State	Platformscript    	      ***
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
				--Cutszene wird gestartet			
    			MapFlagSetTrue {Name = "mf_P403_StartIntroCS"},
				BackdropHide	{Tag = "Backdrop_Cityship"},
				
				--Brennende Gebäude
				BuildingHealthSet	{Tag = "Farm01", Percent = 30},
				BuildingHealthSet	{Tag = "Farm02", Percent = 40},
			
				--Fog Aufdeckungen			
    	   		 
    	   		FogOfWarReveal	{FogOfWarId = 1, X = 540, Y = 473, Range = 55, Height = 120},
    	   		FogOfWarReveal	{FogOfWarId = 2, X = 635, Y = 676, Range = 15, Height = 125},
    	   		FogOfWarReveal	{FogOfWarId = 3, X = 609, Y = 476, Range = 15, Height = 125},
    	  
    	   		--Trebuchets
    	   		FigureSwappingDisable	{Tag = "Trebuchet1"},
    	   		FigureSwappingDisable	{Tag = "Trebuchet3"},
    	   		FigureSwappingDisable	{Tag = "Trebuchet4"},
    	   		FigureSwappingDisable	{Tag = "Trebuchet5"},
				
				
				DialogSetEnabled	{Tag = "BlackPouder02" },
				DialogTypeSetSideQuest	{Tag = "BlackPouder02"},
				
				DialogSetEnabled	{Tag = "Skjadir" },
				DialogTypeSetMainQuest	{Tag = "Skjadir"},
				
				DialogSetDisabled	{Tag = "Askan"},
				
				DialogSetDisabled	{Tag = "Gefangener1"},
				DialogSetDisabled	{Tag = "Gefangener2"},
				DialogSetDisabled	{Tag = "Redmund"},
				
				
				--Portal/Reisestein Deaktivierung
				PortalDisable	{Tag = "GoldenFields_Alluvyan"},
				PortalDisable	{Tag = "GoldenFields_Westguard"},
				PlayerTravelDisable	{},
				
				FigureVanish	{Tag = "HeroWind"},		-- die ist nur zur Dialoginitialisierung da...
		},
		GotoState = "DwarfSecurity",
	},
}

--*******************************************************
--***                                                 ***
--***       Akt1 Zwerge in die Stadt bringen	      ***
--***                                                 ***
--*******************************************************

-- SingleMapLoadEvent einladen
--dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "DwarfSecurity",
 	--Lever Für Haupttor wird betätigt.
 	OnOneTimeLeverEvent	
    {
    	Lever = "LeverGateDwarf", 
    	OnConditions = 
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 3, X = 554, Y = 497},
    		OR
			{
				GateIsClosed	{Tag = "MainGateDwarf"},
				MapFlagIsFalse {Name = "mf_GateDestroyed"},
			},
    	},
    	Actions = 
    	{
    		GateSetOpen	{Tag = "MainGateDwarf"},
    	},
    },
      
    --Das DwarfGate öffnet sich sobald sich ein Zwerg in Reichweite befindet.
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_GateDwarfOpenTimer", Seconds = 2},
		},
		Actions =
		{
			GateSetOpen	{Tag = "DwarfGate02"},
		},
		
	},
    --Abfrage ob das Stadttor schon geöffnet wurde, wenn nicht wird es jetzt geöffnet.
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			OR
			{
				GateIsClosed	{Tag = "MainGateDwarf"},
				MapFlagIsFalse {Name = "mf_GateDestroyed"},
			},
			QuestIsSolved {Quest = "SevenkeepsA1_GetFugitivesIntoTown"},
		},
		Actions =
		{
    		GateSetOpen	{Tag = "MainGateDwarf"},	
		},
		
	},  
	
	
	--GameOver Abfrag
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			PlayerHasNotUnitAmount	{Player = "pl_Human", UnitId = 1060, Amount = 10},
			QuestIsNotSolved {Quest = "SevenkeepsA1_GetToTown"},
		},
		Actions =
		{
    		PlayerGameOver	{Player = "pl_Human", Tag = "pl_HumanAvatar", LocaTag = "GameOverA1DwarfsDead"},
		},
		
	},  
	
		
	--HeroHall1 wird geclaimed.
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "HeroHall1", Range = 10},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "HeroHall1", Range = 10},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "HeroHall1", Range = 10},
			},
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_HeroHall01"}, 
		},
	},
	
	--HeroHall2 wird geclaimed.
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "HeroHall2", Range = 10},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWhisper", TargetTag = "HeroHall2", Range = 10},
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroWind", TargetTag = "HeroHall2", Range = 10},
			},
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_HeroHall02"}, 
		},
	},
	 	
	--Haldor verschwindet wenn er nicht mehr erwünscht ist.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_HaldorNotAccepted"},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions =
		{
			FigureWalk	{Tag = "Haldor", X = 621, Y = 641},
		},
		
	},   
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_HaldorNotAccepted"},
			FigureIsInRange	{Tag = "Haldor", Range = 2, X = 621, Y = 641},
		},
		Actions =
		{
			FigureLookAtDirection	{Tag = "Haldor", Direction = 270},
			MapTimerStart	{Name = "mt_HaldorKneeingTimer"},
		},
		
	},  
	
	--Atmozone wird getauscht sobald alle Kämpfe vorbei sind.
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead	{Tag = "GargoyleHorst01"},
			FigureIsDead	{Tag = "Pact01FireGargoyle04"},
			FigureIsDead	{Tag = "Pact01FireGargoyle03"},
			FigureIsDead	{Tag = "Pact01FireGargoyle02"},
			FigureIsDead	{Tag = "Pact01FireGargoyle01"},
		},
		Actions =
		{
			AtmoZoneChange	{Tag = "warsound7", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
		},
	},
	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_HaldorNotAccepted"},
			MapTimerIsElapsed	{Name = "mt_HaldorKneeingTimer", Seconds = 1},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "Haldor", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_hold.ska"},
		},
		
	}, 
	--Wenn das Tor geöffnet wurde, und alle Türme zerstört wurden verschwinden die Marker.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "DwarfGate02"},
			EntityIsExisting	{Tag = "Barrel01"},
			BuildingIsDead	{Tag = "Tower01"},	
			BuildingIsDead	{Tag = "Tower02"},	
		},
		Actions =
		{
			ObjectVanish	{Tag = "Barrel01"},
		},
		
	}, 
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "DwarfGate02"},
			EntityIsExisting	{Tag = "Barrel02"},
			BuildingIsDead	{Tag = "Tower03"},	
			BuildingIsDead	{Tag = "Tower04"},	
		},
		Actions =
		{
			ObjectVanish	{Tag = "Barrel02"},
		},
		
	}, 
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "DwarfGate02"},
			EntityIsExisting	{Tag = "Barrel03"},
			BuildingIsDead	{Tag = "Tower05"},	
			BuildingIsDead	{Tag = "Fortress"},	
		},
		Actions =
		{
			ObjectVanish	{Tag = "Barrel03"},
		},
		
	}, 
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "DwarfGate02"},
			EntityIsExisting	{Tag = "Barrel04"},
			BuildingIsDead	{Tag = "Tower06"},	
			BuildingIsDead	{Tag = "Tower07"},		
		},
		Actions =
		{
			ObjectVanish	{Tag = "Barrel04"},
		},
		
	}, 
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "DwarfGate02"},
			EntityIsExisting	{Tag = "Barrel05"},
			BuildingIsDead	{Tag = "Tower08"},	
			BuildingIsDead	{Tag = "Tower09"},
			BuildingIsDead	{Tag = "Tower10"},	
		},
		Actions =
		{
			ObjectVanish	{Tag = "Barrel05"},
		},
		
	}, 
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "DwarfGate02"},
			EntityIsExisting	{Tag = "Barrel06"},
			BuildingIsDead	{Tag = "Tower11"},	
			BuildingIsDead	{Tag = "Tower12"},	
		},
		Actions =
		{
			ObjectVanish	{Tag = "Barrel06"},
		},
		
	}, 
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "DwarfGate02"},
			EntityIsExisting	{Tag = "Barrel07"},
			BuildingIsDead	{Tag = "Tower13"},	
			BuildingIsDead	{Tag = "TrainingGround"},	
		},
		Actions =
		{
			ObjectVanish	{Tag = "Barrel07"},
		},
		
	}, 
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "DwarfGate02"},
			EntityIsExisting	{Tag = "Barrel08"},
			BuildingIsDead	{Tag = "Tower14"},	
			BuildingIsDead	{Tag = "Tower15"},	
		},
		Actions =
		{
			ObjectVanish	{Tag = "Barrel08"},
		},
		
	}, 
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "DwarfGate02"},
			EntityIsExisting	{Tag = "Barrel09"},
			BuildingIsDead	{Tag = "Tower17"},	
			BuildingIsDead	{Tag = "Tower18"},
		},
		Actions =
		{
			ObjectVanish	{Tag = "Barrel09"},
		},
		
	}, 
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "DwarfGate02"},
			EntityIsExisting	{Tag = "Barrel10"},
			GateIsOpen	{Tag = "MainGateDwarf"},	
		},
		Actions =
		{
			ObjectVanish	{Tag = "Barrel10"},
		},
		
	}, 
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			GateIsOpen	{Tag = "DwarfGate02"},
			EntityIsExisting	{Tag = "Barrel11"},
			BuildingIsDead	{Tag = "Camp01"},	
		},
		Actions =
		{
			ObjectVanish	{Tag = "Barrel11"},
		},
		
	}, 
	        
--*******************************************************
--***                                                 ***
--***                BlackPouder	                  ***
--***                                                 ***
--*******************************************************    
   
 --Fässer werden aufgenommen  
 
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_PouderTake02"},
		},
		Actions =
		{
			AvatarItemMiscGive	{Player = "pl_Human", ItemId = 283, Amount = 13},
    		ObjectVanish	{Tag = "BlackPouder01"},	
    		ObjectVanish	{Tag = "BlackPouder02"},	
    		ObjectVanish	{Tag = "BlackPouder03"},
    		FigureRun	{Tag = "Skjadir", X = 651, Y = 663},
		},
		
	},
	

    
--*******************************************************
--***                                                 ***
--***   Akt2 King Ulf und die Befreiung Siebenburgs	  ***
--***                                                 ***
--*******************************************************  

--Akt2 wird gestartet.
 
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "SevenkeepsA1_GetToTown"},
		},
		Actions =
		{
			
			--Cutszene KingUlf wird gestartet			
    		MapFlagSetTrue {Name = "mf_P403_KingUlfCS"},	
			MapFlagSetTrue {Name = "mf_Akt2Started"},	
			MapFlagSetTrue {Name = "mf_DwarfGate02IsOpen"}, --die Tore werden aktiviert	
			   
			FogOfWarCloak	{FogOfWarId = 1},
			FogOfWarCloak	{FogOfWarId = 2},
		
			--Ulf
			FogOfWarReveal	{X = 441, Y = 323, Range = 15, Height = 135},
			--Redmund
			FogOfWarReveal	{X = 109, Y = 199, Range = 15, Height = 130},
			
			DialogSetEnabled	{Tag = "BauerIdling" },
			DialogTypeSetSideQuest	{Tag = "BauerIdling"},
			DialogSetEnabled	{Tag = "BauerLocke" },
			DialogTypeSetSideQuest	{Tag = "BauerLocke"},
			DialogSetEnabled	{Tag = "BauerSalios" },
			DialogTypeSetSideQuest	{Tag = "BauerSalios"},
			
			DialogSetEnabled	{Tag = "Gefangener2" },   
			DialogTypeSetSideQuest	{Tag = "Gefangener2"},
			DialogSetEnabled	{Tag = "Gefangener1" },   
			DialogTypeSetSideQuest	{Tag = "Gefangener1"},
			
			ObjectVanish	{Tag = "Bomb01"},
			ObjectVanish	{Tag = "Bomb02"},
			ObjectVanish	{Tag = "Bomb03"},
			ObjectVanish	{Tag = "Bomb04"},
			ObjectVanish	{Tag = "Bomb05"},
			ObjectVanish	{Tag = "Bomb06"},
			ObjectVanish	{Tag = "Bomb07"},
			ObjectVanish	{Tag = "Bomb08"},
			ObjectVanish	{Tag = "Bomb09"},
			ObjectVanish	{Tag = "Bomb10"},
			ObjectVanish	{Tag = "Bomb11"},
			
			ObjectVanish	{Tag = "Barrel01"},
			ObjectVanish	{Tag = "Barrel02"},
			ObjectVanish	{Tag = "Barrel03"},
			ObjectVanish	{Tag = "Barrel04"},
			ObjectVanish	{Tag = "Barrel05"},
			ObjectVanish	{Tag = "Barrel06"},
			ObjectVanish	{Tag = "Barrel07"},
			ObjectVanish	{Tag = "Barrel08"},
			ObjectVanish	{Tag = "Barrel09"},
			ObjectVanish	{Tag = "Barrel10"},
			ObjectVanish	{Tag = "Barrel11"},
	
			DialogSetDisabled	{Tag = "BlackPouder02"},
			DialogSetEnabled	{Tag = "Redmund" },   
			DialogTypeSetMainQuest	{Tag = "Redmund"},
			PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_BindstoneMilitia"},
			PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_BindstoneDwarf"},	
			
			AIPlayerDeactivate	{Player = "pl_Pact01"},
				
				
			},
		
		},
		
	--Redmund
 	OnEvent
	{
		Conditions =
		{
			AvatarHasNotItemMisc	{Player = "pl_Human", ItemId = 282, Amount = 1},
			MapFlagIsFalse	{Name = "mf_WarenaustauschEinmal"},
			
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_Warenaustausch"},
			MapFlagSetTrue	{Name = "mf_WarenaustauschEinmal"},
		},	
		
	},	
		
	--BombJack wird gevanished falls es ihn noch gibt.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsAlive	{Tag = "BombJackUnit"},
			QuestIsSolved {Quest = "SevenkeepsA1_GetToTown"},
		},
		Actions =
		{
			FigureVanish	{Tag = "BombJackUnit"},
		},
		
	},
	--Haldor begibt sich  in die Stadt
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "SevenkeepsA1_GetToTown"},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Haldor"},
			MapTimerStart	{Name = "mt_HaldorWalk"},
		},
		
	},
	--Haldor begibt sich  in die Stadt
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "SevenkeepsA1_GetToTown"},
			MapTimerIsElapsed	{Name = "mt_HaldorWalk", Seconds = 2},
			GateIsOpen	{Tag = "HouseGate"},
			GateIsOpen	{Tag = "HouseGate2"},	
		},
		Actions =
		{
			FigureWalk	{Tag = "Haldor", X = 599, Y = 323},
		},
		
	},
	--Nachdem man mit Redmund gesprochen hat werden die Versorgungslinien des Pakts aufgedeckt.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_RedmundKnown"},	
		},
		Actions =
		{
			--Tore werden aufgedeckt
				FogOfWarReveal	{FogOfWarId = 5, X = 177, Y = 99, Range = 15, Height = 120},
    	   		FogOfWarReveal	{FogOfWarId = 6, X = 95, Y = 161, Range = 15, Height = 122},
    	   		FogOfWarReveal	{FogOfWarId = 7, X = 166, Y = 233, Range = 15, Height = 120},
    	   		FogOfWarReveal	{X = 236.127, Y = 597.602,  Range = 15, Height = 135},
			--Patroullien werden aufgedeckt Track01
				
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint02r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint03r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint04r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint05r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint06r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint07r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint08r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint09r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint10r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "4PathPoint11", Range = 20, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint12r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint13r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint14r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint15r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint16r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint17r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint18r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint19r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint20r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint21r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint22r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "PathPoint23r", Range = 10, Height = 110},
				
				
				--Patroullien werden aufgedekt Track02
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint06r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint07r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint08r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint09r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint10r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint11r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track02CityWaitingPoint08", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint13r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint14r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint15r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint16r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint17r", Range = 20, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint18r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint19r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathEndpoint08", Range = 20, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint22r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint23r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint24r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Track2PathPoint25r", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "FogOfWarMarker01", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "FogOfWarMarker02", Range = 10, Height = 110},
				FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "FogOfWarMarker03", Range = 10, Height = 110},
				
				PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_SuedWest"},
				PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_HolyPlace"},
				PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_BindstoneNorth"},
				PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_BindstoneSouth"},
		},
    },
       
--*******************************************************
--***                                                 ***
--***                BlackPouder	                  ***
--***                                                 ***
--*******************************************************      
   
   
    --Wenn alle Camps zerstört wurden.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "SevenkeepsA1_WipeCamps"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Track01Vanish"},
			MapFlagSetTrue {Name = "mf_Track02Vanish"},
		},
    },
   
   --Atmozone wird getauscht sobald alle Kämpfe vorbei sind.
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead	{Tag = "GargoyleHorst01"},
			FigureIsDead	{Tag = "Pact01FireGargoyle04"},
			FigureIsDead	{Tag = "Pact01FireGargoyle03"},
			FigureIsDead	{Tag = "Pact01FireGargoyle02"},
			FigureIsDead	{Tag = "Pact01FireGargoyle01"},
		},
		Actions =
		{
			AtmoZoneChange	{Tag = "warsound7", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
		},
	},
	
	--Atmozone wird getauscht sobald alle Kämpfe vorbei sind.
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead	{Tag = "GargoyleHorst02"},
			BuildingIsDead	{Tag = "Camp02"},
			FigureIsDead	{Tag = "Pact02FireGargoyle01"},
			FigureIsDead	{Tag = "Pact02FireGargoyle02"},
		},
		Actions =
		{
			AtmoZoneChange	{Tag = "warsound1", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
		},
	},
	
	--Atmozone wird getauscht sobald alle Kämpfe vorbei sind.
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead	{Tag = "GargoyleHorst03"},
			BuildingIsDead	{Tag = "Camp03"},
			FigureIsDead	{Tag = "Pact03FireGargoyle02"},
			FigureIsDead	{Tag = "Pact03FireGargoyle01"},
		},
		Actions =
		{
			AtmoZoneChange	{Tag = "warsound2", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
			AtmoZoneChange	{Tag = "warsound3", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
		},
	},
	
	--Atmozone wird getauscht sobald alle Kämpfe vorbei sind.
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead	{Tag = "GargoyleHorst04"},
			BuildingIsDead	{Tag = "Camp04"},
			FigureIsDead	{Tag = "Pact04FireGargoyle04"},
			FigureIsDead	{Tag = "Pact04FireGargoyle03"},
			FigureIsDead	{Tag = "Pact04FireGargoyle02"},
			FigureIsDead	{Tag = "Pact04FireGargoyle01"},
		},
		Actions =
		{
			AtmoZoneChange	{Tag = "warsound4", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
			AtmoZoneChange	{Tag = "warsound5", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
		},
	},
	
	--Atmozone wird getauscht sobald alle Kämpfe vorbei sind.
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead	{Tag = "Camp05"},
		},
		Actions =
		{
			AtmoZoneChange	{Tag = "warsound6", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
		},
	},
   
   
     --Wenn ein Tier aus dem Track getötet wurde und der TrackVanisher True ist werden alle Tiere gevanished.
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Track01Vanish"},
		},
		Actions =
		{
			FigureVanish	{Tag = "Track01Pack01"},
			FigureVanish	{Tag = "Track01Pack02"},
			FigureVanish	{Tag = "Track01Pack03"},
			FigureVanish	{Tag = "Track01Pack04"},
			FigureVanish	{Tag = "Track01Pack05"},
			FigureVanish	{Tag = "Track01Pack06"},
			FigureVanish	{Tag = "Track01Pack07"},
			FigureVanish	{Tag = "Track01Pack08"},
			
			FigureVanish	{Tag = "Track01Vorhut01"},
			FigureVanish	{Tag = "Track01Vorhut02"},
			FigureVanish	{Tag = "Track01Nachhut01"},
			FigureVanish	{Tag = "Track01Nachhut02"},
			
			FigureVanish	{Tag = "Track01Lead"},
			FigureVanish	{Tag = "Track01Guard01"},
			FigureVanish	{Tag = "Track01Guard02"},
			FigureVanish	{Tag = "Track01Guard03"},
			
			FigureVanish	{Tag = "PonyCampGuard1"},
			FigureVanish	{Tag = "PonyCampGuard2"},
			FigureVanish	{Tag = "PonyCampGuard3"},
			FigureVanish	{Tag = "PonyCampGuard4"},
			FigureVanish	{Tag = "PonyCampGuard5"},
			FigureVanish	{Tag = "PonyCampGuard6"},
			FigureVanish	{Tag = "PonyCampGuard7"},
			FigureVanish	{Tag = "PonyCampGuard8"},
			FigureVanish	{Tag = "PonyCampGuard9"},
			FigureVanish	{Tag = "PonyCampGuard10"},
		},
    },
    
 --Wenn ein Tier aus dem Track02 getötet wurde und der TrackVanisher True ist werden alle Tiere gevanished.
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Track02Vanish"},
		},
		Actions =
		{
			FigureVanish	{Tag = "Track02Pack01"},
			FigureVanish	{Tag = "Track02Pack02"},
			FigureVanish	{Tag = "Track02Pack03"},
			FigureVanish	{Tag = "Track02Pack04"},
			FigureVanish	{Tag = "Track02Pack05"},
			FigureVanish	{Tag = "Track02Pack06"},
			FigureVanish	{Tag = "Track02Pack07"},
			FigureVanish	{Tag = "Track02Pack08"},
			
			FigureVanish	{Tag = "Track02Vorhut01"},
			FigureVanish	{Tag = "Track02Vorhut02"},
			FigureVanish	{Tag = "Track02Nachhut01"},
			FigureVanish	{Tag = "Track02Nachhut02"},
			
			FigureVanish	{Tag = "Track02Lead"},
			FigureVanish	{Tag = "Track02Guard01"},
			FigureVanish	{Tag = "Track02Guard02"},
			FigureVanish	{Tag = "Track02Guard03"},
			
			FigureVanish	{Tag = "PonyCampGuard11"},
			FigureVanish	{Tag = "PonyCampGuard12"},
			FigureVanish	{Tag = "PonyCampGuard13"},
			FigureVanish	{Tag = "PonyCampGuard14"},
			FigureVanish	{Tag = "PonyCampGuard15"},
		},
    },   
    
	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			BuildingIsDead	{Tag = "Camp02"},
			BuildingIsDead	{Tag = "Building1Camp2"},
			BuildingIsDead	{Tag = "Building2Camp2"},
			BuildingIsDead	{Tag = "GargoyleHorst02"},
			FigureIsDead	{Tag = "ChefCamp2"},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_DestroyedPactCamps", Value = 1},
			ObjectVanish	{Tag = "PactCamp02"},
			MapFlagSetTrue	{Name = "mf_Camp02Destroyed"},
			
		},
    },
    
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			BuildingIsDead	{Tag = "GargoyleHorst03"},
			BuildingIsDead	{Tag = "Camp03"},
			BuildingIsDead	{Tag = "TrainingGroundCamp3"},
			BuildingIsDead	{Tag = "DarkFortressCamp3"},
			FigureIsDead	{Tag = "ChefCamp3"},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_DestroyedPactCamps", Value = 1},
			ObjectVanish	{Tag = "PactCamp03"},
			MapFlagSetTrue	{Name = "mf_Camp03Destroyed"},
		},
    },
    
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			BuildingIsDead	{Tag = "GargoyleHorst04"},
			BuildingIsDead	{Tag = "Camp04"},
			BuildingIsDead	{Tag = "Building1Camp4"},
			BuildingIsDead	{Tag = "Building2Camp4"},
			FigureIsDead	{Tag = "ChefCamp4"},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_DestroyedPactCamps", Value = 1},
			ObjectVanish	{Tag = "PactCamp04"},
			MapFlagSetTrue	{Name = "mf_Camp04Destroyed"}, --Ponytrack2
		},
    },
    
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			BuildingIsDead	{Tag = "Camp05"},
			BuildingIsDead	{Tag = "Building1Camp5"},
			BuildingIsDead	{Tag = "Building2Camp5"},
			FigureIsDead	{Tag = "ChefCamp5"},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_DestroyedPactCamps", Value = 1},
			ObjectVanish	{Tag = "PactCamp05"},
			MapFlagSetTrue	{Name = "mf_Camp05Destroyed"}, --Ponytrack1
		},
    },
	
	--Beim letzten Camp erscheinen die Geweihte und helfen dem Spieler.
	 OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_DestroyedPactCamps", Value = 3},
			MapFlagIsFalse	{Name = "mf_Camp02Destroyed"},
			OR
			{
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 10, X = 246, Y = 656},
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 10, X = 249, Y = 648},
			},
			
			
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_SpawnGeweihteCamp02"},
			FigureVanish	{Tag = "Riddengards_Gang01"},
			FigureVanish	{Tag = "Riddengards_Gang02"},
			FigureVanish	{Tag = "Riddengards_Gang03"},
		},
    },
	--Beim letzten Camp erscheinen die Geweihte und helfen dem Spieler.
	 OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_DestroyedPactCamps", Value = 3},
			MapFlagIsFalse	{Name = "mf_Camp03Destroyed"},
			OR
			{
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 10, X = 467, Y = 162},
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 10, X = 462, Y = 123},
			},
			
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_SpawnGeweihteCamp03"},
			FigureVanish	{Tag = "Riddengards_Gang01"},
			FigureVanish	{Tag = "Riddengards_Gang02"},
			FigureVanish	{Tag = "Riddengards_Gang03"},
		},
    },
	--Beim letzten Camp erscheinen die Geweihte und helfen dem Spieler.
	 OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_DestroyedPactCamps", Value = 3},
			MapFlagIsFalse	{Name = "mf_Camp04Destroyed"},
			OR
			{
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 10, X = 247, Y = 236},
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 10, X = 156, Y = 273},
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 10, X = 166, Y = 240},
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 10, X = 221, Y = 298},
				PlayerFigureIsInRange	{Player = "pl_Human", Range = 10, X = 240, Y = 298},
			},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_SpawnGeweihteCamp04"},
			FigureVanish	{Tag = "Riddengards_Gang01"},
			FigureVanish	{Tag = "Riddengards_Gang02"},
			FigureVanish	{Tag = "Riddengards_Gang03"},
		},
    },
    --Beim letzten Camp erscheinen die Geweihte und helfen dem Spieler.
	 OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_DestroyedPactCamps", Value = 3},
			MapFlagIsFalse	{Name = "mf_Camp05Destroyed"},
			PlayerFigureIsInRange	{Player = "pl_Human", Range = 10, X = 46, Y = 88},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_SpawnGeweihteCamp05"},
			FigureVanish	{Tag = "Riddengards_Gang01"},
			FigureVanish	{Tag = "Riddengards_Gang02"},
			FigureVanish	{Tag = "Riddengards_Gang03"},
		},
    },
	
	
	
	
	--Nachdem alle Camps vernichtet wurden wird die letzte Cutszene gestartet
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved {Quest = "SevenkeepsA1_WipeCamps"},	
		},
		Actions =
		{
			--Cutszene KingUlf wird gestartet			
    		MapFlagSetTrue {Name = "mf_P403_EndCS"},
    		FigureRespawn	{Tag = "Riddengards_Gang01",X = 434.378, Y = 324.221},
    		FigureRespawn	{Tag = "Riddengards_Gang02", X = 432.431, Y = 323.714},
    		FigureRespawn	{Tag = "Riddengards_Gang03", X = 432.453, Y = 321.032},
    		DialogSetDisabled	{Tag = "Redmund"},
		},
    },
    
    --Die Zivilisten werden gespawned und die Tore geöffnet
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P403_EndCS"},
			
		},
		Actions =
		{
			ObjectVanish	{Tag = "LeverPactMainGate1"},
			ObjectVanish	{Tag = "LeverPactMainGate2"},
			ObjectVanish	{Tag = "LeverElfenGate01"},
			ObjectVanish	{Tag = "LeverElfenGate02"},
			ObjectVanish	{Tag = "LeverGateGarnisson01"},
			ObjectVanish	{Tag = "LeverGateGarnisson02"},
			ObjectVanish	{Tag = "LeverGateGarnisson03"},
			ObjectVanish	{Tag = "LeverGateSouth"},
			GateSetOpen	{Tag = "PactMainGate01"},
			GateSetOpen	{Tag = "PactMainGate02"},
			GateSetOpen	{Tag = "ElfenGate01"},
			GateSetOpen	{Tag = "ElfenGate02"},
			GateSetOpen	{Tag = "GarnisonGate01"},
			GateSetOpen	{Tag = "GarnisonGate02"},
			GateSetOpen	{Tag = "GarnisonGate03"},
			GateSetOpen	{Tag = "HumanGateSouth"},
			
			GateSetOpen	{Tag = "TempelGate"},
			GateSetOpen	{Tag = "HouseGate2"},
			
			PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_Uni"},	
			
		},
    },
    
    --Der Timer für die Zivilisten wird nach der King Ulf Cutszene gestartet.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndEndeCS"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_ResidentTimerStart"},
			
		},
    },
    
    
    --Nachdem der letzten Cutszene bekommt Halicos und Askan einen Dialog
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndEndeCS"},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "Askan" },   
		},
    },
   
    
    --Nach dem Dialog mit Askan startet eine Cutszene mit Riddengard.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
			MapFlagIsTrue {Name = "mf_PlayerTeleportGhostwatch"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P403_RiddengardCS"},
		},
    },
	
 
-- DIALOGKONTROLLE Haldor
	OnOneTimeEvent
{
	Conditions =
	{
	MapFlagIsTrue {Name = "mf_HaldorOffer"},
	AvatarHasItemMisc	{Player = "pl_Human", ItemId = 284, Amount = 1},
	AvatarIsNotTalking	{},
	},
	Actions =
	{
		
		DialogSetEnabled	{Tag = "Haldor"},
	},
},

	OnOneTimeEvent
{
	Conditions =
	{
	MapFlagIsTrue {Name = "mf_PowderReady"},
	},
	Actions =
	{
		
		DialogSetEnabled	{Tag = "Haldor"},
	},
}
};
