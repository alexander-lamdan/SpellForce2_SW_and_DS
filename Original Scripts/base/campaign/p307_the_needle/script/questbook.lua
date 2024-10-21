
--- VORSICHT:
--- SIDEQUEST "Warrads Tochter" befindet sich im "n0"

-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{	
	StateName = "INIT",
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P301_CampaignStarted"},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P307_Intro"},
		},
		GotoState = "QuestState01",
	},
}


State
{
	StateName = "QuestState01",

	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			PortalDisable{Tag = "WayBack"},
			PortalDisable{Tag = "WayToIF"},
			PortalDisable{Tag = "WayToGOS"},
			
			PlayerTravelDisable{},
			
			QuestSetSolved {Quest = "GFPart10NightsongRescue"},
			QuestSetSolved {Quest = "TravelToNeedle"},
			
			QuestSetActive {Quest = "NeedlePart1TheBulwark"},
			QuestSetActive {Quest = "MatricusMustLiveNeedle"},
			QuestSetActive {Quest = "TalkToMatricusToGetCamp"},
		}, -- zu Beginn der Karte den ersten Teil triggern
		GotoState = "QuestState02"
	},
}


State
{
	StateName = "QuestState02",

	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_MatricusDialogFinished"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "TalkToMatricusToGetCamp"},
			QuestSetActive {Quest = "DefeatFirstWave"},
		}, -- Wenn mit Matricus gesprochen, dann
			-- Quest "Wehre die 1. Welle ab"
		GotoState = "QuestState03"
	},
}


State
{
	StateName = "QuestState03",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P307_Cutscene02"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DefeatFirstWave"},
			QuestSetActive {Quest = "DefineTacticsForRealm"},
			
			FogOfWarRevealAtEntity	{Tag = "SpiritistMother01", Range = 30, Height = default},
			FogOfWarRevealAtEntity	{Tag = "SpiritistMother02", Range = 30, Height = default},
			-- Wenn erste Wave abgewehrt, dann bekommt Spieler den Auftrag
			-- mit Einar und Karan die Taktik abzustimmen
			-- Die Spiritistenlager werden aufgedeckt
			
			QuestSetActive {Quest = "FreeGriffons"},
			MapFlagSetTrue { Name = "mf_PlayerGotTaskToFreeGriffons"},
			FogOfWarRevealAtEntity	{Tag = "GriffonHut", Range = 30, Height = default},
			      
		},  -- Auftrag, die Greifen zu befreien und das Bulwark zu stürmen
		-- Greifenlager wird aufgedeckt
		GotoState = "QuestState04"
	},
}


State
{
	StateName = "QuestState04",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue { Name = "af_P307_EinarTacticDone"},
			AvatarFlagIsTrue { Name = "af_P307_KaranTacticDone"}, 
		},
		Actions =
		{
			QuestSetSolved {Quest = "DefineTacticsForRealm"},
		},
	},

	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue { Name = "af_P307_GriffonsFree" },
		},
		Actions =
		{
			QuestSetSolved {Quest = "FreeGriffons"},
			QuestSetSolved {Quest = "MatricusMustLiveNeedle"},
		},  
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue { Name = "af_P307_GriffonsFree" },
			AvatarFlagIsTrue { Name = "af_P307_EinarTacticDone"},
			AvatarFlagIsTrue { Name = "af_P307_KaranTacticDone"}, 
		},
		Actions =
		{
			QuestSetActive {Quest = "StormBulwark"},
		},
		-- Wenn die Greifen befreit wurden & Taktiken abgesprochen
		-- Auftrag, das Bulwark zu stürmen
		GotoState = "QuestState06"
	},
}

State
{
	StateName = "QuestState06",	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsFalse {Name = "af_P307_CampBulwarkBusted"},
			AvatarFlagIsTrue {Name = "af_P307_PlayerEnteredBulwark"},
		},
		Actions =
		{
			QuestSetActive {Quest = "StrangeEnemies"},
		},
	},


	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P307_CampBulwarkBusted"},
			AvatarFlagIsTrue {Name = "af_P307_PlayerEnteredBulwark"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "StrangeEnemies"},
		},
		GotoState = "QuestState07",
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P307_CampBulwarkBusted"},
			AvatarFlagIsFalse {Name = "af_P307_PlayerEnteredBulwark"},
		},
		Actions =
		{
			QuestSetActive {Quest = "StrangeEnemies"},
			QuestSetSolved {Quest = "StrangeEnemies"},
		}, 
		-- Quest muß erst gestartet werden, bevor sie gesolved werden kann
		GotoState = "QuestState07",
	},
}

State
{
	   StateName = "QuestState07",
	   
	   OnOneTimeEvent
		{
			Conditions = 
			{
				AvatarFlagIsTrue{Name = "af_P307_CS04Finished"},
			},
			Actions = 
			{
				QuestSetSolved {Quest = "StormBulwark"},
				QuestSetSolved {Quest = "NeedlePart1TheBulwark"},
				QuestSetActive {Quest = "OnToIronFields"},
				
				PortalEnable{Tag = "WayBack"},
				PortalEnable{Tag = "WayToIF"},
				
				--ObjectSpawn	{ObjectId = 1641, X = 180.234, Y = 218.202, Direction = 204.729, Tag = "Empty001"},
				--ObjectSpawn	{ObjectId = 1641, X = 424.128, Y = 520.199, Direction = 107.898, Tag = "Empty002"},
				PlayerTravelEnable{},
			},
		},
		
		OnOneTimeEvent
		{
			Conditions = 
			{
				AvatarFlagIsTrue {Name = "af_P309_IVisitedGateOfSwords"},
			},
			Actions = 
			{
				
				PortalEnable{Tag = "WayToGOS"},
			},
		},
} 