State
{
	StateName = "init",
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 206, Amount = 1},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_GotEternalFireStone"},
		},
	},
};

