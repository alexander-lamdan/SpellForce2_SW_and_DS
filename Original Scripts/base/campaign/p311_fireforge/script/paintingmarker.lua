State
{
	StateName = "Init",
	-- Marker für das Painting starten
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "HouseOfGreyPaintFireforge"}
		},
		Actions =
		{
			ObjectChange	{Tag = "PaintingMarker", ObjectId = 1592, X = 301, Y = 547, Direction = 0},
			FogOfWarRevealAtEntity	{Tag = "PaintingMarker", Range = 10, Height = default},
		}
	},
	-- Bild von Rushwater malen
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "PaintingMarker", Range = 5},
			QuestIsActive {Quest = "HouseOfGreyPaintFireforge"},
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Paint1"},
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Paint2"},
			QuestSetSolved {Quest = "HouseOfGreyPaintFireforge"},
			ObjectVanish	{Tag = "PaintingMarker"},
		}
	},
	-- Alle Bilder gemalt, Rückkehrquest starten
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "HouseOfGreyPaintRushwater"},
			QuestIsSolved {Quest = "HouseOfGreyPaintNeedle"},
			QuestIsSolved {Quest = "HouseOfGreyPaintGF"},
			QuestIsSolved {Quest = "HouseOfGreyPaintFireforge"},
			QuestIsSolved {Quest = "HouseOfGreyPaintMagnetStones"},
			QuestIsNotKnown  {Player = "pl_Human", Quest = "HouseOfGreyReturnMyra"},
		},
		Actions =
		{
			QuestSetActive {Quest = "HouseOfGreyReturnMyra"},
			AvatarItemMiscTake {ItemId = 222, Amount = 1},
		}
	},
}