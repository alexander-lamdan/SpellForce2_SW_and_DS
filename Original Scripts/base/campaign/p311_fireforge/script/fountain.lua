State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		GotoState = "Fountain",
		Conditions = 
		{
		},
		Actions = 
		{	
		},
	};


};

State
{
	StateName = "Fountain",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 115, Amount = 1},		
		},
		Actions = 
		{
			DialogSetEnabled 		{},
			DialogTypeSetMainQuest	{},
		},
	};
};

