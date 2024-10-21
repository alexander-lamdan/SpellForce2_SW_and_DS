

State
{
	StateName = "UgnathsWache04",
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
			MapFlagSetTrue  {Name = "mf_UgnathsWache04_Alive"},
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
