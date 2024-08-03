--*******************************************************
--***                                                 ***
--***               Track01 Main                	  ***
--***                                                 ***
--*******************************************************

--Karte ist wie folgt in States unterteilt

--*******************************************************
--***                                                 ***
--***       InitState == Initialisierung/Sycn         ***
--***        Attack == Angriff auf den Track		  ***
--***                                                 ***
--*******************************************************

--*******************************************************
--***                                                 ***
--***                Init State	    	              ***
--***                                                 ***
--*******************************************************

State
{	
	StateName = "InitState",
	
	--TRACKSTART SYNC
    OnToggleEvent	
	{
		EventName = "Track01START",
		OnConditions =
		{
			SetUpdateInterval	{Steps = 33},
			MapFlagIsTrue {Name = "mf_RedmundKnown"},
			FigureIsInEntityRange	{Tag = "Track01Pack01", TargetTag = "04LStartPathPoint", Range = 10},
			FigureIsInEntityRange	{Tag = "Track01Pack02", TargetTag = "04RStartPathPoint", Range = 10},
			FigureIsInEntityRange	{Tag = "Track01Pack03", TargetTag = "05LStartPathPoint", Range = 10},
			FigureIsInEntityRange	{Tag = "Track01Pack04", TargetTag = "05RStartPathPoint", Range = 10},
			FigureIsInEntityRange	{Tag = "Track01Pack05", TargetTag = "06LStartPathPoint", Range = 10},
			FigureIsInEntityRange	{Tag = "Track01Pack06", TargetTag = "06RStartPathPoint", Range = 10},
			FigureIsInEntityRange	{Tag = "Track01Pack07", TargetTag = "07LStartPathPoint", Range = 10},
			FigureIsInEntityRange	{Tag = "Track01Pack08", TargetTag = "07RStartPathPoint", Range = 10},
			
			FigureIsInEntityRange	{Tag = "Track01Vorhut01", TargetTag = "01LStartPathPoint", Range = 10},
			FigureIsInEntityRange	{Tag = "Track01Vorhut02", TargetTag = "01RStartPathPoint", Range = 10},
			FigureIsInEntityRange	{Tag = "Track01Nachhut01", TargetTag = "08LStartPathPoint", Range = 10},
			FigureIsInEntityRange	{Tag = "Track01Nachhut02", TargetTag = "08RStartPathPoint", Range = 10},
			
			FigureIsInEntityRange	{Tag = "Track01Lead", TargetTag = "02LStartPathPoint", Range = 10},
			FigureIsInEntityRange	{Tag = "Track01Guard01", TargetTag = "02RStartPathPoint", Range = 10},
			FigureIsInEntityRange	{Tag = "Track01Guard02", TargetTag = "03LStartPathPoint", Range = 10},
			FigureIsInEntityRange	{Tag = "Track01Guard03", TargetTag = "03RStartPathPoint", Range = 10},
		
		},
		OnActions = 
		{
			MapFlagSetFalse {Name = "mf_FollowStart"},
			MapTimerStart	{Name = "mt_TrackStartSyncTimer"},
			MapTimerStop	{Name = "mt_TrackEndSyncTimer"},
			MapFlagSetFalse {Name = "mf_LeadGoHomeFlag"},
			
		},
		OffConditions =
		{
			SetUpdateInterval	{Steps = 33},
			OR
			{
				FigureIsNotInEntityRange	{Tag = "Track01Pack01", TargetTag = "04LStartPathPoint", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track01Pack02", TargetTag = "04RStartPathPoint", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track01Pack03", TargetTag = "05LStartPathPoint", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track01Pack04", TargetTag = "05RStartPathPoint", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track01Pack05", TargetTag = "06LStartPathPoint", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track01Pack06", TargetTag = "06RStartPathPoint", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track01Pack07", TargetTag = "07LStartPathPoint", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track01Pack08", TargetTag = "07RStartPathPoint", Range = 10},
			
				FigureIsNotInEntityRange	{Tag = "Track01Vorhut01", TargetTag = "01LStartPathPoint", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track01Vorhut02", TargetTag = "01RStartPathPoint", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track01Nachhut01", TargetTag = "08LStartPathPoint", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track01Nachhut02", TargetTag = "08RStartPathPoint", Range = 10},
			
				FigureIsNotInEntityRange	{Tag = "Track01Lead", TargetTag = "02LStartPathPoint", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track01Guard01", TargetTag = "02RStartPathPoint", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track01Guard02", TargetTag = "03LStartPathPoint", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track01Guard03", TargetTag = "03RStartPathPoint", Range = 10},
			}
		},
		OffActions = 
		{
			MapFlagSetFalse	{Name = "mf_Track01Ready"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Lead"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Pack01"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Pack02"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Pack03"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Pack04"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Pack05"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Pack06"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Pack07"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Pack08"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Guard01"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Guard02"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Guard03"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Vorhut01"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Vorhut02"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Nachhut01"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track01Nachhut02"},

			--DebugMessage	{Message = GetScriptTag() .. ": toggle start OFF (Ready)."},
		},
	},
		
	--TRACKEND SYNC
    OnToggleEvent	
	{
		EventName = "Track01END",
		OnConditions =
		{
			SetUpdateInterval	{Steps = 15},
			MapFlagIsTrue {Name = "mf_RedmundKnown"},
			MapFlagIsFalse	{Name = "mf_EndSync1Always"}, 
			FigureIsInEntityRange	{Tag = "Track01Pack01", TargetTag = "Track1Pony1", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Pack02", TargetTag = "Track1Pony2", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Pack03", TargetTag = "Track1Pony3", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Pack04", TargetTag = "Track1Pony4", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Pack05", TargetTag = "Track1Pony5", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Pack06", TargetTag = "Track1Pony6", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Pack07", TargetTag = "Track1Pony7", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Pack08", TargetTag = "Track1Pony8", Range = 15},
			
			FigureIsInEntityRange	{Tag = "Track01Vorhut01", TargetTag = "Track1Rider1", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Vorhut02", TargetTag = "Track1Rider2", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Nachhut01", TargetTag = "Track1Rider7", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Nachhut02", TargetTag = "Track1Rider8", Range = 15},
			
			FigureIsInEntityRange	{Tag = "Track01Lead", TargetTag = "Track1Rider3", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Guard01", TargetTag = "Track1Rider4", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Guard02", TargetTag = "Track1Rider5", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Guard03", TargetTag = "Track1Rider6", Range = 15},
		
		},
		OnActions = 
		{
			MapTimerStart	{Name = "mt_TrackEndSyncTimer"},
			MapTimerStop	{Name = "mt_TrackStartSyncTimer"},
			
		},
		OffConditions =
		{
			SetUpdateInterval	{Steps = 15},
			MapFlagIsFalse	{Name = "mf_EndSync1Always"}, 
			OR
			{
				FigureIsNotInEntityRange	{Tag = "Track01Pack01", TargetTag = "Track1Pony1", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Pack02", TargetTag = "Track1Pony2", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Pack03", TargetTag = "Track1Pony3", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Pack04", TargetTag = "Track1Pony4", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Pack05", TargetTag = "Track1Pony5", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Pack06", TargetTag = "Track1Pony6", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Pack07", TargetTag = "Track1Pony7", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Pack08", TargetTag = "Track1Pony8", Range = 15},
			
				FigureIsNotInEntityRange	{Tag = "Track01Vorhut01", TargetTag = "Track1Rider1", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Vorhut02", TargetTag = "Track1Rider2", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Nachhut01", TargetTag = "Track1Rider7", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Nachhut02", TargetTag = "Track1Rider8", Range = 15},
			
				FigureIsNotInEntityRange	{Tag = "Track01Lead", TargetTag = "Track1Rider3", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Guard01", TargetTag = "Track1Rider4", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Guard02", TargetTag = "Track1Rider5", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Guard03", TargetTag = "Track1Rider6", Range = 15},
			}
		},
		OffActions = 
		{
			
		},
	},
	
	
	--TRACKEND SYNC Camp05 is dead
    OnToggleEvent	
	{
		EventName = "Track01END",
		OnConditions =
		{
			SetUpdateInterval	{Steps = 15},
			MapFlagIsTrue {Name = "mf_RedmundKnown"},
			MapFlagIsTrue	{Name = "mf_Camp05Destroyed"}, 
			FigureIsInEntityRange	{Tag = "Track01Pack01", TargetTag = "Track1Stop7", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Pack02", TargetTag = "Track1Stop8", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Pack03", TargetTag = "Track1Stop9", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Pack04", TargetTag = "Track1Stop10", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Pack05", TargetTag = "Track1Stop11", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Pack06", TargetTag = "Track1Stop12", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Pack07", TargetTag = "Track1Stop13", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Pack08", TargetTag = "Track1Stop14", Range = 15},
			
			FigureIsInEntityRange	{Tag = "Track01Vorhut01", TargetTag = "Track1Stop1", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Vorhut02", TargetTag = "Track1Stop2", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Nachhut01", TargetTag = "Track1Stop15", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Nachhut02", TargetTag = "Track1Stop16", Range = 15},
			
			FigureIsInEntityRange	{Tag = "Track01Lead", TargetTag = "Track1Stop3", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Guard01", TargetTag = "Track1Stop4", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Guard02", TargetTag = "Track1Stop5", Range = 15},
			FigureIsInEntityRange	{Tag = "Track01Guard03", TargetTag = "Track1Stop6", Range = 15},
		
		},
		OnActions = 
		{
			MapTimerStart	{Name = "mt_TrackEndSyncTimer"},
			MapTimerStop	{Name = "mt_TrackStartSyncTimer"},
			MapFlagSetTrue	{Name = "mf_EndSync1Always"}, 
			
		},
		OffConditions =
		{
			SetUpdateInterval	{Steps = 15},
			MapFlagIsTrue	{Name = "mf_Camp05Destroyed"}, 
			MapFlagIsTrue	{Name = "mf_EndSync1Always"}, 
			OR
			{
				FigureIsNotInEntityRange	{Tag = "Track01Pack01", TargetTag = "Track1Stop7", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Pack02", TargetTag = "Track1Stop8", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Pack03", TargetTag = "Track1Stop9", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Pack04", TargetTag = "Track1Stop10", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Pack05", TargetTag = "Track1Stop11", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Pack06", TargetTag = "Track1Stop12", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Pack07", TargetTag = "Track1Stop13", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Pack08", TargetTag = "Track1Stop14", Range = 15},
			
				FigureIsNotInEntityRange	{Tag = "Track01Vorhut01", TargetTag = "Track1Stop1", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Vorhut02", TargetTag = "Track1Stop2", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Nachhut01", TargetTag = "Track1Stop15", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Nachhut02", TargetTag = "Track1Stop16", Range = 15},
			
				FigureIsNotInEntityRange	{Tag = "Track01Lead", TargetTag = "Track1Stop3", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Guard01", TargetTag = "Track1Stop4", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Guard02", TargetTag = "Track1Stop5", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track01Guard03", TargetTag = "Track1Stop6", Range = 15},
			}
		},
		OffActions = 
		{
			
		},
	},
			
	--Wenn der Tross angegriffen wird
	OnEvent
	{
		Conditions =
		{
			SetUpdateInterval	{Steps = 10},
			MapFlagIsFalse {Name = "mf_FollowStart"},
			OR
			{
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Lead"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Pack01"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Pack02"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Pack03"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Pack04"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Pack05"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Pack06"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Pack07"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Pack08"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Guard01"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Guard02"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Guard03"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Vorhut01"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Vorhut02"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Nachhut01"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track01Nachhut02"},
			},
				
		},
		Actions =
		{
			DebugMessage	{Message = "Track01 attacked", Caption = "Everybody was Kung Fu fighting!"},
			MapFlagSetTrue {Name = "mf_FollowStart"},
			MapTimerStart	{Name = "mt_FollowStartTimer"},

			EntityFlagSetTrue {Name = "ef_RemoveAbilitiesAndStopConvoy"},

			--DebugMessage	{Message = GetScriptTag() .. ": attacked, removing immortality."},
		},
		GotoState = "Attack",		
	},
	
};

--*******************************************************
--***                                                 ***
--***              		Attack State                  ***
--***                                                 ***
--*******************************************************	

State
{	
	
	StateName = "Attack",

	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_FollowStartTimer", Seconds = 0.4},
			EntityFlagIsTrue {Name = "ef_RemoveAbilitiesAndStopConvoy"},
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_RemoveAbilitiesAndStopConvoy"},

			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Lead"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Pack01"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Pack02"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Pack03"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Pack04"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Pack05"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Pack06"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Pack07"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Pack08"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Guard01"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Guard02"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Guard03"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Vorhut01"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Vorhut02"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Nachhut01"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track01Nachhut02"},
            
			--FigureStop	{Tag = "Track01Lead"},
			--FigureStop	{Tag = "Track01Pack01"},
			--FigureStop	{Tag = "Track01Pack02"},
			--FigureStop	{Tag = "Track01Pack03"},
			--FigureStop	{Tag = "Track01Pack04"},
			--FigureStop	{Tag = "Track01Pack05"},
			--FigureStop	{Tag = "Track01Pack06"},
			--FigureStop	{Tag = "Track01Pack07"},
			--FigureStop	{Tag = "Track01Pack08"},
			--FigureStop	{Tag = "Track01Guard01"},
			--FigureStop	{Tag = "Track01Guard02"},
			--FigureStop	{Tag = "Track01Guard03"},
			--FigureStop	{Tag = "Track01Vorhut01"},
			--FigureStop	{Tag = "Track01Vorhut02"},
			--FigureStop	{Tag = "Track01Nachhut01"},
			--FigureStop	{Tag = "Track01Nachhut02"},
		},	
	},
	
		
	--Wenn der Tross vom Nordlager ins Westlager unterwegs ist und angegriffen wird, flüchtet der Lead mit den Packpferden im Followmode ins Westlager.
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_FollowStartTimer", Seconds = 0.5},
			MapFlagIsFalse {Name = "mf_LeadGoHomeFlag"},
		},
		Actions =
		{
			FigureForcedWalkToEntity	{Tag = "Track01Lead", TargetTag = "NorthCamp"},
			MapFlagSetTrue {Name = "mf_LeadGoHomeFlag"},

		},	
	},
		
 	--Wenn der Lead gevanished wird bedeutet das, das der Kampfmodus beendet wird.
	OnEvent
	{
		Conditions =
		{
			SetUpdateInterval	{Steps = 30},
			MapTimerIsElapsed	{Name = "mt_FollowStartTimer", Seconds = 7},
		
				FigureIsInEntityRange	{Tag = "Track01Pack01", TargetTag = "04LStartPathPoint", Range = 10},
				FigureIsInEntityRange	{Tag = "Track01Pack02", TargetTag = "04RStartPathPoint", Range = 10},
				FigureIsInEntityRange	{Tag = "Track01Pack03", TargetTag = "05LStartPathPoint", Range = 10},
				FigureIsInEntityRange	{Tag = "Track01Pack04", TargetTag = "05RStartPathPoint", Range = 10},
				FigureIsInEntityRange	{Tag = "Track01Pack05", TargetTag = "06LStartPathPoint", Range = 10},
				FigureIsInEntityRange	{Tag = "Track01Pack06", TargetTag = "06RStartPathPoint", Range = 10},
				FigureIsInEntityRange	{Tag = "Track01Pack07", TargetTag = "07LStartPathPoint", Range = 10},
				FigureIsInEntityRange	{Tag = "Track01Pack08", TargetTag = "07RStartPathPoint", Range = 10},
			
				FigureIsInEntityRange	{Tag = "Track01Vorhut01", TargetTag = "01LStartPathPoint", Range = 10},
				FigureIsInEntityRange	{Tag = "Track01Vorhut02", TargetTag = "01RStartPathPoint", Range = 10},
				FigureIsInEntityRange	{Tag = "Track01Nachhut01", TargetTag = "08LStartPathPoint", Range = 10},
				FigureIsInEntityRange	{Tag = "Track01Nachhut02", TargetTag = "08RStartPathPoint", Range = 10},
			
				FigureIsInEntityRange	{Tag = "Track01Lead", TargetTag = "02LStartPathPoint", Range = 10},
				FigureIsInEntityRange	{Tag = "Track01Guard01", TargetTag = "02RStartPathPoint", Range = 10},
				FigureIsInEntityRange	{Tag = "Track01Guard02", TargetTag = "03LStartPathPoint", Range = 10},
				FigureIsInEntityRange	{Tag = "Track01Guard03", TargetTag = "03RStartPathPoint", Range = 10},
		},
		Actions =
		{
			DebugMessage	{Message = "Track01 no longer under attack", Caption = "Everybody was Kung Fu fighting!"},
			MapFlagSetFalse {Name = "mf_FollowStart"},
		},
		GotoState = "InitState",	
	},	
};