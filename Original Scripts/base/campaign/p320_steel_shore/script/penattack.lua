
State
{
	StateName = "Start",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 176,
		Y = 397,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P319_SorvinaInFirstPentagram"},
		},
		Actions =
		{
			FigureLookAtEntity {TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity {TargetTag = "pl_HumanAvatar"}
		}
	}
}