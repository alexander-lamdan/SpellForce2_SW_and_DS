


State
{
	StateName = "UgnathsWache02",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_UgnathSpawn"},
		},
		Actions = 
		{
			MapFlagSetTrue  {Name = "mf_UgnathsWache02_Alive"},
		},
	};
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue  {Name = "mf_UgnathAlive"},
			FigureIsDead	{Tag = "Ugnath"},
		},
		Actions =
		{
			FigureKill	{},
		},
		
	},
};
