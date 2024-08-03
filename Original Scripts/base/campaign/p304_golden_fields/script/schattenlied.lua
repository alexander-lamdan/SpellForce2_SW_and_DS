

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P304_PalaceArrival"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_Spawned"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "MainState"
	},
}


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
			AvatarFlagIsTrue {Name = "af_P304_CS01Finished"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, -- sobald erste Cutscene beendet (König), Dialog anschalten
	},
    
    OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				EntityFlagIsTrue {Name ="ef_Talked"},
				AvatarFlagIsTrue{Name = "af_P304_SecondReturnToGoldenFields"},
			},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
			AvatarValueSet	{Name = "av_P304_TalkWithSchattenlied", Value = 1 },
		}, 
		-- sobald mit Schattenlied gesprochen ODER
		-- zweite Rückkehr nach Golden Fields, wird Schattenlieds Dialog
		-- entfernt
		-- Schattenlieds Dialogcounter wird auf jeden Fall auf 1 gestellt
		-- sodaß, falls man nicht mit ihr gesprochen hat, später der Eingangsdialog
		-- nicht mehr getriggert wird
	},
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		AvatarFlagIsTrue{Name = "af_P304_SecondReturnToGoldenFields"},
    	},
    	Actions =
    	{
    		FigureTeleport	{Tag = "Schattenlied", X = 658 , Y = 640},
    	},
    	-- Bei der zweiten Cutscene nach Golden Fields
    	-- spawnt Schattenlied um
    },
    
    
	
         
    OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_ShadowsongFreed"},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 
		-- Sobald Schattenlied aus Hagards Klauen befreit
		-- schaltet sie ihren Dialog wieder an
	},           
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P304_TalkWithSchattenlied", Value = 2 },
		},
		Actions = 
		{
			MapFlagSetTrue{Name = "mf_GiveShadowsongAgainToAvatar"},
			EntityFlagSetTrue{Name ="ef_DialogOff"},
		}, -- nach dem zweiten Dialog wird Schattenlieds Dialog endgültig entfernt
	},
	                
};                                                                            