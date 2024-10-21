State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "ForgeMainState",
		Conditions = 
		{
		},
		Actions = 
		{
		},
	},


};

State
{
	StateName = "ForgeMainState",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = "pl_Human", Quest = "IgniteForge"},
		},
		Actions = 
		{
			DialogSetEnabled {},
			DialogTypeSetMainQuest {},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = "pl_Human", Quest = "ForgeRing"},
		},
		Actions = 
		{
			DialogSetEnabled {},
			DialogTypeSetMainQuest {},
		},
	},


	
};

