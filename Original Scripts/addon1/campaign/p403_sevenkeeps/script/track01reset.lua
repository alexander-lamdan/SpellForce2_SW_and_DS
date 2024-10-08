----*******************************************************
----***                                                 ***
----***               TrackReset01                	  ***
----***                                                 ***
----*******************************************************
--
--State
--{	
--	StateName = "InitState",
--    OnOneTimeEvent
--	{
--    	
--		Conditions =
--		{
--			QuestIsSolved {Quest = "SevenkeepsA1_GetToTown"},
--		},
--		Actions =
--		{
--			
--		},
--		GotoState = "ResetStateTrack01",
--	},
--};
--   
--State
--{	
--	StateName = "ResetStateTrack01",
--    
--    --F�r Pony 1 wird abgefragt ob sie am Startpunkt stehen.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Pack01", TargetTag = "04LStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_PonyStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Pack01", TargetTag = "04LStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_PonyStartpositionReached"},
--		},
--	},
--	
--	--F�r Pony 2 wird abgefragt ob sie am Startpunkt stehen.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Pack02", TargetTag = "04RStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_PonyStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Pack02", TargetTag = "04RStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_PonyStartpositionReached"},
--		},
--	},
--	
--	--F�r Pony 3 wird abgefragt ob sie am Startpunkt stehen.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Pack03", TargetTag = "05LStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_PonyStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Pack03", TargetTag = "05LStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_PonyStartpositionReached"},
--		},
--	},
--	
--	--F�r Pony 4 wird abgefragt ob sie am Startpunkt stehen.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Pack04", TargetTag = "05RStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_PonyStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Pack04", TargetTag = "05RStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_PonyStartpositionReached"},
--		},
--	},
--	
--	--F�r Pony 5 wird abgefragt ob sie am Startpunkt stehen.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Pack05", TargetTag = "06LStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_PonyStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Pack05", TargetTag = "06LStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_PonyStartpositionReached"},
--		},
--	},
--	
--	--F�r Pony 6 wird abgefragt ob sie am Startpunkt stehen.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Pack06", TargetTag = "06RStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_PonyStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Pack06", TargetTag = "06RStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_PonyStartpositionReached"},
--		},
--	},
--	
--	--F�r Pony 7 wird abgefragt ob sie am Startpunkt stehen.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Pack07", TargetTag = "07LStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_PonyStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Pack07", TargetTag = "07LStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_PonyStartpositionReached"},
--		},
--	},
--	
--	--F�r Pony 8 wird abgefragt ob sie am Startpunkt stehen.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Pack08", TargetTag = "07RStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_PonyStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Pack08", TargetTag = "07RStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_PonyStartpositionReached"},
--		},
--	},
--	
--	
--	--F�r Lead wird abgefragt ob er am Startpunkt steht.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Lead", TargetTag = "02LStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_GuardsStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Lead", TargetTag = "02LStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_GuardsStartpositionReached"},
--		},
--	},
--	
--	--F�r Gurad 1 wird abgefragt ob er am Startpunkt steht.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Guard01", TargetTag = "02RStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_GuardsStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Guard01", TargetTag = "02RStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_GuardsStartpositionReached"},
--		},
--	},
--	
--	--F�r Gurad 2 wird abgefragt ob er am Startpunkt steht.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Guard02", TargetTag = "03LStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_GuardsStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Guard02", TargetTag = "03LStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_GuardsStartpositionReached"},
--		},
--	},
--	
--	--F�r Gurad 3 wird abgefragt ob er am Startpunkt steht.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Guard03", TargetTag = "03RStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_GuardsStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Guard03", TargetTag = "03RStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_GuardsStartpositionReached"},
--		},
--	},
--	
--	--F�r Vorhut 1 wird abgefragt ob er am Startpunkt steht.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Vorhut01", TargetTag = "01LStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_GuardsStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Vorhut01", TargetTag = "01LStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_GuardsStartpositionReached"},
--		},
--	},
--	
--	--F�r Vorhut 2 wird abgefragt ob er am Startpunkt steht.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Vorhut02", TargetTag = "01RStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_GuardsStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Vorhut02", TargetTag = "01RStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_GuardsStartpositionReached"},
--		},
--	},
--	
--	--F�r Nachhut 1 wird abgefragt ob er am Startpunkt steht.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Nachhut01", TargetTag = "08LStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_GuardsStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Nachhut01", TargetTag = "08LStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_GuardsStartpositionReached"},
--		},
--	},
--	
--	--F�r Nachhut 2 wird abgefragt ob er am Startpunkt steht.
--	OnToggleEvent	
--	{
--		OnConditions =
--		{
--			FigureIsInEntityRange	{Tag = "Track01Nachhut02", TargetTag = "08RStartPathPoint", Range = 10},
--		},
--		OnActions = 
--		{
--			MapValueAdd	{Name = "mv_GuardsStartpositionReached", Value = 1},
--		},
--		OffConditions =
--		{
--			FigureIsNotInEntityRange	{Tag = "Track01Nachhut02", TargetTag = "08RStartPathPoint", Range = 10},
--		},
--		OffActions = 
--		{
--			MapValueDecrease	{Name = "mv_GuardsStartpositionReached"},
--		},
--	},
--	
--	
----*******************************************************
----***                                                 ***
----***               TrackReset01                	  ***
----***                                                 ***
----*******************************************************	
--
--    --ResetCondition, wenn mind. 2 Ponys (damit das vanishen nur in den Ponycamps passiert) auf ihrem Startfeld 45 sec. stehen.
--	OnEvent
--	{
--    	
--		Conditions =
--		{
--			MapValueIsGreaterOrEqual	{Name = "mv_PonyStartpositionReached", Value = 6},
--			EntityFlagIsFalse	{Name = "ef_TrackResetTimerStart"},
--		},
--		Actions =
--		{
--			MapTimerStart	{Name = "mt_ResetTrack01Timer"},
--			EntityFlagSetTrue	{Name = "ef_TrackResetTimerStart"},
--		},
--    },
--    
--    
--    
--    --Nach Ablauf der Zeit wird das Reset Flag gesetzt.
--    OnEvent
--	{
--    	
--		Conditions =
--		{
--			OR
--			{
--				MapValueIsGreater	{Name = "mv_PonyStartpositionReached", Value = 0},
--				MapValueIsGreater	{Name = "mv_GuardsStartpositionReached", Value = 0},
--			},
--			MapTimerIsElapsed	{Name = "mt_ResetTrack01Timer", Seconds = 300},
--			EntityFlagIsTrue	{Name = "ef_TrackResetTimerStart"},
--		},
--		Actions =
--		{
--			MapFlagSetTrue	{Name = "mf_ResetTrack01"}, 
--			MapTimerStop	{Name = "mt_ResetTrack01Timer"},
--			EntityFlagSetFalse	{Name = "ef_TrackResetTimerStart"},
--		},
--    },
--    
--     --Sp�testens nach 6 min. wird der Timer auf jedenfall zur�ckgesetzt.
--    OnEvent
--	{
--    	
--		Conditions =
--		{
--			MapTimerIsElapsed	{Name = "mt_ResetTrack01Timer", Seconds = 360},
--			EntityFlagIsTrue	{Name = "ef_TrackResetTimerStart"},
--		},
--		Actions =
--		{
--			MapTimerStop	{Name = "mt_ResetTrack01Timer"},
--			EntityFlagSetFalse	{Name = "ef_TrackResetTimerStart"},
--		},
--    },
--	
--	 --Wenn der Track zur�ck gesetzt wurde.
--    OnEvent
--	{
--    	
--		Conditions =
--		{
--			MapFlagIsTrue	{Name = "mf_ResetTrack01"}, 
--			MapValueIsEqual	{Name = "mv_PonyStartpositionReached", Value = 8},
--			MapValueIsEqual	{Name = "mv_GuardsStartpositionReached", Value = 8},
--		},
--		Actions =
--		{
--			MapFlagSetFalse {Name = "mf_FollowStart"},
--			MapTimerStop	{Name = "mt_TrackEndSyncTimer"},
--			MapTimerStop	{Name = "mt_TrackStartSyncTimer"},
--			MapFlagSetFalse {Name = "mf_LeadGoHomeFlag"},
--			MapFlagSetFalse	{Name = "mf_ResetTrack01"}, 
--		},
--    },
--
--};
