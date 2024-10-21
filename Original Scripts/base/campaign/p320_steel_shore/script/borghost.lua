State
{
	StateName = "Init",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			BuildingIsNotInRange {Tag = "Altar1", X = 177, Y = 552, Range = 5}
		},
		Actions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanHeroBor"},
			MapValueAdd {Name = "mv_P320_DestroyedAltars", Value = 1}
		}
	}
}