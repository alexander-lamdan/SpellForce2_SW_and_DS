

-- Sind alle Pferd (evtl. Begleiter des Konvois tot gibt es ein Game Over
State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Horse1"},
			FigureIsDead {Tag = "Horse2"},
			FigureIsDead {Tag = "Horse3"},
			FigureIsDead {Tag = "Horse4"},
			FigureIsDead {Tag = "Horse5"},
		},
		Actions =
		{
			
			PlayerGameOver {LocaTag = "GameOverSF2PackhorsesDead"},
		},
	},
}

