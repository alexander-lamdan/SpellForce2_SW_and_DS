State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "State1",
		Conditions = 
		{
		},
		Actions = 
		{
		},
	}


	
	
};

State
{
	StateName = "State1",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			DialogSetEnabled{},
			DialogTypeSetMainQuest{},
		},
	},
	
		
	--  Jetzt geht der Kampf mit den Bestien los
	--  Sobald der Spieler ein Lager zerstört hat,
	--  macht sich Vlad auf den Weg zum Stadttor
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarHasItemMisc	{Player = "pl_Human", ItemId = 119, Amount = 1},
				AvatarHasItemMisc	{Player = "pl_Human", ItemId = 120, Amount = 1},
			},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Vlad", TextTag = "Vlad1"},
			FigureOutcry	{Tag = "Vlad", TextTag = "Vlad2"},
			FigureOutcry	{Tag = "Vlad", TextTag = "Vlad3"},
			
			-- FigureForcedRun {Tag = "Vlad", X = 256, Y = 272},
			FigureTeleportToEntity	{Tag = "default", TargetTag = "VladTeleportPoint1"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 119, Amount = 1},
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 120, Amount = 1},
		},
		Actions = 
		{
			
			QuestSetSolved  {Quest ="FindKeyFragmentsFireforge"},			
			QuestSetActive  {Quest ="GetKeyFragmentFromVlad"},
			
			FigureOutcry	{Tag = "Vlad", TextTag = "Vlad4"},
			FigureOutcry	{Tag = "Vlad", TextTag = "Vlad5"},
			FigureOutcry	{Tag = "Vlad", TextTag = "Vlad6"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			GateIsOpen	{Tag = "GateCity"}
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_GateOpenTimer"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_GateOpenTimer", Seconds = 2},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Vlad", TextTag = "Vlad7"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest ="FindKeyFragmentsFireforge"},			
			FigureIsDead	{Tag = "BeastCampAtGateBeast01"},
			FigureIsDead	{Tag = "BeastCampAtGateBeast02"},
			FigureIsDead	{Tag = "BeastCampAtGateBeast03"},
			BuildingIsDead	{Tag = "BeastCampAtGateTower"},
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "default", TargetTag = "VladTeleportPoint2"},
			FigureForcedWalk	{Tag = "Vlad", X = 373, Y = 257},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "Vlad", X = 373, Y = 257, Range = 5},
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
			GateIsOpen  {Tag = "GateCity"},
		},
		Actions = 
		{
			FigureRun {Tag = "default", X = 242, Y = 146},
		},
	},

};

