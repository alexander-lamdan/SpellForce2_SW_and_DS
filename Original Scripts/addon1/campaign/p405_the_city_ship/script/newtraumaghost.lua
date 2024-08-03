
State
{
	StateName = "INIT",
	
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapValueIsGreaterOrEqual{Name = "mv_CounterHateThoughts", Value = 4},
			MapValueIsGreaterOrEqual{Name = "mv_CounterMadnessThoughts", Value = 4},
			MapValueIsGreaterOrEqual{Name = "mv_CounterWrathThoughts", Value = 4},
			MapValueIsGreaterOrEqual{Name = "mv_CounterFearThoughts", Value = 4},
			MapValueIsGreaterOrEqual{Name = "mv_CounterGrossThoughts", Value = 4},
		},
		Actions = 
		{
			EntityFlagSetTrue{Name = "ef_Spawned"},
		},
	};


	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "MainState"
	},
}

State
{
	StateName = "MainState",
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
    	},
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_TraumGhostTeams"},
    	},
    	Actions =
    	{
    		DialogSetDisabled{},
    		FigureTeamTransfer	{Tag = "default", Team = "tm_Team1"},
    		FigurePlayerTransfer{Tag = "default", Player = "pl_Human"},
    	},
    },

}
