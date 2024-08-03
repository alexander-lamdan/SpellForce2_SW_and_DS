--Ghost03: muss ueberzeugt werden durch richtige choices im Dialog

State
{
	StateName = "INIT",
	--Spawnt, wenn Shae sie sichtbar macht
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_GhostSpawn"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "GhostExhauster03"},
			DialogTypeSetMainQuest	{Tag = "GhostExhauster03"},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Exhauster3DialogEnded"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Exhauster3Unbanned"},
		},
	},


	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Exhauster3Unbanned"},
		},
		Actions = 
		{
			EffectStartAtEntityPosition	{Tag = "default", File = "Effect_DeSpawn_Unit"},
			FigureVanish	{Tag = "GhostExhauster03"},
			QuestSetSolved	{Player = "default", Quest = "Befreie_dritten_Geist"},
			--SoundAmbientPlayOnce	{File = "06_level/map_dm_04_salvation", X = 404.706, Y = 2, Z = 398.016, MaxRange = 25, FallOffRange = 5},
			SoundGlobalPlayOnce	{File = "06_level/map_dm_04_salvation"},
		},
	}

	
};
