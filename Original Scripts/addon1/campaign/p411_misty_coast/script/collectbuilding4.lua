


State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			--FigureIsInEntityRange	{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 20},
			
			FigureIsDead{Tag = "Watcher401"},
			FigureIsDead{Tag = "Watcher402"},
			FigureIsDead{Tag = "Watcher403"},
			FigureIsDead{Tag = "Watcher404"},
			FigureIsDead{Tag = "Watcher405"},
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_CollectKit4"},
			MapFlagSetTrue{Name = "mf_GiveKit4"},
			
			FigureOutcry{TextTag = "FreedBuilding01", Tag = "pl_HumanAvatar"},
			ObjectVanish	{Tag = "Marker04"},
		},
	},


   
};
