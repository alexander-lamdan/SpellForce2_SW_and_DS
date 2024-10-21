-------------------------------------------------------------------------------
--
--		Outcry, wenn Spieler zum Portal nach Songglass kommt
--
-------------------------------------------------------------------------------

PortalX = 315.513
PortalY = 305.189
-- Die Koordinaten des Portals nach Songglass

State
{
	StateName = "Main",
	
	OnOneTimeEvent
	{
		Conditions =
		{  
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 12, X = PortalX , Y = PortalY},
			AvatarFlagIsTrue{Name = "af_P317_EndHQKilled"},
		},
		Actions = 
		{
			FigureOutcry{TextTag = "PortalToSongglass01", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "PortalToSongglass02", Tag = "pl_HumanNightsong"},
			FigureOutcry{TextTag = "PortalToSongglass03", Tag = "pl_HumanNightsong"},
			FigureOutcry{TextTag = "PortalToSongglass04", Tag = "pl_HumanNightsong"},
			FigureOutcry{TextTag = "PortalToSongglass05", Tag = "pl_HumanNightsong"},
			FigureOutcry{TextTag = "PortalToSongglass06", Tag = "pl_HumanAvatar"},
			FigureOutcry{TextTag = "PortalToSongglass07", Tag = "pl_HumanNightsong"},
			FigureOutcry{TextTag = "PortalToSongglass08", Tag = "pl_HumanNightsong"},
			FigureOutcry{TextTag = "PortalToSongglass09", Tag = "pl_HumanNightsong"},
			
			QuestSetActive{Player = "pl_Human", Quest = "Songglass"},
			QuestSetActive{Player = "pl_Human", Quest = "SongglassFindMalkuth"},
			QuestSetActive{Player = "pl_Human", Quest = "SongglassSearchScouts"},
		},
		
	},
	
	
	
	
};

	
