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
	};


	
	
};

State
{
	StateName = "State1",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			GateIsOpen	{Tag = "GateCity"},
		},
		Actions =
		{
			DialogSetEnabled {},
			DialogTypeSetMainQuest {},
		},		
	},
	
	
	
	-- Spieler betritt Esse
	OnOneTimeEvent
	{
		Conditions = 
		{
			
			--	Outcrty kommt sobald Spieler mit dem Hammer die		
			-- Tür zur Esse geöffnet hat
			
			GateIsOpen	{Tag = "GateForge"},
			
			
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_ForgeDoorDelay"},
			FigureTeleport		{Tag = "Ghost", X = 382, Y = 444},
		},
		
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_ForgeDoorDelay", Seconds = 1.5},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Ghost",TextTag = "Ghost6"}, --Die Vulkanesse! Hm, sie ist erloschen ...
			FigureOutcry	{Tag = "Ghost",TextTag = "Ghost7"}, --Kommt her, wir müssen reden!
			DialogSetEnabled {},
			DialogTypeSetMainQuest {},
		},
		
	},


	
-- Spieler findet Hammer
	
	OnOneTimeEvent
	{
		Conditions	=
		{
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 116, Amount = 1},			
			AvatarIsNotTalking {},
			GameInterfaceIsVisible	{},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Ghost",TextTag = "Ghost4"},
			FigureOutcry	{Tag = "Ghost",TextTag = "Ghost5"},
		},
	},
	
	-- Timer für Hilfe zur Yellow Flame Quest
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_TurnFlamesYellowActive"},			
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_PuzzleTimer"}
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_PuzzleTimer", Seconds = 30},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_HelpYellowFlame"},
			FigureOutcry	{Tag = "Ghost",TextTag = "Ghost7"}, 	
		},
	},
	
};