
State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_SpawnCryptos"},
		},
		Actions = 
		{
			MapValueAdd{Name = "mv_CryptosAppeared", Value = 1},
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};	
}