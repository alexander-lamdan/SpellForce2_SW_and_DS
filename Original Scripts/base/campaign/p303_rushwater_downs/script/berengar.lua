-- Belengar macht den Dialog an, wenn man die Quest für den Falkenpanzer hat
State
{
	StateName = "INIT",
	-- Alwin hat die Quest gegeben mit Berengar zu sprechen, alos zieht Berengar nach Connach um
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "RushwaterPart5ReturnToMatricus"}
		},
		Actions =
		{
			FigureVanish {Tag = "Berengar"},
			EntityFlagSetTrue {Name = "ef_P303_BerengarMove"}
		}
	},
	-- Am Anfang steht Berengar in Lyrraine
	OnFigureSpawnOnlyWhenEvent
	{
		X = 318, 
		Y = 357,
		Conditions =
		{
			
		},
		Actions =
		{
		}
	},
	-- Umzug nach Connach und Questdialog das erste mal an
	OnFigureRespawnEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		WaitTime = 1,
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P303_BerengarMove"},
			EntityFlagIsFalse {Name = "ef_P303_BerengarNeverMore"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P303_BerengarNeverMore"},
		}
	},
	-- Erst nach dem Umzug darf der Dialog an sein
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P303_BerengarNeverMore"},
			QuestIsActive {Quest = "TalkToBerengarAboutArmor"}
		},
		Actions =
		{
			DialogTypeSetSideQuest {},
			DialogSetEnabled {},
		}
	},
	-- Quest ist gelöst und Spieler hat die Rüstung Dialog an für "Nachbesprechung" (Tausch Rüstung gegen Gold)
	OnOneTimeEvent
	{
		EventName = "QuestIsSolved {Quest = RushwaterTheIronFalcon},",
		Conditions =
		{
			QuestIsSolved {Quest = "RushwaterTheIronFalcon"},
			--OR
			--{
			--	AvatarHasItemEquipment {ItemId = 503, Amount = 1},
			--	AvatarHasItemEquipment {ItemId = 491, Amount = 1},
			--}
		},
		Actions =
		{
			DialogSetEnabled {},
		}
	},
	OnOneTimeEvent
	{
		EventName = "QuestIsSolved {Quest = TalkToUndergantAboutBill},",
		Conditions =
		{
			QuestIsActive {Quest = "TalkToUndergantAboutBill"},
		},
		Actions =
		{
			DialogSetEnabled {},
		}
	}
}