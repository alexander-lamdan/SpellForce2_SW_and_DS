
State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 327, Amount = 1}, -- Geisterrassel
		},
		Actions = 
		{
			FigureOutcryImmediate{TextTag = "RattleInfo01", Tag = "pl_HumanAvatar"},
			FigureOutcryImmediate{TextTag = "RattleInfo02", Tag = "pl_HumanHeroCaine"},
		},
		GotoState = self,
	};




	
}