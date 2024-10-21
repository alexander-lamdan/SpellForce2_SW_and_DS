--Ghost04: Botschaft

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
			DialogSetEnabled	{Tag = "GhostExhauster04"},
			DialogTypeSetMainQuest	{Tag = "GhostExhauster04"},
		},
	},

-- FOW Cloak, der im Dialog unexplored wurde (2 Sekunden noetig)
	OnOneTimeEvent
			{
				Conditions = 
				{
					EntityTimerIsElapsed	{Name = "et_FOWCloak", Seconds = 2},
				},
				Actions = 
				{
					MinimapAlertSetToEntity	{Tag = "Botschaft", Type = 1},
					--FogOfWarCloak	{FogOfWarId = 07}, --Position Botschaft im Sumpf direkt wieder zu, nur noch Unexplored auf	
				},
			},

	--Dialog wieder an, wenn verziehen wurde
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SanshaHasForgiven"}, --in Dialog Sansha true gesetzt
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "GhostExhauster04"},
			DialogTypeSetMainQuest	{Tag = "GhostExhauster04"},
		},
	},
				
			
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Exhauster4DialogEnded"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Exhauster4Unbanned"},
		},
	},



	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Exhauster4Unbanned"},
		},
		Actions = 
		{
			EffectStartAtEntityPosition	{Tag = "default", File = "Effect_DeSpawn_Unit"},
			FigureVanish	{Tag = "GhostExhauster04"},
			SoundGlobalPlayOnce	{File = "06_level/map_dm_04_salvation"},
			--SoundAmbientPlayOnce	{File = "06_level/map_dm_04_salvation", X = 354.575, Y = 2, Z = 365.221, MaxRange = 25, FallOffRange = 5},
		},
	}

	
};

