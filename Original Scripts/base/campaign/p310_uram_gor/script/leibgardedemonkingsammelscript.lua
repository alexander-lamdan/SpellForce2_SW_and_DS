local CUpdateInterval = SetUpdateInterval {Steps = math.random(7, 9)}

 -- Wenn der DemonKing stirbt nimmt er seine Leibgarde mit in den Tod.

State
{
	StateName = "LeibgardeDemonKing",
   	OnOneTimeEvent
	{
		Conditions = 
		{
			CUpdateInterval,
			MapFlagIsTrue	{Name = "mf_DemonKingDeath"},	
		},
		Actions = 
		{
			FigureKill	{},
		},
	},

 

};
