
State
{
	StateName = "INIT",
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			EntityValueSet{Name = "ev_MySymbol", Value = 1}, -- Schwert
			EntityValueSet{Name = "ev_MyEye", Value = 1}, -- Auge rot
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{ 
			MapValueIsEqual{Name = "mv_TowerKombo", Value = 1},
		},
		Actions = 
		{ 
			EntityValueSet{Name = "ev_MyCorrectSymbol", Value = 5}, -- Erde 
		},
		GotoState = "MainState"
	},
	OnOneTimeEvent
	{
		Conditions = 
		{ 
			MapValueIsEqual{Name = "mv_TowerKombo", Value = 2},
		},
		Actions = 
		{ 
			EntityValueSet{Name = "ev_MyCorrectSymbol", Value = 3}, -- Feuer 
		},
		GotoState = "MainState"
	},
	OnOneTimeEvent
	{
		Conditions = 
		{ 
			MapValueIsEqual{Name = "mv_TowerKombo", Value = 3},
		},
		Actions = 
		{ 
			EntityValueSet{Name = "ev_MyCorrectSymbol", Value = 4}, -- Eis 
		},
		GotoState = "MainState"
	},
	OnOneTimeEvent
	{
		Conditions = 
		{ 
			MapValueIsEqual{Name = "mv_TowerKombo", Value = 4},
		},
		Actions = 
		{ 
			EntityValueSet{Name = "ev_MyCorrectSymbol", Value = 5}, -- Erde 
		},
		GotoState = "MainState"
	},
}

State
{
	StateName = "MainState",
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_PlayerGotTowerInfo"}, -- wird im Ragna-Dialog true gesetzt
		},
		Actions =
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
    	},
    },
    
    OnToggleEvent
	{
		OnConditions = 
		{
			EntityValueIsEqualToVariable{Name = "ev_MySymbol", Variable = "ev_MyCorrectSymbol"},
		},
		OnActions = 
		{
			BuildingTeamTransfer{Tag = "RealTower01", Team = "tm_FriendlyTowers"},
			MapFlagSetTrue{Name = "mf_OneTowerActivated"},
			EntityTimerStart{Name = "et_StartTower"},
		},
		OffConditions = 
		{
			EntityValueIsNotEqualToVariable{Name = "ev_MySymbol", Variable = "ev_MyCorrectSymbol"},
		},
		OffActions = 
		{
			BuildingTeamTransfer{Tag = "RealTower01", Team = "tm_NeutralTowers"},
			EntityTimerStop{Name = "et_StartTower"},
		},
	};

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed{Name = "et_StartTower", Seconds = 10},
			EntityValueIsEqualToVariable{Name = "ev_MySymbol", Variable = "ev_MyCorrectSymbol"},
		},
		Actions =
		{
			AvatarXPGive{Player = "pl_Human", Amount = 200},
			DialogSetDisabled{},
			FogOfWarRevealAtEntity	{FogOfWarId = 11, Tag = "RealTower01", Range = 10, Height = default},
		},
	},

   	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_DialogOff"},
		},
		Actions =
		{
    		DialogSetDisabled{},
    	},
    },
    
    OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS04Ended"},
		},
		Actions =
		{
			DialogSetDisabled{},
		},
	},
    

}
