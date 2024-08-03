State
{	
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_SpawnEndBoss"},
		},
		Actions = 
		{
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_giantmonster_scream", X = 626, Y = 25, Z = 57, MaxRange = 15, FallOffRange = 5},
			MapFlagSetTrue  {Name = "mf_EndbossAlive"},
			FigureLookAtDirection {Tag = "default", Direction = 223},
		},
	},
	
	
	-- Abfrage auf 20% ist jetzt im Mainquest.lua drin
	
	
	
	
};
