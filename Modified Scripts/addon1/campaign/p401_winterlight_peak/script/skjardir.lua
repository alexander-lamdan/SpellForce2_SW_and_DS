-------------------------------------------------------------
--
--		Auftraggeber Zwerg
--
-------------------------------------------------------------
State
{
	StateName = "Init",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigureAbilityAdd {AbilityId = Ability.Immortal},
		},
	};
	
	OnEvent
	{
		Conditions =
		{
			-- wenn der Spieler auf die Karte zurückkommt...
			MapFlagIsTrue	{Name = "mf_MapChangeDetected"},
		},
		Actions =
		{
			-- ... dann hat der Mainquest Skajdir hier nichts mehr zu suchen.
			FigureAbilityRemove	 {AbilityId = Ability.Immortal},	-- just in case...
			FigureVanish	{},
		},
		GotoState = "END",
	};
};

State	{StateName = "END"};
