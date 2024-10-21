
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
		GotoState = "TurnOff"
	},
}

State
{
	StateName = "TurnOff",
	
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
		GotoState = "MainState"
	},
}


State
{
	StateName = "MainState",
	
	
    
    OnToggleEvent
	{
		OnConditions = 
		{
			AND
			{
				MapFlagIsTrue{Name = "mf_DiscoveredNavigationObject"},
				OR
				{
					MapFlagIsFalse{Name = "mf_SpawnBlessed"},
					AND
					{
						MapFlagIsTrue{Name = "mf_UrgiFree"},
						MapFlagIsTrue{Name = "mf_BlessedKilled"},
					},
				},
			},
		},
		OnActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
			NotAND
			{
				MapFlagIsTrue{Name = "mf_DiscoveredNavigationObject"},
				OR
				{
					MapFlagIsFalse{Name = "mf_SpawnBlessed"},
					AND
					{
						MapFlagIsTrue{Name = "mf_UrgiFree"},
						MapFlagIsTrue{Name = "mf_BlessedKilled"},
					},
				},
			},
		},
		OffActions = 
		{
			DialogSetDisabled{},
		},
	};



}
