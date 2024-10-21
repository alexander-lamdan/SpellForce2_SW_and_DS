--Ghost 01 : Leiche begraben

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
				--FogOfWarCloak	{FogOfWarId = 06}, --Position Leiche wieder zu, damit nur Unexplored offen bleibt
				MinimapAlertSetToEntity	{Tag = "CorpseDirge01", Type = 1},
			},
		},


----------------------------------------------------------------
----------------------------------------------------------------				
	--wenn Leiche begraben, Umspawnen des Geists zum Grab	
	OnOneTimeEvent
	{
		Conditions = 
		{
			
			MapFlagIsTrue	{Name = "mf_BurrialDone"},
		},
		Actions = 
		{
			
			FigureTeleport	{Tag = "default", X = 410.13, Y = 258.66},
			MapFlagSetTrue {Name = "mf_GhostSpawnsAtGrave"},
			
		},
	},

	--wenn Geist gespawnt, OC Init	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_GhostSpawnsAtGrave"},
			PlayerIsNotGameOver	{Player = "default"},
			
		},
		Actions = 
		{
			FigureLookAtEntity	{Tag = "default", TargetTag = "pl_HumanAvatar"},
			EntityTimerStart	{Name = "et_OC_Timer01"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar1"}, --euer Koerper ist begraben
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_OC_Timer01", Seconds = 5},
			PlayerIsNotGameOver	{Player = "default"},
		},
		Actions = 
		{
			FigureWalk	{Tag = "default", X = 410.391, Y = 256.431}, --Geist geht zum Grab
			FigureOutcry	{Tag = "GhostExhauster01", TextTag = "Ghost01_1"}, --endlich kann ich ruhen
		},
	},
	
	
	--Wenn Outcries geführt,				
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_OC_Timer01", Seconds = 15},
		},
		Actions = 
		{
			--EntityTimerStop	{Name = "et_OC_Timer01"},
			MapFlagSetTrue	{Name = "mf_Exhauster1Unbanned"},
			EffectStartAtEntityPosition	{Tag = "default", File = "Effect_DeSpawn_Unit"},
			FigureVanish	{Tag = "GhostExhauster01"},
			--SoundAmbientPlayOnce	{File = "06_level/map_dm_04_salvation", X = 457.535, Y = 2, Z = 421.321, MaxRange = 25, FallOffRange = 5},
			SoundGlobalPlayOnce	{File = "06_level/map_dm_04_salvation"},
			QuestSetSolved	{Player = "default", Quest = "Befreie_ersten_Geist"},
		},
	},
};
