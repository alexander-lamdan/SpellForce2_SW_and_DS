
--OrogLights
OrogLight01X = 425
OrogLight01Y = 656
OrogLight02X = 445
OrogLight02Y = 639
OrogLight03X = 443
OrogLight03Y = 615
OrogLight04X = 406
OrogLight04Y = 616
OrogLight05X = 406
OrogLight05Y = 639

--OrogWaveTimer
OrogWaveTimer = 60


State
{
	StateName = "NQBloodRevenge",
--*******************************************************
--***                                                 ***
--***          		NQ Blutrache		              ***
--***                                                 ***
--*******************************************************   

--*******************************************************
--***                                                 ***
--***          			NQ Teleport		              ***
--***                                                 ***
--*******************************************************   	


    OnOneTimeEvent
    {
    	   
    	Conditions =
    	{
    		AvatarHasItemMisc	{Player = "pl_Human", ItemId = 156, Amount = 1},
    		QuestIsActive	{Quest = "RevengeKillOrog"},
    	},
    	Actions =
    	{
    		ObjectSpawn	{Tag = "Teleport01", ObjectId = 1432, X = 348.5, Y = 634, Direction = 0},
       	},
    },	 
        
    --In die Arena vom Teleport01 nur beim ersten Mal
    OnOneTimeEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 2, X = Teleporter01X, Y = Teleporter01Y},
    		AvatarHasItemMisc	{Player = "pl_Human", ItemId = 156, Amount = 1},
    		QuestIsActive	{Quest = "RevengeKillOrog"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanAvatar", X = TeleporterArenaX, Y = TeleporterArenaY},
 			MapFlagSetTrue {Name = "mf_ReiseSteinAktive"},
 			AvatarItemMiscTake	{Player = "pl_Human", ItemId = 156, Amount = 1},
   		},
    },    
    
     --In die Arena vom Teleport01
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 2, X = Teleporter01X, Y = Teleporter01Y},
    		MapFlagIsTrue {Name = "mf_ReiseSteinAktive"},
    		--QuestIsActive	{Quest = "RevengeKillOrog"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanAvatar", X = 424, Y = 607},
 			
   		},
    },    
    
    
    --Aus der Arena zum Teleport01
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 2, X = TeleporterArenaX, Y = TeleporterArenaY},
    		AvatarHasItemMisc	{Player = "pl_Human", ItemId = 218, Amount = 1},
    		AvatarHasItemMisc	{Player = "pl_Human", ItemId = 219, Amount = 1},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "pl_HumanAvatar", X = 347, Y = 625},
   		},
    }, 
    
    
--*******************************************************
--***                                                 ***
--***          		NQ Teleport End		              ***
--***                                                 ***
--*******************************************************   
	   
    --Wenn Tzang stirbt 
     OnOneTimeEvent
    {
    	   
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_TzangAlive"},
    		FigureIsDead	{Tag = "Tzang"},
    		QuestIsActive	{Quest = "RevengeKillTzang"},
    		QuestIsActive	{Quest = "GoSRevenge"},
    		AvatarHasItemMisc {ItemId = 218, Amount = 1},
    	},
    	Actions =
    	{
    		QuestSetSolved	{Quest = "RevengeKillTzang"},   	
       	},
    },
    -- Nur mit beiden Köpfen wird gesolved
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "RevengeKillOrog"},
			QuestIsSolved {Quest = "RevengeKillTzang"},
			QuestIsNotKnown {Quest = "RevengeBringHeadOrog"},
			QuestIsNotKnown {Quest = "RevengeBringHeadTzang"}
		},
		Actions =
		{
			QuestSetActive {Quest = "RevengeBringHeadOrog"},
			QuestSetActive	{Quest = "RevengeBringHeadTzang"}, 
		}
	},	 
   

--*******************************************************
--***                                                 ***
--***          			New Wave		              ***
--***                                                 ***
--*******************************************************   
     --Wichtel sterben wenn alle drei Brandstifter getötet wurden.
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsDead	{Tag = "Brandstifter01"},
    		FigureIsDead	{Tag = "Brandstifter02"},
    		FigureIsDead	{Tag = "Brandstifter03"},
    		MapFlagIsTrue {Name = "mf_Brandstifter01Alive"}, 
    		MapFlagIsTrue {Name = "mf_Brandstifter02Alive"}, 
    		MapFlagIsTrue {Name = "mf_Brandstifter03Alive"}, 
    		MapFlagIsFalse {Name = "mf_EinmalOrogWaveSchalter"},
    	},
    	Actions =
    	{
 			FigureKill	{Tag = "Feuerwichtel01"},
 			FigureKill	{Tag = "Feuerwichtel02"},
 			FigureKill	{Tag = "Feuerwichtel03"},
 			FigureKill	{Tag = "Feuerwichtel04"},
 			FigureKill	{Tag = "Feuerwichtel05"},
 			FigureKill	{Tag = "Feuerwichtel06"},
 			FigureKill	{Tag = "Feuerwichtel07"},
 			FigureKill	{Tag = "Feuerwichtel08"},
 			FigureKill	{Tag = "Feuerwichtel09"},
 			FigureKill	{Tag = "Feuerwichtel10"},
 			FigureKill	{Tag = "Feuerwichtel11"},
 			FigureKill	{Tag = "Feuerwichtel12"},
 			FigureKill	{Tag = "Feuerwichtel13"},
 			FigureKill	{Tag = "Feuerwichtel14"},
 			FigureKill	{Tag = "Feuerwichtel15"},
 			
 			FigureKill	{Tag = "Feuerwichtel16"},
 			FigureKill	{Tag = "Feuerwichtel17"},
 			FigureKill	{Tag = "Feuerwichtel18"},
 			FigureKill	{Tag = "Feuerwichtel19"},
 			FigureKill	{Tag = "Feuerwichtel20"},
 			FigureKill	{Tag = "Feuerwichtel21"},
 			FigureKill	{Tag = "Feuerwichtel22"},
 			FigureKill	{Tag = "Feuerwichtel23"},
 			FigureKill	{Tag = "Feuerwichtel24"},
 			FigureKill	{Tag = "Feuerwichtel25"},
 			FigureKill	{Tag = "Feuerwichtel26"},
 			FigureKill	{Tag = "Feuerwichtel27"},
 			FigureKill	{Tag = "Feuerwichtel28"},
 			FigureKill	{Tag = "Feuerwichtel29"},
 			FigureKill	{Tag = "Feuerwichtel30"},
 			
 			MapTimerStart	{Name = "mt_OrogWaveStart"},
 			MapFlagSetTrue {Name = "mf_BrandstifterNotAlive"},
 			MapFlagSetTrue {Name = "mf_EinmalOrogWaveSchalter"},
   		},
    },      
 	--Start new OrogWave.
    OnEvent
    {
    	
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_OrogWaveStart", Seconds = OrogWaveTimer},
    		MapFlagIsTrue {Name = "mf_OrogAlive"},
    		FigureIsAlive	{Tag = "Orog"},
    		MapFlagIsFalse {Name = "mf_ZweimalOrogWaveSchalter"},
    	},
    	Actions =
    	{
 			EntityFlagSetFalse {Name = "ef_WichtelInitialisierung"},
 			MapFlagSetTrue {Name = "mf_NewOrogWave"},
 			MapTimerStop	{Name = "mt_OrogWaveStart"},
 			MapFlagSetTrue {Name = "mf_ZweimalOrogWaveSchalter"},
   		},
    },   
   
    --Wichtelsplitting Initialisierung.
    OnEvent
    {
    	
    	Conditions =
    	{
    		EntityFlagIsFalse {Name = "ef_WichtelInitialisierung"},
    		MapFlagIsTrue {Name = "mf_OrogAlive"},
    		FigureIsAlive	{Tag = "Orog"},
    		
    	},
    	Actions =
    	{
 			MapValueSet	{Name = "mv_WichtelGroupA", Value = 0},
 			MapValueSet	{Name = "mv_WichtelGroupB", Value = 0},
 			MapValueSet	{Name = "mv_WichtelGroupC", Value = 0},
 			MapValueSet	{Name = "mv_WichtelGroupD", Value = 0},
 			
 			MapValueSet	{Name = "mv_WichtelGroupA2", Value = 0},
 			MapValueSet	{Name = "mv_WichtelGroupB2", Value = 0},
 			MapValueSet	{Name = "mv_WichtelGroupC2", Value = 0},
 			MapValueSet	{Name = "mv_WichtelGroupD2", Value = 0},
 			
 			EntityFlagSetTrue {Name = "ef_WichtelInitialisierung"},
 			MapFlagSetFalse {Name = "mf_EinmalOrogWaveSchalter"},
 			MapFlagSetFalse {Name = "mf_ZweimalOrogWaveSchalter"},
 			
   		},
    },   
   
    --Wenn Orog weniger als 15% Health dann wird ein Area Feuercast freigeschaltet
    OnOneTimeEvent
    {
    	   
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_OrogAlive"},
    		FigureHasNotHealth	{Tag = "Orog", Percent = 15},
    	},
    	Actions =
    	{
    		TeamCastSpell	{Spell = 54, Power = 1, Team = "tm_Creep", X = 426, Y = 628},
       	},
    },	
   
    --Wenn Orog stirbt sterben auch alle seine Untertanen
    OnOneTimeEvent
    {
    	   
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_OrogAlive"},
    		FigureIsDead	{Tag = "Orog"},
    	},
    	Actions =
    	{
    		FigureKill	{Tag = "Feuerwichtel01"},
 			FigureKill	{Tag = "Feuerwichtel02"},
 			FigureKill	{Tag = "Feuerwichtel03"},
 			FigureKill	{Tag = "Feuerwichtel04"},
 			FigureKill	{Tag = "Feuerwichtel05"},
 			FigureKill	{Tag = "Feuerwichtel06"},
 			FigureKill	{Tag = "Feuerwichtel07"},
 			FigureKill	{Tag = "Feuerwichtel08"},
 			FigureKill	{Tag = "Feuerwichtel09"},
 			FigureKill	{Tag = "Feuerwichtel10"},
 			FigureKill	{Tag = "Feuerwichtel11"},
 			FigureKill	{Tag = "Feuerwichtel12"},
 			FigureKill	{Tag = "Feuerwichtel13"},
 			FigureKill	{Tag = "Feuerwichtel14"},
 			FigureKill	{Tag = "Feuerwichtel15"},
 			
 			FigureKill	{Tag = "Feuerwichtel16"},
 			FigureKill	{Tag = "Feuerwichtel17"},
 			FigureKill	{Tag = "Feuerwichtel18"},
 			FigureKill	{Tag = "Feuerwichtel19"},
 			FigureKill	{Tag = "Feuerwichtel20"},
 			FigureKill	{Tag = "Feuerwichtel21"},
 			FigureKill	{Tag = "Feuerwichtel22"},
 			FigureKill	{Tag = "Feuerwichtel23"},
 			FigureKill	{Tag = "Feuerwichtel24"},
 			FigureKill	{Tag = "Feuerwichtel25"},
 			FigureKill	{Tag = "Feuerwichtel26"},
 			FigureKill	{Tag = "Feuerwichtel27"},
 			FigureKill	{Tag = "Feuerwichtel28"},
 			FigureKill	{Tag = "Feuerwichtel29"},
 			FigureKill	{Tag = "Feuerwichtel30"},
 			
 			FigureKill	{Tag = "Brandstifter01"},
 			FigureKill	{Tag = "Brandstifter02"},
 			FigureKill	{Tag = "Brandstifter03"},
 			
 			MapFlagSetFalse {Name = "mf_NewOrogWave"},
 			MapFlagSetTrue {Name = "mf_OrogIsDead"},
 			--FigureKill	{Tag = "OrogLight01burner"},
 			--FigureKill	{Tag = "OrogLight02burner"},
 			--FigureKill	{Tag = "OrogLight03burner"},
 			--FigureKill	{Tag = "OrogLight04burner"},
 			--FigureKill	{Tag = "OrogLight05burner"},    	
       	},
    },	
    -- Erst wenn der Spieler den Kopf hat darf die Quest gesolved werden
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive	{Quest = "RevengeKillOrog"},
    		QuestIsActive	{Quest = "GoSRevenge"},
    		AvatarHasItemMisc {ItemId = 219, Amount = 1},
    	},
    	Actions =
    	{
    		QuestSetSolved	{Quest = "RevengeKillOrog"},
    		ObjectChange	{Tag = "TeleportInside", ObjectId = 1432, X = 424.13, Y = 600.679, Direction = 0},
    	}
    },
   

 
    
     
--*******************************************************
--***                                                 ***
--***         		 NQ Blutrache End         	      ***
--***                                                 ***
--*******************************************************     
 
 
};

