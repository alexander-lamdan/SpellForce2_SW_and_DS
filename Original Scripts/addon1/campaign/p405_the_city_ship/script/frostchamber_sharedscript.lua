
State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name ="mf_FrostChamberDoorOpen"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};	
}