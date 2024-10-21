


State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			--FigureIsInEntityRange	{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 20},
			
			FigureIsDead{Tag = "Watcher201"},
			FigureIsDead{Tag = "Watcher202"},
			FigureIsDead{Tag = "Watcher203"},
			FigureIsDead{Tag = "Watcher204"},
			FigureIsDead{Tag = "Watcher205"},
			FigureIsDead{Tag = "Watcher206"},
			FigureIsDead{Tag = "Watcher207"},
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_CollectKit2"},
			MapFlagSetTrue{Name = "mf_GiveKit2"},
			
			FigureOutcry{TextTag = "FreedBuilding01", Tag = "pl_HumanAvatar"},
			ObjectVanish	{Tag = "Marker02"},
		},
	},


   
};
