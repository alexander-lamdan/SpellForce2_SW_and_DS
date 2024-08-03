State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P309_CutsceneIronLordEnd"},
		},
		Actions =
		{
			DialogTypeSetSideQuest {},
			DialogSetEnabled {},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DarkLegionReturnMorca"},
		},
		Actions =
		{
			DialogTypeSetSideQuest {},
			DialogSetEnabled {},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			--QuestIsSolved {Quest = "DarkLegionBringArmorToMorca"},
			QuestIsSolved {Quest = "DarkLegionSearchAxeblade"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P309_AxeSolved"},
			DialogSetDisabled {},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_AxeSolved"},
			QuestIsActive {Quest = "DarkLegionBringArmorToMorca"},
		},
		Actions =
		{
			DialogSetEnabled {},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "DarkLegionBringArmorToMorca"},
			QuestIsSolved {Quest = "DarkLegionSearchAxeblade"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P309_AxeSolved"},
			DialogSetDisabled {},
		}
	},
	-- hat der Spieler sowohl Rüstung als auch Axt, kann auch die Mainquest gesolved werden
 	OnOneTimeEvent
 	{
 		Conditions =
 		{
 			QuestIsSolved {Quest = "DarkLegionBringArmorToMorca"},
 			QuestIsSolved {Quest = "DarkLegionSearchAxeblade"},
 		},
 		Actions =
 		{
 			QuestSetSolved {Quest = "GoSDarkLegion"},
 			DialogSetDisabled {},
 		}
 	},
 	-- Der SPieler findet den Griff nach der Rüstung
 	OnOneTimeEvent
 	{
 		Conditions =
 		{
 			AvatarHasItemMisc {ItemId = 237, Amount = 1},
 		},
 		Actions =
 		{
 			DialogSetEnabled {},
 		}
 	},
}