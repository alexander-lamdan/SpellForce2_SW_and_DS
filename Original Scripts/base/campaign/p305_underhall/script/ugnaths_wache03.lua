

State
{
	StateName = "UgnathsWache03",
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
			MapFlagSetTrue  {Name = "mf_UgnathsWache03_Alive"},
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
