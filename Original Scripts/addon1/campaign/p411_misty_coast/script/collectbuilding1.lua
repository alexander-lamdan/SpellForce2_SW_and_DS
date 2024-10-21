


State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			--FigureIsInEntityRange	{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 20},
			
			FigureIsDead{Tag = "Watcher101"},
			FigureIsDead{Tag = "Watcher102"},
			FigureIsDead{Tag = "Watcher103"},
			FigureIsDead{Tag = "Watcher104"},
			FigureIsDead{Tag = "Watcher105"},
			FigureIsDead{Tag = "Watcher106"},
			FigureIsDead{Tag = "Watcher107"},
			FigureIsDead{Tag = "Watcher108"},
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_CollectKit1"},
			MapFlagSetTrue{Name = "mf_GiveKit1"},
			
			FigureOutcry{TextTag = "FreedBuilding01", Tag = "pl_HumanAvatar"},
			ObjectVanish	{Tag = "Marker01"},
		},
	},


   
};
