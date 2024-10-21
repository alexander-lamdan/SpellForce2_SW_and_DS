
-- SingleMapLoadEvent einladen
dofile("addon1/script/TestCampaignSingleMapLoadEvents.lua")

State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			QuestSetSolved {Quest = "WestguardA1_GotoMistyCoast"},
			QuestSetSolved {Quest = "SF2A1_3_Akt_Kapitel1"},
			QuestSetActive {Quest = "SF2A1_3_Akt_Kapitel2"},
			QuestSetActive {Quest = "MistyCoast_FreeBuildings"},
			
			PortalDisable{Tag = "EndPortal"},
			PortalDisable{Tag = "StartPortal"},
			PlayerTravelDisable{},
		},
		GotoState = "QuestState00",
	},
}


State
{	
	StateName = "QuestState00",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_GiveKit1"},
			MapFlagIsTrue{Name = "mf_GiveKit2"},
			MapFlagIsTrue{Name = "mf_GiveKit3"},
			MapFlagIsTrue{Name = "mf_GiveKit4"},
			MapFlagIsTrue{Name = "mf_GiveKit5"},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_AllCampsFreed"},
			
			QuestSetSolved{Quest = "MistyCoast_FreeBuildings"},
			QuestSetActive{Quest = "MistyCoast_Build"},
		},
		GotoState = "QuestState01",
	},
}

State
{	
	StateName = "QuestState01",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerHasBuildingAmount	{Player = "pl_Human", Amount = 7, OnlyCompleted = true},
		},
		Actions =
		{
			QuestSetSolved {Quest = "MistyCoast_Build"},
			
			QuestSetActive {Quest = "MistyCoast_DragonMustLive"},
			
			QuestSetActive {Quest = "MistyCoast_FormersProtection"},
			QuestSetActive {Quest = "MistyCoast_FirstPowerSource"},
			QuestSetActive {Quest = "MistyCoast_SecondPowerSource"},
			QuestSetActive {Quest = "MistyCoast_ThirdPowerSource"},
			QuestSetActive {Quest = "MistyCoast_FourthPowerSource"},
			QuestSetActive {Quest = "MistyCoast_FifthPowerSource"},
			
			MapFlagSetTrue {Name = "mf_CS02Start"},
			-- 2. Cutscene wird gestartet
			
			--PlayerHeroAdd {Player = "pl_Human", HeroId = 105},
			--FigureHeroSpawn {Player = "default", Tag = "Ur", X = 236.265, Y = 159.251, Direction = 4},
			--FigureHeroSpawn {Player = "default", Tag = "Ur", X = 280.613, Y = 312.113, Direction = 85},
			AvatarFlagSetTrue{Name = "af_P411_PlayerHasUr"},
			-- Spieler bekommt Ur
		},
		GotoState = "QuestState02",
	},
}


State
{	
	StateName = "QuestState02",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Source1Disabled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "MistyCoast_FirstPowerSource"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Source2Disabled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "MistyCoast_SecondPowerSource"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Source3Disabled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "MistyCoast_ThirdPowerSource"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Source4Disabled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "MistyCoast_FourthPowerSource"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Source5Disabled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "MistyCoast_FifthPowerSource"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_Source1Disabled"},
			MapFlagIsTrue{Name = "mf_Source2Disabled"},
			MapFlagIsTrue{Name = "mf_Source3Disabled"},
			MapFlagIsTrue{Name = "mf_Source4Disabled"},
			MapFlagIsTrue{Name = "mf_Source5Disabled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "MistyCoast_FormersProtection"},
			--QuestSetActive {Quest = "MistyCoast_DestroyFormersBase"},
			QuestSetActive {Quest = "MistyCoast_KillFormer"},
		},
		GotoState = "QuestState03",
	},
}


State
{	
	StateName = "QuestState03",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_FormerDoubleKilled"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "MistyCoast_KillFormer"},
			
			QuestSetSolved {Quest = "MistyCoast_DragonMustLive"},
			
			QuestSetActive {Quest = "MistyCoast_FollowTheRealFormer"},
			
			-- Flag für Steffen
			MapFlagSetTrue {Name = "mf_MistyCoastMainQuestComplete"},
			
			PortalEnable{Tag = "EndPortal"},
			PortalEnable{Tag = "StartPortal"},
			PlayerTravelEnable{},
		}
	},
}