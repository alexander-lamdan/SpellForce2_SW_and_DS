State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P319_SorvinaFirstTeleport"},
		},
		Actions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanAvatar"},
		}
	}
}