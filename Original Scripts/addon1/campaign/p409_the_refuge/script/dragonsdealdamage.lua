
	State
	{
		StateName = "State01",
	
		OnOneTimeEvent
		{
			Conditions =
			{
				MapFlagIsTrue{Name = "mf_DoDamageOnPlayer"},
			},
			Actions =
			{
				MapFlagSetFalse{Name = "mf_DoDamageOnPlayer"},
				FigureHealthSubtract{Tag = "pl_HumanAvatar", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroWind", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroWhisper", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroCaine", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroYasha", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroMordecay", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanNightsong", Percent = 50},
				
				FigureKill	{Tag = "pl_HumanNightsong"},
			},
			GotoState = "State02",
		},
	}		
	
	
	State
	{
		StateName = "State02",
	
		OnOneTimeEvent
		{
			Conditions =
			{
				MapFlagIsTrue{Name = "mf_DoDamageOnPlayer"},
			},
			Actions =
			{
				MapFlagSetFalse{Name = "mf_DoDamageOnPlayer"},
				FigureHealthSubtract{Tag = "pl_HumanAvatar", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroWind", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroWhisper", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroCaine", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroYasha", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroMordecay", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanNightsong", Percent = 50},
				
				FigureKill	{Tag = "pl_HumanHeroMordecay"},
				FigureKill	{Tag = "pl_HumanNightsong"},
			},
			GotoState = "State03",
		},
	}		
	
	State
	{
		StateName = "State03",
	
		OnOneTimeEvent
		{
			Conditions =
			{
				MapFlagIsTrue{Name = "mf_DoDamageOnPlayer"},
			},
			Actions =
			{
				MapFlagSetFalse{Name = "mf_DoDamageOnPlayer"},
				FigureHealthSubtract{Tag = "pl_HumanAvatar", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroWind", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroWhisper", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroCaine", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroYasha", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroMordecay", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanNightsong", Percent = 50},
				
				FigureKill	{Tag = "pl_HumanHeroYasha"},
				FigureKill	{Tag = "pl_HumanHeroMordecay"},
				FigureKill	{Tag = "pl_HumanNightsong"},
			},
			GotoState = "State04",
		},
	}		
	
	State
	{
		StateName = "State04",
	
		OnOneTimeEvent
		{
			Conditions =
			{
				MapFlagIsTrue{Name = "mf_DoDamageOnPlayer"},
			},
			Actions =
			{
				MapFlagSetFalse{Name = "mf_DoDamageOnPlayer"},
				FigureHealthSubtract{Tag = "pl_HumanAvatar", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroWind", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroWhisper", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroCaine", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroYasha", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroMordecay", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanNightsong", Percent = 50},
				
				FigureKill	{Tag = "pl_HumanHeroCaine"},
				FigureKill	{Tag = "pl_HumanHeroYasha"},
				FigureKill	{Tag = "pl_HumanHeroMordecay"},
				FigureKill	{Tag = "pl_HumanNightsong"},
			},
			GotoState = "State05",
		},
	}		
	
	State
	{
		StateName = "State05",
	
		OnOneTimeEvent
		{
			Conditions =
			{
				MapFlagIsTrue{Name = "mf_DoDamageOnPlayer"},
			},
			Actions =
			{
				MapFlagSetFalse{Name = "mf_DoDamageOnPlayer"},
				FigureHealthSubtract{Tag = "pl_HumanAvatar", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroWind", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroWhisper", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroCaine", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroYasha", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroMordecay", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanNightsong", Percent = 50},
				
				FigureKill	{Tag = "pl_HumanHeroWhisper"},
				FigureKill	{Tag = "pl_HumanHeroCaine"},
				FigureKill	{Tag = "pl_HumanHeroYasha"},
				FigureKill	{Tag = "pl_HumanHeroMordecay"},
				FigureKill	{Tag = "pl_HumanNightsong"},
			},
			GotoState = "State06",
		},
	}
	
	State
	{
		StateName = "State06",
	
		OnOneTimeEvent
		{
			Conditions =
			{
				MapFlagIsTrue{Name = "mf_DoDamageOnPlayer"},
			},
			Actions =
			{
				MapFlagSetFalse{Name = "mf_DoDamageOnPlayer"},
				FigureHealthSubtract{Tag = "pl_HumanAvatar", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroWind", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroWhisper", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroCaine", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroYasha", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroMordecay", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanNightsong", Percent = 50},
				
				FigureKill	{Tag = "pl_HumanHeroWind"},
				FigureKill	{Tag = "pl_HumanHeroWhisper"},
				FigureKill	{Tag = "pl_HumanHeroCaine"},
				FigureKill	{Tag = "pl_HumanHeroYasha"},
				FigureKill	{Tag = "pl_HumanHeroMordecay"},
				FigureKill	{Tag = "pl_HumanNightsong"},
			},
			GotoState = "State07",
		},
	}
	
	State
	{
		StateName = "State07",
	
		OnOneTimeEvent
		{
			Conditions =
			{
				MapFlagIsTrue{Name = "mf_DoDamageOnPlayer"},
			},
			Actions =
			{
				MapFlagSetFalse{Name = "mf_DoDamageOnPlayer"},
				FigureHealthSubtract{Tag = "pl_HumanAvatar", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroWind", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroWhisper", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroCaine", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroYasha", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanHeroMordecay", Percent = 50},
				FigureHealthSubtract{Tag = "pl_HumanNightsong", Percent = 50},
				
				FigureKill	{Tag = "pl_HumanAvatar"},
				FigureKill	{Tag = "pl_HumanHeroWind"},
				FigureKill	{Tag = "pl_HumanHeroWhisper"},
				FigureKill	{Tag = "pl_HumanHeroCaine"},
				FigureKill	{Tag = "pl_HumanHeroYasha"},
				FigureKill	{Tag = "pl_HumanHeroMordecay"},
				FigureKill	{Tag = "pl_HumanNightsong"},
			},
		},
	}