

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
			DialogTypeSetSideQuest{},
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
			AvatarFlagIsTrue{Name = "af_P304_FirstReturnToGoldenFields"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		},
			-- Wenn der Spieler zum 2. mal zurückkommt, schaltet er seinen Dialog an
	},  
 
    OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_DrakkarGameStart"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, -- wenn das richtige Spiel startet, abschalten
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarHasItemMisc{Player = "pl_Human", ItemId = 129, Amount = 1},
				AvatarHasItemMisc{Player = "pl_Human", ItemId = 137, Amount = 1},
				-- wenn Spieler kleine oder große Taschendiebstahlklaue hat
			},
			FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 3},
		},
		Actions =
		{
			AvatarItemMiscGive	{Player = "pl_Human", ItemId = 145, Amount = 1 },
			FigureOutcry{TextTag = "Pickpocketing01", Tag = "pl_HumanAvatar"},
			-- PURPURNER DRACHE ABGREIFEN
		},
	},
                                      
};                                                                            