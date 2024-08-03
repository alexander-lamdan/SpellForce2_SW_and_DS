--*******************************************************
--***                                                 ***
--***            SQ WineQuest - Palace				  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	--Die Treants sterben, bevor der Magische Schild bezwungen wurde.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_OpenBarrel"},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions =
		{
			ObjectVanish	{Tag = "GhostBarrel4"},
			ObjectVanish	{Tag = "GhostBarrel3"},
			ObjectVanish	{Tag = "GhostBarrel2"},
			ObjectVanish	{Tag = "GhostBarrel1"},
			MapFlagSetTrue {Name = "mf_SpawnWineGhosts"},
		},
		
	},
	
};