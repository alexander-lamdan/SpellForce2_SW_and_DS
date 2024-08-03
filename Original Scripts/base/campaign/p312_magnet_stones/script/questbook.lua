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
			PortalDisable{Tag = "PortalToGS"},
			PortalDisable{Tag = "Portal_End"},
			
			PlayerTravelDisable{},
			
			QuestSetSolved {Quest = "GoSPart7FindMagnetStones"},
			QuestSetSolved {Quest = "FindPortalToMagnetStones"},
			QuestSetActive {Quest = "MagnetStonesPart1FreeTrolls"},
		}, -- zu Beginn der Karte den ersten Teil triggern
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
			AvatarFlagIsTrue {Name = "af_P312_SiegeSkelsAllDead"},
			AvatarFlagIsTrue{Name = "af_P312_MagnetStonesInfoGiven"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "MagnetStonesPart1FreeTrolls"},
			QuestSetActive {Quest = "MagnetStonesPart3SkullFaste"},
			QuestSetActive {Quest = "StormSkullCastle"},
			QuestSetActive {Quest = "MagnetStonesPart2MagnetStones"},
		},  -- 
			-- 
			-- Wenn Skelette tot sind und Sobald der Spieler mit Ardar gesprochen hat
			-- "Befreie die Trolle" solven
			-- und "Stürme das Castle", "Schneide Supply ab" triggern
	},


	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "MagnetStonesPart2MagnetStones"},
			OR
			{
				AvatarValueIsEqual{Name = "av_P312_ChiefsOnPower", Value = 0},
				AND
				{
					FigureIsDead{Tag = "Leader99"},
					FigureIsDead{Tag = "Leader01"},
					FigureIsDead{Tag = "Leader02"},
					FigureIsDead{Tag = "Leader03"},
					FigureIsDead{Tag = "Leader04"},
				},
				AND
				{
					FigureIsDead{Tag = "ManicMiner01"},
					FigureIsDead{Tag = "ManicMiner02"},
					FigureIsDead{Tag = "ManicMiner03"},
					FigureIsDead{Tag = "ManicMiner04"},
					FigureIsDead{Tag = "ManicMiner05"},
					FigureIsDead{Tag = "ManicMiner06"},
					FigureIsDead{Tag = "ManicMiner07"},
					FigureIsDead{Tag = "ManicMiner08"},
					FigureIsDead{Tag = "ManicMiner09"},
					FigureIsDead{Tag = "ManicMiner10"},
				},
			},
		},
		Actions =
		{
			QuestSetSolved {Quest = "MagnetStonesPart2MagnetStones"},
		}, 	-- Wenn Supply abgeschnitten wurde
			-- wird Supply-Quest gesolved
	},


	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead{Tag = "Leader99"},
			FigureIsDead{Tag = "Leader01"},
			FigureIsDead{Tag = "Leader02"},
			FigureIsDead{Tag = "Leader03"},
			FigureIsDead{Tag = "Leader04"},
			
			MapFlagIsTrue{Name = "mf_EnemyAIKilled"},
			
		},
		Actions =
		{
			PlayerTravelEnable{},
			
			QuestSetSolved {Quest = "StormSkullCastle"},
			QuestSetActive {Quest = "SearchPortal"},
			
			PortalEnable{Tag = "PortalToGS"},
			PortalEnable{Tag = "Portal_End"},
		}, 
			
	},
}


