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
		GotoState = "EnableDialog"
	},
}


State
{
	StateName = "EnableDialog",
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
		},
		GotoState = "MainState"
	},
}

State
{
	StateName = "MainState",
	
	
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--			AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosStateOfMind", Value = 1},
--			AvatarIsNotTalking	{},
--		},
--		Actions =
--		{
--			FigureUnitChange	{Tag = "default", UnitId = 1040, Level = 35},
--			DialogTypeSetSideQuest{},
--    		DialogSetEnabled{},
--    	},
--    },
--    
--    OnOneTimeEvent
--	{
--		Conditions =
--		{
--			AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosStateOfMind", Value = 2},
--			AvatarIsNotTalking	{},
--		},
--		Actions =
--		{
--			FigureUnitChange	{Tag = "default", UnitId = 1041, Level = 35},
--			DialogTypeSetSideQuest{},
--    		DialogSetEnabled{},
--    	},
--    },
--    
--    OnOneTimeEvent
--	{
--		Conditions =
--		{
--			AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosStateOfMind", Value = 3},
--			AvatarIsNotTalking	{},
--		},
--		Actions =
--		{
--			FigureUnitChange	{Tag = "default", UnitId = 1042, Level = 35},
--			DialogTypeSetSideQuest{},
--    		DialogSetEnabled{},
--    	},
--    },
--    
--    OnOneTimeEvent
--	{
--		Conditions =
--		{
--			AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosStateOfMind", Value = 4},
--			AvatarIsNotTalking	{},
--		},
--		Actions =
--		{
--			FigureUnitChange	{Tag = "default", UnitId = 1043, Level = 35},
--			DialogTypeSetSideQuest{},
--    		DialogSetEnabled{},
--    	},
--    },
--    
--    OnOneTimeEvent
--	{
--		Conditions =
--		{
--			AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosStateOfMind", Value = 5},
--			AvatarIsNotTalking	{},
--		},
--		Actions =
--		{
--			FigureUnitChange	{Tag = "default", UnitId = 1044, Level =35},
--			DialogTypeSetSideQuest{},
--    		DialogSetEnabled{},
--    	},
--    },
--    
--    OnOneTimeEvent
--	{
--		Conditions =
--		{
--			AvatarValueIsEqual{Player = "default", Name = "av_P404_AgathosStateOfMind", Value = 6},
--			AvatarIsNotTalking	{},
--		},
--		Actions =
--		{
--			FigureUnitChange	{Tag = "default", UnitId = 1045, Level = 35},
--			DialogTypeSetSideQuest{},
--    		DialogSetEnabled{},
--    	},
--    },
    
    OnToggleEvent
	{
		OnConditions = 
		{
			OR
			{
				AvatarFlagIsTrue{Name = "af_P404_AgathosIsFollowing"},
				AND
				{
					AvatarHasNotItemMisc{Player = "default", ItemId = 270, Amount = 1},
					AvatarHasNotItemMisc{Player = "default", ItemId = 271, Amount = 1},
					AvatarHasNotItemMisc{Player = "default", ItemId = 272, Amount = 1},
					AvatarHasNotItemMisc{Player = "default", ItemId = 273, Amount = 1},
					AvatarHasNotItemMisc{Player = "default", ItemId = 274, Amount = 1},
					AvatarHasNotItemMisc{Player = "default", ItemId = 275, Amount = 1},
					MapFlagIsTrue{Name = "mf_AgathosKnown"},
					AvatarValueIsLess{Player = "default", Name = "av_P404_AgathosStateOfMind", Value = 6},
				},
			},
		},
		OnActions = 
		{
    		DialogSetDisabled{},
		},
		OffConditions = 
		{
			NotOR
			{
				AvatarFlagIsTrue{Name = "af_P404_AgathosIsFollowing"},
				AND
				{
					AvatarHasNotItemMisc{Player = "default", ItemId = 270, Amount = 1},
					AvatarHasNotItemMisc{Player = "default", ItemId = 271, Amount = 1},
					AvatarHasNotItemMisc{Player = "default", ItemId = 272, Amount = 1},
					AvatarHasNotItemMisc{Player = "default", ItemId = 273, Amount = 1},
					AvatarHasNotItemMisc{Player = "default", ItemId = 274, Amount = 1},
					AvatarHasNotItemMisc{Player = "default", ItemId = 275, Amount = 1},
					MapFlagIsTrue{Name = "mf_AgathosKnown"},
					AvatarValueIsLess{Player = "default", Name = "av_P404_AgathosStateOfMind", Value = 6},
				},
			},
		},
		OffActions = 
		{
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
		},
	};

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P404_AgathosIsFollowing"},
		},
		Actions =
		{
			FigureUnitChange	{Tag = "default", UnitId = 1045, Level = 15},
		},
	},
    
    
    OnFollowEvent
	{
		Tag = "Agathos",
		TargetTag = "pl_HumanAvatar",
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
			AvatarFlagSetTrue{Name = "af_P404_AgathosDied"},
		},
	};



}
