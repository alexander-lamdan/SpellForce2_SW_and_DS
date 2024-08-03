

State
{
	StateName = "MainState",

	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			EntityFlagIsFalse {Name ="ef_DialogOff"},
		},
		OnActions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
			EntityFlagIsTrue {Name ="ef_DialogOff"},
		},
		OffActions = 
		{
			DialogSetDisabled{},
		},
	};

	
	OnOneTimeEvent
	{
		Conditions = {},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, -- zu Beginn der Karte Dialog abschalten
	};
    
    
    
    OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P304_CS02Finished"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, -- sobald zweite Cutscene beendet (Jandrim), Dialog anschalten
	};
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown{Quest = "GetHerbsFromPatriarch"},
			QuestIsKnown{Quest = "GetVialFromCraftsman"},
			OR
			{
				QuestIsSolved{Quest = "GetHerbsFromPatriarch"},
				QuestIsSolved{Quest = "GetVialFromCraftsman"},
			},
		},
		Actions =
		{
			FigureVanish{Tag = "default"},
		},
		-- Jared verschwindet, sobald der Spieler die Questen Bitterlauge & Phiole
		-- hat und mindestens eines der Items erhalten hat
	},
	
	
	OnFigureRespawnEvent
	{
		WaitTime = 0,
		X = 326.175,
		Y = 382.931,
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_JaredRespawn"},
				AND
				{
					AvatarValueIsGreaterOrEqual{Name = "av_P304_TalkWithAsha", Value = 1 },
					EntityFlagIsFalse{Name = "ef_IDidRespawn"},
				},
			},
		},
		Actions = 
		{
			EntityFlagSetTrue{Name = "ef_IDidRespawn"},
			-- Jared wird ausgerichtet
			FigureLookAtDirection {Tag = "default", Direction = 35},
			-- Jared spielt seine Liege-Animation ab
			MapFlagSetTrue {Name = "mf_P304_Jared_Died_Anim_Play"},
		},
		-- sobald mit Asha geredet, erscheint Jared wieder hinten an seiner Hütte
	};


	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P304_CS03Finished"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, -- sobald dritte Cutscene beendet (Jandrim), Dialog anschalten
	};
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithJared", Value = 2 },
		},
		Actions =
		{
			EntityFlagSetTrue{Name ="ef_DialogOff"},
			FigureVanish{Tag = "default"},
			PlayerHeroAdd{Player = "pl_Human", HeroId = 20 },
			FigureHeroSpawn	{Player = "pl_Human", Tag = "HeroJared", X = 326.175, Y = 382.931, Direction = default},
			MapTimerStart	{Name = "mt_JaredOutcries"},
			FigureOutcry {Tag = "Nonsense", TextTag = "UbergabeOutcry01"},
		},
    },                                
};                                                                            