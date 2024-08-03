SAMMELSCRIPT = true


State
{
	StateName = "Ambush",
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerFigureIsInRange {X = 216, Y = 172, Range = 10, Player = "pl_Human"},
		},
		Actions =
		{
			FigureRun {X = 213+offsetX, Y = 175+offsetY},
		},
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
			--FigureAttackFigure  {Tag = "AttackAmbush21", TargetTag = "ConvoyLeader"},
			--FigureAttackFigure  {Tag = "AttackAmbush22", TargetTag = "ConvoyLeader"},
			--FigureAttackFigure  {Tag = "AttackAmbush23", TargetTag = "ConvoyLeader"},
			--FigureAttackFigure  {Tag = "AttackAmbush24", TargetTag = "ConvoyLeader"},
			--FigureAttackFigure  {Tag = "AttackAmbush25", TargetTag = "ConvoyLeader"},
			
			FigureRun {Tag = "AttackAmbush21", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush22", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush23", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush24", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush25", X = 222, Y = 148},
			
			
			
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
			--FigureAttackFigure  {Tag = "AttackAmbush21", TargetTag = "Horse1"},
			--FigureAttackFigure  {Tag = "AttackAmbush22", TargetTag = "Horse1"},
			--FigureAttackFigure  {Tag = "AttackAmbush23", TargetTag = "Horse1"},
			--FigureAttackFigure  {Tag = "AttackAmbush24", TargetTag = "Horse1"},
			--FigureAttackFigure  {Tag = "AttackAmbush25", TargetTag = "Horse1"},
			FigureRun {Tag = "AttackAmbush21", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush22", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush23", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush24", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush25", X = 222, Y = 148},
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
			--FigureAttackFigure  {Tag = "AttackAmbush21", TargetTag = "Horse2"},
			--FigureAttackFigure  {Tag = "AttackAmbush22", TargetTag = "Horse2"},
			--FigureAttackFigure  {Tag = "AttackAmbush23", TargetTag = "Horse2"},
			--FigureAttackFigure  {Tag = "AttackAmbush24", TargetTag = "Horse2"},
			--FigureAttackFigure  {Tag = "AttackAmbush25", TargetTag = "Horse2"},
			FigureRun {Tag = "AttackAmbush21", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush22", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush23", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush24", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush25", X = 222, Y = 148},
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
			--FigureAttackFigure  {Tag = "AttackAmbush21", TargetTag = "Horse3"},            
			--FigureAttackFigure  {Tag = "AttackAmbush22", TargetTag = "Horse3"},
			--FigureAttackFigure  {Tag = "AttackAmbush23", TargetTag = "Horse3"},
			--FigureAttackFigure  {Tag = "AttackAmbush24", TargetTag = "Horse3"},
			--FigureAttackFigure  {Tag = "AttackAmbush25", TargetTag = "Horse3"},
			FigureRun {Tag = "AttackAmbush21", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush22", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush23", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush24", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush25", X = 222, Y = 148},
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
			--FigureAttackFigure  {Tag = "AttackAmbush21", TargetTag = "Horse4"},
			--FigureAttackFigure  {Tag = "AttackAmbush22", TargetTag = "Horse4"},
			--FigureAttackFigure  {Tag = "AttackAmbush23", TargetTag = "Horse4"},
			--FigureAttackFigure  {Tag = "AttackAmbush24", TargetTag = "Horse4"},
			--FigureAttackFigure  {Tag = "AttackAmbush25", TargetTag = "Horse4"},
			FigureRun {Tag = "AttackAmbush21", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush22", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush23", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush24", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush25", X = 222, Y = 148},
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
			--FigureAttackFigure  {Tag = "AttackAmbush21", TargetTag = "Horse4"},
			--FigureAttackFigure  {Tag = "AttackAmbush22", TargetTag = "Horse4"},
			--FigureAttackFigure  {Tag = "AttackAmbush23", TargetTag = "Horse4"},
			--FigureAttackFigure  {Tag = "AttackAmbush24", TargetTag = "Horse4"},
			--FigureAttackFigure  {Tag = "AttackAmbush25", TargetTag = "Horse4"},
			FigureRun {Tag = "AttackAmbush21", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush22", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush23", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush24", X = 222, Y = 148},
			FigureRun {Tag = "AttackAmbush25", X = 222, Y = 148},
		}
	},
}