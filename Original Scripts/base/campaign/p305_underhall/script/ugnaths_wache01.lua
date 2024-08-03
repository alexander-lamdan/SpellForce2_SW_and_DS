

State
{
	StateName = "UgnathsWache01",
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
			MapFlagSetTrue  {Name = "mf_UgnathsWache01_Alive"},
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
