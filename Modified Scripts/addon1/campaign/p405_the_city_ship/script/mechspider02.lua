
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
		},
		GotoState = "MainState"
	},
}

State
{
	StateName = "MainState",
	
	
	OnOneTimeEvent
	{
		-- zu Beginn abschalten
		Conditions =
		{
		},
		Actions =
		{
			DialogSetDisabled{},
		},
	},
	
	OnOneTimeEvent
	{
		-- wird angeschaltet, sobald Spieler die Quest hat
		Conditions =
		{
			QuestIsActive {Quest = "CityShip2_ActivateSpiders"},
		},
		Actions =
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
    	},
    },
    
    --- Feuerspinne
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityValueIsEqual{Name = "ev_MyWheelSet", Value = 0},
    		EntityFlagIsTrue{Name = "ef_FinalizeSpider"},
    		AvatarIsNotTalking{},
    	},
    	Actions =
    	{
    		FigureTeamTransfer	{Tag = "default", Team = "tm_Team1"},
			FigurePlayerTransfer	{Tag = "default", Player = "pl_Human"},
			FigureUnitChange{Tag = "default", UnitId = 1278, Level = 20},
			
			MapFlagSetTrue{Name = "mf_Spider02Ready"},
			
    		DialogSetDisabled{},
    	},
    },
    
    --- Untotenjägerspinne
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityValueIsEqual{Name = "ev_MyWheelSet", Value = 1},
    		EntityFlagIsTrue{Name = "ef_FinalizeSpider"},
    		AvatarIsNotTalking{},
    	},
    	Actions =
    	{
    		FigureTeamTransfer	{Tag = "default", Team = "tm_Team1"},
			FigurePlayerTransfer	{Tag = "default", Player = "pl_Human"},
			FigureUnitChange{Tag = "default", UnitId = 1280, Level = 20},
			
			MapFlagSetTrue{Name = "mf_Spider02Ready"},
			
    		DialogSetDisabled{},
    	},
    },
    
    --- Freezespinne
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityValueIsEqual{Name = "ev_MyWheelSet", Value = 2},
    		EntityFlagIsTrue{Name = "ef_FinalizeSpider"},
    		AvatarIsNotTalking{},
    	},
    	Actions =
    	{
    		FigureTeamTransfer	{Tag = "default", Team = "tm_Team1"},
			FigurePlayerTransfer	{Tag = "default", Player = "pl_Human"},
			FigureUnitChange{Tag = "default", UnitId = 1282, Level = 20},
			
			MapFlagSetTrue{Name = "mf_Spider02Ready"},
			
    		DialogSetDisabled{},
    	},
    },
    
    
    --- Supportspinne
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityValueIsEqual{Name = "ev_MyWheelSet", Value = 3},
    		EntityFlagIsTrue{Name = "ef_FinalizeSpider"},
    		AvatarIsNotTalking{},
    	},
    	Actions =
    	{
    		FigureTeamTransfer	{Tag = "default", Team = "tm_Team1"},
			FigurePlayerTransfer	{Tag = "default", Player = "pl_Human"},
			FigureUnitChange{Tag = "default", UnitId = 1281, Level = 20},
			
			MapFlagSetTrue{Name = "mf_Spider02Ready"},
			
    		DialogSetDisabled{},
    	},
    },
    
    --- Supportspinne
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		EntityValueIsEqual{Name = "ev_MyWheelSet", Value = 4},
    		EntityFlagIsTrue{Name = "ef_FinalizeSpider"},
    		AvatarIsNotTalking{},
    	},
    	Actions =
    	{
    		FigureTeamTransfer	{Tag = "default", Team = "tm_Team1"},
			FigurePlayerTransfer	{Tag = "default", Player = "pl_Human"},
			FigureUnitChange{Tag = "default", UnitId = 1279, Level = 20},
			
			MapFlagSetTrue{Name = "mf_Spider02Ready"},
			
    		DialogSetDisabled{},
    	},
    },
    

}
