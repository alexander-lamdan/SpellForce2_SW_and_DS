------------------------------------------------------------------------
--
--	Skript, damit man den Zustand herstellen kann, den der SPieler hätte, wenn er auf GoS zurück kommt
--
----------------------------------------------------------------------------

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P309_Pfuschen"}
		},
		Actions =
		{
			
			-- !!! Mapinitialisierung für Single Load (Questen etc)
			
			QuestSetSolved {Quest = "ToUramGor"},
			QuestSetSolved {Quest = "GoSPart4Fireforge"},
			QuestSetSolved {Quest = "2_KapitelAkt2"},
			
			QuestSetActive {Quest = "SF2_2_Akt"},
			QuestSetActive {Quest = "3_KapitelAkt2"},
			QuestSetActive {Quest = "GoSPart5ShadowWarrior"},
			--QuestSetActive {Quest = "GoSPart6GetMirror"},
		},
	},
	--OnOneTimeEvent
	--{
	--	Conditions =
	--	{
	--		QuestIsKnown {Quest = "FindPortalToMagnetStones"},
	--	},
	--	Actions =
	--	{
	--		QuestSetSolved {Quest = "FindPortalToMagnetStones"},
	--		QuestSetSolved {Quest = "GoSPart7FindMagnetStones"},
	--		QuestSetSolved {Quest = "3_KapitelAkt2"},
	--		
	--		QuestSetActive {Quest = "4_KapitelAkt2"},
	--		QuestSetActive {Quest = "GoSPart9MarchToDraghLur"},
	--		QuestSetSolved {Quest = "TalkToIronLord"},
	--		--QuestSetActive {Quest = "SolveStoneGodRiddle"},
	--		AvatarFlagSetTrue {Name = "af_P312_PlayerHasVisitedMagnetStones"},
	--		
	--		AvatarFlagSetFalse {Name = "af_P309_Pfuschen"},
	--		AvatarFlagSetTrue {Name = "af_P309_Ficken"}
	--		
	--	},
	--},
}