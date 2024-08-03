--------------------------------------------------------------
--
--		Bibliothekar taucht erst auf wenn seine Quest aktiv ist
--
---------------------------------------------------------------


State
{	
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			QuestIsActive {Quest = "FindMemoryBookstore"},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P309_Librarian"},
		}
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P309_Librarian", Seconds = 2},
		},
		Actions = 
		{
			DialogTypeSetMainQuest {},
			DialogSetEnabled {},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P312_PlayerHasVisitedMagnetStones"},
		},
		Actions =
		{
			FigureVanish {Tag = "default"},
		}
	}
}