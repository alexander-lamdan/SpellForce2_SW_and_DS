--Ghost05: Will Lebenskraft oder muss getoetet werden

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
			DialogSetEnabled	{Tag = "GhostExhauster05"},
			DialogTypeSetMainQuest	{Tag = "GhostExhauster05"},
			MapFlagSetTrue {Name = "mf_Ghost05Spawned"},
		},
	},

	-- wenn friedlich geloest:
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Exhauster5DialogEnded"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Exhauster5Unbanned"},
			EffectStartAtEntityPosition	{Tag = "default", File = "Effect_DeSpawn_Unit"},
			FigureVanish	{Tag = "GhostExhauster05"},
			SoundGlobalPlayOnce	{File = "06_level/map_dm_04_salvation"},
			--SoundAmbientPlayOnce	{File = "06_level/map_dm_04_salvation", X = 457.73, Y = 2, Z = 378.558, MaxRange = 25, FallOffRange = 5},
			QuestSetSolved	{Player = "default", Quest = "Befreie_fuenften_Geist"},
		},
	},

	

	-- Team Transfer boese, wenn Spieler gewaltsame Loesung angestrebt hat
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Exhauster5TeamTransfer"},
			
		},
		Actions = 
		{
			FigureTeamTransfer	{Tag = "default", Team = "tm_Ghost"},
			FigureAttackEntity	{Tag = "default", TargetTag = "pl_HumanAvatar"},
		},
	},
		
							
};
