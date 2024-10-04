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
			FogOfWarReveal {X = 534,Y = 342,Range = 50,Height = 20},
			FogOfWarReveal {X = 311,Y = 322,Range = 50,Height = 20},
			FogOfWarReveal {X = 175,Y = 408,Range = 70,Height = 20},
		},
		GotoState = "MAIN",
	},
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