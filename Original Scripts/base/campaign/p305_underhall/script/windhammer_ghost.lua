


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
			DialogSetDisabled	{Tag = "Windhammer_Ghost"},
		},
		GotoState = "StateMinerGhost01"
	},
}
State
{
	StateName = "StateMinerGhost01",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_JandrimsVaterSpawn"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_JandrimsVaterAlive"},
			FigureSwappingDisable {},
		},
		DelayedActions = 
		{
		},
	},

    --Startet die CutscenWindhammerGhost
    OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		MapFlagIsTrue{Name = "mf_StartCutsceneWindhammer"},
    	 },
    	Actions = 
    	{
    		DialogSetDisabled	{Tag = "Windhammer_Ghost"},
    		MapTimerStart	{Name = "mt_CutsceneWindhammerGhostTimer"},
    	},
    },
	
	 OnOneTimeEvent
    {
    	Conditions = 
    	 {	
    		MapFlagIsTrue{Name = "mf_StartFightUgnath"},
    	 },
    	Actions = 
    	{
    		MapTimerStart	{Name = "mt_StartFightUgnathTimer"},
    		
    		
    	},
    },
	OnEvent
    {
    	Conditions = 
    	 {	
    		MapFlagIsTrue {Name = "mf_WindhammerGhostPlayerColor"},
    		FigureHasNotHealth	{Percent = 50},
    	 },
    	Actions = 
    	{
    		FigureHealthSet	{Percent = 100},
    	},
    },
	
};
