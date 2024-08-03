State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Altar4", X = 158.63, Y = 494.691, Range = 5}
		},
		Actions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanHeroMordecay"},
			MapValueAdd {Name = "mv_P320_DestroyedAltars", Value = 1}
		}
	}
}