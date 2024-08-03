

--------------------------------------------------------------
--
--		Die Kisten erscheint nur, wenn der Spieler sie auch sehen soll
--
---------------------------------------------------------------


State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindMemoryBookstore"},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1427, X = 279, Y = 368, Tag = "Soulchest1", Direction = 23},
			ObjectLootItemMiscAdd	{Tag = "Soulchest1", ItemId = 72},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindMemoryBookstore"},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1428, X = 272, Y = 348, Tag = "Soulchest10", Direction = 69},
			ObjectLootItemMiscAdd	{Tag = "Soulchest2", ItemId = 73},
			ObjectLootItemMiscAdd	{Tag = "Soulchest2", ItemId = 74},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindMemoryBookstore"},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1429, X = 272, Y = 348, Tag = "Soulchest2", Direction = 77},
			ObjectLootItemMiscAdd	{Tag = "Soulchest2", ItemId = 72},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindMemoryBookstore"},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1430, X = 343, Y = 317, Tag = "Soulchest3", Direction = 123},
			ObjectLootItemMiscAdd	{Tag = "Soulchest3", ItemId = 71},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindMemoryBookstore"},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1427, X = 339, Y = 204, Tag = "Soulchest4", Direction = 169},
			ObjectLootItemMiscAdd	{Tag = "Soulchest4", ItemId = 71},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindMemoryBookstore"},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1428, X = 402, Y = 336, Tag = "Soulchest5", Direction = 177},
			ObjectLootItemMiscAdd	{Tag = "Soulchest5", ItemId = 74},
			ObjectLootItemMiscAdd	{Tag = "Soulchest5", ItemId = 73},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindMemoryBookstore"},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1429, X = 319, Y = 396, Tag = "Soulchest6", Direction = 269},
			ObjectLootItemMiscAdd	{Tag = "Soulchest6", ItemId = 74},
			ObjectLootItemMiscAdd	{Tag = "Soulchest6", ItemId = 73},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindMemoryBookstore"},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1430, X = 374, Y = 193, Tag = "Soulchest7", Direction = 277},
			ObjectLootItemMiscAdd	{Tag = "Soulchest7", ItemId = 74},
			ObjectLootItemMiscAdd	{Tag = "Soulchest7", ItemId = 73},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindMemoryBookstore"},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1427, X = 394, Y = 335, Tag = "Soulchest8", Direction = 323},
			ObjectLootItemMiscAdd	{Tag = "Soulchest8", ItemId = 74},
			ObjectLootItemMiscAdd	{Tag = "Soulchest8", ItemId = 73},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindMemoryBookstore"},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1428, X = 240, Y = 215, Tag = "Soulchest9", Direction = 77},
			ObjectLootItemMiscAdd	{Tag = "Soulchest9", ItemId = 74},
			ObjectLootItemMiscAdd	{Tag = "Soulchest9", ItemId = 73},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P312_PlayerHasVisitedMagnetStones"},
		},
		Actions =
		{
			ObjectVanish {Tag = "Soulchest1"},
			ObjectVanish {Tag = "Soulchest2"},
			ObjectVanish {Tag = "Soulchest3"},
			ObjectVanish {Tag = "Soulchest4"},
			ObjectVanish {Tag = "Soulchest5"},
			ObjectVanish {Tag = "Soulchest6"},
			ObjectVanish {Tag = "Soulchest7"},
			ObjectVanish {Tag = "Soulchest8"},
			ObjectVanish {Tag = "Soulchest9"},
			ObjectVanish {Tag = "Soulchest10"},
		}
	}
}