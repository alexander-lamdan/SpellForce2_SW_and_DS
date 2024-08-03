State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		Conditions =
		{
	    	FigureIsDead {Tag="Soldier1"}
		},
		Actions =
		{

		},
		GotoState = "MAIN",
	};
};

OnEvent
{
  Actions =
  {
    FigureRespawn {Tag="Soldier1",X=302,Y=330},
  },
}

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