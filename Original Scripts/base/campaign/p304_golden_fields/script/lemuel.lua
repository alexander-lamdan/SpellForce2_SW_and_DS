
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
		Conditions = 
		{
			
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, 	-- zu Beginn sollte er erstmal abgeschaltet werden
	};       
    
    
   OnOneTimeEvent
   {
   	Conditions =
   	{
   		AvatarFlagIsTrue{Name = "af_P304_ThiefQuestGiven"},
   	},
   	Actions =
   	{
   		EntityFlagSetFalse{Name ="ef_DialogOff"},
   	},
      -- erst anschalten
		-- sobald Spieler die Diebesqueste hat       
    },                                                   

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_TalkWithLemuel", Value = 2},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, 	-- nachdem Spieler die "FivePurses"-Quest hat, wird Lemuel abgeschaltet
	};     
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 130, Amount = 5 },
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 	-- sobald Spieler die 5 Brieftaschen hat,
		-- wird Lemuel freigeschaltet
	};      
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_TalkWithLemuel", Value = 3},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, 	-- nachdem Spieler die "Cashbag"-Quest hat, wird Lemuel abgeschaltet
	};   
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc{Player = "pl_Human", ItemId = 140, Amount = 3},
		},
		Actions = 
		{
			EntityFlagSetFalse {Name ="ef_DialogOff"},
		}, 	-- sobald Spieler die 3 Cashbags hat,
		-- wird Lemuel freigeschaltet
	};   
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsEqual{Name = "mv_TalkWithLemuel", Value = 5},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name ="ef_DialogOff"},
		}, 	-- nachdem Spieler mit Lemuel gesprochen hat, wird der
		-- endgültig disabled
	};      
    
};                                                       