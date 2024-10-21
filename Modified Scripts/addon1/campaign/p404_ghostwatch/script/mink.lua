

State
{
	StateName = "MainState",
	
    
    OnFollowEvent
	{
		Tag = "Mink",
		TargetTag = "Agathos",
		OnConditions = 
		{
			AvatarFlagIsTrue{Name = "af_P404_AgathosIsFollowing"},
		},
		Actions = 
		{
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P405_AgathosIsNowInCityShip"},
		},
		Actions =
		{
			FigureVanish{Tag = "default"},
		},
	},
	
	OnOneTimeDeadEvent
	{
		Conditions = 
		{
			AvatarFlagIsFalse{Name = "af_P405_AgathosIsNowInCityShip"},
		},
		Actions = 
		{
			AvatarFlagSetTrue{Name = "af_P404_MinkDied"},
		},
	};

}
