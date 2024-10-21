State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Altar3", X = 196.837, Y = 494.746, Range = 5}
		},
		Actions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanHeroLya"},
			MapValueAdd {Name = "mv_P320_DestroyedAltars", Value = 1}
		}
	}
}