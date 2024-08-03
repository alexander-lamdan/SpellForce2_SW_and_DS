-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P301_CampaignStarted"},
		},
		Actions =
		{
		},
		GotoState = "QuestState01"
	},
}


State
{
	StateName = "QuestState01",

	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			PortalDisable{Tag = "WayToMS"},
			
			PlayerTravelDisable{},
			
			QuestSetSolved {Quest = "SearchPortal"},
			QuestSetSolved {Quest = "MagnetStonesPart3SkullFaste"},
			QuestSetActive {Quest = "CraterPart1BoneTower"},
			QuestSetActive {Quest = "FindBoneTower"},
		}, -- Karte Betreten löst die Karte betreten Quest, 
		-- das bleibt alles drei auch im Release
		-- Spieler bekommt "FindBoneTower"-Quest
		GotoState = "QuestState02"
	},
}


State
{
	StateName = "QuestState02",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P313_InsideCraterCenter"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "FindBoneTower"},
			QuestSetActive {Quest = "DefeatNaugron"},
		}, -- Hat der Spieler den Knochenturm gefunden
		-- bekommt er die Quest "Töte Naugron"
		GotoState = "QuestState03"
	},
}


State
{
	StateName = "QuestState03",

	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Naugron"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DefeatNaugron"},
		}, 
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P313_Cutscene03Ended"},
		},
		Actions =
		{
			QuestSetActive {Quest = "BringMirrorToShadowWarrior"},
			-- Sobald Naugron tot ist, wird "Töte Naugron"-Quest gesolved
			
			AvatarItemMiscGive	{Player = "pl_Human", ItemId = 152, Amount = 1},
			-- Avatar erhält schwarzen Spiegel
			
			PortalEnable{Tag = "WayToMS"},
			PlayerTravelEnable{},
		},
	},
}