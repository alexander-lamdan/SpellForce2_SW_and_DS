--------------------------------------------------------------
--
--		Die Bibliothe erscheint nur, wenn der Spieler sie auch sehen soll
--
---------------------------------------------------------------


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
			ObjectVanish {Tag = "default"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "FindMemoryBookstore"},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 776, X = GetEntityX(), Y = GetEntityY(), Direction = default, Tag = "FuckingLib"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P312_PlayerHasVisitedMagnetStones"},
		},
		Actions =
		{
			ObjectVanish {Tag = "FuckingLib"},
		}
	}
}