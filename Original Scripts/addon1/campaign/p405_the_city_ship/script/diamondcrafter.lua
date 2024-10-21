
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
	
	
	-- zu Beginn abschalten
	OnOneTimeEvent
	{
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
		Conditions =
		{
			QuestIsActive {Quest = "CityShip1_RepairPowerCrystal"},
		},
		Actions =
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
    	},
    },
    
    OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_CrystalDone"},
		},
		Actions =
		{
    		DialogSetDisabled{},
    	},
    },

}
