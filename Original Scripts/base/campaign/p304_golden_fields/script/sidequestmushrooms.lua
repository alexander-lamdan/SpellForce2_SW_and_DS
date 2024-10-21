



State
{
	StateName = "Main",
	   
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_MushroomQuestGiven"},
		},
		Actions =
		{
			QuestSetActive {Quest = "ItemCollectionGiftpilze"},
			QuestSetActive {Quest = "GetGiftstacheling"},
			QuestSetActive {Quest = "GetGelbenSpeiling"},
			QuestSetActive {Quest = "GetMagenkrempling"},
			QuestSetActive {Quest = "GetElfenspreizling"},
			QuestSetActive {Quest = "GetBraunenWaldling"},
			
			PlayerTravelStoneAdd{Player = "pl_Human", Tag = "RS_BindstoneSouth"},
			PlayerTravelStoneAdd{Player = "pl_Human", Tag = "RS_BindstoneWest"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetGiftstacheling"},
			AvatarHasItemMisc	{ItemId = 27 , Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetGiftstacheling"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetGelbenSpeiling"},
			AvatarHasItemMisc	{ItemId = 28 , Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetGelbenSpeiling"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetMagenkrempling"},
			AvatarHasItemMisc	{ItemId = 29 , Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetMagenkrempling"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetElfenspreizling"},
			AvatarHasItemMisc	{ItemId = 30 , Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetElfenspreizling"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "GetBraunenWaldling"},
			AvatarHasItemMisc	{ItemId = 31 , Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GetBraunenWaldling"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "ItemCollectionGiftpilze"},
			QuestIsSolved {Quest = "GetGiftstacheling"},
			QuestIsSolved {Quest = "GetGelbenSpeiling"},
			QuestIsSolved {Quest = "GetMagenkrempling"},
			QuestIsSolved {Quest = "GetElfenspreizling"},
			QuestIsSolved {Quest = "GetBraunenWaldling"},
		},	
		Actions =
		{
			QuestSetActive {Quest = "BringFungiToZodias"},
			AvatarFlagSetTrue{Name = "af_P304_MushroomsCollected"},
		},
	},
	
	-- QUEST "ItemCollectionHerbs" wird im Script von "MageZodias" gesolved
	
	
	
	
	
}

