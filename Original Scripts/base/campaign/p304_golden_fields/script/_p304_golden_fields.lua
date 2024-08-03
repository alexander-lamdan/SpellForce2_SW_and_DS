
State
{
	StateName = "MainState",
	
	
	OnOneTimeEvent
    {
    	-- das Flag "AlwaysTrue" ist immer true sein
    	-- ist als Default-Abfragewert für Sammelscripte gedacht (Spawning etc.)
    	-- Außerdem wird das NonstopNonsens-Flag true gesetzt == Freischaltung
    	-- der abgeschalteten Nebenquesten
    	Conditions =
    	{
    	},
    	Actions =
    	{
    		 AvatarFlagSetTrue	{Name = "af_P304_AlwaysTrue"},
    		 AvatarFlagSetTrue{Name = "af_P304_NonstopNonsens"},
    		 
    		 FigureSwappingDisable {Tag = "Asha"},
    		 FigureSwappingDisable {Tag = "Drakka01"},
    		 FigureSwappingDisable {Tag = "Drakka02"},
    		 FigureSwappingDisable {Tag = "Drakka03"},
    		 FigureSwappingDisable {Tag = "Drakka04"},
    		 FigureSwappingDisable {Tag = "Drakka05"},
    		 FigureSwappingDisable {Tag = "Drakka06"},
    		 FigureSwappingDisable {Tag = "Drakka07"},
    		 FigureSwappingDisable {Tag = "Drakka08"},
    		 FigureSwappingDisable {Tag = "DrakkarMaster"},
    		 FigureSwappingDisable {Tag = "DrakkarMentor"},
    		 FigureSwappingDisable {Tag = "DrakkarPractice01"},
    		 FigureSwappingDisable {Tag = "DrakkarPractice02"},
    		 FigureSwappingDisable {Tag = "DrakkarPractice03"},
    		 FigureSwappingDisable {Tag = "GeneralRedmund"},
    		 FigureSwappingDisable {Tag = "GuildmasterAlyre"},
    		 FigureSwappingDisable {Tag = "GuildmasterCardogan"},
    		 FigureSwappingDisable {Tag = "GuildmasterLaudinia"},
    		 FigureSwappingDisable {Tag = "MageAlba"},
    		 FigureSwappingDisable {Tag = "MageTalienne"},
    		 FigureSwappingDisable {Tag = "MageZodias"},
    		 FigureSwappingDisable {Tag = "MagisterAskan"},
    		 FigureSwappingDisable {Tag = "MilitiaFalida"},
    		 FigureSwappingDisable {Tag = "MilitiaSemion"},
    		 FigureSwappingDisable {Tag = "PatriarchAlastar"},
    		 FigureSwappingDisable {Tag = "PriestSephis"},
    		 FigureSwappingDisable {Tag = "PriestGalius"},
    		 FigureSwappingDisable {Tag = "ProfessorUndergant"},
    		 FigureSwappingDisable {Tag = "TraderJorge"},
    		 FigureSwappingDisable {Tag = "TraderOdger"},
    	}, 
    },
	
	
	
	
	----- Übergabe der Soldaten- und Magiereinheiten, wenn man
	----- Punkte für Soldaten & Magier sammelt
	
	-- PASSIERT IM SAMMELSCRIPT: GIVESOLDIERS_SHAREDSCRIPT
	-- PASSIERT IM SAMMELSCRIPT: GIVEMAGES_SHAREDSCRIPT
	
	----- ENDE
	----- Übergabe der Soldaten- und Magiereinheiten, wenn man
	----- Punkte für Soldaten & Magier sammelt
	
	
	

   
   
   --- 1. Cutscene triggert
   --- sobald pl_HumanAvatar sich dem Schloss von Süden nähert
   
	OnOneTimeEvent
   	{
   		Conditions =
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 439.6, Y = 280},
		},
		Actions =
   		{	
   			AvatarFlagSetTrue {Name = "af_P304_PalaceArrival"},
   			AvatarFlagSetTrue {Name = "af_P304_CS01Start"},
   			
   			PlayerHeroRemove{Player = "pl_Human", Tag = "Nightsong"},
   			
   			FigureOutcry {Tag = "Nonsense", TextTag = "UbergabeOutcry02"},
   			-- Schattenlied wird entfernt
   		},
	},
	
	
	
	
	
	--- 2. Cutscene triggert
   	--- sobald pl_HumanAvatar sich dem Zwerg Jandrim nähert
   
	OnOneTimeEvent
   	{
   		Conditions =
		{
			FigureIsInEntityRange{Tag = "pl_HumanAvatar", TargetTag = "Windhammer", Range = 10},
			QuestIsActive	{Quest = "GFPart3TalkToDwarf"},
		},
		Actions =
   		{
   			AvatarFlagSetTrue {Name = "af_P304_JandrimArrival"},
   		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithWindhammer", Value = 1 },
			GameInterfaceIsVisible{},
		},
		Actions =
		{
			FigureOutcry{TextTag = "JandrimToPortal01", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "JandrimToPortal02", Tag = "Windhammer"},
			FigureOutcry{TextTag = "JandrimToPortal03", Tag = "Windhammer"},
		},
		-- Outcries nach Dialog mit Jandrim
	},
	
	
	
	--- 3. Cutscene triggert
	---
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed{Name = "mt_Cutscene03Timer", Seconds = 5},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions =
		{
			AvatarFlagSetTrue{Name = "af_P304_Cutscene03Start"},
		},    
	},        
 
 
---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--- GOLDEN FIELDS
--- PART 2 STUFF

---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 
 
 	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_TalkedWithIdara"},
		},
		Actions = 
		{
			ObjectVanish{Tag = "Fence01"},
			ObjectVanish{Tag = "Fence02"},
			GateSetOpen	{Tag = "Gate02"},
		},
		-- nachdem man mit Idara gesprochen hat, geht die Verbindung zu Hagard
		-- auf (sowohl verschwindet der blockende Zaun als auch öffnet sich das Tor)
	};


 
 
 	--- 4. Cutscene triggert
   	--- sobald Avatar den zweiten Dialog mit Hagard beendet hat
	OnOneTimeEvent
   	{
   		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithHagard", Value = 2 }, 
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions =
   		{
   			AvatarFlagSetTrue {Name = "af_P304_Cutscene04Start"},
   			AvatarFlagSetTrue {Name = "af_P304_HagardUnmasked"},
   		},
	},
 
 	OnOneTimeEvent
 	{
 		Conditions =
 		{
 			AvatarFlagIsTrue{Name ="af_P314_HagardSummonsSverants"},
 			FigureIsDead{Tag = "HagardsServant01"},
 			FigureIsDead{Tag = "HagardsServant02"},
 			FigureIsDead{Tag = "HagardsServant03"},
 			FigureIsDead{Tag = "HagardsServant04"},
 			FigureIsDead{Tag = "HagardsServant05"},
 			FigureIsDead{Tag = "HagardsServant06"},
 			FigureIsDead{Tag = "HagardsServant07"},
 			FigureIsDead{Tag = "HagardsServant08"},
 			FigureIsDead{Tag = "HagardsServant09"},
 			FigureIsDead{Tag = "HagardsServant10"},
 		},
 		Actions =
 		{
 			AvatarFlagSetTrue {Name = "af_P304_YliaFreed"},
 			FigureOutcry{TextTag = "HagardMocks03", Tag = "FakeHagard"},
 			ObjectVanish{Tag = "ThiefGate02"},
 		},
 	},
 
---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--- GOLDEN FIELDS
--- PART 3 STUFF

---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
 
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_SecondReturnToGoldenFields"},	
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P304_Cutscene05Start"},
		},
	},
 
 
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P304_CS05Finished"},
			GameInterfaceIsVisible	{},
		},
		Actions =
		{
			FigureOutcry{TextTag = "ShadowSongKidnapped01", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "ShadowSongKidnapped02", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "ShadowSongKidnapped03", Tag = "pl_HumanAvatar"},
			
			AvatarFlagSetTrue {Name = "af_P304_ShadowsongKidnapped"},
		}, -- nach Ablauf der 5. Cutscene
		-- kann man Redmund auf die verschwundene Schattenlied ansprechen
	},
		 
 	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P304_ShadowsongKidnapperTold"},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Hagard", Team = "tm_Team2"},
			GateSetOpen	{Tag = "Gate01"},
		},
		-- sobald der Spieler von Redmund erfahren hat, daß Schattenlied in den Nordosten
		-- verschleppt wurde, öffnet sich das Tor, Hagard wird aggro
	},
 	
 	
 	OnOneTimeEvent
 	{
 		Conditions =
 		{
 			AvatarFlagIsTrue {Name = "af_P304_ShadowsongKidnapperTold"},
 			FigureIsDead{Tag = "Hagard"},
 			FigureIsDead{Tag = "Zarshuul"},
 			FigureIsDead{Tag = "Ghulaar"},
 		},
 		Actions =
 		{
 			AvatarFlagSetTrue{Name = "af_P304_ShadowsongFreed"},
 			-- Schattenlied wird in ihrem Script wieder eingeschaltet
 		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_GiveShadowsongAgainToAvatar"},
		},
		Actions =
		{
			FigureVanish{Tag = "Schattenlied"},
			PlayerHeroAdd {Player = "pl_Human", HeroId = 25},
			FigureHeroSpawn {Player = "default", Tag = "Nightsong", X = 658 , Y = 640, Direction = 258.014},
			
			FigureOutcry {Tag = "Nonsense", TextTag = "UbergabeOutcry03"},
			-- Nightsong wird geadded
		},
		-- Die gescriptete Schattenlied wird gevanished
		-- Der Spieler bekommt Schattenlied wieder als Held
	},
	
	
	
	
	---- FÜR NEBENQUEST: Verschollene Lieferungen
	---- Bestimmung eines Zufallswerts zwischen 1 und 6
	OnOneTimeEvent
	{
		Conditions = {},
		Actions =
		{
			AvatarValueRandomize
			{Name = "av_P304_DeliveryRandomizer", MinValue = 1, MaxValue = 6},
			AvatarValueRandomize
			{Name = "av_P304_DeliveryRandomizer", MinValue = 1, MaxValue = 6},
			AvatarValueRandomize
			{Name = "av_P304_DeliveryRandomizer", MinValue = 1, MaxValue = 6},
		},
	},
	
	
	---- FÜR NEBENQUEST: Pickpocketing
	OnOneTimeEvent
	{
		Conditions = {},
		Actions =
		{
			MapTimerStart{Name = "mt_PauseBetweenPickpocketing"},
		},
		-- MapTimer initialisieren, damit die Klaue des Taschendiebstahls beim ersten
		-- Mal zulangen kann
		-- (der Rest findet sich im Script "ResidentSharedAllNew.lua")
	},
	
	
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
	-- Der Spieler bringt das böse Geschenk zu Marcus und hat ihn getötet
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Marcus"}
		},
		Actions =
		{
			QuestSetSolved {Quest = "HouseOfGreyDarioDelivery"},
			QuestSetActive {Quest = "HouseOfGreyReturnToDario"},
		}
	},
	
	
	---------------------------------------------------------------
	---------------------------------------------------------------
	---                       SAMMELQUESTEN                     ---
	---------------------------------------------------------------
	---------------------------------------------------------------
	 --Blutnessel abgreifen
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			OR
   			{
   			  LeverIsOn	{Tag = "Herb01"},
   			  LeverIsOn	{Tag = "HerbA1"},
   			  LeverIsOn	{Tag = "HerbB1"},
   			  LeverIsOn	{Tag = "HerbC1"},
   			  LeverIsOn	{Tag = "HerbD1"},
   			  LeverIsOn	{Tag = "HerbE1"},
   			}, 
    	},
    	Actions =
   		{
   				ObjectVanish{Tag = "Herb01"},
   				ObjectVanish{Tag = "HerbA1"},
   				ObjectVanish{Tag = "HerbB1"},
   				ObjectVanish{Tag = "HerbC1"},
   				ObjectVanish{Tag = "HerbD1"},
   				ObjectVanish{Tag = "HerbE1"},
   				AvatarItemMiscGive	{Player = "pl_Human", ItemId = 23, Amount = 1},   				
       	},
    }, 
    
     --Katzenwurzel abgreifen
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			OR
   			{
   			  LeverIsOn	{Tag = "Herb02"},
   			  LeverIsOn	{Tag = "HerbA2"},
   			  LeverIsOn	{Tag = "HerbB2"},
   			  LeverIsOn	{Tag = "HerbC2"},
   			  LeverIsOn	{Tag = "HerbD2"},
   			  LeverIsOn	{Tag = "HerbE2"},
   			},
    	},
    	Actions =
   		{
   				ObjectVanish{Tag = "Herb02"},
   				ObjectVanish{Tag = "HerbA2"},
   				ObjectVanish{Tag = "HerbB2"},
   				ObjectVanish{Tag = "HerbC2"},
   				ObjectVanish{Tag = "HerbD2"},
   				ObjectVanish{Tag = "HerbE2"},
   				AvatarItemMiscGive	{Player = "pl_Human", ItemId = 22, Amount = 1},   				
       	},
    }, 
    
     --Leuchtkraut abgreifen
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			OR
   			{
   				LeverIsOn{Tag = "Herb03"},
   				LeverIsOn{Tag = "HerbA3"},
   				LeverIsOn{Tag = "HerbB3"},
   				LeverIsOn{Tag = "HerbC3"},
   				LeverIsOn{Tag = "HerbD3"},
   				LeverIsOn{Tag = "HerbE3"},
   			},
    	},
    	Actions =
   		{
   				ObjectVanish{Tag = "Herb03"},
   				ObjectVanish{Tag = "HerbA3"},
   				ObjectVanish{Tag = "HerbB3"},
   				ObjectVanish{Tag = "HerbC3"},
   				ObjectVanish{Tag = "HerbD3"},
   				ObjectVanish{Tag = "HerbE3"},
   				AvatarItemMiscGive	{Player = "pl_Human", ItemId = 24, Amount = 1},   				
       	},
    }, 
     --Teufelslauch abgreifen
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			OR
   			{
   			  LeverIsOn{Tag = "Herb04"},
   			  LeverIsOn{Tag = "HerbA4"},
   			  LeverIsOn{Tag = "HerbB4"},
   			  LeverIsOn{Tag = "HerbC4"},
   			  LeverIsOn{Tag = "HerbD4"},
   			  LeverIsOn{Tag = "HerbE4"},
   			}, 
    	},
    	Actions =
   		{
   				ObjectVanish{Tag = "Herb04"},
   				ObjectVanish{Tag = "HerbA4"},
   				ObjectVanish{Tag = "HerbB4"},
   				ObjectVanish{Tag = "HerbC4"},
   				ObjectVanish{Tag = "HerbD4"},
   				ObjectVanish{Tag = "HerbE4"},
   				AvatarItemMiscGive	{Player = "pl_Human", ItemId = 25, Amount = 1},   				
       	},
    }, 
     --Wermut abgreifen
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			OR
   			{
   			  LeverIsOn{Tag = "Herb05"},
   			  LeverIsOn{Tag = "HerbA5"},
   			  LeverIsOn{Tag = "HerbB5"},
   			  LeverIsOn{Tag = "HerbC5"},
   			  LeverIsOn{Tag = "HerbD5"},
   			  LeverIsOn{Tag = "HerbE5"},
   			}, 
    	},
    	Actions =
   		{
   				ObjectVanish{Tag = "Herb05"},
   				ObjectVanish{Tag = "HerbA5"},
   				ObjectVanish{Tag = "HerbB5"},
   				ObjectVanish{Tag = "HerbC5"},
   				ObjectVanish{Tag = "HerbD5"},
   				ObjectVanish{Tag = "HerbE5"},
   				AvatarItemMiscGive	{Player = "pl_Human", ItemId = 21, Amount = 1},   				
       	},
    }, 
    
    --Brauner Waldling abgreifen
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			OR
   			{
   			  LeverIsOn{Tag = "Fungus01"},
   			  LeverIsOn{Tag = "FungusA1"},
   			  LeverIsOn{Tag = "FungusB1"},
   			  LeverIsOn{Tag = "FungusC1"},
   			  LeverIsOn{Tag = "FungusD1"},
   			  LeverIsOn{Tag = "FungusE1"},
   			}, 
    	},
    	Actions =
   		{
   			ObjectVanish{Tag = "Fungus01"},
   			ObjectVanish{Tag = "FungusA1"},
   			ObjectVanish{Tag = "FungusB1"},
   			ObjectVanish{Tag = "FungusC1"},
   			ObjectVanish{Tag = "FungusD1"},
   			ObjectVanish{Tag = "FungusE1"},
   			AvatarItemMiscGive	{Player = "pl_Human", ItemId = 31, Amount = 1},   				
       	},
    }, 
    --Elfenspreizling abgreifen
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			OR
   			{   				
   			  LeverIsOn{Tag = "Fungus02"},
   			  LeverIsOn{Tag = "FungusA2"},
   			  LeverIsOn{Tag = "FungusB2"},
   			  LeverIsOn{Tag = "FungusC2"},
   			  LeverIsOn{Tag = "FungusD2"},
   			  LeverIsOn{Tag = "FungusE2"},
   			}, 
    	},
    	Actions =
   		{
   				ObjectVanish{Tag = "Fungus02"},
   				ObjectVanish{Tag = "FungusA2"},
   				ObjectVanish{Tag = "FungusB2"},
   				ObjectVanish{Tag = "FungusC2"},
   				ObjectVanish{Tag = "FungusD2"},
   				ObjectVanish{Tag = "FungusE2"},
   				AvatarItemMiscGive	{Player = "pl_Human", ItemId = 30, Amount = 1},   				
       	},
    }, 
    --Gelben Speiling abgreifen
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			OR
   			{
   			  LeverIsOn{Tag = "Fungus03"},
   			  LeverIsOn{Tag = "FungusA3"},
   			  LeverIsOn{Tag = "FungusB3"},
   			  LeverIsOn{Tag = "FungusC3"},
   			  LeverIsOn{Tag = "FungusD3"},
   			  LeverIsOn{Tag = "FungusE3"},
   			}, 
    	},
    	Actions =
   		{
   				ObjectVanish{Tag = "Fungus03"},
   				ObjectVanish{Tag = "FungusA3"},
   				ObjectVanish{Tag = "FungusB3"},
   				ObjectVanish{Tag = "FungusC3"},
   				ObjectVanish{Tag = "FungusD3"},
   				ObjectVanish{Tag = "FungusE3"},
   				AvatarItemMiscGive	{Player = "pl_Human", ItemId = 28, Amount = 1},   				
       	},
    }, 
    --Giftstacheling abgreifen
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			OR
   			{
   			  LeverIsOn{Tag = "Fungus04"},
   			  LeverIsOn{Tag = "FungusA4"},
   			  LeverIsOn{Tag = "FungusB4"},
   			  LeverIsOn{Tag = "FungusC4"},
   			  LeverIsOn{Tag = "FungusD4"},
   			  LeverIsOn{Tag = "FungusE4"},
   			}, 
    	},
    	Actions =
   		{
   				ObjectVanish{Tag = "Fungus04"},
   				ObjectVanish{Tag = "FungusA4"},
   				ObjectVanish{Tag = "FungusB4"},
   				ObjectVanish{Tag = "FungusC4"},
   				ObjectVanish{Tag = "FungusD4"},
   				ObjectVanish{Tag = "FungusE4"},
   				AvatarItemMiscGive	{Player = "pl_Human", ItemId = 27, Amount = 1},   				
       	},
    }, 
    --Magenkrempling abgreifen
   	OnOneTimeEvent
  	{	
   		Conditions =
   		{
   			OR
   			{
   			  LeverIsOn{Tag = "Fungus05"},
   			  LeverIsOn{Tag = "FungusA5"},
   			  LeverIsOn{Tag = "FungusB5"},
   			  LeverIsOn{Tag = "FungusC5"},
   			  LeverIsOn{Tag = "FungusD5"},
   			  LeverIsOn{Tag = "FungusE5"},
   			}, 
    	},
    	Actions =
   		{
   				ObjectVanish{Tag = "Fungus05"},
   				ObjectVanish{Tag = "FungusA5"},
   				ObjectVanish{Tag = "FungusB5"},
   				ObjectVanish{Tag = "FungusC5"},
   				ObjectVanish{Tag = "FungusD5"},
   				ObjectVanish{Tag = "FungusE5"},
   				AvatarItemMiscGive	{Player = "pl_Human", ItemId = 29, Amount = 1},   				
       	},
    }, 
	
	
	----------------------------------------------------------------------
	---- MURMELN ---------------------------------------------------------
	----------------------------------------------------------------------
	
	OnEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 184, Amount = 1},
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 185, Amount = 1},
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 186, Amount = 1},
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 187, Amount = 1},
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 188, Amount = 1},
		},
		Actions = 
		{
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 184, Amount = 1},
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 185, Amount = 1},
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 186, Amount = 1},
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 187, Amount = 1},
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 188, Amount = 1},
			AvatarItemMiscGive{Player = "pl_Human", ItemId = 198, Amount = 1},
		},
	};


	----------------------------------------------------------------------
	
	
	
	
	-- Marker für das Painting starten
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "HouseOfGreyPaintGF"}
		},
		Actions =
		{
			ObjectChange	{Tag = "PaintingMarker", ObjectId = 1592, X = 245, Y = 432, Direction = 0},
			FogOfWarRevealAtEntity{FogOfWarId = 5, Tag = "PaintingMarker", Range = 10, Height = default},
		}
	},
	-- Bild von Needle malen
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "PaintingMarker", Range = 5},
			QuestIsActive {Quest = "HouseOfGreyPaintGF"},
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Paint1"},
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Paint2"},
			QuestSetSolved {Quest = "HouseOfGreyPaintGF"},
			ObjectVanish	{Tag = "PaintingMarker"},
		}
	},
	-- Alle Bilder gemalt, Rückkehrquest starten
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "HouseOfGreyPaintRushwater"},
			QuestIsSolved {Quest = "HouseOfGreyPaintNeedle"},
			QuestIsSolved {Quest = "HouseOfGreyPaintGF"},
			QuestIsSolved {Quest = "HouseOfGreyPaintFireforge"},
			QuestIsSolved {Quest = "HouseOfGreyPaintMagnetStones"},
			QuestIsNotKnown  {Player = "pl_Human", Quest = "HouseOfGreyReturnMyra"},
		},
		Actions =
		{
			QuestSetActive {Quest = "HouseOfGreyReturnMyra"},
			AvatarItemMiscTake {ItemId = 222, Amount = 1},
		}
	},
	
	
	
	-- Professor Undergant schaltet seinen Dialog nun in seinem eigenen Script an
	-- Askan schaltet seinen Dialog nun in seinem eigenen Script an
	
	
	
	----------------------------------------------------------------------------------
	------------------- XP-Rewards for Mobboss-Kills ---------------------------------
	----------------------------------------------------------------------------------
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Boma"},
			-- Boma, der Bär (im 3 Teil)
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_BomaTheBearKilled"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "GrandmotherSilvernet"},
			-- Spinne vor Tor Großmutter Silbernetz
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_SpiderBeforeGateKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Scarface"},
			-- bandit Narbengesicht im Banditencamp
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_BanditChiefKilled"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_GhulaarSpawned"},
			FigureIsDead{Tag = "Ghulaar"},
			-- einer von Hagards Wachen
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_HagardsWarden01Killed" },
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_ZarshuulSpawned"},
			FigureIsDead{Tag = "Zarshuul"},
			-- zweiter von Hagards Wachen
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_HagardsWarden02Killed" },
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_HagardsServant01Spawned"},
			FigureIsDead{Tag = "HagardsServant01"},
			-- Hagards zehn beschworene Geister
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_HagardsServant01Killed" },
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_HagardsServant02Spawned"},
			FigureIsDead{Tag = "HagardsServant02"},
			-- Hagards zehn beschworene Geister
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_HagardsServant02Killed" },
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_HagardsServant03Spawned"},
			FigureIsDead{Tag = "HagardsServant03"},
			-- Hagards zehn beschworene Geister
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_HagardsServant03Killed" },
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_HagardsServant04Spawned"},
			FigureIsDead{Tag = "HagardsServant04"},
			-- Hagards zehn beschworene Geister
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_HagardsServant04Killed" },
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_HagardsServant05Spawned"},
			FigureIsDead{Tag = "HagardsServant05"},
			-- Hagards zehn beschworene Geister
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_HagardsServant05Killed" },
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_HagardsServant06Spawned"},
			FigureIsDead{Tag = "HagardsServant06"},
			-- Hagards zehn beschworene Geister
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_HagardsServant06Killed" },
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_HagardsServant07Spawned"},
			FigureIsDead{Tag = "HagardsServant07"},
			-- Hagards zehn beschworene Geister
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_HagardsServant07Killed" },
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_HagardsServant08Spawned"},
			FigureIsDead{Tag = "HagardsServant08"},
			-- Hagards zehn beschworene Geister
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_HagardsServant08Killed" },
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_HagardsServant09Spawned"},
			FigureIsDead{Tag = "HagardsServant09"},
			-- Hagards zehn beschworene Geister
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_HagardsServant09Killed" },
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_HagardsServant10Spawned"},
			FigureIsDead{Tag = "HagardsServant10"},
			-- Hagards zehn beschworene Geister
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_HagardsServant10Killed" },
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Mugger01Spawned"},
			FigureIsDead{Tag = "Mugger01"},
			-- Die drei Mugger
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_Mugger01Killed" },
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Mugger02Spawned"},
			FigureIsDead{Tag = "Mugger02"},
			-- Die drei Mugger
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_Mugger02Killed" },
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Mugger03Spawned"},
			FigureIsDead{Tag = "Mugger03"},
			-- Die drei Mugger
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_Mugger03Killed" },
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P304_CS05Finished"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = "mf_CS05KingCutscene" },
		},
	},
	
	---- XP für Hagard jeweils in dessen Script
	
	
	
	-------------------- LENYA BEIM HÄNDLER KAUFEN
	
	OnEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 264, Amount = 1},
		},
		Actions = 
		{
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 264, Amount = 1},
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 200},
			-- 200 Stück Lenya
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 265, Amount = 1},
		},
		Actions = 
		{
			AvatarItemMiscTake{Player = "pl_Human", ItemId = 265, Amount = 1},
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 500},
			-- 500 Stück Lenya
		},
	},


}
