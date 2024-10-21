


State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			--FigureIsInEntityRange	{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 20},
			
			FigureIsDead{Tag = "Watcher501"},
			FigureIsDead{Tag = "Watcher502"},
			FigureIsDead{Tag = "Watcher503"},
			FigureIsDead{Tag = "Watcher504"},
			FigureIsDead{Tag = "Watcher505"},
			FigureIsDead{Tag = "Watcher506"},
			FigureIsDead{Tag = "Watcher507"},
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_CollectKit5"},
			MapFlagSetTrue{Name = "mf_GiveKit5"},
			
			FigureOutcry{TextTag = "FreedBuilding01", Tag = "pl_HumanAvatar"},
			ObjectVanish{Tag = "Marker05"},
		},
	},


   
};
