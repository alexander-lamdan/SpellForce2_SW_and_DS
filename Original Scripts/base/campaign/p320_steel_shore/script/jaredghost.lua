State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Altar2", X = 208.053, Y = 531.22, Range = 5}
		},
		Actions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanHeroJared"},
			MapValueAdd {Name = "mv_P320_DestroyedAltars", Value = 1}
		}
	}
}