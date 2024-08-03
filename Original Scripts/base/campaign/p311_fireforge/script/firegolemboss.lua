State
{
	StateName = "INIT",
	OnFigureDeadOneTimeEvent
	{	
		Conditions = 
		{
		},
		Actions = 
		{
			MapFlagSetTrue  {Name = "mf_GolemKilled"},			
		},
	},	
};

