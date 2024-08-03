--*******************************************************
--***                                                 ***
--***               Track02 Main                	  ***
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
		EventName = "Track02START",
		OnConditions =
		{
			SetUpdateInterval	{Steps = 30},
			MapFlagIsTrue {Name = "mf_RedmundKnown"},
			FigureIsInEntityRange	{Tag = "Track02Pack01", TargetTag = "Track2PathPointStart01", Range = 10},
			FigureIsInEntityRange	{Tag = "Track02Pack02", TargetTag = "Track2PathPointStart02", Range = 10},
			FigureIsInEntityRange	{Tag = "Track02Pack03", TargetTag = "Track2PathPointStart03", Range = 10},
			FigureIsInEntityRange	{Tag = "Track02Pack04", TargetTag = "Track2PathPointStart04", Range = 10},
			FigureIsInEntityRange	{Tag = "Track02Pack05", TargetTag = "Track2PathPointStart05", Range = 10},
			FigureIsInEntityRange	{Tag = "Track02Pack06", TargetTag = "Track2PathPointStart06", Range = 10},
			FigureIsInEntityRange	{Tag = "Track02Pack07", TargetTag = "Track2PathPointStart07", Range = 10},
			FigureIsInEntityRange	{Tag = "Track02Pack08", TargetTag = "Track2PathPointStart08", Range = 10},
			
			FigureIsInEntityRange	{Tag = "Track02Vorhut01", TargetTag = "Track2PathPointStart09", Range = 10},
			FigureIsInEntityRange	{Tag = "Track02Vorhut02", TargetTag = "Track2PathPointStart10", Range = 10},
			FigureIsInEntityRange	{Tag = "Track02Nachhut01", TargetTag = "Track2PathPointStart15", Range = 10},
			FigureIsInEntityRange	{Tag = "Track02Nachhut02", TargetTag = "Track2PathPointStart16", Range = 10},
			
			FigureIsInEntityRange	{Tag = "Track02Lead", TargetTag = "Track2PathPointStart11", Range = 10},
			FigureIsInEntityRange	{Tag = "Track02Guard01", TargetTag = "Track2PathPointStart12", Range = 10},
			FigureIsInEntityRange	{Tag = "Track02Guard02", TargetTag = "Track2PathPointStart13", Range = 10},
			FigureIsInEntityRange	{Tag = "Track02Guard03", TargetTag = "Track2PathPointStart14", Range = 10},
		
		},
		OnActions = 
		{
			
			MapFlagSetFalse {Name = "mf_FollowTrack02Start"},
			MapTimerStart	{Name = "mt_Track02StartSyncTimer"},
			MapTimerStop	{Name = "mt_Track02EndSyncTimer"},
			MapFlagSetFalse {Name = "mf_Lead2GoHomeFlag"},
		},
		OffConditions =
		{
			SetUpdateInterval	{Steps = 30},
			OR
			{
				FigureIsNotInEntityRange	{Tag = "Track02Pack01", TargetTag = "Track2PathPointStart01", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track02Pack02", TargetTag = "Track2PathPointStart02", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track02Pack03", TargetTag = "Track2PathPointStart03", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track02Pack04", TargetTag = "Track2PathPointStart04", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track02Pack05", TargetTag = "Track2PathPointStart05", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track02Pack06", TargetTag = "Track2PathPointStart06", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track02Pack07", TargetTag = "Track2PathPointStart07", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track02Pack08", TargetTag = "Track2PathPointStart08", Range = 10},
			
				FigureIsNotInEntityRange	{Tag = "Track02Vorhut01", TargetTag = "Track2PathPointStart09", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track02Vorhut02", TargetTag = "Track2PathPointStart10", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track02Nachhut01", TargetTag = "Track2PathPointStart15", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track02Nachhut02", TargetTag = "Track2PathPointStart16", Range = 10},
			
				FigureIsNotInEntityRange	{Tag = "Track02Lead", TargetTag = "Track2PathPointStart11", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track02Guard01", TargetTag = "Track2PathPointStart12", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track02Guard02", TargetTag = "Track2PathPointStart13", Range = 10},
				FigureIsNotInEntityRange	{Tag = "Track02Guard03", TargetTag = "Track2PathPointStart14", Range = 10},
			}
		},
		OffActions = 
		{
			MapFlagSetFalse	{Name = "mf_Track02Ready"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Lead"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Pack01"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Pack02"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Pack03"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Pack04"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Pack05"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Pack06"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Pack07"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Pack08"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Guard01"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Guard02"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Guard03"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Vorhut01"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Vorhut02"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Nachhut01"},
			FigureAbilityAdd	{AbilityId = Ability.Immortal, Tag = "Track02Nachhut02"},
		},
	},
		
	--TRACKEND SYNC
    OnToggleEvent	
	{
		EventName = "Track02END",
		OnConditions =
		{
			SetUpdateInterval	{Steps = 15},
			MapFlagIsFalse	{Name = "mf_EndSync2Always"}, 
			MapFlagIsTrue {Name = "mf_RedmundKnown"},
			FigureIsInEntityRange	{Tag = "Track02Pack01", TargetTag = "Track2PathEndpoint07", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Pack02", TargetTag = "Track2PathEndpoint08", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Pack03", TargetTag = "Track2PathEndpoint09", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Pack04", TargetTag = "Track2PathEndpoint10", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Pack05", TargetTag = "Track2PathEndpoint11", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Pack06", TargetTag = "Track2PathEndpoint12", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Pack07", TargetTag = "Track2PathEndpoint13", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Pack08", TargetTag = "Track2PathEndpoint14", Range = 15},
			
			FigureIsInEntityRange	{Tag = "Track02Vorhut01", TargetTag = "Track2PathEndpoint01", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Vorhut02", TargetTag = "Track2PathEndpoint02", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Nachhut01", TargetTag = "Track2PathEndpoint15", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Nachhut02", TargetTag = "Track2PathEndpoint16", Range = 15},
			
			FigureIsInEntityRange	{Tag = "Track02Lead", TargetTag = "Track2PathEndpoint03", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Guard01", TargetTag = "Track2PathEndpoint04", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Guard02", TargetTag = "Track2PathEndpoint05", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Guard03", TargetTag = "Track2PathEndpoint06", Range = 15},
		
		},
		OnActions = 
		{
			MapTimerStart	{Name = "mt_Track02EndSyncTimer"},
			MapTimerStop	{Name = "mt_Track02StartSyncTimer"},
			
		},
		OffConditions =
		{
			SetUpdateInterval	{Steps = 15},
			MapFlagIsFalse	{Name = "mf_EndSync2Always"}, 
			OR
			{
				FigureIsNotInEntityRange	{Tag = "Track02Pack01", TargetTag = "Track2PathEndpoint07", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Pack02", TargetTag = "Track2PathEndpoint08", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Pack03", TargetTag = "Track2PathEndpoint09", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Pack04", TargetTag = "Track2PathEndpoint10", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Pack05", TargetTag = "Track2PathEndpoint11", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Pack06", TargetTag = "Track2PathEndpoint12", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Pack07", TargetTag = "Track2PathEndpoint13", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Pack08", TargetTag = "Track2PathEndpoint14", Range = 15},
			
				FigureIsNotInEntityRange	{Tag = "Track02Vorhut01", TargetTag = "Track2PathEndpoint01", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Vorhut02", TargetTag = "Track2PathEndpoint02", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Nachhut01", TargetTag = "Track2PathEndpoint15", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Nachhut02", TargetTag = "Track2PathEndpoint16", Range = 15},
			
				FigureIsNotInEntityRange	{Tag = "Track02Lead", TargetTag = "Track2PathEndpoint03", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Guard01", TargetTag = "Track2PathEndpoint04", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Guard02", TargetTag = "Track2PathEndpoint05", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Guard03", TargetTag = "Track2PathEndpoint06", Range = 15},
			}
		},
		OffActions = 
		{
			
		},
	},
	
	
	--TRACKEND SYNC Camp04 is dead
    OnToggleEvent	
	{
		EventName = "Track02END",
		OnConditions =
		{
			SetUpdateInterval	{Steps = 15},
			MapFlagIsTrue {Name = "mf_RedmundKnown"},
			MapFlagIsTrue	{Name = "mf_Camp04Destroyed"}, 
			FigureIsInEntityRange	{Tag = "Track02Pack01", TargetTag = "Track02CityWaitingPoint07", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Pack02", TargetTag = "Track02CityWaitingPoint08", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Pack03", TargetTag = "Track02CityWaitingPoint09", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Pack04", TargetTag = "Track02CityWaitingPoint10", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Pack05", TargetTag = "Track02CityWaitingPoint11", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Pack06", TargetTag = "Track02CityWaitingPoint12", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Pack07", TargetTag = "Track02CityWaitingPoint13", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Pack08", TargetTag = "Track02CityWaitingPoint14", Range = 15},
			
			FigureIsInEntityRange	{Tag = "Track02Vorhut01", TargetTag = "Track02CityWaitingPoint01", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Vorhut02", TargetTag = "Track02CityWaitingPoint02", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Nachhut01", TargetTag = "Track02CityWaitingPoint15", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Nachhut02", TargetTag = "Track02CityWaitingPoint16", Range = 15},
			
			FigureIsInEntityRange	{Tag = "Track02Lead", TargetTag = "Track02CityWaitingPoint03", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Guard01", TargetTag = "Track02CityWaitingPoint04", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Guard02", TargetTag = "Track02CityWaitingPoint05", Range = 15},
			FigureIsInEntityRange	{Tag = "Track02Guard03", TargetTag = "Track02CityWaitingPoint06", Range = 15},
		
		},
		OnActions = 
		{
			MapTimerStart	{Name = "mt_Track02EndSyncTimer"},
			MapTimerStop	{Name = "mt_Track02StartSyncTimer"},
			MapFlagSetTrue	{Name = "mf_EndSync2Always"}, 
		},
		OffConditions =
		{
			SetUpdateInterval	{Steps = 15},
			MapFlagIsTrue	{Name = "mf_Camp04Destroyed"}, 
			MapFlagIsTrue	{Name = "mf_EndSync2Always"}, 
			OR
			{
				FigureIsNotInEntityRange	{Tag = "Track02Pack01", TargetTag = "Track02CityWaitingPoint07", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Pack02", TargetTag = "Track02CityWaitingPoint08", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Pack03", TargetTag = "Track02CityWaitingPoint09", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Pack04", TargetTag = "Track02CityWaitingPoint10", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Pack05", TargetTag = "Track02CityWaitingPoint11", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Pack06", TargetTag = "Track02CityWaitingPoint12", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Pack07", TargetTag = "Track02CityWaitingPoint13", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Pack08", TargetTag = "Track02CityWaitingPoint14", Range = 15},
			
				FigureIsNotInEntityRange	{Tag = "Track02Vorhut01", TargetTag = "Track02CityWaitingPoint01", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Vorhut02", TargetTag = "Track02CityWaitingPoint02", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Nachhut01", TargetTag = "Track02CityWaitingPoint15", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Nachhut02", TargetTag = "Track02CityWaitingPoint16", Range = 15},
			
				FigureIsNotInEntityRange	{Tag = "Track02Lead", TargetTag = "Track02CityWaitingPoint03", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Guard01", TargetTag = "Track02CityWaitingPoint04", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Guard02", TargetTag = "Track02CityWaitingPoint05", Range = 15},
				FigureIsNotInEntityRange	{Tag = "Track02Guard03", TargetTag = "Track02CityWaitingPoint06", Range = 15},
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
			SetUpdateInterval	{Steps = 11},
			MapFlagIsFalse {Name = "mf_FollowTrack02Start"},
			OR
			{

				FigureHasNotHealth	{Percent = 99, Tag = "Track02Lead"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Pack01"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Pack02"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Pack03"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Pack04"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Pack05"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Pack06"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Pack07"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Pack08"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Guard01"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Guard02"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Guard03"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Vorhut01"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Vorhut02"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Nachhut01"},
				FigureHasNotHealth	{Percent = 99, Tag = "Track02Nachhut02"},
			},
				
		},
		Actions =
		{
			DebugMessage	{Message = "Track02 attacked", Caption = "Everybody was Kung Fu fighting!"},
			MapFlagSetTrue {Name = "mf_FollowTrack02Start"},
			MapTimerStart	{Name = "mt_FollowTrack02StartTimer"},
			
			EntityFlagSetTrue {Name = "ef_RemoveAbilitiesAndStopConvoy"},
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
			MapTimerIsElapsed	{Name = "mt_FollowTrack02StartTimer", Seconds = 0.4},
			EntityFlagIsTrue {Name = "ef_RemoveAbilitiesAndStopConvoy"},
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_RemoveAbilitiesAndStopConvoy"},

			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Lead"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Pack01"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Pack02"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Pack03"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Pack04"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Pack05"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Pack06"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Pack07"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Pack08"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Guard01"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Guard02"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Guard03"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Vorhut01"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Vorhut02"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Nachhut01"},
			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "Track02Nachhut02"},

			--FigureStop	{Tag = "Track02Lead"},
			--FigureStop	{Tag = "Track02Pack01"},
			--FigureStop	{Tag = "Track02Pack02"},
			--FigureStop	{Tag = "Track02Pack03"},
			--FigureStop	{Tag = "Track02Pack04"},
			--FigureStop	{Tag = "Track02Pack05"},
			--FigureStop	{Tag = "Track02Pack06"},
			--FigureStop	{Tag = "Track02Pack07"},
			--FigureStop	{Tag = "Track02Pack08"},
			--FigureStop	{Tag = "Track02Guard01"},
			--FigureStop	{Tag = "Track02Guard02"},
			--FigureStop	{Tag = "Track02Guard03"},
			--FigureStop	{Tag = "Track02Vorhut01"},
			--FigureStop	{Tag = "Track02Vorhut02"},
			--FigureStop	{Tag = "Track02Nachhut01"},
			--FigureStop	{Tag = "Track02Nachhut02"},
		},	
	},
	
	--Wenn der Tross vom Nordlager ins Westlager unterwegs ist und angegriffen wird, flüchtet der Lead mit den Packpferden im Followmode ins Westlager.
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_FollowTrack02StartTimer", Seconds = 0.5},
			MapFlagIsFalse {Name = "mf_Lead2GoHomeFlag"},
		},
		Actions =
		{
			FigureForcedWalkToEntity	{Tag = "Track02Lead", TargetTag = "SouthCamp"},
			MapFlagSetTrue {Name = "mf_Lead2GoHomeFlag"},
			
		},	
	},
	
	
 	--Wenn der Lead gevanished wird bedeutet das, das der Kampfmodus beendet wird.
	OnEvent
	{
		Conditions =
		{
			SetUpdateInterval	{Steps = 30},
			MapTimerIsElapsed	{Name = "mt_FollowTrack02StartTimer", Seconds = 7},

			FigureIsInEntityRange	{Tag = "Track02Pack01", TargetTag = "Track2PathPointStart01", Range = 10},      
			FigureIsInEntityRange	{Tag = "Track02Pack02", TargetTag = "Track2PathPointStart02", Range = 10},      
			FigureIsInEntityRange	{Tag = "Track02Pack03", TargetTag = "Track2PathPointStart03", Range = 10},      
			FigureIsInEntityRange	{Tag = "Track02Pack04", TargetTag = "Track2PathPointStart04", Range = 10},      
			FigureIsInEntityRange	{Tag = "Track02Pack05", TargetTag = "Track2PathPointStart05", Range = 10},      
			FigureIsInEntityRange	{Tag = "Track02Pack06", TargetTag = "Track2PathPointStart06", Range = 10},      
			FigureIsInEntityRange	{Tag = "Track02Pack07", TargetTag = "Track2PathPointStart07", Range = 10},      
			FigureIsInEntityRange	{Tag = "Track02Pack08", TargetTag = "Track2PathPointStart08", Range = 10},      
			                                                                                                        
			FigureIsInEntityRange	{Tag = "Track02Vorhut01", TargetTag = "Track2PathPointStart09", Range = 10},    
			FigureIsInEntityRange	{Tag = "Track02Vorhut02", TargetTag = "Track2PathPointStart10", Range = 10},    
			FigureIsInEntityRange	{Tag = "Track02Nachhut01", TargetTag = "Track2PathPointStart15", Range = 10},   
			FigureIsInEntityRange	{Tag = "Track02Nachhut02", TargetTag = "Track2PathPointStart16", Range = 10},   
			                                                                                                        
			FigureIsInEntityRange	{Tag = "Track02Lead", TargetTag = "Track2PathPointStart11", Range = 10},        
			FigureIsInEntityRange	{Tag = "Track02Guard01", TargetTag = "Track2PathPointStart12", Range = 10},     
			FigureIsInEntityRange	{Tag = "Track02Guard02", TargetTag = "Track2PathPointStart13", Range = 10},     
			FigureIsInEntityRange	{Tag = "Track02Guard03", TargetTag = "Track2PathPointStart14", Range = 10},     
		},
		Actions =
		{
			DebugMessage	{Message = "Track02 no longer under attack", Caption = "Everybody was Kung Fu fighting!"},
			MapFlagSetFalse {Name = "mf_FollowTrack02Start"},
		},
		GotoState = "InitState",	
	},	
};