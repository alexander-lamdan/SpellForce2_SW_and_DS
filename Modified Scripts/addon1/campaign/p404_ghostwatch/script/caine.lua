
State
{
	StateName = "MainState",
	
	OnOneTimeEvent
	{
		-- Caine erhält den Auftrag, den Spieler zu attackieren
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS01Ended"},
		},
		Actions = 
		{
			FigureTeamTransfer{Tag = "default", Team = "tm_Team2"},
			FigureForceAttackEntity	{Tag = "default", TargetTag = "pl_HumanAvatar"},
			MapFlagSetTrue{Name = "mf_CaineGotHisKillOrder"},
		},
	};
	
	OnOneTimeEvent
	{
		-- sollte der ungünstige Fall eintreten, und Caine den Spieler tatsächlich umbringen
		-- (gewollt ist, dass er ihn lediglich verletzt [Blut trinkt])
		-- dann wird er danach selbst gekillt
		-- (unschön, aber notwendig, um die Situation unter Kontrolle zu halten)
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_CaineGotHisKillOrder"},
			FigureIsDead{Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			FigureKill{Tag = "default"},
		},
	},
	
	

	

};
