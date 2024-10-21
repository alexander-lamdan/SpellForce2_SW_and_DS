
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
    		DialogTypeSetMainQuest{},
    		DialogSetEnabled{},
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
    		MapFlagIsTrue {Name = "mf_MatricusDialogFinished"},
    	},
    	Actions =
    	{
    		DialogSetDisabled	{},
    	},   	
    },          
    
    OnIdleGoHomeFake
    {
    	X = 216.02,
		Y = 264.64,
		Range = 1.5,
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_MatricusGoHome"},
			MapFlagIsTrue{Name = "mf_MatricusDialogFinished"},
		},
		HomeActions =
		{
			FigureHoldPosition	{Tag = "default"},
		},
    },
    
    OnIdleRunHomeFake
	{
		X = 179.5,
		Y = 218.7,
		Range = 1.5,
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_MatricusGoHome"},
		},
		-- Flag wird im Script "OutcriesMatricus" auf true gesetzt
		OneTimeHomeActions = 
		{
			FigureVanish{Tag = "default"},
		},
	};
      
	OnToggleEvent
	{
		OnConditions = 
		{    
			FigureHasNotHealth	{Tag = "Matricus", Percent = 30}, 
		},
		OnActions = 
		{   
			FigureOutcry{TextTag = "MatricusWarning01", Tag = "Matricus"},
		},
		OffConditions = 
		{   
			FigureHasHealth	{Tag = "Matricus", Percent = 35},  
		},
		OffActions = 
		{
		},
	};


                                                     
};                                                                            