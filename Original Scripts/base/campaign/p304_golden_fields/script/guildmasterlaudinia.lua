
State
{
	StateName = "MainState",
	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			AND
			{
				EntityFlagIsFalse {Name = "ef_DialogOff"},
				-- grundsätzliche Dialogfreischaltung
				
				OR
				{
					AvatarValueIsGreaterOrEqual{Name = "av_P304_TraderGuildBonus", Value = 1 },
					-- GuildBonus>0
					
					AND
					{
						AvatarFlagIsTrue{Name = "af_P304_QuestForNessel"},
						EntityFlagIsFalse{Name = "ef_TalkedAboutNessel"},
					},
					-- Nesselquest aktiv und Satz noch nicht gesagt
					
					AvatarFlagIsFalse{Name = "af_P304_LaudiniaKnown"},
					-- Laudinia unbekannt
					
					EntityFlagIsFalse{Name = "ef_BaseInfoGiven"},
					-- Basis-Info noch nicht gegeben
				},
			},
		},
		OnActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
			NotAND
			{
				EntityFlagIsFalse {Name = "ef_DialogOff"},
				-- grundsätzliche Dialogfreischaltung
				
				OR
				{
					AvatarValueIsGreaterOrEqual{Name = "av_P304_TraderGuildBonus", Value = 1 },
					-- GuildBonus>0
					
					AND
					{
						AvatarFlagIsTrue{Name = "af_P304_QuestForNessel"},
						EntityFlagIsFalse{Name = "ef_TalkedAboutNessel"},
					},
					-- Nesselquest aktiv und Satz noch nicht gesagt
					
					AvatarFlagIsFalse{Name = "af_P304_LaudiniaKnown"},
					-- Laudinia unbekannt
					
					EntityFlagIsFalse{Name = "ef_BaseInfoGiven"},
					-- Basis-Info noch nicht gegeben
				},
			},
		},
		OffActions = 
		{
			DialogSetDisabled{},
		},
	},

	
	OnOneTimeEvent
	{
		Conditions = {},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, -- zu Beginn der Karte Dialog abschalten
	},
    
    
    OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				QuestIsActive	{Quest = "GFPart4GetMedicine"},
				MapFlagIsTrue{Name = "mf_MarcIsCheating"},
			},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, -- sobald Spieler den Auftrag bekommt, die Medizin zu besorgen
		-- wird der Charakter freigeschaltet
		-- (gilt für alle fünf Gildenmeister, auch für die die nichts zur Medizin
		-- beitragen)
	},
	
                                                                      
};                                                                                  