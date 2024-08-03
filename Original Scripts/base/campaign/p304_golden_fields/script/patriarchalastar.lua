
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
					AvatarValueIsGreaterOrEqual{Name = "av_P304_PriestGuildBonus", Value = 1 },
					-- GuildBonus>0
					
					AND
					{
						AvatarFlagIsTrue{Name = "af_P304_QuestForNessel"},
						EntityFlagIsFalse{Name = "ef_TalkedAboutNessel"},
					},
					-- Nesselquest aktiv und Satz noch nicht gesagt
					
					AND
					{
						QuestIsActive{Quest = "GetHerbsFromPatriarch"},
						AvatarValueIsEqual{Name = "av_P304_PriestGiftGiven", Value = 0 },
						AvatarFlagIsFalse{Name = "af_P304_GivePriestTaskQuest"},
					},
					-- Laugenquest
					-- noch kein Task erbracht & Satz "Tut Dienste" noch nicht gesagt
					
					AND
					{
						QuestIsActive{Quest = "GetHerbsFromPatriarch"},
						AvatarValueIsGreater{Name = "av_P304_PriestGiftGiven", Value = 0 },
					},
					-- Laugenquest
					-- Task erbracht & Lauge noch nicht übergeben
					
					
					AvatarFlagIsFalse{Name = "af_P304_AlastarKnown"},
					-- Alastar unbekannt
					
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
					AvatarValueIsGreaterOrEqual{Name = "av_P304_PriestGuildBonus", Value = 1 },
					-- GuildBonus>0
					
					AND
					{
						AvatarFlagIsTrue{Name = "af_P304_QuestForNessel"},
						EntityFlagIsFalse{Name = "ef_TalkedAboutNessel"},
					},
					-- Nesselquest aktiv und Satz noch nicht gesagt
					
					AND
					{
						QuestIsActive{Quest = "GetHerbsFromPatriarch"},
						AvatarValueIsEqual{Name = "av_P304_PriestGiftGiven", Value = 0 },
						AvatarFlagIsFalse{Name = "af_P304_GivePriestTaskQuest"},
					},
					-- Laugenquest
					-- noch kein Task erbracht & Satz "Tut Dienste" noch nicht gesagt
					
					AND
					{
						QuestIsActive{Quest = "GetHerbsFromPatriarch"},
						AvatarValueIsGreater{Name = "av_P304_PriestGiftGiven", Value = 0 },
					},
					-- Laugenquest
					-- Task erbracht & Lauge noch nicht übergeben
					
					
					AvatarFlagIsFalse{Name = "af_P304_AlastarKnown"},
					-- Alastar unbekannt
					
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
				QuestIsActive{Quest = "GFPart4GetMedicine"},
				MapFlagIsTrue{Name = "mf_MarcIsCheating"},
			},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, -- sobald Spieler den Auftrag bekommt, die Medizin zu besorgen
		-- wird der Charakter freigeschaltet
		
	},
	
	
	                                                           
};                                                                            