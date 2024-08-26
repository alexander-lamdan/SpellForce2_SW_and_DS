
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
			PortalDisable{Tag = "PortalToCityShip"},
			PlayerTravelDisable{},
			
			QuestSetSolved {Quest = "SevenkeepsA1_PortToGhostwatch"},
			QuestSetSolved {Quest = "SF2A1_1_Akt_Kapitel2"},
			QuestSetSolved {Quest = "SF2A1_1_Akt"},
			QuestSetActive {Quest = "SF2A1_2_Akt"},
			QuestSetActive {Quest = "SF1A1_2_Akt_Kapitel1"},
			QuestSetActive {Quest = "Ghostwatch_SearchEmpyriaTroops"},
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
			MapFlagIsTrue{Name = "mf_AvatarReachedRealmTroops"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Ghostwatch_SearchEmpyriaTroops"},
			QuestSetActive {Quest = "Ghostwatch_TalkToCommander"},
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
			MapFlagIsTrue{Name = "mf_CommanderDialogEndedTroopsGiven"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Ghostwatch_TalkToCommander"},
			QuestSetActive {Quest = "Ghostwatch_IntoGhostwatch"},
			QuestSetActive {Quest = "Ghostwatch_TalkToRagna"},
			QuestSetActive {Quest = "Ghostwatch_UndeadOutpost"},
			QuestSetActive {Quest = "Ghostwatch_ReachGhostwatch"},
		},
		GotoState = "QuestState03",
	},
}


State
{
	StateName = "QuestState03",
	
	-- In diesen Queststate müssen die unabhängig voneinander lösbaren Teile
	--          Ragna & die Türme / Zerstöre Untotencamp / In die Geisterwacht
	-- rein
	
	OnOneTimeEvent
	{
		Conditions =
		{
			-- wenn mit Ragna gesprochen wurde
			QuestIsActive {Quest = "Ghostwatch_TalkToRagna"},
			MapFlagIsTrue{Name = "mf_PlayerGotTowerInfo"},
		},
		Actions =
		{
			-- wird die entsprechende Quest gesolved & die Turmquesten werden gestartet
			QuestSetSolved {Quest = "Ghostwatch_TalkToRagna"},
			QuestSetActive {Quest = "Ghostwatch_TheTowers"},
			QuestSetActive {Quest = "Ghostwatch_TowerClues"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "Ghostwatch_TheTowers"},
			MapFlagIsTrue{Name = "mf_OneTowerActivated"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Ghostwatch_TheTowers"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			-- wenn Untotenlager zerstört werden
			QuestIsActive {Quest = "Ghostwatch_UndeadOutpost"},
			BuildingIsDead{Tag = "UndeadBuild01"},
			BuildingIsDead{Tag = "UndeadBuild02"},
			BuildingIsDead{Tag = "UndeadBuild03"},
			BuildingIsDead{Tag = "UndeadBuild04"},
			BuildingIsDead{Tag = "UndeadBuild05"},
			BuildingIsDead{Tag = "UndeadBuild06"},
			BuildingIsDead{Tag = "UndeadBuild07"},
			BuildingIsDead{Tag = "UndeadBuild08"},
			BuildingIsDead{Tag = "UndeadBuild09"},
			BuildingIsDead{Tag = "UndeadBuild10"},
			BuildingIsDead{Tag = "UndeadBuild11"},
			BuildingIsDead{Tag = "UndeadBuild12"},
		},
		Actions =
		{
			-- wird die entsprechende Quest gesolved
			QuestSetSolved {Quest = "Ghostwatch_UndeadOutpost"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_ReachedGhostwatch"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Ghostwatch_ReachGhostwatch"},
		},
		GotoState = "QuestState04",
	},
}


State
{
	StateName = "QuestState04",
	
	-- IN DIESEM STATE WERDEN ALLE QUESTEN GESOLVED, DIE NACH ERREICHEN DER GEISTERWACHT NOCH OFFEN SIND
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "Ghostwatch_TalkToRagna"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Ghostwatch_TalkToRagna"},
			-- ?? EVTL. UNSOLVABLE SETZEN??
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "Ghostwatch_TheTowers"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Ghostwatch_TheTowers"},
			-- ?? EVTL. UNSOLVABLE SETZEN??
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "Ghostwatch_TowerClues"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Ghostwatch_TowerClues"},
			-- ?? EVTL. UNSOLVABLE SETZEN??
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "Ghostwatch_UndeadOutpost"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Ghostwatch_UndeadOutpost"},
			-- ?? EVTL. UNSOLVABLE SETZEN??
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotActive {Quest = "Ghostwatch_TalkToRagna"},
			QuestIsNotActive {Quest = "Ghostwatch_TheTowers"},
			QuestIsNotActive {Quest = "Ghostwatch_TowerClues"},
			QuestIsNotActive {Quest = "Ghostwatch_UndeadOutpost"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Ghostwatch_IntoGhostwatch"},
		},
		GotoState = "QuestState05",
	},
}


State
{
	StateName = "QuestState05",
	
	-- IN DIESEM STATE GEHTS DANN WEITER, WENN MAN DIE GHOSTWATCH VERTEIDIGEN MUSS
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS03Ended"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Ghostwatch_IntoGhostwatch"},
			QuestSetActive {Quest = "Ghostwatch_Defend"},
			QuestSetActive {Quest = "Ghostwatch_ActivateMoreTowers"},
			QuestSetActive {Quest = "Ghostwatch_RepelBlessed"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "Ghostwatch_ActivateMoreTowers"},
			MapFlagIsTrue{Name = "mf_OneBigTowerActivated"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Ghostwatch_ActivateMoreTowers"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "Ghostwatch_RepelBlessed"},
			MapFlagIsTrue{Name = "mf_AnyBlessedSpawned"},
			
			FigureIsDead{Tag = "Blessed01"},
			FigureIsDead{Tag = "Blessed02"},
			FigureIsDead{Tag = "Blessed03"},
			FigureIsDead{Tag = "Blessed04"},
			FigureIsDead{Tag = "Blessed05"},
			FigureIsDead{Tag = "Blessed06"},
			FigureIsDead{Tag = "Blessed07"},
			FigureIsDead{Tag = "Blessed08"},
			FigureIsDead{Tag = "Blessed09"},
			FigureIsDead{Tag = "Blessed10"},
			FigureIsDead{Tag = "Blessed11"},
			FigureIsDead{Tag = "Blessed12"},
			FigureIsDead{Tag = "Blessed13"},
			FigureIsDead{Tag = "Blessed14"},
			FigureIsDead{Tag = "Blessed15"},
			FigureIsDead{Tag = "Blessed16"},
			FigureIsDead{Tag = "Blessed17"},
			FigureIsDead{Tag = "Blessed18"},
			FigureIsDead{Tag = "Blessed19"},
			FigureIsDead{Tag = "Blessed20"},
			FigureIsDead{Tag = "Blessed21"},
			FigureIsDead{Tag = "Blessed22"},
			FigureIsDead{Tag = "Blessed23"},
			FigureIsDead{Tag = "Blessed24"},
			FigureIsDead{Tag = "Blessed25"},
			FigureIsDead{Tag = "Blessed26"},
			FigureIsDead{Tag = "Blessed27"},
			FigureIsDead{Tag = "Blessed28"},
			FigureIsDead{Tag = "Blessed29"},
			FigureIsDead{Tag = "Blessed30"},
			FigureIsDead{Tag = "Blessed31"},
			FigureIsDead{Tag = "Blessed32"},
			FigureIsDead{Tag = "Blessed33"},
			FigureIsDead{Tag = "Blessed34"},
			FigureIsDead{Tag = "Blessed35"},
			FigureIsDead{Tag = "BlessedChef01"},
			FigureIsDead{Tag = "BlessedChef02"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Ghostwatch_RepelBlessed"},
		},
		GotoState = "QuestState06",
	},
}

State
{
	StateName = "QuestState06",
	
	-- QUESTEN WERDEN GESOLVED
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "Ghostwatch_ActivateMoreTowers"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Ghostwatch_ActivateMoreTowers"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "Ghostwatch_ActivateMoreTowers"},
			QuestIsSolved {Quest = "Ghostwatch_RepelBlessed"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "Ghostwatch_Defend"},
			
			MapFlagSetTrue {Name = "mf_CS04Start"},
			GateSetOpen{Tag = "Gate04"},
			
			QuestSetActive {Quest = "Ghostwatch_ToTheCityShip"},
			
			PortalEnable{Tag = "PortalToCityShip"},
			PlayerTravelEnable{},
		},
	},
}