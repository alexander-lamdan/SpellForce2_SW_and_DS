
--*******************************************************
--***                                                 ***
--***                  Shal                           ***
--***                                                 ***
--*******************************************************

----FlaggenStandorte Team Alpha
--FlagAlpha01X = 23.8
--FlagAlpha01Y = 148.4
--FlagAlpha02X = 117.6
--FlagAlpha02Y = 211.4
--FlagAlpha03X = 86.8
--FlagAlpha03Y = 334.6
--FlagAlpha04X = 159.6
--FlagAlpha04Y = 280
--FlagAlpha05X = 81.2
--FlagAlpha05Y = 60.2
--FlagAlpha06X = 32.2
--FlagAlpha06Y = 226.8
--FlagAlpha07X = 96.6
--FlagAlpha07Y = 254.8
HomePointAlphaX = 35 --50
HomePointAlphaY = 266 --270
--
----FlaggenStandorte Team Beta
--FlagBeta01X = 246.4
--FlagBeta01Y = 334.6
--FlagBeta02X = 312.2
--FlagBeta02Y = 296.8
--FlagBeta03X = 302.4
--FlagBeta03Y = 224
--FlagBeta04X = 270.2
--FlagBeta04Y = 194.6
--FlagBeta05X = 287
--FlagBeta05Y = 21
--FlagBeta06X = 186.2
--FlagBeta06Y = 126
--FlagBeta07X = 287
--FlagBeta07Y = 82.6
--FlagBeta08X = 319.2
--FlagBeta08Y = 144.2
HomePointBetaX = 325 --320
HomePointBetaY = 93.8 --110
--
----FlaggenIDs
--Neutral = 1134
--Alpha = 1132
--Beta = 1133
--Spieler = 1131



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

			DialogSetDisabled	{Tag = "Ur"},

			--XP Vergabe
			MapFlagSetTrue {Name = "mf_P316_ReachedShal"},

    		--Building Add
    		PlayerBuildingAdd{Player = "pl_Human", BuildingId = 133},
    		PlayerBuildingAdd{Player = "pl_Human", BuildingId = 134},
			PlayerBuildingAdd{Player = "pl_Human", BuildingId = 136},
			PlayerBuildingAdd{Player = "pl_Human", BuildingId = 137},
			PlayerBuildingAdd{Player = "pl_Human", BuildingId = 147},
    		PlayerBuildingAdd{Player = "pl_Human", BuildingId = 146},
			PlayerBuildingAdd{Player = "pl_Human", BuildingId = 142},
			PlayerBuildingAdd{Player = "pl_Human", BuildingId = 138},
			PlayerBuildingAdd{Player = "pl_Human", BuildingId = 140},
    		PlayerBuildingAdd{Player = "pl_Human", BuildingId = 145},
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 20},
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 28},
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 26},
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 34},
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 24},
			MapTimerStart	{Name = "mt_WaitTimer"},
			DialogSetDisabled	{Tag = "Ur"},
			AvatarItemMiscTake	{Player = "pl_Human", ItemId = 152, Amount = 1},
			
			 --Bei folgenden Figuren wird das Swapping verhindert
    	   	FigureSwappingDisable {Tag = "Merchant"},
    	   	FigureSwappingDisable {Tag = "MerchantSklave"},
    	  
       	},
		GotoState = "MainState",
	},
}


-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "MainState",
    OnOneTimeEvent
    {
    	-- das Flag "AlwaysTrue" ist immer true sein
    	-- ist als Default-Abfragewert für Sammelscripte gedacht (Spawning etc.)
    	Conditions =
    	{
    			MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
    	},
    	Actions =
    	{
				--Die Leibgarde greift ein
				FigureTeamTransfer	{Tag = "Wache05", Team = "tm_TeamAlpha"},
				FigureTeamTransfer	{Tag = "Wache06", Team = "tm_TeamAlpha"},
				FigureTeamTransfer	{Tag = "Wache07", Team = "tm_TeamAlpha"},
				FigureTeamTransfer	{Tag = "Wache08", Team = "tm_TeamAlpha"},
				--FigureTeamTransfer	{Tag = "Malar", Team = "tm_TeamAlpha"},

				PlayerTravelDisable	{},
				PortalDisable	{Tag = "ShalStartPortal"},
				PortalDisable	{Tag = "Portal_End"},
       	},
    },

     --Spieler findet Lenya
    OnEvent
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
--***           Shal Gefangenen Quest                 ***
--***                                                 ***
--*******************************************************
     OnOneTimeEvent
    {

    	--Wenn alle Wachen getötet wurden nach dem Intro.
    	Conditions =
    	{
    		MapFlagIsTrue	{Name = "mf_CutsceneStartEnded"},
    		FigureIsDead	{Tag = "Wache05"},
    		FigureIsDead	{Tag = "Wache06"},
    		FigureIsDead	{Tag = "Wache07"},
    		FigureIsDead	{Tag = "Wache08"},
			FigureIsDead	{Tag = "Malar"},
    	},
    	Actions =
    	{
    		MapFlagSetTrue{Name = "mf_UrGuardsDeath"},
    		QuestSetActive {Quest = "ShalPart1Trapped"},
    		DialogTypeSetMainQuest	{Tag = "Ur"},
    		DialogSetEnabled	{Tag = "Ur"},
       	},
    },

     OnOneTimeEvent
    {

    	-- Wenn HeldenA befreit werden
    	Conditions =
    	{
    		OR
    		{
    			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "GateZelleHelden01", Range = 5},
				MapFlagIsTrue{Name = "mf_UrGuardsDeath"},
    		},
    	},
    	Actions =
    	{
			GateSetOpen	{Tag = "GateZelleHelden01"},
			MapFlagSetTrue	{Name = "mf_HeldenASchonBefreit"},
       	},
    },

     OnOneTimeEvent
    {

    	--  Wenn HeldenB befreit werden
    	Conditions =
    	{
    		OR
    		{
    			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "GateZelleHelden02", Range = 5},
				MapFlagIsTrue{Name = "mf_UrGuardsDeath"},
    		},
			
    	},
    	Actions =
    	{
    		GateSetOpen	{Tag = "GateZelleHelden02"},
    		MapFlagSetTrue	{Name = "mf_HeldenBSchonBefreit"},
       	},
    },
--*******************************************************
--***                                                 ***
--***         Shal Gefangenen Quest End               ***
--***                                                 ***
--*******************************************************	
--*******************************************************
--***                                                 ***
--***         			Cutszene Ur 	              ***
--***                                                 ***
--*******************************************************	
   --Nach der Cutszene mit Ur
      OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue {Name = "mf_P316_Ur_Is_Dead"},
    		MapTimerIsElapsed	{Name = "mt_CutszeneEndUr", Seconds = 2},
    	},
    	Actions =
    	{
    			MapTimerStart	{Name = "mt_OutcriesUr"},
    			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar01"},
				FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar02"},
				FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar03"},
				FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar04"},
				FigureVanish	{Tag = "Wache01"},
				FigureVanish	{Tag = "Wache02"},
				FigureVanish	{Tag = "Wache03"},
				FigureVanish	{Tag = "Wache04"},
				--FigureAnimPlayOnce	{Tag = "Ur_Dragon", File = "base/gfx/figures/boss/figure_boss_dragon_ur_wounded_die.ska"},
				MapFlagSetTrue{Name = "mf_Cutszene2Start"},
				MapTimerStart	{Name = "mt_CutsceneSchattenliedTimer"},
				ObjectLootItemMiscAdd	{Tag = "LootUr", DropChance = 100, ItemId = 214},
       	},
    },
--*******************************************************
--***                                                 ***
--***         		Cutszene ShadowSong               ***
--***                                                 ***
--*******************************************************
--*******************************************************
--***                                                 ***
--***           		XP Vewrgabe   	              ***
--***                                                 ***
--*******************************************************	  

   --XP Sorvinas Leibwächter
	OnOneTimeEvent
    {
    	Conditions =
    	{
    		 MapFlagIsTrue {Name = "mf_CutsceneStartEnded"},
    		 FigureIsDead	{Tag = "Wache05"},

    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P316_SorvinaGuard05Dead"},
       	},
    },

    OnOneTimeEvent
    {
    	Conditions =
    	{
    		 MapFlagIsTrue {Name = "mf_CutsceneStartEnded"},
    		 FigureIsDead	{Tag = "Wache06"},

    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P316_SorvinaGuard06Dead"},
       	},
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		 MapFlagIsTrue {Name = "mf_CutsceneStartEnded"},
    		 FigureIsDead	{Tag = "Wache07"},

    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P316_SorvinaGuard07Dead"},
       	},
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		 MapFlagIsTrue {Name = "mf_CutsceneStartEnded"},
    		 FigureIsDead	{Tag = "Wache08"},

    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P316_SorvinaGuard08Dead"},
       	},
    },

      --Nach der zweiten Cutscene
      OnOneTimeEvent
    {


    	Conditions =
    	{
    		  MapFlagIsTrue{Name = "mf_CutsceneSchattenliedEnded"},
    	},
    	Actions =
    	{
				
       	},
       	GotoState = "Part2Shal",
    },

}


State
{
	StateName = "Part2Shal",
	  OnOneTimeEvent
    {

    	Conditions =
    	{

    	},
    	Actions =
    	{
    			QuestSetSolved	{Quest ="ShalPart1Trapped"},
    			QuestSetActive {Quest = "GetDarkelfHelp"},
				QuestSetActive {Quest = "ShalPart3GetTheFlags"},
				

				--SpielerAufbau wird übergeben
				PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerBuilding"},

				--Die Aufbau KI`s werden gestartet
				PlayerActivate	{Player = "pl_SchattenTeamAlpha"},
				PlayerActivate	{Player = "pl_SchattenTeamBeta"},
				PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_PlayerUnit"},  
				
				--Start des Flaggen Sammelscriptes
				MapFlagSetTrue {Name = "mf_GameCommencing"},

				--NQ unberechenbare Monster
				FigureOutcry	{Tag = "pl_HumanNightsong", TextTag = "SchattenliedNQ01"},
				FigureOutcry	{Tag = "pl_HumanNightsong", TextTag = "SchattenliedNQ02"},
				FigureOutcry	{Tag = "pl_HumanNightsong", TextTag = "SchattenliedNQ03"},
				MapTimerStart	{Name = "mt_OutcryNightsong"},
				MapFlagSetTrue{Name = "mf_SchattenLiedNQ"},

       	},

    },
    
    --OutcryTimer Nightsong
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_OutcryNightsong", Seconds = 15},
    	},
    	Actions =
    	{
			QuestSetActive	{Player = "pl_Human", Quest = "ShalUnpredictableMonsters"},
			DialogTypeSetSideQuest	{Tag = "MonsterZelleA"},
			DialogSetEnabled	{Tag = "MonsterZelleA"},
			DialogTypeSetSideQuest	{Tag = "MonsterZelleB"},
			DialogSetEnabled	{Tag = "MonsterZelleB"},
       	},
    },
    
   	 --Spieler findet Lenya
    OnEvent
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
 	 OnOneTimeEvent
    {

    	-- Wenn HeldenA befreit werden
    	Conditions =
    	{
    		
    		OR
    		{
    			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "GateZelleHelden01", Range = 5},
				MapFlagIsTrue{Name = "mf_UrGuardsDeath"},
    		},
    		MapFlagIsFalse	{Name = "mf_HeldenASchonBefreit"},

    	},
    	Actions =
    	{
			GateSetOpen	{Tag = "GateZelleHelden01"},
			MapFlagSetTrue	{Name = "mf_HeldenASchonBefreit"},
       	},
    },



     OnOneTimeEvent
    {

    	--  Wenn HeldenB befreit werden
    	Conditions =
    	{
    		OR
    		{
    			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "GateZelleHelden02", Range = 5},
				MapFlagIsTrue{Name = "mf_UrGuardsDeath"},
    		},
    		MapFlagIsFalse	{Name = "mf_HeldenBSchonBefreit"},

    	},
    	Actions =
    	{
    		GateSetOpen	{Tag = "GateZelleHelden02"},
    		MapFlagSetTrue	{Name = "mf_HeldenBSchonBefreit"},
       	},
    },



    --*******************************************************
	--***                                                 ***
	--***       NQ Unberechenbare Monster                 ***
	--***                                                 ***
	--*******************************************************

   --Monster A wird befreit.
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_MonsterABefreit"},
    		AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!

    	},
    	Actions =
    	{
    		DialogSetDisabled	{Tag = "MonsterZelleA"},
    		GateSetOpen	{Tag = "GateMonsterZelleA"},
    		FigureTeamTransfer	{Tag = "AlphaMonster", Team = "tm_MonsterA"},
    		MapTimerStart	{Name = "mt_MonsterACry"},
    		SoundGlobalPlayOnce	{File = "03_creeps/creep_warbeast_hit1"},
       	},
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_MonsterACry", Seconds = 2},
    	},
    	Actions =
    	{
   			FigurePathGoto
			{
				Goto = FigurePatrolWalk {Tag = "AlphaMonster", X = 188,Y = 77},
				Points =
				{
					"151, 124",
					"196, 155",
					"268, 154",
					"309, 112",
				},
			},
       	},
    },


   --Monster B wird befreit.
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_MonsterBBefreit"},
    		AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!

    	},
    	Actions =
    	{
   			DialogSetDisabled	{Tag = "MonsterZelleB"},
    		GateSetOpen	{Tag = "GateMonsterZelleB"},
    		FigureTeamTransfer	{Tag = "BetaMonster", Team = "tm_MonsterB"},
			MapTimerStart	{Name = "mt_MonsterBCry"},
    		SoundGlobalPlayOnce	{File = "03_creeps/creep_warbeast_hit1"},
       	},
    },

   --Monster B stirbt wenn der Timer abgelaufen ist.
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapTimerIsElapsed	{Name = "mt_MonsterBCry", Seconds = 2},
    	},
    	Actions =
    	{
    		FigurePathGoto
			{
				Goto = FigurePatrolWalk {Tag = "BetaMonster", X = 130,Y = 240},
				Points =
				{
					"123, 208",
					"116, 182",
					"56, 203",
					"51, 259",
				},
			},
       	},
    },

   	OnOneTimeEvent
    {

    	-- Schattenlied
    	Conditions =
    	{
    		   QuestIsActive	{Player = "pl_Human", Quest = "ShalUnpredictableMonsters"},
    		   MapFlagIsTrue{Name = "mf_MonsterABefreit"},
    		   MapFlagIsTrue{Name = "mf_MonsterBBefreit"},
    	},
    	Actions =
    	{
    			QuestSetSolved	{Player = "pl_Human", Quest = "ShalUnpredictableMonsters"},
       	},
    },
    
    
    --Wenn alle Flaggen erobert wird erlischt das Fragenzeichen bei den Monsterzellen
    OnOneTimeEvent
    {

    	-- Schattenlied 
    	Conditions =
    	{
    		   MapValueIsGreaterOrEqual	{Name = "mv_FlagCounterTeamBlue", Value = 15},
    		   MapFlagIsFalse{Name = "mf_MonsterABefreit"},
    		   MapFlagIsFalse{Name = "mf_MonsterBBefreit"},
    	},
    	Actions =
    	{

    			DialogSetDisabled	{Tag = "MonsterZelleB"},
    			DialogSetDisabled	{Tag = "MonsterZelleA"},
    			QuestSetSolved	{Player = "pl_Human", Quest = "ShalUnpredictableMonsters"},


       	},
    },
   
    
  	--*******************************************************
	--***                                                 ***
	--***       NQ Unberechenbare Monster End             ***
	--***                                                 ***
	--*******************************************************

   --*******************************************************
	--***                                                 ***
	--***            Game Over Bedingungen                ***
	--***                                                 ***
	--*******************************************************

 
     --KI Alpha verliert
      OnOneTimeEvent
    {

    	Conditions =
    	{
    		 	MapValueIsEqual	{Name = "mv_FlagCounterTeamRed", Value = 0},
    		  	PlayerHasNotBuildingAmount	{Player = "pl_SchattenTeamAlpha", Amount = 1, OnlyCompleted = True},
    	},
    	Actions =
    	{
    			MapFlagSetTrue{Name = "mf_AlphaHauptlagerEingenommen"},
				--FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "AvatarTest04"},
				MapFlagSetTrue{Name = "mf_P316_AIAlphaDead"},
				--ObjectVanish	{Tag = "SpawnpointAlpha"},

       	},
    },
    --KI Beta verliert
      OnOneTimeEvent
    {

    	Conditions =
    	{
    		 	MapValueIsEqual	{Name = "mv_FlagCounterTeamPurple", Value = 0},
    		  	PlayerHasNotBuildingAmount	{Player = "pl_SchattenTeamBeta", Amount = 1, OnlyCompleted = True},
    	},
    	Actions =
    	{
    			MapFlagSetTrue{Name = "mf_BetaHauptlagerEingenommen"},
  		 		--FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "AvatarTest05"},
				MapFlagSetTrue{Name = "mf_P316_AIBetaDead"},
				--ObjectVanish	{Tag = "SpawnpointBeta"},
       	},
    },



 	--*******************************************************
	--***                                                 ***
	--***          Game Over Bedingungen End              ***
	--***                                                 ***
	--*******************************************************
	--*******************************************************
	--***                                                 ***
	--***          			XP Vergabe  		          ***
	--***                                                 ***
	--*******************************************************


	--EndgegnerAlpha
	OnOneTimeEvent
    {
    	Conditions =
    	{
    		 MapFlagIsTrue {Name = "mf_AlphaHauptlagerEingenommen"},
    		 FigureIsDead	{Tag = "EndBossAlpha"},

    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P316_EndBossAlphaDead"},
       	},
    },
	--EndgegnerBeta
	OnOneTimeEvent
    {
    	Conditions =
    	{
    		 MapFlagIsTrue {Name = "mf_BetaHauptlagerEingenommen"},
    		 FigureIsDead	{Tag = "EndBossBeta"},

    	},
    	Actions =
    	{
    		MapFlagSetTrue {Name = "mf_P316_EndBossBetaDead"},
       	},
    },

   --*******************************************************
	--***                                                 ***
	--***          		XP Vergabe End   		          ***
	--***                                                 ***
	--*******************************************************


    --Outcry, wenn der Spieler zwei/alle Stadtteile erobert hat
    OnOneTimeEvent
    {

    	-- Schattenlied Outcries
    	Conditions =
    	{
    		  	MapValueIsGreaterOrEqual	{Name = "mv_FlagCounterTeamBlue", Value = 15},
    	},
    	Actions =
    	{
    			FigureOutcry	{Tag = "pl_HumanNightsong", TextTag = "Schattenlied03"},
    			--FigureOutcry	{Tag = "pl_HumanNightsong", TextTag = "Schattenlied04"},
    			QuestSetSolved	{Quest = "ShalPart3GetTheFlags"},
  				FogOfWarReveal	{X = 330, Y = 121, Range = 15, Height = 115},
  				QuestSetSolved {Quest = "GetDarkelfHelp"},
    			QuestSetActive {Quest = "OnToCrystalWastes"},
  				
       	},
    },
   
     --Wenn der Spieler alle Stadtteile erobert hat und sich zur Schattenlied zum östlichen Portal begibt, startet die dritte Cutscene

    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapValueIsGreaterOrEqual	{Name = "mv_FlagCounterTeamBlue", Value = 15},
    	 	FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 15, X = 330, Y = 121},
    	},
    	Actions =
    	{
    		MapFlagSetTrue{Name = "mf_StartCutsceneFinal"},
       	},
    },

     --Nach der dritten Cutscene
     OnOneTimeEvent
    {


    	Conditions =
    	{
    		  MapFlagIsTrue{Name = "mf_CutsceneFinaleEnded"},
    	},
    	Actions =
    	{
    			PlayerTravelEnable	{},
    			PortalEnable	{Tag = "ShalStartPortal"},
				PortalEnable	{Tag = "Portal_End"},
       	},
    },


 	--*******************************************************
	--***                                                 ***
	--***          		NQ Der letzte Dreh 		          ***
	--***                                                 ***
	--*******************************************************
	
	OnOneTimeEvent
    {


    	Conditions =
    	{
    		 	QuestIsActive {Quest = "RightTwist4SearchPortalFragment"},
    		 	AvatarHasItemMisc	{ItemId = 240, Amount = 1},
    	},
    	Actions =
    	{
    			QuestSetSolved {Quest = "RightTwist4SearchPortalFragment"},
    			QuestSetActive {Quest = "RightTwist4MeetProfSongglass"},
    		
       	},
    },
	
	
	--*******************************************************
	--***                                                 ***
	--***          	 NQ Der letzte Dreh End	 	          ***
	--***                                                 ***
	--*******************************************************

};
