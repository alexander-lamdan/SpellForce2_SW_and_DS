State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Tower1", X = 432, Y = 531, Range = 2}
		},
		Actions =
		{
			MapValueAdd {Name = "mv_P309_DestoyedTowers", Value = 1}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Tower2", X = 413, Y = 530, Range = 2}
		},
		Actions =
		{
			MapValueAdd {Name = "mv_P309_DestoyedTowers", Value = 1}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Tower3", X = 384, Y = 534, Range = 2}
		},
		Actions =
		{
			MapValueAdd {Name = "mv_P309_DestoyedTowers", Value = 1}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Tower4", X = 368, Y = 538, Range = 2}
		},
		Actions =
		{
			MapValueAdd {Name = "mv_P309_DestoyedTowers", Value = 1}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Tower5", X = 358, Y = 545, Range = 2}
		},
		Actions =
		{
			MapValueAdd {Name = "mv_P309_DestoyedTowers", Value = 1}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Tower6", X = 351, Y = 551, Range = 2}
		},
		Actions =
		{
			MapValueAdd {Name = "mv_P309_DestoyedTowers", Value = 1}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Tower7", X = 344, Y = 556, Range = 2}
		},
		Actions =
		{
			MapValueAdd {Name = "mv_P309_DestoyedTowers", Value = 1}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Tower8", X = 337, Y = 562, Range = 2}
		},
		Actions =
		{
			MapValueAdd {Name = "mv_P309_DestoyedTowers", Value = 1}
		},
	},
	-- Spieler hat genug Türme zerstört
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P309_DestoyedTowers", Value = 5}
		},
		Actions =
		{
			FigureOutcry {Tag = "TothLar", TextTag = "TothLar1"},
			FigureOutcry {Tag = "TothLar", TextTag = "TothLar2"},
			FigureRun {Tag = "TothLar", X = 386, Y = 653},
			GateSetOpen {Tag = "GateFortress"},
			PlayerActivate {Player = "pl_Fortress"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Tower1", X = 432, Y = 531, Range = 2},
			BuildingIsNotInRange {Tag = "Tower2", X = 413, Y = 530, Range = 2},
			BuildingIsNotInRange {Tag = "Tower3", X = 384, Y = 534, Range = 2},
			BuildingIsNotInRange {Tag = "Tower4", X = 368, Y = 538, Range = 2},
			BuildingIsNotInRange {Tag = "Tower5", X = 358, Y = 545, Range = 2},
			BuildingIsNotInRange {Tag = "Tower6", X = 351, Y = 551, Range = 2},
			BuildingIsNotInRange {Tag = "Tower7", X = 344, Y = 556, Range = 2},
			BuildingIsNotInRange {Tag = "Tower8", X = 337, Y = 562, Range = 2},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DestroyDraghLurTowers"},
			QuestSetActive {Quest = "ToDraghLurTop"},
			FogOfWarRevealAtEntity {Tag = "TothLar", Range = 15, Height = 170}
		}
	}
}