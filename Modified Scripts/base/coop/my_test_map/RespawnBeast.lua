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
			-- fill_me
		},
		GotoState = "MAIN",
	};
};

State
{ StateName = "Spawn"
  OnEvent
  {
	  Conditions =
	  {

	  },
	  Actions =
	  {
      FigureRespawn {Tag = "test1", X = 11,Y = 333},
      FigureRespawn {Tag = "test3", X = 8,Y = 333},
	  },
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
