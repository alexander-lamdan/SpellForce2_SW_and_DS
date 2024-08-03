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
		},
		GotoState = "QuestState01"
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
			PortalDisable{Tag = "WayToCF"},
			PortalDisable{Tag = "WayToSG"},
			
			PlayerTravelDisable{},
			
			QuestSetSolved {Quest = "OnToCrystalWastes"},
			QuestSetSolved {Quest = "1_KapitelAkt3"},
			QuestSetActive {Quest = "1_5_KapitelAkt3"},
			QuestSetActive {Quest = "CrystalWastesPart2GargoyleTome"},
			QuestSetActive {Quest = "FindAllPartsOfTome"},
			QuestSetActive {Quest = "CrystalWastesPart1ToCrystalForest"},
			QuestSetActive {Quest = "CrystalWastesDestroyKI"},
		}, 
		-- Spieler bekommt "Finde Buch"- und "To Crystal Forest"-Quest
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
			AvatarFlagIsTrue{Name = "af_P317_TomeCompleted"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "FindAllPartsOfTome"},
			QuestSetActive {Quest = "FindIceEssence"},
			QuestSetActive {Quest = "FindFireEssence"},
			QuestSetActive {Quest = "FindEarthEssence"},
		}, -- Hat man den Tome gefunden
		-- dann bekommt man die Quest, die Essenzen zu sammeln
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindFireEssence"},
			AvatarHasItemMisc	{ItemId = 53, Amount = 1,},
		},
		Actions =
		{
			QuestSetSolved {Quest = "FindFireEssence"},
			
			PlayerResourceSilverGive{Player = "pl_Player2", Amount = 10000},
			PlayerResourceSilverGive{Player = "pl_Player2", Amount = 10000},
		}, -- Wenn man die Feueressenz gefunden hat
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindIceEssence"},
			AvatarHasItemMisc	{ItemId = 54, Amount = 1,},
		},
		Actions =
		{
			QuestSetSolved {Quest = "FindIceEssence"},
			
			PlayerResourceSilverGive{Player = "pl_Player2", Amount = 20000},
			PlayerResourceSilverGive{Player = "pl_Player2", Amount = 20000},
		}, -- Wenn man die Feueressenz gefunden hat
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 54, Amount = 1,},
			AvatarHasItemMisc	{ItemId = 53, Amount = 1,},
		},
		Actions =
		{
		}, 
		GotoState = "QuestState03"
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "CrystalWastesDestroyKI"},
			AvatarFlagIsTrue{Name = "af_P317_EndHQKilled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CrystalWastesDestroyKI"},
		},
	},
}

State
{
	StateName = "QuestState03",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "CrystalWastesDestroyKI"},
			AvatarFlagIsTrue{Name = "af_P317_EndHQKilled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "CrystalWastesDestroyKI"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P317_EndHQKilled"},
			MapFlagIsTrue{ Name = "mf_GolemBossFireKilled"},
			MapFlagIsTrue{ Name = "mf_GolemBossIceKilled"},
		},
		Actions =
		{
			PortalEnable{Tag = "WayBack"},
			PortalEnable{Tag = "WayToCF"},
			PortalEnable{Tag = "WayToSG"},
            --
			--ObjectSpawn	{ObjectId = 1641, X = 24.013, Y = 25.0437, Direction = 315, Tag = "Empty001"},
			--ObjectSpawn	{ObjectId = 1641, X = 297.357, Y = 289.037, Direction = 319.893, Tag = "Empty002"},
			--ObjectSpawn	{ObjectId = 1641, X = 151.911, Y = 299.519, Direction = 272.91, Tag = "Empty003"},
			
			PlayerTravelEnable{},
		}, 
	},
}


