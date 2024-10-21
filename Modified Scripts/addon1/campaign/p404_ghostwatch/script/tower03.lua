
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
			EntityValueSet{Name = "ev_MyEye", Value = 3}, -- Auge gelb
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{ 
			OR
			{
				MapValueIsEqual{Name = "mv_TowerKombo", Value = 1},
				MapValueIsEqual{Name = "mv_TowerKombo", Value = 2},
				MapValueIsEqual{Name = "mv_TowerKombo", Value = 3},
			},
		},
		Actions = 
		{ 
			EntityValueSet{Name = "ev_MyCorrectSymbol", Value = 2}, -- Schild 
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
			EntityValueSet{Name = "ev_MyCorrectSymbol", Value = 4}, -- Eis 
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
			BuildingTeamTransfer{Tag = "RealTower03", Team = "tm_FriendlyTowers"},
			MapFlagSetTrue{Name = "mf_OneTowerActivated"},
			EntityTimerStart{Name = "et_StartTower"},
		},
		OffConditions = 
		{
			EntityValueIsNotEqualToVariable{Name = "ev_MySymbol", Variable = "ev_MyCorrectSymbol"},
		},
		OffActions = 
		{
			BuildingTeamTransfer{Tag = "RealTower03", Team = "tm_NeutralTowers"},
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
			FogOfWarRevealAtEntity	{FogOfWarId = 33, Tag = "RealTower03", Range = 10, Height = default},
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
