-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		GotoState = "AgainstTheBeasts",
		Conditions =
		{
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_AvaAtForge"},
			MapFlagSetFalse	{Name = "mf_GotStuff"},
			
			LeverSetDisabled {Tag = "Lever1"},
			LeverSetDisabled {Tag = "Lever2"},
			LeverSetDisabled {Tag = "Lever3"},
			QuestSetSolved   {Quest = "ThroughPortalToFF"},
		},
	},
};

State
{
	StateName = "AgainstTheBeasts",


	-- Outcries am Anfang der Map
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "pl_HumanAvatar", X = 260, Y = 60, Range = 7},
		},
		Actions =
		{
			QuestSetActive  {Quest =  "FireforgePart1TheBarbarians"},
			FigureOutcry	{Tag   =  "pl_HumanAvatar", TextTag = "Avatar1"},
			FigureOutcry	{Tag   =  "pl_HumanAvatar", TextTag = "Avatar2"},
		},
	},

--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			MapFlagIsTrue	{Name = "mf_StartBarbQuest"},
--		},
--		Actions =
--		{
--			QuestSetActive  {Quest =  "WorkWithBarbarians"},
--		},
--
--	},

	-- DIe Flags hierfür werden im Dialog mit Vlad gesetzt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_MainPart1Solved"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "FireforgePart1TheBarbarians"},
		},

	},

	-- Spieler bekommt Barbaren übergeben

	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_WorkBarbSolved"},
			
			AvatarIsNotTalking 		{},
			GameInterfaceIsVisible 	{},
		},
		Actions =
		{

			PlayerResourceLenyaGive		{Player = "default", Amount = 300},
			PlayerResourceSilverGive	{Player = "default", Amount = 300},
			PlayerResourceStoneGive		{Player = "default", Amount = 300},
			
--			QuestSetSolved		{Quest = "WorkWithBarbarians"},
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Barbarians"},
			PlayerActivate	{Player = "pl_Beast_AI1"},
			PlayerActivate	{Player = "pl_Beast_AI2"},

			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 33},  -- HQ   Barbaren Upgrade
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 19},  -- Turm Barbaren Upgrade
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 25},  -- Pig Farm
			PlayerBuildingAdd		{Player = "pl_Human", BuildingId = 149},    -- StoneMason
			PlayerBuildingAdd		{Player = "pl_Human", BuildingId = 155},    -- FightingPit
			
			-- Outcry für die Übergabe der Barbaren
			FigureOutcry {Tag = "Nobody", TextTag = "System1"},
			
			PortalDisable  {Tag = "PortalToUramGor"},  
			PlayerTravelDisable	{},
		},

	},


	-- Wenn die Barbaren dem Spieler gehören, werden die Auf zur Schmiede Quests aktiv
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "FireforgePart1TheBarbarians"},
		},
		Actions	=
		{
			QuestSetActive	{Quest = "FireforgePart2TheForge"},
			QuestSetActive	{Quest = "FindWayToForge"},
			QuestSetActive  {Quest = "FindKeyFragmentsFireforge"},
		},
	},

	OnOneTimeEvent
	{
		GotoState = "TheForge",
		Conditions =
		{
			GateIsOpen	{Tag = "GateCity"},
		},
		Actions =
		{
		},
	},

};

State
{
	StateName = "TheCity",
};
State
{
	StateName = "TheForge",

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarIsNotTalking	{},	GameInterfaceIsVisible	{},
			MapFlagIsTrue	{Name = "mf_AvaAtForge"},
		},
		Actions =
		{
			FigureTeleport	{Tag  = "Ghost", X = 378, Y = 537},
			
			FigureTeleport	{Tag  = "pl_HumanAvatar",  X = 372, Y = 535},
			FigureTeleport	{Tag  = "pl_HumanHeroBor", X = 371, Y = 535.5},
			FigureTeleport	{Tag  = "pl_HumanHeroLya", X = 373, Y = 535.5},
			FigureTeleport	{Tag  = "pl_HumanHeroMordecay", X = 371, Y = 536.5},
			FigureTeleport	{Tag  = "pl_HumanHeroJared",    X = 372, Y = 536.5},
			FigureTeleport	{Tag  = "pl_HumanHeroShae",     X = 373, Y = 536.5},
			FigureTeleport	{Tag  = "pl_HumanKor",     X = 371, Y = 532},
			

			QuestSetSolved	{Quest = "FindWayToForge"}, 

			FigureOutcry	{Tag = "Ghost",TextTag = "Ghost0"},
			FigureOutcry	{Tag = "Ghost",TextTag = "Ghost1"},
			FigureOutcry	{Tag = "Ghost",TextTag = "Ghost2"},
			FigureOutcry	{Tag = "Ghost",TextTag = "Ghost3"},

			QuestSetActive	{Quest = "CollectStuffForRing"},
		},
	},


	-- CollectStuffForRingQuest wird gelöst, sobald das Tor zur Inneren Schmiede aufgetan wurde
	OnOneTimeEvent
	{
		Conditions	=
		{
			GateIsOpen {Tag = "GateForge"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "CollectStuffForRing"},
		},
	},



	-- Aus Dialog mit Geist heraus: Ignite Forge Quest aktiv setzen

	OnOneTimeEvent
	{
		Conditions	=
		{
			MapFlagIsTrue	{Name = "mf_LightForgeActive"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "IgniteForge"},
		},
	},

	-- DUMMY: IgniteForge lösen

	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_LightForgeSolved"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "IgniteForge"},
			
			LeverSetEnabled	{Tag = "Lever1"},
			LeverSetEnabled	{Tag = "Lever2"},
			LeverSetEnabled	{Tag = "Lever3"},

		},
	},


	-- Aus Dialog mit Geist heraus: SetFlamesToYellow Quest aktiv setzen

	OnOneTimeEvent
	{
		Conditions	=
		{
			MapFlagIsTrue	{Name = "mf_TurnFlamesYellowActive"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "SetFlamesToYellow"},
		},
	},


	-- Richitge Abfrage:
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual {Name = "mv_Flame1State", Value = 1},
			MapValueIsEqual {Name = "mv_Flame2State", Value = 1},
			MapValueIsEqual {Name = "mv_Flame3State", Value = 1},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "SetFlamesToYellow"},
			MapFlagSetTrue  {Name  = "mf_TurnFlamesYellowSolved"},
			
						
			LeverSetDisabled	{Tag = "Lever1"},
			LeverSetDisabled	{Tag = "Lever2"},
			LeverSetDisabled	{Tag = "Lever3"},
		},
	},

	-- Aus Dialog mit Geist heraus: ForgeRing aktiv setzen

	OnOneTimeEvent
	{
		Conditions	=
		{
			MapFlagIsTrue	{Name = "mf_ForgeRingActive"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "ForgeRing"},
		},
	},

	-- Aus Dialog mit Schmiede heraus: ForgeRing lösen

	OnOneTimeEvent
	{
		Conditions	=
		{
			AvatarIsNotTalking	{},	GameInterfaceIsVisible	{},
			MapFlagIsTrue	{Name = "mf_ForgeRingSolved"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "ForgeRing"},
			PortalEnable    {Tag = "PortalToUramGor"},
			PlayerTravelEnable	{},
		},
	},


};

