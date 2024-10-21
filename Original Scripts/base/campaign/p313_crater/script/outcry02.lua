-------------------------------------------------------------------------------
--
--		Outcry, wenn Spieler in den inneren Krater vordringt
--
-------------------------------------------------------------------------------

EntryX = 169
EntryY = 163
-- Die Koordinaten der Mitte des Eingangs zum inneren Krater


FirstInfo = 120
SecondInfo = 180
ThirdInfo = 240
-- Sekundenzeiten, nach denen jeweils die Info-Outcryblöcke von Malacay gestartet werden


State
{
	StateName = "Main",
	
	OnOneTimeEvent
	{
		Conditions =
		{  
			MapTimerIsElapsed {Name = "mt_InfoOutcryTimer", Seconds = FirstInfo},
			MapFlagIsFalse{Name ="mf_AnyTowerDamaged"},
		},
		Actions = 
		{
		},
		GotoState = "Infos01",
	},
}


State
{
	StateName = "Infos01",
	
	OnOneTimeEvent
	{
		Conditions =
		{  
			MapTimerIsElapsed {Name = "mt_InfoOutcryTimer", Seconds = FirstInfo},
		},
		Actions = 
		{
			FigureOutcry{TextTag = "NoDamage01", Tag = "Malacay"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{  
			MapTimerIsElapsed {Name = "mt_InfoOutcryTimer", Seconds = FirstInfo+5},
		},
		Actions = 
		{
			FigureOutcry{TextTag = "NoDamage02", Tag = "Malacay"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{  
			MapTimerIsElapsed {Name = "mt_InfoOutcryTimer", Seconds = FirstInfo+10},
		},
		Actions = 
		{
			FigureOutcry{TextTag = "NoDamage03", Tag = "Malacay"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{  
			MapTimerIsElapsed {Name = "mt_InfoOutcryTimer", Seconds = SecondInfo},
			MapFlagIsFalse{Name ="mf_AnyTowerDamaged"},
		},
		Actions = 
		{
		},
		GotoState = "Infos02",
	},
}
	
	


State
{
	StateName = "Infos02",
	
	OnOneTimeEvent
	{
		Conditions =
		{  
			MapTimerIsElapsed {Name = "mt_InfoOutcryTimer", Seconds = SecondInfo},
		},
		Actions = 
		{
			FigureOutcry{TextTag = "NoDamage11", Tag = "Malacay"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{  
			MapTimerIsElapsed {Name = "mt_InfoOutcryTimer", Seconds = ThirdInfo},
			MapFlagIsFalse{Name ="mf_AnyTowerDamaged"},
		},
		Actions = 
		{
		},
		GotoState = "Infos03",
	},
}



State
{
	StateName = "Infos03",
	
	OnOneTimeEvent
	{
		Conditions =
		{  
			MapTimerIsElapsed {Name = "mt_InfoOutcryTimer", Seconds = ThirdInfo},
		},
		Actions = 
		{
			FigureOutcry{TextTag = "NoDamage21", Tag = "Malacay"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{  
			MapTimerIsElapsed {Name = "mt_InfoOutcryTimer", Seconds = ThirdInfo+5},
		},
		Actions = 
		{
			FigureOutcry{TextTag = "NoDamage22", Tag = "Malacay"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{  
			MapTimerIsElapsed {Name = "mt_InfoOutcryTimer", Seconds = ThirdInfo+10},
		},
		Actions = 
		{
			FigureOutcry{TextTag = "NoDamage23", Tag = "Malacay"},
		},
	},
	
}