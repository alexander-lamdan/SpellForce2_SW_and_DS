State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_EndIntroCS"}
		},
		Actions =
		{
			FigureHoldPosition{},
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = 5,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			BuildingIsAlive	{Tag = myBuilding},
		},
		Actions =
		{
			FigureHoldPosition{},
		},
		
	},
}