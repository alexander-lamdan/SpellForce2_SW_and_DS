
State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigurePlayerTransfer {Tag = "PlayerArmy".. variety},
		},
	},
	--OnFigureSpawnOnlyWhenEvent
	--{
	--	X = 121,
	--	Y = 160,
	--	Conditions = 
	--	{
	--		MapTimerIsElapsed {Name = "mt_P303_MapStartTimer", Seconds = 0+ variety},
	--	},
	--	Actions = 
	--	{
	--		FigurePlayerTransfer {Tag = "PlayerArmy".. variety},
	--	},
	--},
	--OnIdleGoHomeFake
	--{
	--	X = GetEntityX(), 
	--	Y = GetEntityY(),
	--	Conditions = 
	--	{
	--	},
   	--	Actions = 
	--	{
	--	},
	--},

}
