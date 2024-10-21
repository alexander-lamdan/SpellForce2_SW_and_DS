

State
{
	StateName = "Main",
	   
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_HerbQuestGiven"},
		},
		Actions =
		{
			QuestSetActive {Quest = "ItemCollectionHerbs"},
			QuestSetActive {Quest = "GetWermut"},
			QuestSetActive {Quest = "GetKatzenwurzel"},
			QuestSetActive {Quest = "GetBlutnessel"},
			QuestSetActive {Quest = "GetLeuchtkraut"},
			QuestSetActive {Quest = "GetTeufelslauch"},
			
			PlayerTravelStoneAdd{Player = "pl_Human", Tag = "RS_BindstoneSouth"},
			PlayerTravelStoneAdd{Player = "pl_Human", Tag = "RS_BindstoneWest"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetWermut"},
			AvatarHasItemMisc	{ItemId = 21 , Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetWermut"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetKatzenwurzel"},
			AvatarHasItemMisc	{ItemId = 22 , Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetKatzenwurzel"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetBlutnessel"},
			AvatarHasItemMisc	{ItemId = 23 , Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetBlutnessel"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetLeuchtkraut"},
			AvatarHasItemMisc	{ItemId = 24 , Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetLeuchtkraut"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetTeufelslauch"},
			AvatarHasItemMisc	{ItemId = 25 , Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetTeufelslauch"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "ItemCollectionHerbs"},
			QuestIsSolved {Quest = "GetTeufelslauch"},
			QuestIsSolved {Quest = "GetLeuchtkraut"},
			QuestIsSolved {Quest = "GetBlutnessel"},
			QuestIsSolved {Quest = "GetKatzenwurzel"},
			QuestIsSolved {Quest = "GetWermut"},
		},	
		Actions =
		{
			QuestSetActive {Quest = "BringHerbsToGalius"},
			AvatarFlagSetTrue{Name = "af_P304_HerbsCollected"},
		},
	},
	
	-- QUEST "ItemCollectionHerbs" wird im Script von "PriestGalius" gesolved
	
	
	
	
	
}

