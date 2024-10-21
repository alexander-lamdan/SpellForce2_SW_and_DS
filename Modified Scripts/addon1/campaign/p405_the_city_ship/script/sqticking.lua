
if DEBUG and QUESTDEBUG then
	--OnOneTimeEvent
	--{
	--	EventName = "Debug",
	--	Conditions = 
	--	{
	--		QuestIsNotKnown	{Quest = "TickingHeart"},
	--		DebugQuestionYes	{Question = "Sidequest das tickende Herz aktivieren?", Caption = "SQ Ticking Heart"},
	--	},
	--	Actions = 
	--	{
	--		QuestSetActive	{Quest = "TickingHeart"},
	--	},
	--};
end

State
{
	StateName = "TalkToUrgi",
	
	OnEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "TickingHeartTalkToUrgi"},
		},
		Actions =
		{
			ObjectLootItemMiscAdd	{Tag = "SQTicking_Loot1", DropChance = 100, ItemId = 394},
			ObjectLootItemMiscAdd	{Tag = "SQTicking_Loot2", DropChance = 100, ItemId = 393},
			ObjectLootItemMiscAdd	{Tag = "SQTicking_Loot3", DropChance = 100, ItemId = 393},
			ObjectLootItemMiscAdd	{Tag = "SQTicking_Loot4", DropChance = 100, ItemId = 393},
			ObjectLootItemMiscAdd	{Tag = "SQTicking_Loot5", DropChance = 100, ItemId = 393},
			ObjectLootItemMiscAdd	{Tag = "SQTicking_Loot6", DropChance = 100, ItemId = 393},
			ObjectLootItemMiscAdd	{Tag = "SQTicking_Loot7", DropChance = 100, ItemId = 393},
			ObjectLootItemMiscAdd	{Tag = "SQTicking_Loot8", DropChance = 100, ItemId = 393},
			ObjectLootItemMiscAdd	{Tag = "SQTicking_Loot9", DropChance = 100, ItemId = 393},
		},
		GotoState = "FindItems",
	};
};

State
{
	StateName = "FindItems",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 394, Amount = 1},		-- Taktgeber
		},
		Actions =
		{
			QuestSetSolved	{Quest = "TickingHeartFindTactGiver"},
			QuestSetActive	{Quest = "TickingHeartConfigureTactGiver"},
			DialogSetEnabled	{Tag = "SQTicking_Bench"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 393, Amount = 5},		-- Metallteile
		},
		Actions =
		{
			QuestSetSolved	{Quest = "TickingHeartFindMetal"},
		},
	};
	
	OnEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "TickingHeartConfigureTactGiver"},
			QuestIsSolved	{Quest = "TickingHeartFindMetal"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "TickingHeartRepairSpider"},
		},
		GotoState = "WaitForSecondTactGiver",
	};
};

State
{
	StateName = "WaitForSecondTactGiver",
	
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 394, Amount = 1},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "SQTicking_Bench"},
		},
		GotoState = "END",
	};
};

State	{StateName = "END"};
