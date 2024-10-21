

State
{
	StateName = "HedwigState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsFalse  	{Name = "af_P302_HedwigKilled"},
			
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_HedwigAlive"},
			AvatarFlagSetTrue  	{Name = "af_P300_HedwigOnWestguard"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_SummonDemonAttack"},	
				MapFlagIsTrue{Name = "mf_ThurAttack"},
			},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
			MapFlagIsTrue {Name = "mf_HedwigAlive"},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Hedwig"},
			FigureTeamTransfer	{Team = "tm_Untote"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			--MapFlagIsTrue{Name = "mf_ThurDialogOn"}, 
			MapFlagIsTrue {Name = "mf_HedwigAlive"},
			AvatarFlagIsTrue  	{Name = "af_P302_SpokenToHedwig"},
		},
		Actions =
		{
			DialogTypeSetSideQuest	{Tag = "Hedwig"},
			DialogSetEnabled	{Tag = "Hedwig"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_SummonDemonAlive"},	
			FigureHasNotHealth	{Percent = 100},
			MapFlagIsTrue {Name = "mf_HedwigAlive"},
		},
		Actions =
		{
			FigureKill	{Tag = "Hedwig"},
		},
		
	},
	
};
