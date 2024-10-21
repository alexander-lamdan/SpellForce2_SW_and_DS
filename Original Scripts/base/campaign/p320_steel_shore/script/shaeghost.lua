State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Altar5", X = 147.565, Y = 531.411, Range = 5}
		},
		Actions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanHeroShae"},
			MapValueAdd {Name = "mv_P320_DestroyedAltars", Value = 1}
		}
	}
}