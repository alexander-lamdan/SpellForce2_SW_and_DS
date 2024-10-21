-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "QuestStart",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P301_CampaignStarted"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "GFPart5ActivatePortal"},	
			QuestSetSolved {Quest = "ToUnderhall"},	
			QuestSetSolved {Quest = "ActivatePortal"},	
		
			--Mainquest Underhall Part 1
			QuestSetActive {Quest = "UnderhallPart1SaveDwarves"},	
			QuestSetActive {Quest = "FindWayThroughMine"},
		},
		GotoState = "QuestState01",
	},
};

State
{
	StateName = "QuestState01",
};
