State
{	
	StateName = "INIT",	
	
	--WeinGeist
	OnOneTimeEvent
	{
		Conditions =
		{
			GateIsOpen	{Tag = "WineDoor"},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 239, Y = 103},
		},
		Actions =
		{
			FigureOutcry	{Tag = "WineGhost", TextTag = "WineGhost01"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			GateIsOpen	{Tag = "WineDoor"},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 4, X = 266, Y = 110},
		},
		Actions =
		{
			FigureOutcry	{Tag = "WineGhost", TextTag = "WineGhost02"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_SpawnWineGhosts"},
		},
		Actions =
		{
			FigureVanish	{Tag = "WineGhost"},
		},
		
	},
	
	--Teleportfight
	OnOneTimeEvent
	{
		Conditions =
		{
			GateIsOpen	{Tag = "TempleOutGate"},
			OR
			{
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 8, X = 100, Y = 252},
				FigureIsInRange	{Tag = "pl_HumanHeroYasha", Range = 8, X = 100, Y = 252},
				FigureIsInRange	{Tag = "pl_HumanHeroWind", Range = 8, X = 100, Y = 252},
				FigureIsInRange	{Tag = "pl_HumanHeroCaine", Range = 8, X = 100, Y = 252},
				FigureIsInRange	{Tag = "pl_HumanHeroWhisper", Range = 8, X = 100, Y = 252},
				FigureIsInRange	{Tag = "pl_HumanHeroMordecay", Range = 8, X = 100, Y = 252},
				FigureIsInRange	{Tag = "pl_HumanNightsong", Range = 8, X = 100, Y = 252},
			},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_TeleportFightTimer"},
		},
		
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_TeleportPartyFinished"},
			MapTimerIsElapsed	{Name = "mt_TeleportFightTimer", Seconds = 120},
		},
		Actions =
		{
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "Spawns1"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_TeleportPartyFinished"},
			MapTimerIsElapsed	{Name = "mt_TeleportFightTimer", Seconds = 140},
		},
		Actions =
		{
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "Spawns2"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_TeleportPartyFinished"},
			MapTimerIsElapsed	{Name = "mt_TeleportFightTimer", Seconds = 180},
		},
		Actions =
		{
			FigureOutcry	{Tag = "pl_HumanHeroWind", TextTag = "Spawns3"},
			FigureOutcry	{Tag = "pl_HumanHeroWind", TextTag = "Spawns4"},
		},
		
	},
	--Hotchkiss
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_OutcryThiefTreasureroom"},
			FigureIsInRangeToEntity	{Tag = "Thief", TargetTag = "Secret6", Range = 5},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Thief", TextTag = "Hotchkiss4"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_OutcryThiefLeaving"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Thief", TextTag = "Hotchkiss2"},
			FigureOutcry	{Tag = "Thief", TextTag = "Hotchkiss3"},
		},
		
	},
	
	
	--Endfight Former, nach erster Cutszene
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_Reached_Throne_Room_Ended"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_OutcryEndfigtTimer1"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_Reached_Throne_Room_Ended"},
			MapTimerIsElapsed	{Name = "mt_OutcryEndfigtTimer1", Seconds = 5},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_OutcryEndfigtTimer1"},
			FigureOutcry	{Tag = "Former", TextTag = "Endfight1"},
--			FigureOutcry	{Tag = "Former", TextTag = "Endfight2"},
--			FigureOutcry	{Tag = "pl_HumanHeroWind", TextTag = "Endfight3"},
--			FigureOutcry	{Tag = "pl_HumanHeroYasha", TextTag = "Endfight4"},
			FigureOutcry	{Tag = "pl_HumanHeroMordecay", TextTag = "Endfight5"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "Endfight6"},
			FigureOutcry	{Tag = "pl_HumanHeroWind", TextTag = "Endfight7"},
			FigureOutcry	{Tag = "Former", TextTag = "Endfight8"},
			
		},
		
	},
	--Endfight Former, nach zweiter Cutszene
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_King_Ulf_Appears_Ended"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_OutcryEndfigtTimer2"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_King_Ulf_Appears_Ended"},
			MapTimerIsElapsed	{Name = "mt_OutcryEndfigtTimer2", Seconds = 5},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_OutcryEndfigtTimer2"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "Endfight9"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Endfight10"},
			FigureOutcry	{Tag = "Former", TextTag = "Endfight11"},
			FigureOutcry	{Tag = "Former", TextTag = "Endfight12"},
			FigureOutcry	{Tag = "Former", TextTag = "Endfight13"},
		},
		
	},
	
	--Endfight Former, nach der dritten Cutszene
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_Archfire_Ended"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_OutcryEndfigtTimer3"},	
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_Archfire_Ended"},
			MapTimerIsElapsed	{Name = "mt_OutcryEndfigtTimer3", Seconds = 1},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_OutcryEndfigtTimer3"},
			FigureOutcry	{Tag = "Former", TextTag = "Endfight14"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Endfight15"},
			FigureOutcry	{Tag = "pl_HumanHeroWind", TextTag = "Endfight16"},
			FigureOutcry	{Tag = "pl_HumanHeroWind", TextTag = "Endfight17"},
			
		},
		
	},
	--Endfight Former, nach der dritten Cutszene, Former ist bei weniger als 30% Health
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P412_Archfire_Ended"},
			FigureHasNotHealth	{Tag = "Former", Percent = 30},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Former", TextTag = "Endfight18"},
			FigureOutcry	{Tag = "Former", TextTag = "Endfight19"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Endfight20"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Endfight21"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Endfight22"},
			
		},
		
	},
	
	
};