State
{
	StateName = "INIT",
	-- nach der Cutscene spawnen die Zwerge und fangen auch direkt an zu frieren
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			QuestIsActive {Quest = "WinterlightPeak_LastStand"}
		},
		Actions =
		{
			FigurePlayerTransfer {Tag = "Worker"..myNumber},
			EntityFlagSetTrue {Name = "ef_P401_Alive"},
			GateSetOpen {Tag = "BackDoor"}
		},
	},
	-- Wenn der Spieler die Zwerge das erste Mal aus der Festung bewegt, dann fangen sie an zu frieren
	OnOneTimeEvent
	{
		Conditions =
		{
			SetUpdateInterval {Steps = 1},
			FigureIsInRect {Top = 103, Left = 161, Bottom = 123,Right = 155}
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P401_FreezeTimer"},
			EntityFlagSetTrue {Name = "ef_P401_Freeze"},
		},
	},
	OnToggleEvent
	{
		OffConditions =
		{
			SetUpdateInterval {Steps = 1},
			EntityFlagIsFalse {Name = "ef_P401_Freeze"},
			FigureIsInRect {Top = 103, Left = 166, Bottom = 123,Right = 170}
		},
		OffActions =
		{
			EntityFlagSetTrue {Name = "ef_P401_Freeze"},
		},
		OnConditions =
		{
			SetUpdateInterval {Steps = 1},
			EntityFlagIsTrue {Name = "ef_P401_Freeze"},
			FigureIsInRect {Top = 103, Left = 154, Bottom = 123, Right = 159}
		},
		OnActions =
		{
			EntityFlagSetFalse {Name = "ef_P401_Freeze"},
		},
	},
	OnEvent
	{
		Conditions =
		{
			SetUpdateInterval {Steps = 1},
			EntityTimerIsElapsed {Name = "et_P401_FreezeTimer", Seconds = 0.8},
			EntityFlagIsTrue {Name = "ef_P401_Freeze"},
			-- Die erste Nische
			FigureIsNotInRect {Top = 107, Left = 222, Bottom = 128, Right = 201},
			-- Die zweite Nische
			FigureIsNotInRect {Top = 147, Left = 249, Bottom = 162, Right = 225},
			FigureIsNotInRect {Top = 162, Left = 245, Bottom = 169, Right = 235},
			--FigureIsInRect {Top = 156, Left = 231, Bottom = 161, Right = 239},
			-- Die dritte Nische
			FigureIsNotInRect {Top = 207.2, Left = 280, Bottom = 229, Right = 260},
			MapFlagIsFalse {Name = "mf_Cutscene_03"},
		},
		Actions =
		{
			FigureHealthSubtract {Tag = "Worker"..myNumber, Percent = 6},
			EntityTimerStart {Name = "et_P401_FreezeTimer"},
		},
	},
	OnEvent
	{
		Conditions =
		{
			SetUpdateInterval {Steps = 1},
			EntityTimerIsElapsed {Name = "et_P401_FreezeTimer", Seconds = 1},
			EntityFlagIsTrue {Name = "ef_P401_Freeze"},
			FigureHasNotHealth {Percent = 100, Tag = "Worker"..myNumber},
			FigureIsNotInCombat {Tag = "Worker"..myNumber},
			OR
			{
				-- Die erste Nische
				FigureIsInRect {Top = 107, Left = 222, Bottom = 128, Right = 201},
				-- Die zweite Nische
				FigureIsInRect {Top = 147, Left = 249, Bottom = 162, Right = 225},
				FigureIsInRect {Top = 162, Left = 245, Bottom = 169, Right = 235},
				--FigureIsInRect {Top = 156, Left = 231, Bottom = 161, Right = 239},
				-- Die dritte Nische
				FigureIsInRect {Top = 207.2, Left = 280, Bottom = 229, Right = 260},
			},
		},
		Actions =
		{
			FigureHealthAdd {Tag = "Worker"..myNumber, Percent = 20},
			EntityTimerStart {Name = "et_P401_FreezeTimer"},
			EffectStartAddon1 {File = "Effect_Misc_Warming"}
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth {Percent = 5, Tag = "Worker"..myNumber},
		},
		Actions =
		{
			FigureKill {Tag = "Worker"..myNumber},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange {TargetTag = "Effect", Range = 3},
		},
		Actions =
		{
			FigureVanish {},
			EntityFlagSetTrue {Name = "ef_P401_GoneAllu"},
			MapValueAdd {Name = "mv_P401_GoneToAlluvyn", Value = 1},
			MapFlagSetTrue {Name = "mf_Worker" .. myNumber .. "TeleportedAway"},
			PlayerNPCKillCountIncrease {UnitId = 1553},
		}
	},
	OnOneTimeDeadEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P401_Alive"},
			EntityFlagIsFalse {Name = "ef_P401_GoneAllu"}
		},
		Actions =
		{
			MapValueAdd {Name = "mv_P401_DwarfsDiedInTheCold", Value = 1}
		},
	},
	-- Frieren Outcries
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth {Percent = 30, Tag = "Worker"..myNumber},
			MapFlagIsFalse {Name = "mf_P401_OutcryFreeze1"},
		},
		Actions =
		{
			FigureOutcry {Tag = "Worker"..myNumber, TextTag = "Pass03"},
			MapFlagSetTrue {Name = "mf_P401_OutcryFreeze1"},
			MapTimerStart {Name = "mt_P401_FreezeTimer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth {Percent = 30, Tag = "Worker"..myNumber},
			MapTimerIsElapsed {Name = "mt_P401_FreezeTimer", Seconds = 90},
		},
		Actions =
		{
			FigureOutcry {Tag = "Worker"..myNumber, TextTag = "Pass04"},
			MapTimerStop {Name = "mt_P401_FreezeTimer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth {Percent = 15, Tag = "Worker"..myNumber},
			MapFlagIsFalse {Name = "mf_P401_OutcryDying1"},
		},
		Actions =
		{
			FigureOutcry {Tag = "Worker"..myNumber, TextTag = "Pass05"},
			MapFlagSetTrue {Name = "mf_P401_OutcryDying1"},
			MapTimerStart {Name = "mt_P401_DyingTimer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth {Percent = 15, Tag = "Worker"..myNumber},
			MapTimerIsElapsed {Name = "mt_P401_DyingTimer", Seconds = 90},
		},
		Actions =
		{
			FigureOutcry {Tag = "Worker"..myNumber, TextTag = "Pass06"},
			MapTimerStop {Name = "mt_P401_DyingTimer"},
		},
	},
	-- Die Zwerge werden angegriffen
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasHate {Tag = "Worker"..myNumber},
			MapFlagIsFalse {Name = "mf_P401_OutcryAggro"},
		},
		Actions =
		{
			FigureOutcry {Tag = "Worker"..myNumber, TextTag = "Pass07"},
			MapFlagSetTrue {Name = "mf_P401_OutcryAggro"},
		}
	},
	-- Sind nur noch wenige Zwerge übrig wird der Spieler gewarnt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P465_RegularDiedDwarfes", Value = 17},
			MapFlagIsFalse {Name = "mf_P401_OutcryFew"},
		},
		Actions =
		{
			FigureOutcry {Tag = "Worker"..myNumber, TextTag = "Pass08"},
			MapFlagSetTrue {Name = "mf_P401_OutcryFew"},
		},
	},
	
}