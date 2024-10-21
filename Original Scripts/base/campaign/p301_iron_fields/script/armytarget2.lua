-- Dunkelelfenwachen an der Brücke respawnen bis Spieler den Auftrag hat sie zu killen
State
{
	StateName = "INIT",

	OnFigureRespawnEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		WaitTime = 10,
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P301_BridgeArmyDoNotRespawn"},
			MapFlagIsFalse {Name = "mf_P301_Mission"},
		},
		Actions = 
		{
		},
	};
}