--*******************************************************
--***                                                 ***
--***             		Former                        ***
--***                    	                          ***
--*******************************************************



State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_FormerActiv"},
		},
		Actions =
		{	
			FigureHoldPosition	{},
    		FigureAttackEntity	{TargetTag = "KingGuards1"},
    		FigureAbilityAdd	{Tag = "Former", AbilityId = Ability.Immortal},
    		FigureAbilityAdd	{Tag = "Former", AbilityId = 213},
		},
		
	},		
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_FormerActiv"},
			FigureIsDead	{Tag = "KingGuards1"},
		},
		Actions =
		{	
    		FigureAttackEntity	{TargetTag = "KingGuards2"},
		},
		
	},		
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_FormerActiv"},
			FigureIsDead	{Tag = "KingGuards2"},
		},
		Actions =
		{	
    		FigureAttackEntity	{TargetTag = "KingGuards3"},
		},
		
	},	
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_FormerActiv"},
			FigureIsDead	{Tag = "KingGuards3"},
		},
		Actions =
		{	
    		FigureAttackEntity	{TargetTag = "CS_06_Soldier01"},
		},
		
	},		
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_FormerActiv"},
			FigureIsDead	{Tag = "CS_06_Soldier01"},
		},
		Actions =
		{	
    		FigureAttackEntity	{TargetTag = "CS_06_Soldier02"},
		},
		
	},		
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_FormerActiv"},
			FigureIsDead	{Tag = "CS_06_Soldier02"},
		},
		Actions =
		{	
    		FigureAttackEntity	{TargetTag = "CS_06_Soldier03"},
		},
		
	},		
	
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_Archfire_Ended"},
		},
		Actions =
		{	
    		FigureAbilityRemove	{Tag = "Former", AbilityId = Ability.Immortal},
    		FigureAbilityRemove	{Tag = "Former", AbilityId = 213},
		},
		
	},		
	
};

