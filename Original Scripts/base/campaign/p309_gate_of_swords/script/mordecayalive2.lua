State
{
	StateName = "INIT",
	-- Der Beserker ist tot und die Cutscene gelaufen, also spricht der tote Mordecay mit dem Spieler
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Berserker"},
			MapFlagIsTrue {Name = "mf_P309_CS_10_Done"},
		},
		Actions =
		{
			DialogTypeSetMainQuest {Tag = "MordecayAlive2"},
			DialogSetEnabled {Tag = "MordecayAlive2"},
		},
	},
};
	
-- Mordecay liegt da so rum
State
{
	StateName = "Idle",
	
}


