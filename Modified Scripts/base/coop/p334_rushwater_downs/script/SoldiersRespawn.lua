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

		},
		GotoState = "MAIN",
	};
};

State
{
  OnEvent
  {
    Conditions = {},
    Actions =
    {
      FigureRespawn {Tag="Soldier1",X=302,Y=330},
      FigureRespawn {Tag="Soldier2",X=302,Y=330},
      FigureRespawn {Tag="Soldier3",X=302,Y=330},
      FigureRespawn {Tag="Soldier4",X=302,Y=330},
    }
  }
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