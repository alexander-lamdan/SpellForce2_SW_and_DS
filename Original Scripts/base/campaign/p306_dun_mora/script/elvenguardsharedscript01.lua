State
{
	StateName = "INIT",
	OnFigureRespawnEvent
	{
		WaitTime = 30,
		X = 317,
		Y = 386,
		Conditions = 
		{
			
		},
		Actions = 
		{	
		},
		DeathActions = 
		{
		},
		DelayedActions = 
		{
		},
	},
	
		OnIdleRunHomeFake
	{
		
		X = HomeX, --X = GetEntityX(),
		Y = HomeY, --Y = GetEntityY(),
		Range = 1,
		UpdateInterval = 30,
		
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			FigureDirectionSet	{Tag = "default", Direction = DirectionElvenGuard},
			FigureHoldPosition	{Tag = "default"},
		},
		OneTimeHomeActions = 
		{
			
		},
	},
}