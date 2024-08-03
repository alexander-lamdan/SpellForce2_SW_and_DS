--beginnt den Timer fuer die Belebung des Horstes, wenn Spieler in die Naehe kommt
State
{
	StateName = "Init",
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 540, Y = 548}, --Ausgang des Hornwegs
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_BuergerTiming"}, --Startet die Animationen / WPs der Buerger
			MapFlagSetTrue {Name = "mf_BuergerGo"},
		},
		
	}


}


