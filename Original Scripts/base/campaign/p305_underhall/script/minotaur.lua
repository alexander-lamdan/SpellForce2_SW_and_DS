
State
{
	StateName = "MinotaurStart",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_MinotaurRunStart"},
		},
		Actions = 
		{
			SoundGlobalPlayOnce	{File = "03_creeps/creep_warbeast_hit1"},
			EntityFlagSetTrue {Name = "ef_MinotaurAlive"},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_MinotaurRunStart"},
			EntityFlagIsTrue {Name = "ef_MinotaurAlive"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureRun {X = 330, Y = 218}, 
    			Points = 
   				{
        			"390, 218",
        			"390, 180",
        			"350, 180",
        			"350, 218",
        			"411, 214",
   				},
			},
		},
	
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_MinotaurRunStart"},
			EntityFlagIsTrue {Name = "ef_MinotaurAlive"},
			FigureIsInRange	{Tag = "Minotaur", Range = 2, X = 411, Y = 214},
		},
		Actions =
		{
			FigureVanish	{Tag = "Minotaur"},
		},
	
	},
	
};
