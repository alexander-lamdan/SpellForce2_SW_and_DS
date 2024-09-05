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
			FogOfWarReveal {X = 399,Y = 380,Range = 50,Height = 20},
			FogOfWarReveal {X = 341,Y = 625,Range = 70,Height = 50},
			FogOfWarReveal {X = 316,Y = 75,Range = 70,Height = 50},
			FogOfWarReveal {X = 410,Y = 64,Range = 70,Height = 50},
			FogOfWarReveal {X = 142,Y = 98,Range = 70,Height = 50},
			FigureWalk {Tag = "ClanArmy1", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy2", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy3", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy4", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy5", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy6", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy7", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy8", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy9", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy10", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy11", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy12", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy13", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy14", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy15", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy16", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy17", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy18", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy19", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy20", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy21", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy22", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy23", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy24", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy25", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy26", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy27", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy28", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy29", X = 317, Y = 71},
      FigureWalk {Tag = "ClanArmy30", X = 317, Y = 71},
			FigureWalk {Tag = "RealmArmy1", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy2", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy3", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy4", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy5", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy6", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy7", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy8", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy9", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy10", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy11", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy12", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy13", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy14", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy15", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy16", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy17", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy18", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy19", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy20", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy21", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy22", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy23", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy24", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy25", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy26", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy27", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy28", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy29", X = 317, Y = 71},
      FigureWalk {Tag = "RealmArmy30", X = 317, Y = 71},

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