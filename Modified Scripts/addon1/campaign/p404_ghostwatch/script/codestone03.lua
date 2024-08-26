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
		-- zu Beginn der Karte Dialog abschalten
		Conditions = {},
		Actions = 
		{
			DialogSetDisabled{},
		}, 
	};
    OnOneTimeEvent
	{
		-- Dialog an, sobald TowerInfo erhalten
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_PlayerGotTowerInfo"},
		},
		Actions = 
		{
			DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
		}, 
	};
  	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue{Name = "ef_CalledRagnaRemoveDialog"},
		},
		Actions = 
		{
			DialogSetDisabled{},
			MapValueAdd{Name = "mv_KnowledgeLevel", Value = 1},
			MapValueSet{Name = "mv_LastStoneFound", Value = 3},
		}, 
	};
	
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