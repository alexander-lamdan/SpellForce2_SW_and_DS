State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		Conditions =
		{
	    	-- fill_me
		},
		Actions =
		{
			FogOfWarReveal
			{
			  FogOfWarId = 0,
			  X = 586,
			  Y = 555,
			  Range = 50,
			  Height = 20
			},
		},
		GotoState = "MAIN",
	};
};

State
{
	StateName = "MAIN",

	OnOneTimeEvent
	{
		Conditions =
		{
		    -- fill_me
		},
		Actions =
		{
            -- fill_me
		},
	},

};