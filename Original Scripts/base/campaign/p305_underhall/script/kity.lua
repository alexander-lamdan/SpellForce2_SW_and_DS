

State
{
	StateName = "KityStart",
	OnFollowEvent
	{
		Tag = "Kity",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			MapFlagIsTrue{Name = "mf_KityFollowAvatar01"},
		},
		Actions = 
		{
		
		},
	},
    
	
	OnFollowEvent
	{
		Tag = "Kity",
		TargetTag = "Minotaur",
		OnConditions = 
		{
			MapFlagIsTrue{Name = "mf_KityFollowMinotaur"},
			
		},
		Actions = 
		{
			MapFlagSetFalse{Name = "mf_KityFollowAvatar01"},
		},
	},
    
	--In die Mine vom Start
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "Kity", Range = 10, X = 125, Y = 233},
    		MapFlagIsTrue{Name = "mf_KityFollowAvatar01"},
    	},
    	Actions =
    	{
 			FigureTeleport	{Tag = "Kity", X = 285, Y = 325},
 			EffectStart	{Tag = "Kity", File = "Effect_DeSpawn_Unit"},
 			MapFlagSetTrue{Name = "mf_KityFollowAvatar01"},
 			EntityFlagSetFalse {Name = "ef_KityEinmalschalter01"},
   		},
    },
    --In die Mine vom Start
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 125, Y = 233},
    		EntityFlagIsFalse {Name = "ef_KityEinmalschalter01"},
    		MapFlagIsTrue{Name = "mf_KityAngesprochen"},
    		MapFlagIsTrue{Name = "mf_KityFollowAvatar01"},
    	},
    	Actions =
    	{
 			--MapFlagSetFalse{Name = "mf_KityFollowAvatar01"},
 			FigureWalk	{Tag = "Kity", X = 125, Y = 233},
 			EntityFlagSetTrue {Name = "ef_KityEinmalschalter01"},
 			
   		},
    },
     --Aus der Mine zum Start
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "Kity", Range = 10, X = 285, Y = 337},
    		MapFlagIsTrue{Name = "mf_KityFollowAvatar01"},
    	},
    	Actions =
    	{
 			
 			FigureTeleport	{Tag = "Kity", X = 125, Y = 216},
 			EffectStart	{Tag = "Kity", File = "Effect_DeSpawn_Unit"},
 			MapFlagSetTrue{Name = "mf_KityFollowAvatar01"},
 			EntityFlagSetFalse {Name = "ef_KityEinmalschalter02"},
   		},
    },
	 --Aus der Mine zum Start
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 285, Y = 337},
    		EntityFlagIsFalse {Name = "ef_KityEinmalschalter02"},
    		MapFlagIsTrue{Name = "mf_KityAngesprochen"},
    		MapFlagIsTrue{Name = "mf_KityFollowAvatar01"},
    	},
    	Actions =
    	{
 			--MapFlagSetFalse{Name = "mf_KityFollowAvatar01"},
 			FigureWalk	{Tag = "Kity", X = 285, Y = 337},
 			EntityFlagSetTrue {Name = "ef_KityEinmalschalter02"},
   		},
    },
	 --Aus der Mine zur Stadt
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "Kity", Range = 10, X = 345, Y = 64},
    		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    		MapFlagIsTrue{Name = "mf_KityFollowAvatar01"},
    		
    	},
    	Actions =
    	{
 		
 			FigureTeleport	{Tag = "Kity", X = 464, Y = 58},
 			EffectStart	{Tag = "Kity", File = "Effect_DeSpawn_Unit"},
 			MapFlagSetTrue{Name = "mf_KityFollowAvatar01"},
 			EntityFlagSetFalse {Name = "ef_KityEinmalschalter03"},
   		},
    },
     --Aus der Mine zur Stadt
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 345, Y = 64},
    		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    		EntityFlagIsFalse {Name = "ef_KityEinmalschalter03"},
    		MapFlagIsTrue{Name = "mf_KityAngesprochen"},
    		MapFlagIsTrue{Name = "mf_KityFollowAvatar01"},
    	},
    	Actions =
    	{
 			--MapFlagSetFalse{Name = "mf_KityFollowAvatar01"},
 			FigureWalk	{Tag = "Kity", X = 345, Y = 64},
 			EntityFlagSetTrue {Name = "ef_KityEinmalschalter03"},
   		},
    },
     --Aus der Stadt zur Mine
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "Kity", Range = 10, X = 466, Y = 65},
    		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    		MapFlagIsTrue{Name = "mf_KityFollowAvatar01"},
    	},
    	Actions =
    	{
 			
 			FigureTeleport	{Tag = "Kity", X = 343, Y = 54},
 			EffectStart	{Tag = "Kity", File = "Effect_DeSpawn_Unit"},
 			MapFlagSetTrue{Name = "mf_KityFollowAvatar01"},
 			EntityFlagSetFalse {Name = "ef_KityEinmalschalter04"},
   		},
    },
	 --Aus der Stadt zur Mine
    OnEvent
    {
    	
    	Conditions =
    	{
    		FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 466, Y = 65},
    		QuestIsSolved	{Quest = "TalkToWindhammerAfterIuan"},
    		EntityFlagIsFalse {Name = "ef_KityEinmalschalter04"},
    		MapFlagIsTrue{Name = "mf_KityAngesprochen"},
    		MapFlagIsTrue{Name = "mf_KityFollowAvatar01"},
    	},
    	Actions =
    	{
 			--MapFlagSetFalse{Name = "mf_KityFollowAvatar01"},
 			FigureWalk	{Tag = "Kity", X = 466, Y = 65},
 			EntityFlagSetTrue {Name = "ef_KityEinmalschalter04"},
   		},
    },
	--Kity teleportiert sich zum Avatar sobald sie einen größeren Abstand zum Avatar einnimmt.
    OnEvent
    {
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_KityFollowAvatar01"},
    		MapFlagIsFalse{Name = "mf_KityAttackMinotaur"},
    		FigureIsNotInEntityRange	{Tag = "Kity", TargetTag = "pl_HumanAvatar", Range = 15},
    		EntityFlagIsFalse {Name = "ef_KityEinmalschalterTeleport"},
    	},
    	Actions =
    	{
 			FigureTeleportToEntity	{Tag = "Kity", TargetTag = "pl_HumanAvatar"},
 			EntityFlagSetTrue {Name = "ef_KityEinmalschalterTeleport"},
   		},
    },
    --Kity teleportiert sich zum Avatar sobald sie einen größeren Abstand zum Avatar einnimmt.
    OnEvent
    {
    	
    	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_KityFollowAvatar01"},
    		MapFlagIsFalse{Name = "mf_KityAttackMinotaur"},
    		EntityFlagIsTrue {Name = "ef_KityEinmalschalterTeleport"},
    		FigureIsInEntityRange	{Tag = "Kity", TargetTag = "pl_HumanAvatar", Range = 15},
    		EntityFlagIsTrue {Name = "ef_KityEinmalschalterTeleport"},
    	},
    	Actions =
    	{
 			EntityFlagSetFalse {Name = "ef_KityEinmalschalterTeleport"},
   		},
    },
	OnOneTimeEvent
    {
       	Conditions =
    	{
    		--FigureIsInEntityRange	{Tag = "Kity", TargetTag = "Minotaur", Range = 10},
			MapFlagIsTrue{Name = "mf_MinotaurRunStart"},
    	},
    	Actions =
    	{
     		ObjectVanish	{Tag = "MinotaurDead"},
     		MapFlagSetFalse{Name = "mf_KityFollowAvatar01"},
     		EntityTimerStart {Name = "et_KityTimer"},
     		MapFlagSetTrue{Name = "mf_KityFollowMinotaur"},
     		DialogTypeSetSideQuest	{Tag = "Pocket"},
			DialogSetEnabled	{Tag = "Pocket" },
   		},
    },
    --Kity folgt dem Minotaur in die Mine und verschwindet.
    OnOneTimeEvent
    {
       	Conditions =
    	{
    		MapFlagIsTrue{Name = "mf_MinotaurRunStart"},
			FigureIsInRange	{Tag = "Minotaur", Range = 2, X = 411, Y = 214},
    	},
    	Actions =
    	{
     		MapFlagSetFalse{Name = "mf_KityFollowMinotaur"},
			MapFlagSetTrue{Name = "mf_KityRunToEnd"},
   		},
    },
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_KityRunToEnd"},
		},
		Actions =
		{
			FigureRun	{Tag = "Kity", X = 411, Y = 214},
		},
	
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			
			FigureIsInRange	{Tag = "Kity", Range = 2, X = 411, Y = 214},
		},
		Actions =
		{
			FigureVanish	{Tag = "Kity"},
		},
	
	},


};
