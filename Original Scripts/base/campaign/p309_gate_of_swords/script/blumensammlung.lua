
-- Sammelskript, damit der Spieler die Bluemchen pfülcken kann
State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "Collect",
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P309_CutsceneOracleEnd"},
		},
		Actions =
		{
		},
	},
}
	
-- Jetzt läuft der Auftrag, die Blumen können gelöscht werden
State
{
	StateName = "Collect",
	-- Blumen löschen, wenn der Spieler da ist und dessen Counter erhöhen
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 5, X = GetEntityX(), Y = GetEntityY()},
			QuestIsActive {Quest = "FindFlowers"},
			EntityFlagIsFalse {Name = "ef_P309_FlowerPicked"}
		},
		Actions =
		{
			-- Der Spieler ist da, also lösch ich mich mal
			ObjectVanish {Tag = "Kackeblume" .. nummer},
			MapValueAdd {Name = "mv_P309_PlayerFlowers", Value = 1},
			EntityFlagSetTrue {Name = "ef_P309_FlowerPicked"},
			AvatarItemMiscGive	{Player = "default", ItemId = 75, Amount = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange {Tag = "Mardrag", Range = 5, X = GetEntityX(), Y = GetEntityY()},
			QuestIsActive {Quest = "FindFlowers"},
			EntityFlagIsFalse {Name = "ef_P309_FlowerPicked"}
		},
		Actions =
		{
			-- Der Mardrag ist da, also lösch ich mich mal
			ObjectVanish {Tag = "Kackeblume" .. nummer},
			MapValueAdd {Name = "mv_P309_MardragFlowers", Value = 1},	
			EntityFlagSetTrue {Name = "ef_P309_FlowerPicked"}
		},
	},
	
}