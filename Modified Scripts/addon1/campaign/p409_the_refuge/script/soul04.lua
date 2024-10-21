
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
		GotoState = "MainState"
	},
}

State
{
	StateName = "MainState",
	
	
	-- zu Beginn abschalten
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			DialogSetDisabled{},
		},
	},
	
	OnOneTimeEvent
	{
		-- Dialog wird freigeschaltet
		-- sobald Quest aktiv ist
		Conditions =
		{
			QuestIsActive {Quest = "Refuge_ApologizeToDragons"},
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
    		EntityFlagIsTrue{Name = "ef_Disintegrate"},
    	},
    	Actions =
    	{
    		DialogSetDisabled{},
    		FigureVanish	{Tag = "default"},
    	},
    },

}
