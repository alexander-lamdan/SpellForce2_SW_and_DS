State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		-- Wen der Outcry kam, dass der Titan gespawnt wurde und der Spieler zurückkommen soll in die Festung erscheint Schattenlied
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P407_TitanWarning"},
		},
		Actions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanAvatar"},
		},
	},
}