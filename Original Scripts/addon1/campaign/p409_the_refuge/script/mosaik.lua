State
{
	StateName = "MainState",
	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			EntityFlagIsFalse {Name ="ef_DialogOff"},
		},
		OnActions = 
		{
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
			EntityFlagIsTrue {Name ="ef_DialogOff"},
		},
		OffActions = 
		{
			DialogSetDisabled{},
		},
	},

	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P409_MosaicOfDeath", Value = 1},
		},
		Actions =
		{
			ObjectChange{Tag = "default", ObjectId = 1174, X = default, Y = default, Direction = default},
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P409_MosaicOfDeath", Value = 2},
		},
		Actions =
		{
			ObjectChange{Tag = "default", ObjectId = 1175, X = default, Y = default, Direction = default},
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P409_MosaicOfDeath", Value = 3},
		},
		Actions =
		{
			ObjectChange{Tag = "default", ObjectId = 1176, X = default, Y = default, Direction = default},
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
		},
	},
 
 	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P409_MosaicOfDeath", Value = 4},
		},
		Actions =
		{
			ObjectChange{Tag = "default", ObjectId = 1177, X = default, Y = default, Direction = default},
			DialogSetDisabled{},
		},
	},
 
                                                                      
};                                                                         