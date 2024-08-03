State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "Change",
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
	StateName = "Change",
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 46, Amount = 1},
		},
		Actions = 
		{
			DialogSetEnabled{},
			DialogTypeSetMainQuest{},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue   {Name = "mf_ChalkDrawingChanged"},
		},
		Actions = 
		{
			ObjectChange	{ObjectId = 616, X = 85, Y = 552, Tag = "ChalkDrawing"}, 
			AtmoZoneChange	{Tag = "AtmoUndead06", AtmoDay = "silence", AtmoNight = "silence"},
			QuestSetSolved      {Quest = "CloseCrypt"},
		},
	},
	
};