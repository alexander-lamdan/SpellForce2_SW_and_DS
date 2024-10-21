-- Zweiter Spannender Angriff auf den Konvoi, !nicht die Begleitgruppen
State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P303_Todesblocker"},
			OR
			{
				FigureIsInRange	{Tag = "Horse1", Range = 4, X = 137, Y = 115},
				FigureIsInRange	{Tag = "Horse2", Range = 4, X = 137, Y = 115},
				FigureIsInRange	{Tag = "Horse3", Range = 4, X = 137, Y = 115},
				FigureIsInRange	{Tag = "Horse4", Range = 4, X = 137, Y = 115},
				FigureIsInRange	{Tag = "Falkmar", Range = 4, X = 137, Y = 115},
			},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P309_AdditionalAttackDelay"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P309_AdditionalAttackDelay", Seconds = 2},
			FigureIsAlive {Tag = "Falkmar"}
		},
		Actions =
		{
			--FigureAttackFigure {Tag = "SecondAdditionalAttack1", TargetTag = "ConvoyLeader"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack2", TargetTag = "ConvoyLeader"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack3", TargetTag = "ConvoyLeader"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack4", TargetTag = "ConvoyLeader"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack5", TargetTag = "ConvoyLeader"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack6", TargetTag = "ConvoyLeader"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack7", TargetTag = "ConvoyLeader"},
			
			FigureRun {Tag = "SecondAdditionalAttack1", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack2", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack3", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack4", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack5", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack6", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack7", X = 144, Y = 105},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P309_AdditionalAttackDelay", Seconds = 2},
			FigureIsDead {Tag = "Falkmar"},
			FigureIsAlive {Tag = "Horse1"}
		},
		Actions =
		{
			--FigureAttackFigure {Tag = "SecondAdditionalAttack1", TargetTag = "Horse1"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack2", TargetTag = "Horse1"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack3", TargetTag = "Horse1"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack4", TargetTag = "Horse1"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack5", TargetTag = "Horse1"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack6", TargetTag = "Horse1"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack7", TargetTag = "Horse1"},
			FigureRun {Tag = "SecondAdditionalAttack1", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack2", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack3", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack4", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack5", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack6", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack7", X = 144, Y = 105},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P309_AdditionalAttackDelay", Seconds = 2},
			FigureIsDead {Tag = "Falkmar"},
			FigureIsDead {Tag = "Horse1"},
			FigureIsAlive {Tag = "Horse2"}
		},
		Actions =
		{
			--FigureAttackFigure {Tag = "SecondAdditionalAttack1", TargetTag = "Horse2"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack2", TargetTag = "Horse2"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack3", TargetTag = "Horse2"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack4", TargetTag = "Horse2"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack5", TargetTag = "Horse2"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack6", TargetTag = "Horse2"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack7", TargetTag = "Horse2"},
			FigureRun {Tag = "SecondAdditionalAttack1", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack2", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack3", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack4", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack5", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack6", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack7", X = 144, Y = 105},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P309_AdditionalAttackDelay", Seconds = 2},
			FigureIsDead {Tag = "Falkmar"},
			FigureIsDead {Tag = "Horse1"},
			FigureIsDead {Tag = "Horse2"},
			FigureIsAlive {Tag = "Horse3"}
		},
		Actions =
		{
			--FigureAttackFigure {Tag = "SecondAdditionalAttack1", TargetTag = "Horse3"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack2", TargetTag = "Horse3"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack3", TargetTag = "Horse3"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack4", TargetTag = "Horse3"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack5", TargetTag = "Horse3"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack6", TargetTag = "Horse3"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack7", TargetTag = "Horse3"},
			FigureRun {Tag = "SecondAdditionalAttack1", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack2", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack3", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack4", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack5", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack6", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack7", X = 144, Y = 105},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P309_AdditionalAttackDelay", Seconds = 2},
			FigureIsDead {Tag = "Falkmar"},
			FigureIsDead {Tag = "Horse1"},
			FigureIsDead {Tag = "Horse2"},
			FigureIsDead {Tag = "Horse3"},
			FigureIsAlive {Tag = "Horse4"}
		},
		Actions =
		{
			--FigureAttackFigure {Tag = "SecondAdditionalAttack1", TargetTag = "Horse4"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack2", TargetTag = "Horse4"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack3", TargetTag = "Horse4"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack4", TargetTag = "Horse4"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack5", TargetTag = "Horse4"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack6", TargetTag = "Horse4"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack7", TargetTag = "Horse4"},
			FigureRun {Tag = "SecondAdditionalAttack1", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack2", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack3", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack4", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack5", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack6", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack7", X = 144, Y = 105},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P309_AdditionalAttackDelay", Seconds = 2},
			FigureIsDead {Tag = "Falkmar"},
			FigureIsDead {Tag = "Horse1"},
			FigureIsDead {Tag = "Horse2"},
			FigureIsDead {Tag = "Horse3"},
			FigureIsDead {Tag = "Horse4"},
			FigureIsAlive {Tag = "Horse5"}
		},
		Actions =
		{
			--FigureAttackFigure {Tag = "SecondAdditionalAttack1", TargetTag = "Horse4"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack2", TargetTag = "Horse4"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack3", TargetTag = "Horse4"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack4", TargetTag = "Horse4"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack5", TargetTag = "Horse4"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack6", TargetTag = "Horse4"},
			--FigureAttackFigure {Tag = "SecondAdditionalAttack7", TargetTag = "Horse4"},
			FigureRun {Tag = "SecondAdditionalAttack1", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack2", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack3", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack4", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack5", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack6", X = 144, Y = 105},
			FigureRun {Tag = "SecondAdditionalAttack7", X = 144, Y = 105},
		}
	},
	
}