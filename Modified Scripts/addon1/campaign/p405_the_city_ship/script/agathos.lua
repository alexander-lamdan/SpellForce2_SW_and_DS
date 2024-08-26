State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P404_AgathosIsFollowing"},
			AvatarFlagIsFalse{Name = "af_P404_AgathosDied"},
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_AgathosSpawned"},
			AvatarFlagSetTrue{Name = "af_P405_AgathosIsNowInCityShip"},
		},
	};

	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_AgathosSpawned"},
		},
		Actions =
		{
		},
		GotoState = "DisableDialog"
	},

}

State
{
	StateName = "DisableDialog",
	
	
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
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRangeToEntity	{Tag = "default", TargetTag = "SQThoughts_Crystalizer", Range = 10},
		},
		Actions =
		{
			AvatarFlagSetTrue{Name = "af_P405_AgathosReachedCrystalPoint"},
			EntityFlagSetTrue{Name = "ef_StoppedFollowing"},
		},
	},
    
    OnFollowEvent
	{
		Tag = "Agathos",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			AvatarFlagIsFalse{Name = "af_P405_AgathosReachedCrystalPoint"},
		},
		Actions = 
		{
		},
	};
	
	OnIdleGoHomeFake
	{
		X = 475.788, Y = 291.965, 
		Range = 8,
		UpdateInterval = 5,
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_StoppedFollowing"},
		},
		Actions = 
		{
		},
	};

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_StoppedFollowing"},
		},
		Actions =
		{
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_BeSilentNow"},
		},
		Actions =
		{
    		DialogSetDisabled{},
		},
	},
	


}
