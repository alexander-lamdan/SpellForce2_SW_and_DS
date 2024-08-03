
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
					AvatarValueIsGreaterOrEqual{Name = "av_P304_MilitiaGuildBonus", Value = 1 },
					-- GuildBonus>0
					
					QuestIsActive{Quest = "TalkToRedmund"},
					-- Gf Pt.3 : Redmund nach Schattenlied fragen
					
					AND
					{
						AvatarFlagIsTrue{Name = "af_P304_QuestForNessel"},
						EntityFlagIsFalse{Name = "ef_TalkedAboutNessel"},
					},
					-- Nesselquest aktiv und Satz noch nicht gesagt
					
					AND
					{
						AvatarFlagIsTrue {Name = "af_P304_HagardUnmasked"},
						AvatarFlagIsFalse{Name = "af_P304_GiveSoldierTroops"},
						AvatarValueIsEqual{Name = "av_P304_MilitiaGiftGiven", Value = 0 },
						AvatarFlagIsFalse{Name = "af_P304_GiveMiltiaTaskQuest"},
					},
					-- Hagard demaskiert, Truppen noch nicht übergeben
					-- noch kein Task erbracht & Satz "Tut Dienste" noch nicht gesagt
					
					AND
					{
						AvatarFlagIsTrue {Name = "af_P304_HagardUnmasked"},
						AvatarFlagIsFalse{Name = "af_P304_GiveSoldierTroops"},
						AvatarValueIsGreater{Name = "av_P304_MilitiaGiftGiven", Value = 0 },
					},
					-- Hagard demaskiert
					-- Task erbracht & Truppen noch nicht übergeben
					
					
					AvatarFlagIsFalse{Name = "af_P304_RedmundKnown"},
					-- Redmund unbekannt
					
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
					AvatarValueIsGreaterOrEqual{Name = "av_P304_MilitiaGuildBonus", Value = 1 },
					-- GuildBonus>0
					
					QuestIsActive{Quest = "TalkToRedmund"},
					-- Gf Pt.3 : Redmund nach Schattenlied fragen
					
					AND
					{
						AvatarFlagIsTrue{Name = "af_P304_QuestForNessel"},
						EntityFlagIsFalse{Name = "ef_TalkedAboutNessel"},
					},
					-- Nesselquest aktiv und Satz noch nicht gesagt
					
					AND
					{
						AvatarFlagIsTrue {Name = "af_P304_HagardUnmasked"},
						AvatarFlagIsFalse{Name = "af_P304_GiveSoldierTroops"},
						AvatarValueIsEqual{Name = "av_P304_MilitiaGiftGiven", Value = 0 },
						AvatarFlagIsFalse{Name = "af_P304_GiveMiltiaTaskQuest"},
					},
					-- Hagard demaskiert, Truppen noch nicht übergeben
					-- noch kein Task erbracht & Satz "Tut Dienste" noch nicht gesagt
					
					AND
					{
						AvatarFlagIsTrue {Name = "af_P304_HagardUnmasked"},
						AvatarFlagIsFalse{Name = "af_P304_GiveSoldierTroops"},
						AvatarValueIsGreater{Name = "av_P304_MilitiaGiftGiven", Value = 0 },
					},
					-- Hagard demaskiert
					-- Task erbracht & Truppen noch nicht übergeben
					
					
					AvatarFlagIsFalse{Name = "af_P304_RedmundKnown"},
					-- Redmund unbekannt
					
					EntityFlagIsFalse{Name = "ef_BaseInfoGiven"},
					-- Basis-Info noch nicht gegeben
				},
			},
		},
		OffActions = 
		{
			DialogSetDisabled{},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions = 
		{
			-- zu Beginn der Karte Dialog abschalten
			EntityFlagSetTrue {Name = "ef_DialogOff"},
		}, 
	},
	
    OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue{Name = "mf_EnableDialogAlyreRedmundFlannAfterHagardDialog"},
				MapFlagIsTrue{Name = "mf_MarcIsCheating"},
			},
		},
		Actions = 
		{
			-- sobald Spieler den Auftrag bekommt, die Gildenmeister zu fragen
			-- wird der Charakter freigeschaltet
			-- (schaltet auch Flann Gondersen frei)
			EntityFlagSetFalse {Name = "ef_DialogOff"},
		}, 
	},
	

	
	
};                                                                                        