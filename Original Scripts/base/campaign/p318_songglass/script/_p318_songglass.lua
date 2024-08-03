--*******************************************************
--***                                                 ***
--***                 Songglass                    	  ***
--***                                                 ***
--*******************************************************



-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		GotoState = "SongglassMainState",
		Conditions = 
		{
		},
		Actions = 
		{
			-- Dummy Flags zum Testen
			MapFlagSetFalse	{Name = "mf_SpokenToMalkuth"},
			MapFlagSetFalse	{Name = "mf_KilledLokar"},
			MapFlagSetFalse {Name = "mf_LokarQuestSolved"},
			MapFlagSetFalse {Name = "mf_CrystalQuestSolved"},
			MapFlagSetTrue {Name = "mf_XPInitialisierung"},

			-- RPG Map -> Spieler startet mit Lenya
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 300},
			
			--Bei folgenden Figuren wird das Swapping verhindert
    	   	FigureSwappingDisable {Tag = "Malkuth"},
    	      	   
			
		},
	},
};



--*******************************************************
--***                                                 ***
--***                 	Quests                   	  ***
--***                                                 ***
--*******************************************************
State
{
	StateName = "SongglassMainState",
	
	-- Avatar findet Malkuth
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_FirstTalk"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "SongglassFindMalkuth"},
		},
	},
	-- Spieler bekommt Crystal Quest
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_GiveCrystalQuest"},
		},
		Actions = 
		{
			QuestSetActive  {Quest = "SongglassCollectCrystals"},		
		},
	},
	
	-- Crystal Quest gelöst
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_CrystalQuestSolved"},
		},
		Actions = 
		{
			QuestSetSolved  {Quest = "SongglassCollectCrystals"},		
		},
		
	},
		
	-- Spieler bekommt Kill Lokar Quest
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_KilledLokarQuestActive"},
		},
		Actions = 
		{
			QuestSetActive  {Quest = "SongglassReturnHeart"},		
		},
		
	},
	
	-- Lokar Quest gelöst
		OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 127, Amount = 1},
		},
		Actions = 
		{
			QuestSetSolved  {Quest = "SongglassReturnHeart"},
			QuestSetActive  {Quest = "SongglassHeartBackToMalkuth"},			
		},
		
	},
	
	-- HerzQuest gelöst
		OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_LokarQuestSolved"},
		},
		Actions = 
		{
			QuestSetSolved  {Quest = "SongglassHeartBackToMalkuth"},		
		},
		
	},
	
	
	
	-- Sobald der Spieler alle Quests auf der Map gelöst hat, wird auch die Map Quest auf Solved gesetzt
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved  {Quest = "SongglassSearchScouts"},
			QuestIsSolved  {Quest = "SongglassFindMalkuth"},
			QuestIsSolved  {Quest = "SongglassCollectCrystals"},
			QuestIsSolved  {Quest = "SongglassReturnHeart"},
			QuestIsSolved  {Quest = "SongglassHeartBackToMalkuth"},
			
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "Songglass"},
		},
	},
	
--*******************************************************
--***                                                 ***
--***                 Quests  End                	  ***
--***                                                 ***
--*******************************************************

OnOneTimeEvent
	{
		Conditions =
		{
			
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 16, X = 255, Y = 195.6},
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_HeroHall"},    
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
--***                 Resiesteine                 	  ***
--***                                                 ***
--*******************************************************
-- Wenn der Spieler die Aufgabe von Malkuth bekommt 6 Kristalle zu finden
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive  {Quest = "SongglassSearchScouts"},	
		},
		Actions = 
		{
			PlayerTravelStoneAdd	{Tag = "TravelStoneDarkelfes"},
			MinimapAlertSetToEntity	{Tag = "TravelStoneDarkelfes", Type = 5},
			PlayerTravelStoneAdd	{Tag = "StartTravelStone"},
			MinimapAlertSetToEntity	{Tag = "StartTravelStone", Type = 5},
		},
	},

-- Wenn der Spieler die Aufgabe von Malkuth bekommt 6 Kristalle zu finden
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive  {Quest = "SongglassCollectCrystals"},	
		},
		Actions = 
		{
			PlayerTravelStoneAdd	{Tag = "TravelstoneCrystal01"},
			MinimapAlertSetToEntity	{Tag = "TravelstoneCrystal01", Type = 5},
			PlayerTravelStoneAdd	{Tag = "TravelStoneCrystal02"},
			MinimapAlertSetToEntity	{Tag = "TravelStoneCrystal02", Type = 5},
		},
	},

-- Wenn der Spieler die Aufgabe von Malkuth bekommt sein Herz von Lokhar zu bringen
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive  {Quest = "SongglassReturnHeart"},	
		},
		Actions = 
		{
			PlayerTravelStoneAdd	{Tag = "TravelStoneLohkar"},
			MinimapAlertSetToEntity	{Tag = "TravelStoneLohkar", Type = 5},
		},
	},



--*******************************************************
--***                                                 ***
--***             SQ Späher befreien	           	  ***
--***                                                 ***
--*******************************************************	
	
	-- Avatar findet die Dunkelelfenspäher
	
	OnOneTimeLeverEvent
	{
		Lever = "LeverDarkElfGate",
		OnConditions = 
		{
		},
		Actions = 
		{
			GateSetOpen		   {Tag  = "DarkElfGate"},
			ObjectVanish	{Tag = "Cage01"},
			ObjectVanish	{Tag = "Cage02"},
			ObjectVanish	{Tag = "Cage03"},
			ObjectVanish	{Tag = "Cage04"},
			QuestSetSolved	   {Quest = "SongglassSearchScouts"},
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Scouts"}, 
			FigureOutcryAlert	{TextTag = "Avatar1", Tag = "pl_HumanAvatar", TargetTag = "Shadowblade"},
			--FigureOutcry	   {Tag  = "Shadowblade", TextTag = "Shadowblade1"},
			--FigureOutcry	   {Tag  = "Shadowblade", TextTag = "Shadowblade2"},
			--FigureOutcry	   {Tag  = "Shadowblade", TextTag = "Shadowblade3"},
			--Flugloot wird aufgedeckt
			FogOfWarReveal	{X = 182, Y = 254, Range = 10, Height = 185},
			FogOfWarReveal	{X = 380.8, Y = 229.8, Range = 10, Height = 200},
			FogOfWarReveal	{X = 305.9, Y = 570, Range = 10, Height = 181},
			FogOfWarReveal	{X = 225.3, Y = 476.3, Range = 15, Height = 190},
			FogOfWarReveal	{X = 561, Y = 236, Range = 15, Height = 185},
			FogOfWarReveal	{X = 429.8, Y = 318.4, Range = 15, Height = 199},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_XPInitialisierung"},
			FigureIsDead	{Tag = "Sklaventreiber"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P318_SklaventreiberDead"},
		},
	},

--*******************************************************
--***                                                 ***
--***             SQ Späher befreien End           	  ***
--***                                                 ***
--*******************************************************

--*******************************************************
--***                                                 ***
--***                Lokhar	Endkampf               	  ***
--***                                                 ***
--*******************************************************


	-- Outcries von Lokhar
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Lokar", Range = 30},
		},
		Actions = 
		{
			FigureOutcry	{Tag  = "Lokar", TextTag = "Lokar1"},
			FigureOutcry	{Tag  = "Lokar", TextTag = "Lokar2"},
			FigureOutcry	{Tag  = "Lokar", TextTag = "Lokar3"},
		},
		
	},
	-- Tor öffnet sich
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "OrcGate02", Range = 15},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroBor", TargetTag = "OrcGate02", Range = 15},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroLya", TargetTag = "OrcGate02", Range = 15},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroMordecay", TargetTag = "OrcGate02", Range = 15},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroJared", TargetTag = "OrcGate02", Range = 15},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroShae", TargetTag = "OrcGate02", Range = 15},
			},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "OrcGate02"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Lokar"},
			MapFlagIsTrue {Name = "mf_XPInitialisierung"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_KilledLokar"},
			MapFlagSetTrue	{Name = "mf_P318_LokharDead"},
		},
	},
	
--*******************************************************
--***                                                 ***
--***                Lokhar	Endkampf End           	  ***
--***                                                 ***
--*******************************************************	

	
--*******************************************************
--***                                                 ***
--***                NQ Professor Drehlein         	  ***
--***                                                 ***
--*******************************************************
	-- Wenn der Spieler die Professor Bienlein Queste aktiv hat
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsKnown {Quest = "RightTwist4SearchPortalFragment"},
		},
		Actions = 
		{
			PlayerTravelStoneAdd	{Tag = "TravelStoneDrehlein"},
			MinimapAlertSetToEntity	{Tag = "TravelStoneDrehlein", Type = 5},
			ObjectSpawn	{ObjectId = 1918, X = 455.5, Y = 481, Direction = 0, Tag = "TwiddleTreasure01"},
			ObjectSpawn	{ObjectId = 1918, X = 407.8, Y = 454, Direction = 0, Tag = "TwiddleTreasure02"},
			ObjectSpawn	{ObjectId = 1918, X = 415.7, Y = 513.7, Direction = 0, Tag = "TwiddleTreasure03"},
			ObjectLootItemGenericAdd	{Tag = "TwiddleTreasure03", DropChance = 100, Level = 23, Skill = 96},
			ObjectLootItemGenericAdd	{Tag = "TwiddleTreasure03", DropChance = 50, Level = 29, Skill = 27},
			ObjectLootItemGenericAdd	{Tag = "TwiddleTreasure01", DropChance = 100, Level = 23, Skill = 9},
			ObjectLootItemGenericAdd	{Tag = "TwiddleTreasure01", DropChance = 50, Level = 29, Skill = 42},
			ObjectLootItemGenericAdd	{Tag = "TwiddleTreasure02", DropChance = 100, Level = 24, Skill = 63},
			ObjectLootItemGenericAdd	{Tag = "TwiddleTreasure02", DropChance = 50, Level = 29, Skill = 75},
		},
	},


	-- Der Spieler hat mit Twiddlequest Map betreten, Flag für zum Despawnen tun auf anderer Map
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "RightTwist4SearchPortalFragment"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P318_PlayerHasBeenOnSongglassWithTwiddleQuest"}
		}
	},

 	OnOneTimeLeverEvent	
    {
    	Lever = "MonsterLever01", 
    	OnConditions = 
    	{
   
    	},
    	Actions = 
    	{
    		GateSetOpen	{Tag = "MonsterGate01"},
    		PlayerKitTransfer	{Player = "pl_Raptor", PlayerKit = "pk_Raptor01"},
    		
    	},
    },	
    OnOneTimeLeverEvent	
    {
    	Lever = "MonsterLever02", 
    	OnConditions = 
    	{
   
    	},
    	Actions = 
    	{
    		GateSetOpen	{Tag = "MonsterGate02"},
    		PlayerKitTransfer	{Player = "pl_Raptor", PlayerKit = "pk_Raptor02"},
    		
    	},
    },	
   	
  
--*******************************************************
--***                                                 ***
--***            NQ Professor Drehlein  End     	  ***
--***                                                 ***
--*******************************************************


};

