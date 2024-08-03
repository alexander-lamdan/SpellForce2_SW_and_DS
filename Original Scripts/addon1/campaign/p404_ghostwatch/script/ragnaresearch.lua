

State
{
	StateName = "WaitForDialogEnd",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			-- zu Kartenbeginn ist KnowledgeLevel == 1
			-- mit jedem Stein, den der Avatar findet, wird es erhöht
			MapValueSet{Name = "mv_KnowledgeLevel", Value = 1},
		},
	},
	
	OnOneTimeEvent
	{
		-- wenn der Spieler mit Ragna gesprochen hat
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_PlayerGotTowerInfo"},
		},
		-- beginnt der Forschungszyklus
		Actions =
		{
			MapFlagSetTrue{Name = "mf_StartNewResearch"},
		},
		GotoState = "ResearchCycle01"
	},
}



	----
	----   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	----   !!!!             DER FORSCHUNGS-ZYKLUS                !!!!
	----   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	----
	
State
{
	StateName = "ResearchCycle01",
	
	OnEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			-- Wir beginnen mit demjenigen Step, der dem KnowledgeLevel entspricht
			-- (Je mehr Pergamente Ragna gebracht, desto höher wird eingestiegen)
			-- KnowledgeLevel darf nicht > 9 werden, da bloß 10 Researchsteps vorgesehen sind
			MapValueSetVariable	{Name = "mv_ResearchStep", Variable = "mv_KnowledgeLevel"},
			
			-- jetzt wird geforscht, um den nächsten Step zu erreichen
			MapFlagSetTrue{Name ="mf_StudyForNextStep"},
		},
		GotoState = "ResearchCycle02"
	},
}

State
{
	StateName = "ResearchCycle02",
	
	OnEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			-- Timer wird gestartet
			MapTimerStart{Name = "mt_StudyingForNextStep"},
			MapFlagSetTrue{Name = "mf_MapTimerIsRunning"},
		},
		GotoState = "ResearchCycle03"
	},
 }
   
   
State
{
	StateName = "ResearchCycle03",
    
    OnEvent
    {
    	Conditions =
    	{
    		-- wenn die Zeit zwischen 2 Researchsteps abgelaufen ist
    		MapFlagIsTrue{Name = "mf_MapTimerIsRunning"},
    		MapTimerIsElapsed{Name = "mt_StudyingForNextStep", Seconds = 45},
    		
    		-- wenn 10 Researchsteps lang geforscht wurde
    		MapValueIsEqual{Name = "mv_ResearchStep", Value = 10},
    		
    		-- und TowerClues noch nicht > 5 ist
    		MapValueIsLess{Name = "mv_TowerClues", Value = 5},
    	},
    	Actions =
    	{
    		-- Event soll nur einmal triggern
    		MapFlagSetFalse{Name = "mf_MapTimerIsRunning"},
    		MapTimerStop{Name = "mt_StudyingForNextStep"},
    		
    		MapValueAdd{Name = "mv_TowerClues", Value = 1},
    		
    		-- Ragna macht ihren Outcry
    		MapFlagSetTrue{Name = "mf_RagnaDoesOutcry"},
    		
    		-- und es geht wieder von vorne los
    		MapFlagSetTrue{Name = "mf_StartNewResearch"},
    	},
    	GotoState = "ResearchCycle01"
    },
    
    
    OnEvent
    {
    	Conditions =
    	{
    		-- wenn die Zeit zwischen 2 Researchsteps abgelaufen ist
    		MapFlagIsTrue{Name = "mf_MapTimerIsRunning"},
    		MapTimerIsElapsed{Name = "mt_StudyingForNextStep", Seconds = 45},
    		
    		-- wenn weniger als 10 Researchsteps lang geforscht wurde
    		MapValueIsLess{Name = "mv_ResearchStep", Value = 10},
    		
    		-- und TowerClues noch nicht > 5 ist
    		MapValueIsLess{Name = "mv_TowerClues", Value = 5},
    	},
    	Actions =
    	{
    		-- Event soll nur einmal triggern
    		MapFlagSetFalse{Name = "mf_MapTimerIsRunning"},
    		MapTimerStop{Name = "mt_StudyingForNextStep"},
    		
    		MapValueIncrease{Name = "mv_ResearchStep"},
    	},
    	GotoState = "ResearchCycle02"
    },
    
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		MapValueIsEqual{Name = "mv_TowerClues", Value = 5},
    	},
    	Actions =
    	{
    	},
    	GotoState = "LeaveResearchCycle"
    },
                               
}  


State
{
	StateName = "LeaveResearchCycle",
	
	

}                                                                        