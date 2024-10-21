



State
{
	StateName = "Main",
	   
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_SilkQuestGiven"},
		},
		Actions =
		{
			QuestSetActive {Quest = "GFItemCollectionSilk"},
			QuestSetActive {Quest = "FindWhiteSilk"},
			QuestSetActive {Quest = "FindSilverSilk"},
			QuestSetActive {Quest = "FindGreySilk"},
			QuestSetActive {Quest = "FindBlackSilk"},
			
			AvatarItemMiscGive	{Player = "pl_Human", ItemId = 20, Amount = 1},
			
			FogOfWarRevealAtEntity	{FogOfWarId = 13, Tag = "SpiderSilkLair", Range = 25, Height = default},
			PlayerTravelStoneAdd	{Player = "pl_Human", Tag = "RS_SpiderLair"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindWhiteSilk"},
			AvatarHasItemMisc	{ItemId = 15 , Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "FindWhiteSilk"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindSilverSilk"},
			AvatarHasItemMisc	{ItemId = 16 , Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "FindSilverSilk"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindGreySilk"},
			AvatarHasItemMisc	{ItemId = 19 , Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "FindGreySilk"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindBlackSilk"},
			AvatarHasItemMisc	{ItemId = 18 , Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "FindBlackSilk"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "FindWhiteSilk"},
			QuestIsSolved {Quest = "FindSilverSilk"},
			QuestIsSolved {Quest = "FindGreySilk"},
			QuestIsSolved {Quest = "FindBlackSilk"},
		},	
		Actions =
		{
			AvatarFlagSetTrue{Name = "af_P304_SilkCollected"},
			QuestSetActive {Quest = "BringSilkToOdger"},
		},
	},
	
	-- QUEST "ItemCollectionSilk" wird im Script von Trader Odger gesolved
	-- Dort wird auch die Spindel entfernt
	
	
	
	
	
}

