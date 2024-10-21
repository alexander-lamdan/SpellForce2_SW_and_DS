State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTwist2MeetProfGoS"},
		},
		Actions =
		{
		},
		DelayedActions =
		{
			DialogTypeSetSideQuest {},
			DialogSetEnabled {},
		},
	},
	-- Wenn Part IV läuft verscwindet der Professor auf der Map
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "RightTwist4SearchPortalFragment"},
			AvatarFlagIsTrue {Name = "af_P318_PlayerHasBeenOnSongglassWithTwiddleQuest"}
		},
		Actions =
		{
			FigureVanish {},
		}
	},
	-- Professor Drehlein
     OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "RightTwist2MeetProfGoS"},
    		FigureIsInEntityRange {Tag = "pl_HumanAvatar", Range = 20, TargetTag = "Lela"}
    	},
    	Actions =
    	{
    		FigureOutcry {Tag = "Lela", TextTag = "Twiddle1"},
    		FigureOutcry {Tag = "ProfessorTwiddle", TextTag = "Twiddle2"},
    		FigureOutcry {Tag = "Lela", TextTag = "Twiddle3"},
    	}
    },
    -- Ist Quest drei Aktiv ist der Dialog erst mal aus
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "RightTiwst3SearchMagnetOre"},
    	},
    	Actions =
    	{
    		DialogSetDisabled {},
    	}
    },
    -- Magnetgestein Quest
    OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTiwst3SearchMagnetOre"},
			AvatarHasItemMisc {ItemId = Item.Misc.MagnetShard, Amount = 2}
		},
		Actions =
		{
			QuestSetSolved {Quest = "RightTiwst3SearchMagnetOre"},
			QuestSetActive {Quest = "RightTwist3BringOreToProf"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTwist3BringOreToProf"},
		},
		Actions =
		{
			DialogSetEnabled {},
		}
	},
	-- Geoden spawnen
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTwistPart3SearchGeodes"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 471, Y = 680},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1608, X = 471, Y = 680, Tag = "GeodeContainer1", Direction = 0},
			ObjectLootItemMiscAdd	{Tag = "GeodeContainer1", ItemId = 208},
			
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTwistPart3SearchGeodes"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 388, Y = 625},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1608, X = 388, Y = 625, Tag = "GeodeContainer2", Direction = 0},
			ObjectLootItemMiscAdd	{Tag = "GeodeContainer2", ItemId = 208},
			
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTwistPart3SearchGeodes"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 328, Y = 615},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1608, X = 328, Y = 615, Tag = "GeodeContainer3", Direction = 0},
			ObjectLootItemMiscAdd	{Tag = "GeodeContainer3", ItemId = 208},
			
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTwistPart3SearchGeodes"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 519, Y = 625},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1608, X = 519, Y = 625, Tag = "GeodeContainer4", Direction = 0},
			ObjectLootItemMiscAdd	{Tag = "GeodeContainer4", ItemId = 208},
			
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTwistPart3SearchGeodes"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 556, Y = 602},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1608, X = 556, Y = 602, Tag = "GeodeContainer5", Direction = 0},
			ObjectLootItemMiscAdd	{Tag = "GeodeContainer5", ItemId = 208},
		}
	},
	-- Und als ob es noch nicht reicht, spawnen wir noch mal fünf andere Geoden
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTwistPart3SearchGeodes"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 390, Y = 653},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1608, X = 390, Y = 653, Tag = "GeodeContainer6", Direction = 27},
			ObjectLootItemMiscAdd {Tag = "GeodeContainer6", ItemId = 239},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTwistPart3SearchGeodes"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 343, Y = 673},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1608, X = 343, Y = 673, Tag = "GeodeContainer7", Direction = 5},
			ObjectLootItemMiscAdd {Tag = "GeodeContainer7", ItemId = 239},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTwistPart3SearchGeodes"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 295, Y = 639},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1608, X = 295, Y = 639, Tag = "GeodeContainer8", Direction = 71},
			ObjectLootItemMiscAdd {Tag = "GeodeContainer8", ItemId = 239},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTwistPart3SearchGeodes"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 527, Y = 606},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1608, X = 527, Y = 606, Tag = "GeodeContainer9", Direction = 5},
			ObjectLootItemMiscAdd {Tag = "GeodeContainer9", ItemId = 239},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "RightTwistPart3SearchGeodes"},
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 574, Y = 583},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 1608, X = 574, Y = 583, Tag = "GeodeContainer10", Direction = 2},
			ObjectLootItemMiscAdd {Tag = "GeodeContainer10", ItemId = 239},
		}
	},
    -- Geodenquest solven
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "RightTwistPart3SearchGeodes"},
    		AvatarHasItemMisc {ItemId = Item.Misc.Iridiumgeode, Amount = 5},
    		AvatarHasItemMisc {ItemId = Item.Misc.GeodeLathanium, Amount = 5}
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "RightTwistPart3SearchGeodes"},
    		QuestSetActive {Quest = "RightTwist3TalkToProfAgain"},
    		DialogSetEnabled {},
    	}
    },
}
