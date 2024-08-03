State
{
	StateName = "Reward",
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Ulkmar"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_UlkmarKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Siren"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_SirenKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Thunderhoof"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_ThunderHoofKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Wartskin"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_WartSkinKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "FireGolemBoss"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_GolemKilled"},
		},
	},
};

