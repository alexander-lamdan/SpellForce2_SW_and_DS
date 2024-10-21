
State
{
	StateName = "Quest01",
	  
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P304_ThiefQuestGiven"},
		},
		Actions =
		{
			QuestSetActive {Quest = "GFCoveredInvestigation"},
			QuestSetActive {Quest = "TalkToLemuel"},
			QuestSetActive {Quest = "GetLemuelsConfidence"},
			
			FogOfWarRevealAtEntity	{FogOfWarId = 12, Tag = "Lemuel", Range = 25, Height = default},
		},
		GotoState = "Quest02"
	},	
}
	
	
State
{
	StateName = "Quest02",
	  
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_TalkWithLemuel", Value = 2},
		},
		Actions =
		{
			QuestSetSolved {Quest = "TalkToLemuel"},
			QuestSetActive {Quest = "PickpocketFivePurses"},
		},
		GotoState = "Quest03"
	},	
}


State
{
	StateName = "Quest03",
	  
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 130, Amount = 5 },
		},
		Actions =
		{
			QuestSetSolved {Quest = "PickpocketFivePurses"},
			QuestSetActive {Quest = "BringFivePursesToLemuel"},
		},
		GotoState = "Quest04"
	},	
}


State
{
	StateName = "Quest04",
	  
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_TalkWithLemuel", Value = 3},
		},
		Actions =
		{
			QuestSetSolved {Quest = "BringFivePursesToLemuel"},
			QuestSetActive {Quest = "StealThreeCashBags"},
			FogOfWarRevealAtEntity	{FogOfWarId = 42, Tag = "MarketChest01", Range = 15, Height = default},
			FogOfWarRevealAtEntity	{FogOfWarId = 42, Tag = "MarketChest02", Range = 15, Height = default},
			FogOfWarRevealAtEntity	{FogOfWarId = 42, Tag = "MarketChest03", Range = 15, Height = default},
		},
		GotoState = "Quest05"
	},	
}


State
{
	StateName = "Quest05",
	  
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 140, Amount = 3},
		},
		Actions =
		{	
			QuestSetSolved{Quest = "StealThreeCashBags"},
			QuestSetActive {Quest = "BringThreeCashBagsToLemuel"},
		},
		GotoState = "Quest06"
	},	
}

State
{
	StateName = "Quest06",
	  
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_TalkWithLemuel", Value = 4},
		},
		Actions =
		{
			QuestSetSolved {Quest = "BringThreeCashBagsToLemuel"},
			QuestSetSolved {Quest = "GetLemuelsConfidence"},
			QuestSetActive {Quest = "DecideLemuelOrMilitia"},
		},
		GotoState = "Quest07"
	},	
}


State
{
	StateName = "Quest07",
	  
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual{Name = "mv_TalkWithLemuel", Value = 5},
		},
		Actions =
		{
			QuestSetSolved{Quest = "DecideLemuelOrMilitia"},
		},
		GotoState = "Quest08"
	},	
}


State
{
	StateName = "Quest08",
	  
	-- JE NACHDEM, WELCHE ENTSCHEIDUNG DER SPIELER GETROFFEN HAT
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Pickpocket_DecidedForMilitia"},
		},
		Actions =
		{
			QuestSetActive{Quest = "BringPlanToFalida"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Pickpocket_DecidedForLemuel"},
		},
		Actions =
		{
			QuestSetActive{Quest = "LieToFalida"},
		},
	},	
	
	-- DER REST DER QUEST WIRD BEI LEUTNANT FALIDA GESOLVED
}

