--Creeps, die Lager angreifen

State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = SpawnKoordinateX,
		Y = SpawnKoordinateY,
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_Creep_Attack", Seconds = ZeitpunktAttacke},
			
		},
		Actions = 
		{
			FigurePlayerTransfer	{Tag = "default", Player = "pl_AttackCreep"},
		},
		DelayedActions = 
		{
		},
	};


};

