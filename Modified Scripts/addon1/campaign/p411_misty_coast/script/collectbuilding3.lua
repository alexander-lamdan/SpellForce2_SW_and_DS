


State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			--FigureIsInEntityRange	{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 20},
			
			FigureIsDead{Tag = "Watcher301"},
			FigureIsDead{Tag = "Watcher302"},
			FigureIsDead{Tag = "Watcher303"},
			FigureIsDead{Tag = "Watcher304"},
			FigureIsDead{Tag = "Watcher305"},
			FigureIsDead{Tag = "Watcher306"},
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_CollectKit3"},
			MapFlagSetTrue{Name = "mf_GiveKit3"},
			
			FigureOutcry{TextTag = "FreedBuilding01", Tag = "pl_HumanAvatar"},
			ObjectVanish	{Tag = "Marker03"},
		},
	},


   
};
