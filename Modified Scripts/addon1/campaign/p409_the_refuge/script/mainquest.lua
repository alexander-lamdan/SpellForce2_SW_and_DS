
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
			PlayerTravelDisable{},
			-- Teleporter inaktiv solange Reisen nicht erlaubt ist
			MapFlagSetTrue	{Name = "mf_PlayerTravelDisabled"},
			
			QuestSetSolved {Quest = "CityShip3_TeleportRefuge"},
			QuestSetSolved {Quest = "Citadel_ToRefuge"},
			QuestSetActive {Quest = "Refuge_ToDragons"},
			QuestSetActive {Quest = "Refuge_BuildCamp"},
			QuestSetActive {Quest = "Refuge_Bestcamps"},
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
			QuestIsActive {Quest = "Refuge_BuildCamp"},
			PlayerHasBuildingAmount	{Player = "pl_Human", Amount = 5, OnlyCompleted = true},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Refuge_BuildCamp"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "Refuge_Bestcamps"},
			MapFlagIsTrue{Name = "mf_NestAKilled"},
			MapFlagIsTrue{Name = "mf_NestBKilled"},
			MapFlagIsTrue{Name = "mf_NestCKilled"},
			MapFlagIsTrue{Name = "mf_NestDKilled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Refuge_Bestcamps"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS02Ended"},
		},
		Actions =
		{
		},
		GotoState = "QuestState02",
	},
}


State
{
	StateName = "QuestState02",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "Refuge_BuildCamp"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Refuge_BuildCamp"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "Refuge_Bestcamps"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Refuge_Bestcamps"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "Refuge_BuildCamp"},
			QuestIsSolved {Quest = "Refuge_Bestcamps"},
		},
		Actions =
		{
			QuestSetActive {Quest = "Refuge_TalkToSoulCarrier"},
		},
		GotoState = "QuestState04",
	},

}

-- QuestState03 existiert nicht mehr!



State
{
	StateName = "QuestState04",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_TalkedWithSoulCarrier"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Refuge_TalkToSoulCarrier"},
			QuestSetActive {Quest = "Refuge_ApologizeToDragons"},
			
			-- Souls werden auf KNOWN gesetzt, damit man nicht erst nach den Drachen fragen muss
			MapFlagSetTrue{Name = "mf_Soul01Known"},
			MapFlagSetTrue{Name = "mf_Soul02Known"},
			MapFlagSetTrue{Name = "mf_Soul03Known"},
			MapFlagSetTrue{Name = "mf_Soul05Known"},
			
			-- In die Kisten werden die Items gespawned
			ObjectLootItemMiscAdd	{Tag = "LootChest03", DropChance = 100, ItemId = 378},
			ObjectLootItemMiscAdd	{Tag = "LootChest03", DropChance = 100, ItemId = 376},
			ObjectLootItemMiscAdd	{Tag = "LootChest03", DropChance = 100, ItemId = 367},
			ObjectLootItemMiscAdd	{Tag = "LootChest03", DropChance = 100, ItemId = 369},
			ObjectLootItemMiscAdd	{Tag = "LootChest02", DropChance = 100, ItemId = 374},
			ObjectLootItemMiscAdd	{Tag = "LootChest02", DropChance = 100, ItemId = 370},
			ObjectLootItemMiscAdd	{Tag = "LootChest02", DropChance = 100, ItemId = 372},
			ObjectLootItemMiscAdd	{Tag = "LootChest02", DropChance = 100, ItemId = 377},
			ObjectLootItemMiscAdd	{Tag = "LootChest01", DropChance = 100, ItemId = 379},
			ObjectLootItemMiscAdd	{Tag = "LootChest01", DropChance = 100, ItemId = 375},
			ObjectLootItemMiscAdd	{Tag = "LootChest01", DropChance = 100, ItemId = 371},
			ObjectLootItemMiscAdd	{Tag = "LootChest01", DropChance = 100, ItemId = 366},
		},
		GotoState = "QuestState05",
	},
	
}

State
{
	StateName = "QuestState05",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_AllDragonSoulsDisintegrated"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Refuge_ApologizeToDragons"},
		},
		GotoState = "QuestState06",
	},
	
}

State
{
	StateName = "QuestState06",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS03Ended"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Refuge_HeadToRefuge"},
			QuestSetSolved {Quest = "Refuge_ToDragons"},
			QuestSetActive {Quest = "Refuge_ShaperAttack"},
			QuestSetActive {Quest = "Refuge_BuildDrakelings"},
			QuestSetActive {Quest = "Refuge_DestroyInvasionCamp"},
		},
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
			MapFlagIsTrue {Name = "mf_BeastBuildKilled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Refuge_DestroyInvasionCamp"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				-- wenn der Spieler entweder von einer der drei Drachenarten 5 hat
				-- oder von allen drei Drachenarten jeweils 2
				PlayerHasUnitAmount	{Player = "pl_Human", UnitId = 160, Amount = 5},
				PlayerHasUnitAmount	{Player = "pl_Human", UnitId = 161, Amount = 5},
				PlayerHasUnitAmount	{Player = "pl_Human", UnitId = 165, Amount = 5},
				AND
				{
					PlayerHasUnitAmount	{Player = "pl_Human", UnitId = 160, Amount = 2},
					PlayerHasUnitAmount	{Player = "pl_Human", UnitId = 161, Amount = 2},
					PlayerHasUnitAmount	{Player = "pl_Human", UnitId = 165, Amount = 2},
				},
			},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Refuge_BuildDrakelings"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "Refuge_DestroyInvasionCamp"},
			QuestIsActive {Quest = "Refuge_BuildDrakelings"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Refuge_BuildDrakelings"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "Refuge_BuildDrakelings"},
			QuestIsSolved {Quest = "Refuge_DestroyInvasionCamp"},
		},
		Actions =
		{     
		},
		GotoState = "QuestState08",
	},	
}

State
{
	StateName = "QuestState08",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			QuestSetActive {Quest = "Refuge_KillRiddengard"},
		},
		GotoState = "QuestState09",
	},
}


State
{
	StateName = "QuestState09",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{ Name = "mf_RiddengardKilled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Refuge_KillRiddengard"},
			QuestSetSolved {Quest = "Refuge_ShaperAttack"},
			QuestSetSolved {Quest = "SF2A1_2_Akt_Kapitel4"},
			QuestSetSolved {Quest = "SF2A1_2_Akt"},
			QuestSetActive {Quest = "SF2A1_3_Akt"},
			QuestSetActive {Quest = "SF2A1_3_Akt_Kapitel1"},
			QuestSetActive {Quest = "Refuge_ToWestguard"},
			QuestSetActive {Quest = "CityShip4_ReturnToCityShip"},
			AvatarFlagSetTrue{Name = "af_P409_ThirdReturnToCityShip"},
			
			PlayerTravelEnable{},
			-- Teleporter wieder aktiv
			MapFlagSetFalse	{Name = "mf_PlayerTravelDisabled"},
		},
	},
}