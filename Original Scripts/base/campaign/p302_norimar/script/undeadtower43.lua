State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
	--	GotoState = "HealSelf",
		Conditions = 
		{
		},
		Actions = 
		{
		},
	},
};

State
{
	StateName = "HealSelf",
	
	OnEvent
	{
		Conditions = 
		{
			--BuildingHasNotHealth	{Percent = 100},
			MapFlagIsFalse	{Name = "mf_EigthFlameLit"},
		},
		Actions = 
		{
			FigureHealthSet	{Percent = 100},
		},
	},
};


