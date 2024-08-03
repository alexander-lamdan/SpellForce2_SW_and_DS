dofile("addon1/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "QuestBook",
	-- Starten der MapQuesten
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P406_EndIntroCS"}
		},
		Actions =
		{
			QuestSetSolved {Quest = "CityShip1_TravelToCitadel"},
			QuestSetSolved {Quest = "CityShip1_TeleportToCitadel"},
			QuestSetActive {Quest = "Citadel1_IntoTheCitadel"},
			QuestSetActive {Quest = "Citadel1_ToPact"},
		},
	},
	-- Erste Tore wurden geöffnet
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				GateIsOpen	{Tag = "DoorCitadel1"},
				GateIsOpen	{Tag = "DoorCitadel2"},
			},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Citadel1_ToPact"},
			QuestSetActive {Quest = "Citadel1_EngageGatekeeper"},
		},
	},
	
	-- Nach der Cutszene beim Torwächter
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P406_EndGate1CS"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Citadel1_EngageGatekeeper"},
			QuestSetActive {Quest = "Citadel1_GoToDraghLur"},
			
			-- zum Starten des zweiten Teils der City Ship:
			AvatarFlagSetTrue{Name = "af_P406_ReadyToReturnToCityShip"},
		},
		
	},
	
	
	------------------ !!!!!!!!!!!!!!!!!!!!!!----------------------------
	------------------ CHEAT-EVENT ZUM TESTEN (damit kein Assert auftritt)
	----------------- !!!!!!!!!!!!!!!!!!!!!!-------------------------------
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_CheatPartTwo"},
		},
		Actions =
		{
			QuestSetActive {Quest = "SF2A1_2_Akt_Kapitel2"},
			QuestSetActive{Quest = "DraghLurA1_BackToCitadel"},
			AvatarFlagSetTrue {Name = "af_P406_Part2"},
			--AvatarXPGive{Player = "default", Amount = 76250 },
			PlayerHeroAdd {Player = "pl_Human", HeroId = 110},
		},
	},
	
	------------------- ENDE CHEAT-EVENT ------------------------------------
	
	
	
	-- Nach der Cutszene beim Torwächter
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				QuestIsSolved {Quest = "DraghLurA1_TalkToNightsong"},
				AvatarFlagIsTrue {Name = "af_P406_Part2"},
			},
		},
		Actions =
		{
		
		},
		GotoState = "QuestPart2",
	},

};

--*******************************************************
--***                                                 ***
--***               The Citadel Part 2                ***
--***                                                 ***
--*******************************************************

State
{
	StateName = "QuestPart2",
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			QuestSetSolved {Quest = "DraghLurA1_BackToCitadel"},
			QuestSetSolved {Quest = "SF2A1_2_Akt_Kapitel2"},
			QuestSetActive {Quest = "SF2A1_2_Akt_Kapitel3"},
			QuestSetActive {Quest = "Citadel2_DefeatGatekeeper"},
			--QuestSetActive {Quest = "Citadel2_OpenGate"},
		},
	},
	--Wenn der Torwächter getötet wurde
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_GuardianDead"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Citadel2_DefeatGatekeeper"},
			--QuestSetSolved {Quest = "Citadel2_OpenGate"},
			QuestSetActive {Quest = "Citadel2_Build"},
			QuestSetActive {Quest = "Citadel2_DefineTactics"},
			QuestSetActive {Quest = "Citadel2_DestroyTowersAndCamps"},
		},
	},
	--Wenn der Spieler 3 Gebäude gebaut hat.
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				PlayerHasBuildingAmount	{Player = "pl_Human", Amount = 3, OnlyCompleted = default},
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportEndMarkerCitadel", Range = 2},
			},	
		},
		Actions =
		{
			QuestSetSolved {Quest = "Citadel2_Build"},
		},
	},
		
	--Wenn das Tor geöffnet wurde
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_GuardianDead"},
			OR
			{
				MapFlagIsTrue	{Name = "mf_AttackAimGround1"},
				MapFlagIsTrue	{Name = "mf_AttackAimGround2"},
				MapFlagIsTrue	{Name = "mf_AttackAimGround3"},
				MapFlagIsTrue	{Name = "mf_AttackAimGround4"},
				MapFlagIsTrue	{Name = "mf_GiveResourcesGround"},
			},

		},
		Actions =
		{
			QuestSetSolved {Quest = "Citadel2_DefineTactics"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "Citadel2_DestroyTowersAndCamps"},
			MapFlagIsTrue	{Name = "mf_RealmCampDestroyed"},
			MapFlagIsTrue	{Name = "mf_EastClanCampDestroyed"},
			MapFlagIsTrue	{Name = "mf_BeastCampDestroyed"},
			MapFlagIsTrue	{Name = "mf_NorthClanCampDestroyed"},
			BuildingIsDead	{Tag = "Tower1"},
			BuildingIsDead	{Tag = "Tower2"},
			BuildingIsDead	{Tag = "Tower3"},
			BuildingIsDead	{Tag = "Tower4"},
			BuildingIsDead	{Tag = "Tower5"},
			BuildingIsDead	{Tag = "Tower6"},
			BuildingIsDead	{Tag = "Tower7"},
			BuildingIsDead	{Tag = "Tower8"},
			BuildingIsDead	{Tag = "Tower9"},
			BuildingIsDead	{Tag = "Tower10"},
			
		},
		Actions =
		{
			QuestSetSolved {Quest = "Citadel2_DestroyTowersAndCamps"},
			ObjectVanish	{Tag = "QuestmarkerMain"},
		},
	},
		
	--Wenn der Platz um den Teleporter freigekämpft wurde
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_TeleportLibraryActive"},
		},
		Actions =
		{
			QuestSetActive {Quest = "Citadel2_IntoLibrary"},
		},
	},
	
	--Wenn man in der Library ist.
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "Citadel2_DefineTactics"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportEndMarkerCitadel", Range = 2},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Citadel2_DefineTactics"},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "Citadel2_DefineTactics"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportEndMarkerCitadel", Range = 2},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Citadel2_DestroyTowersAndCamps"},
			QuestSetSolved {Quest = "Citadel2_IntoLibrary"},
			QuestSetActive {Quest = "Citadel2_DefeatMordecay"},
		},
	},
		
	--Wenn Mordecay tot ist.
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Mordecay"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Citadel2_DefeatMordecay"},
			QuestSetSolved {Quest = "SF2A1_2_Akt_Kapitel3"},
			QuestSetActive {Quest = "SF2A1_2_Akt_Kapitel4"},
			QuestSetActive {Quest = "Citadel_ToRefuge"},
			QuestSetActive {Quest = "CityShip3_ReturnToCityShip"},
			AvatarFlagSetTrue{Name = "af_P407_SecondReturnToCityShip"},
		},
	},
	
};