State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P309_Demonlord"},
			GameInterfaceIsVisible {},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "DarioGrey", Team = "tm_EnemyPact"},
			FigureTeamTransfer {Tag = "MyraGrey", Team = "tm_EnemyPact"},
			FigureTeamTransfer {Tag = "SaraGrey", Team = "tm_EnemyPact"},
			FigureTeamTransfer {Tag = "NyanoGrey", Team = "tm_EnemyPact"},
			FigureTeamTransfer {Tag = "LethoGrey", Team = "tm_EnemyPact"},
			FigureAttackEntity {Tag = "LethoGrey", TargetTag = "Helllord"},
			FigureAttackEntity {Tag = "NyanoGrey", TargetTag = "Helllord"},
			FigureAttackEntity {Tag = "SaraGrey", TargetTag = "Helllord"},
			FigureAttackEntity {Tag = "MyraGrey", TargetTag = "Helllord"},
			FigureAttackEntity {Tag = "DarioGrey", TargetTag = "Helllord"},
			FigureAttackEntity {Tag = "Helllord", TargetTag = "LethoGrey"},
			FigureOutcry {TextTag = "LOF1"},
			FigureOutcry {TextTag = "LOF2", Tag = "LethoGrey"},
			FigureOutcry {TextTag = "LOF3", Tag = "NyanoGrey"},
			FigureOutcry {TextTag = "LOF4", Tag = "DarioGrey"},
			FigureOutcry {TextTag = "LOF5", Tag = "SaraGrey"},
			FigureOutcry {TextTag = "LOF6", Tag = "SaraGrey"},
			FigureOutcry {TextTag = "LOF7", Tag = "LethoGrey"},
		}
	},
	-- Alle Graus sind tot der Höllenfürst geht nach Hause
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "DarioGrey"},
			FigureIsDead {Tag = "MyraGrey"},
			FigureIsDead {Tag = "SaraGrey"},
			FigureIsDead {Tag = "NyanoGrey"},
			FigureIsDead {Tag = "LethoGrey"},
		},
		Actions =
		{
			FigureVanish {},
		}
	}
}