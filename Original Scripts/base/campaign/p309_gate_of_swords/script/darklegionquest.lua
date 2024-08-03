State
{
	StateName = "Init",
	-- Spieler hat den Magnetspürer und die Dark Legion Quest läuft --> weiterschalten
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 209, Amount = 1},
			QuestIsActive {Quest = "DarkLegionFindMagnet"}
		},
		Actions =
		{
			QuestSetSolved {Quest = "DarkLegionFindMagnet"},
			QuestSetActive {Quest = "DarkLegionSearchPartsNorthOfWall"},
			
		}
	},
	-- Rüstungsteile spawnen spawnen
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "DarkLegionSearchPartsNorthOfWall"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 407, Y = 688},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 862, X = 407, Y = 688, Tag = "Axe", Direction = 0},
			ObjectLootItemMiscAdd	{Tag = "Axe", ItemId = 237},
			
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "DarkLegionSearchPartsNorthOfWall"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 438, Y = 665},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 870, X = 438, Y = 665, Tag = "Armor1", Direction = 0},
			ObjectLootItemMiscAdd	{Tag = "Armor1", ItemId = 231},
			
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "DarkLegionSearchPartsNorthOfWall"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 285, Y = 594},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 870, X = 285, Y = 594, Tag = "Armor2", Direction = 23},
			ObjectLootItemMiscAdd	{Tag = "Armor2", ItemId = 232},
			
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "DarkLegionSearchPartsNorthOfWall"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 456, Y = 611},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 870, X = 456, Y = 611, Tag = "Armor3", Direction = 169},
			ObjectLootItemMiscAdd	{Tag = "Armor3", ItemId = 233},
			
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "DarkLegionSearchPartsNorthOfWall"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 567, Y = 653},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 870, X = 567, Y = 653, Tag = "Armor4", Direction = 223},
			ObjectLootItemMiscAdd	{Tag = "Armor4", ItemId = 234},
			
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "DarkLegionSearchPartsNorthOfWall"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 538, Y = 608},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 870, X = 538, Y = 608, Tag = "Armor5", Direction = 333},
			ObjectLootItemMiscAdd	{Tag = "Armor5", ItemId = 235},
			
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "DarkLegionSearchPartsNorthOfWall"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 390, Y = 644},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 870, X = 390, Y = 644, Tag = "Armor6", Direction = 77},
			ObjectLootItemMiscAdd	{Tag = "Armor6", ItemId = 236},
			
		}
	},
	-- Der Spieler hat alle Teile
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 231, Amount = 1},
			AvatarHasItemMisc {ItemId = 232, Amount = 1},
			AvatarHasItemMisc {ItemId = 233, Amount = 1},
			AvatarHasItemMisc {ItemId = 234, Amount = 1},
			AvatarHasItemMisc {ItemId = 235, Amount = 1},
			AvatarHasItemMisc {ItemId = 236, Amount = 1},
		},
		Actions =
		{
			AvatarFlagSetTrue {Name = "af_P309_AllParts"},
			QuestSetSolved {Quest = "DarkLegionSearchPartsNorthOfWall"},
			QuestSetActive {Quest = "DarkLegionBringArmorToMorca"},
			DialogSetEnabled {Tag = "Mora"}
		}
	},
	
}