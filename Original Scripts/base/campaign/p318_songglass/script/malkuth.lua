
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
			DialogTypeSetSideQuest	{Tag = "Malkuth"},
			DialogSetEnabled	{Tag = "Malkuth" },
		},
		GotoState = "MalkuthState",
	},
}

State
{
	StateName = "MalkuthState",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_GiveCrystalQuest"},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
			--MapFlagIsTrue {Name = "mf_InfoGiven"},
			AvatarHasNotItemMisc	{Player = "pl_Human", ItemId = 123, Amount = 6},			
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Malkuth" },
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 123, Amount = 6},		
		},
		Actions = 
		{
			DialogTypeSetSideQuest	{Tag = "Malkuth"},
			DialogSetEnabled	{Tag = "Malkuth" },
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_KilledLokarQuestActive"},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
			AvatarHasNotItemMisc	{Player = "pl_Human", ItemId = 127, Amount = 1},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Malkuth" },
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive  {Quest = "SongglassHeartBackToMalkuth"},
		},
		Actions = 
		{
			DialogTypeSetSideQuest	{Tag = "Malkuth"},
			DialogSetEnabled	{Tag = "Malkuth" },
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved  {Quest = "SongglassHeartBackToMalkuth"},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Malkuth" },
			MapFlagSetTrue {Name = "mf_ToggleDialogOn"},
		},
	},
	
	
	
		OnToggleEvent	
	{
		EventName = "MalkuthEvent",
		OnConditions =
		{
			MapFlagIsTrue {Name = "mf_ToggleDialogOn"},
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 123, Amount = 6},
		},
		OnActions = 
		{
			DialogTypeSetSideQuest	{Tag = "Malkuth"},
			DialogSetEnabled	{Tag = "Malkuth" },
		},
		OffConditions =
		{
			MapFlagIsTrue {Name = "mf_ToggleDialogOn"},
			AvatarHasNotItemMisc	{Player = "pl_Human", ItemId = 123, Amount = 6},	
		},
		OffActions = 
		{
			DialogSetDisabled	{Tag = "Malkuth" },
		},
	},
	
	
};
