-- Dritter Spannender Angriff auf den Konvoi, !nicht die Begleitgruppen
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
				FigureIsInRange	{Tag = "Horse1", Range = 8, X = 167, Y = 99},
				FigureIsInRange	{Tag = "Horse2", Range = 8, X = 167, Y = 99},
				FigureIsInRange	{Tag = "Horse3", Range = 8, X = 167, Y = 99},
				FigureIsInRange	{Tag = "Horse4", Range = 8, X = 167, Y = 99},
				FigureIsInRange	{Tag = "Falkmar", Range = 8, X = 167, Y = 99},
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
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack1", TargetTag = "Falkmar"},
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack2", TargetTag = "Falkmar"},
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack3", TargetTag = "Falkmar"},
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
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack1", TargetTag = "Horse1"},
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack2", TargetTag = "Horse1"},
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack3", TargetTag = "Horse1"},
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
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack1", TargetTag = "Horse2"},
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack2", TargetTag = "Horse2"},
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack3", TargetTag = "Horse2"},
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
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack1", TargetTag = "Horse3"},
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack2", TargetTag = "Horse3"},
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack3", TargetTag = "Horse3"},
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
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack1", TargetTag = "Horse4"},
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack2", TargetTag = "Horse4"},
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack3", TargetTag = "Horse4"},
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
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack1", TargetTag = "Horse4"},
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack2", TargetTag = "Horse4"},
			FigureRunToEntity	{Tag = "ThirdAdditionalAttack3", TargetTag = "Horse4"},
		}
	},
}