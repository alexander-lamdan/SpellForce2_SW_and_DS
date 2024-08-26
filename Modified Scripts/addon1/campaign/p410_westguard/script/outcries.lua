State
{	
	StateName = "INIT",
	
--1 Geweihter	
	OnOneTimeEvent
	{

		Conditions =
		{
			MapValueIsEqual	{Name = "mv_OutcryPriest", Value = 1},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Geweihter03", TextTag = "CampWestSacredMan01"},	
			FigureOutcry	{Tag = "Geweihter03", TextTag = "CampWestSacredMan02"},	
			
		},
		
	},
--2 Geweihter
	OnOneTimeEvent
	{

		Conditions =
		{
			MapValueIsEqual	{Name = "mv_OutcryPriest", Value = 2},	
			PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 30, TargetTag = "Geweihter01"},
			FigureIsAlive	{Tag = "Geweihter01"},	
		},
		Actions =
		{
			FigureOutcry	{Tag = "Geweihter01", TextTag = "CampNorthSacredMan01"},	
			FigureOutcry	{Tag = "Geweihter01", TextTag = "CampNorthSacredMan02"},	
		},
		
	},
--2 Geweihter
	OnOneTimeEvent
	{

		Conditions =
		{
			MapValueIsEqual	{Name = "mv_OutcryPriest", Value = 2},	
			PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 30, TargetTag = "Geweihter02"},
			FigureIsAlive	{Tag = "Geweihter02"},	
		},
		Actions =
		{
			FigureOutcry	{Tag = "Geweihter02", TextTag = "CampSouthSacredMan01"},	
			FigureOutcry	{Tag = "Geweihter02", TextTag = "CampSouthSacredMan02"},	
		},
		
	},
	
--letzter Geweihter
	OnOneTimeEvent
	{

		Conditions =
		{
			MapValueIsEqual	{Name = "mv_OutcryPriest", Value = 3},	
			PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 30, TargetTag = "Geweihter01"},
			FigureIsAlive	{Tag = "Geweihter01"},		
		},
		Actions =
		{
			FigureOutcry	{Tag = "Geweihter01", TextTag = "CampNorthSacredMan01"},	
			FigureOutcry	{Tag = "Geweihter01", TextTag = "CampNorthSacredMan03"},	
		},
		
	},
--letzter Geweihter
	OnOneTimeEvent
	{

		Conditions =
		{
			MapValueIsEqual	{Name = "mv_OutcryPriest", Value = 3},	
			PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 30, TargetTag = "Geweihter02"},
			FigureIsAlive	{Tag = "Geweihter02"},		
		},
		Actions =
		{
			FigureOutcry	{Tag = "Geweihter02", TextTag = "CampSouthSacredMan01"},	
			FigureOutcry	{Tag = "Geweihter02", TextTag = "CampSouthSacredMan03"},	
		},
		
	},
--letzter Geweihter
	OnOneTimeEvent
	{

		Conditions =
		{
			MapValueIsEqual	{Name = "mv_OutcryPriest", Value = 3},	
			PlayerFigureIsInRangeToEntity	{Player = "pl_Human", Range = 30, TargetTag = "Geweihter03"},
			FigureIsAlive	{Tag = "Geweihter03"},		
		},
		Actions =
		{
			FigureOutcry	{Tag = "Geweihter03", TextTag = "CampWestSacredMan01"},	
			FigureOutcry	{Tag = "Geweihter03", TextTag = "CampWestSacredMan03"},	
		},
		
	},
	
--Verschlinger, gefährdet:	
	OnOneTimeEvent
	{

		Conditions =
		{
			MapFlagIsTrue  {Name = "mf_TeleporterActivate"},
			FigureIsAlive	{Tag = "Monster"},		
		},
		Actions =
		{
			FigureOutcry	{Tag = "Monster", TextTag = "Monster01"},	
			
		},
		
	},
	
--Teleporter
	OnOneTimeEvent
	{

		Conditions =
		{
			MapFlagIsTrue  {Name = "mf_EndbossAlive"},
			FigureIsDead	{Tag = "Monster"},	
			MapFlagIsTrue  {Name = "mf_TeleporterActivate"},	
		},
		Actions =
		{
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_teleport_light", X = 626, Y = 25, Z = 57, MaxRange = 15, FallOffRange = 5},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar01"},	
			FigureOutcry	{Tag = "pl_HumanNightsong", TextTag = "Schattenlied01"},	
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar02"},	
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar03"},	
			
		},
		
	},
	
--Portal
	OnOneTimeEvent
	{

		Conditions =
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Westguard_MistyCoast", Range = 5},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 4, X = 23, Y = 659},
		},
		Actions =
		{
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar04"},	
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar05"},	
		},
		
	},
	
--Haupthaus wird angegriffen
	OnOneTimeEvent
	{

		Conditions =
		{
			BuildingHasNotHealth	{Tag = "Defender07", Percent = 75},
			MapFlagIsFalse {Name = "mf_TimerIsOver"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar06"},	
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_palace_alarm", X = 499, Y = 35, Z = 295, MaxRange = 30, FallOffRange = 5},
		},
		
	},
	
	--Haupthaus wird angegriffen
	OnOneTimeEvent
	{

		Conditions =
		{
			BuildingHasNotHealth	{Tag = "Defender07", Percent = 25},
			MapFlagIsFalse {Name = "mf_TimerIsOver"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar06"},	
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_palace_alarm", X = 499, Y = 35, Z = 295, MaxRange = 30, FallOffRange = 5},
		},
		
	},
	
--Meet Halicos
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndIntroCS"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Halicos", TextTag = "MeetHalicos1"},
			FigureOutcry	{Tag = "Halicos", TextTag = "MeetHalicos2"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "MeetHalicos3"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "MeetHalicos4"},				
		},
		
	},

-- Warnungen Rohstoffgebäude des Feindes	
	
	OnToggleEvent	
	{
		OnConditions =
		{
			MapFlagIsFalse {Name = "mf_TimerIsOver"},
			OR
			{
				PlayerBuildingIsInRange	{Player = "pl_Beast", BuildingId = 292, Range = 30, X = 268, Y = 198},
				PlayerBuildingIsInRange	{Player = "pl_Beast", BuildingId = 312, Range = 30, X = 273, Y = 228},
			},
		},
		OnActions = 
		{
			FigureOutcry	{Tag = "Halicos", TextTag = "Warnings1"},
		},
		OffConditions =
		{
				MapFlagIsFalse {Name = "mf_TimerIsOver"},
				PlayerBuildingIsNotInRange	{Player = "pl_Beast", BuildingId = 292, Range = 30, X = 268, Y = 198},
				PlayerBuildingIsNotInRange	{Player = "pl_Beast", BuildingId = 312, Range = 30, X = 273, Y = 228},
		},
		OffActions = 
		{
			
		},
	},
	
	OnToggleEvent	
	{
		OnConditions =
		{
			MapFlagIsFalse {Name = "mf_TimerIsOver"},
			OR
			{
				PlayerBuildingIsInRange	{Player = "pl_Beast", BuildingId = 312, Range = 30, X = 583, Y = 191},
				PlayerBuildingIsInRange	{Player = "pl_Beast", BuildingId = 292, Range = 30, X = 551, Y = 196},
			},
		},
		OnActions = 
		{
			FigureOutcry	{Tag = "Halicos", TextTag = "Warnings2"},
		},
		OffConditions =
		{
				MapFlagIsFalse {Name = "mf_TimerIsOver"},
				PlayerBuildingIsNotInRange	{Player = "pl_Beast", BuildingId = 312, Range = 30, X = 583, Y = 191},
				PlayerBuildingIsNotInRange	{Player = "pl_Beast", BuildingId = 292, Range = 30, X = 551, Y = 196},
		},
		OffActions = 
		{
			
		},
	},
	
	OnToggleEvent	
	{
		OnConditions =
		{
			MapFlagIsFalse {Name = "mf_TimerIsOver"},
			OR
			{
				PlayerBuildingIsInRange	{Player = "pl_Undead", BuildingId = 311, Range = 30, X = 439, Y = 467},
				PlayerBuildingIsInRange	{Player = "pl_Undead", BuildingId = 283, Range = 30, X = 439, Y = 467},
			},
		},
		OnActions = 
		{
			FigureOutcry	{Tag = "Halicos", TextTag = "Warnings3"},
		},
		OffConditions =
		{
				MapFlagIsFalse {Name = "mf_TimerIsOver"},
				PlayerBuildingIsNotInRange	{Player = "pl_Undead", BuildingId = 311, Range = 30, X = 439, Y = 467},
				PlayerBuildingIsNotInRange	{Player = "pl_Undead", BuildingId = 283, Range = 30, X = 439, Y = 467},
		},
		OffActions = 
		{
			
		},
	},
	
	OnToggleEvent	
	{
		OnConditions =
		{
			MapFlagIsFalse {Name = "mf_TimerIsOver"},
			OR
			{
				PlayerBuildingIsInRange	{Player = "pl_Undead", BuildingId = 311, Range = 30, X = 525, Y = 362},
				PlayerBuildingIsInRange	{Player = "pl_Undead", BuildingId = 283, Range = 30, X = 541, Y = 334},
			},
		},
		OnActions = 
		{
			FigureOutcry	{Tag = "Halicos", TextTag = "Warnings4"},
		},
		OffConditions =
		{
				MapFlagIsFalse {Name = "mf_TimerIsOver"},
				PlayerBuildingIsNotInRange	{Player = "pl_Undead", BuildingId = 311, Range = 30, X = 525, Y = 362},
				PlayerBuildingIsNotInRange	{Player = "pl_Undead", BuildingId = 283, Range = 30, X = 541, Y = 334},
		},
		OffActions = 
		{
			
		},
	},
	
	--SüdWesten Warnings
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_TimerIsOver"},
			OR
			{
				BuildingHasNotHealth	{Tag = "Tower1", Percent = 100},
				BuildingHasNotHealth	{Tag = "Tower2", Percent = 100},
				BuildingHasNotHealth	{Tag = "Tower3", Percent = 100},
				BuildingHasNotHealth	{Tag = "Tower4", Percent = 100},
				BuildingHasNotHealth	{Tag = "Defender01", Percent = 100},
			},
		},
		Actions =
		{
				FigureOutcry	{Tag = "Halicos", TextTag = "Warnings5"},
		},
		
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_TimerIsOver"},
			OR
			{
				BuildingHasNotHealth	{Tag = "Tower1", Percent = 50},
				BuildingHasNotHealth	{Tag = "Tower2", Percent = 50},
				BuildingHasNotHealth	{Tag = "Tower3", Percent = 50},
				BuildingHasNotHealth	{Tag = "Tower4", Percent = 50},
				BuildingHasNotHealth	{Tag = "Defender01", Percent = 50},
			},
		},
		Actions =
		{
				FigureOutcry	{Tag = "Halicos", TextTag = "Warnings5"},
		},
		
	},	
	--SüdOsten Warnings
	OnOneTimeEvent
	{
		Conditions =
		{
				MapFlagIsFalse {Name = "mf_TimerIsOver"},
				BuildingHasNotHealth	{Tag = "Defender02", Percent = 100},
		},
		Actions =
		{
				FigureOutcry	{Tag = "Halicos", TextTag = "Warnings6"},
		},
		
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
				MapFlagIsFalse {Name = "mf_TimerIsOver"},
				BuildingHasNotHealth	{Tag = "Defender02", Percent = 50},
		},
		Actions =
		{
				FigureOutcry	{Tag = "Halicos", TextTag = "Warnings6"},
		},
		
	},	

	--NordWesten Warnings
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_TimerIsOver"},
			OR
			{
				BuildingHasNotHealth	{Tag = "Tower7", Percent = 100},
				BuildingHasNotHealth	{Tag = "Tower8", Percent = 100},
				BuildingHasNotHealth	{Tag = "Tower9", Percent = 100},
				BuildingHasNotHealth	{Tag = "Tower10", Percent = 100},
				BuildingHasNotHealth	{Tag = "Defender04", Percent = 100},
			},
		},
		Actions =
		{
				FigureOutcry	{Tag = "Halicos", TextTag = "Warnings7"},
		},
		
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_TimerIsOver"},
			OR
			{
				BuildingHasNotHealth	{Tag = "Tower7", Percent = 50},
				BuildingHasNotHealth	{Tag = "Tower8", Percent = 50},
				BuildingHasNotHealth	{Tag = "Tower9", Percent = 50},
				BuildingHasNotHealth	{Tag = "Tower10", Percent = 50},
				BuildingHasNotHealth	{Tag = "Defender04", Percent = 50},
			},
		},
		Actions =
		{
				FigureOutcry	{Tag = "Halicos", TextTag = "Warnings7"},
		},
		
	},	
	--NordOsten Warnings
	OnEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_TimerIsOver"},
			EntityFlagIsFalse	{Name = "ef_OneTimeOutcry"},
			OR
			{
				PlayerFigureIsInRange	{Player = "pl_Undead", Range = 20, X = 550, Y = 373},
				PlayerFigureIsInRange	{Player = "pl_Undead2", Range = 20, X = 550, Y = 373},
			},
		},
		Actions =
		{
				FigureOutcry	{Tag = "Halicos", TextTag = "Warnings8"},
				MapTimerStart	{Name = "mt_UndeadAttackNortEastTimer"},
				EntityFlagSetTrue	{Name = "ef_OneTimeOutcry"},
		},
		
	},	
	
	OnEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_TimerIsOver"},
			EntityFlagIsTrue	{Name = "ef_OneTimeOutcry"},
			MapTimerIsElapsed	{Name = "mt_UndeadAttackNortEastTimer", Seconds = 60},
			OR
			{
				PlayerFigureIsNotInRange	{Player = "pl_Undead", Range = 20, X = 550, Y = 373},
				PlayerFigureIsNotInRange	{Player = "pl_Undead2", Range = 20, X = 550, Y = 373},
			},
		},
		Actions =
		{
			EntityFlagSetFalse	{Name = "ef_OneTimeOutcry"},
		},
		
	},	
	

	
};