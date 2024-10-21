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
			FogOfWarReveal {X = 620,Y = 594,Range = 50,Height = 20},
			FogOfWarReveal {X = 543,Y = 421,Range = 50,Height = 20},
			FogOfWarReveal {X = 200,Y = 572,Range = 70,Height = 20},
			FogOfWarReveal {X = 343,Y = 303,Range = 70,Height = 50},
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