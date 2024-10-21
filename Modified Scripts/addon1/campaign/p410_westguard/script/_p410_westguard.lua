
--*******************************************************
--***                                                 ***
--***               Westguard Addon1                   ***
--***                                                 ***
--*******************************************************

--Die Mission ist wie folgt auf die Lua Scripte verteilt:

--*******************************************************
--***                                                 ***
--***               Globale Scripte		              ***
--***                                                 ***
--*******************************************************

--_P410_Westguard
--MainQuest
--Outcries
--Rewards

--*******************************************************
--***                                                 ***
--***        Akt1 20min durchhalten				      ***
--***                                                 ***
--*******************************************************



--*******************************************************
--***                                                 ***
--***  			Akt2 Camps zerstören		 		  ***
--***                                                 ***
--*******************************************************


--*******************************************************
--***                                                 ***
--***         	Akt3 Former stellen			   	      ***
--***                                                 ***
--*******************************************************



State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
    	-- das Flag "AlwaysTrue" ist immer true sein
    	-- ist als Default-Abfragewert für Sammelscripte gedacht (Spawning etc.)
		Conditions =
		{
		},
		Actions =
		{
			--Cutszene wird gestartet			
			MapFlagSetTrue {Name = "mf_P410_StartIntroCS"},
			PortalDisable	{Tag = "Westguard_MistyCoast"},
			PortalDisable	{Tag = "Westguard_GoldenFields"},
			PlayerTravelDisable	{},				
			-- Teleporter inaktiv solange Reisen nicht erlaubt ist
			MapFlagSetTrue	{Name = "mf_PlayerTravelDisabled"},
		},
		GotoState = "HoldPosition",
	},
};

--*******************************************************
--***                                                 ***
--***     			  		Akt1 		   			  ***
--***                                                 ***
--*******************************************************

State
{	
	StateName = "HoldPosition",
	
	--Nach der Startszene wird der erste Akt gestartet
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndIntroCS"},
		},
		Actions =
		{
			VisualTimerStart	{Seconds = 900},
			
			MapFlagSetTrue {Name = "mf_VisualTimerStart"},
			MapTimerStart	{Name = "mt_AdditionalTroopSpawningTimer"},
			MapTimerStart	{Name = "mt_GargoyleAttackTimer"},
			
			PlayerActivate	{Player = "pl_Beast"},
    		PlayerActivate	{Player = "pl_Beast2"},
    		PlayerActivate	{Player = "pl_Undead"},
    		PlayerActivate	{Player = "pl_Undead2"},
    		PlayerActivate	{Player = "pl_Undead3"},
    		
    		PlayerKitTransfer	{Player = "pl_Beast", PlayerKit = "pk_kit3"}, 
    		PlayerKitTransfer	{Player = "pl_Beast2", PlayerKit = "pk_kit4"},
    		PlayerKitTransfer	{Player = "pl_Undead", PlayerKit = "pk_kit5"},
    		PlayerKitTransfer	{Player = "pl_Undead2", PlayerKit = "pk_kit6"},
    		PlayerKitTransfer	{Player = "pl_Undead3", PlayerKit = "pk_kit7"},		
    		
    		FigureAbilityAdd	{Tag = "Geweihter01", AbilityId = 094},
    		FigureAbilityAdd	{Tag = "Geweihter02", AbilityId = 094},
    		FigureAbilityAdd	{Tag = "Geweihter03", AbilityId = 094},
    		
    		SoundGlobalPlayOnce	{File = "06_level/map_no_01_horn"},
			MapTimerStart	{Name = "mt_AttackSoundTimer"},
		},
		
	},	
	--AdditionalTroopSpawn.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_AttackSoundTimer", Seconds = 5},
		},
		Actions =
		{
			SoundGlobalPlayOnce	{File = "06_level/map_no_01_horn"},
		},
		
	},	
	--AdditionalTroopSpawn.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_AdditionalTroopSpawningTimer", Seconds = 10},
		},
		Actions =
		{
			SoundGlobalPlayLoopedAddon1	{File = "06_level/lvl_palace_alarm"},
		},
		
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_AdditionalTroopSpawningTimer", Seconds = 25},
		},
		Actions =
		{
			SoundStopAddon1	{File = "06_level/lvl_palace_alarm"},
		},
		
	},	
	--AdditionalTroopSpawn.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_AdditionalTroopSpawningTimer", Seconds = 300},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_AdditionalTroopSpawn1"},
		},
		
	},	
	--Nach der Hälfte der Zeit ziehen die Military KI´s an.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_AdditionalTroopSpawningTimer", Seconds = 450},
		},
		Actions =
		{
			AITroupSizeSet	{Player = "pl_Beast2", Size = 20},
			AITroupSizeSet	{Player = "pl_Undead2", Size = 20},
			AITroupSizeSet	{Player = "pl_Undead3", Size = 20},
			AIUnitTimerSet	{Player = "pl_Beast2", Value = 15},
			AIUnitTimerSet	{Player = "pl_Undead2", Value = 15},
			AIUnitTimerSet	{Player = "pl_Undead3", Value = 15},
		},
		
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_AdditionalTroopSpawningTimer", Seconds = 600},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_AdditionalTroopSpawn2"},
		},
		
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_AdditionalTroopSpawningTimer", Seconds = 720},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_AdditionalTroopSpawn3"},
		},
		
	},	
	
	--Wenn die Shaikanstellungen überlaufen wurden, dann bekommt Computer Undead3 neue Ziele.
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerBuildingIsNotInRange	{Player = "pl_Human", BuildingId = 0, Range = 15, X = 392, Y = 264},
			PlayerFigureIsNotInRange	{Player = "pl_Human", Range = 15, X = 392, Y = 264},
			PlayerBuildingIsNotInRange	{Player = "pl_Human", BuildingId = 0, Range = 15, X = 473, Y = 464},
			PlayerFigureIsNotInRange	{Player = "pl_Human", Range = 15, X = 473, Y = 464},
		},
		Actions =
		{
			AIEnemyAdd	{Player = "pl_Undead3", Tag = "Defender07"},
		},
		
	},	
	
	--Wenn die Shaikanstellungen überlaufen wurden, dann bekommt Computer Beast neue Ziele.
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerBuildingIsNotInRange	{Player = "pl_Human", BuildingId = 0, Range = 15, X = 392, Y = 264},
			PlayerBuildingIsNotInRange	{Player = "pl_Human", BuildingId = 0, Range = 15, X = 322, Y = 219},
			PlayerFigureIsNotInRange	{Player = "pl_Human", Range = 15, X = 392, Y = 264},
			PlayerFigureIsNotInRange	{Player = "pl_Human", Range = 15, X = 322, Y = 219},
		},
		Actions =
		{
			AIEnemyAdd	{Player = "pl_Beast", Tag = "Defender07"},
		},
		
	},	
	
	--Wenn die Shaikanstellungen überlaufen wurden, dann bekommt Computer Beast2 neue Ziele.
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerBuildingIsNotInRange	{Player = "pl_Human", BuildingId = 0, Range = 15, X = 568, Y = 183},
			PlayerBuildingIsNotInRange	{Player = "pl_Human", BuildingId = 0, Range = 15, X = 593, Y = 177},
			PlayerFigureIsNotInRange	{Player = "pl_Human", Range = 15, X = 568, Y = 183},
			PlayerFigureIsNotInRange	{Player = "pl_Human", Range = 15, X = 593, Y = 177},
		},
		Actions =
		{
			AIEnemyAdd	{Player = "pl_Beast2", Tag = "Defender07"},
		},
		
	},	
	
	--Wenn die Shaikanstellungen überlaufen wurden, dann bekommt Computer Undead2 neue Ziele.
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerBuildingIsNotInRange	{Player = "pl_Human", BuildingId = 0, Range = 15, X = 473, Y = 464},
			PlayerFigureIsNotInRange	{Player = "pl_Human", Range = 15, X = 473, Y = 464},
		},
		Actions =
		{
			AIEnemyAdd	{Player = "pl_Undead2", Tag = "Defender07"},
		},
		
	},	
	
	--Wenn die Shaikanstellungen überlaufen wurden, dann bekommt Computer Undead neue Ziele.
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerBuildingIsNotInRange	{Player = "pl_Human", BuildingId = 0, Range = 15, X = 548, Y = 371},
			PlayerFigureIsNotInRange	{Player = "pl_Human", Range = 15, X = 548, Y = 371},
		},
		Actions =
		{
			AIEnemyAdd	{Player = "pl_Undead", Tag = "Defender07"},
		},
		
	},	
	

	--Wenn der Timer abgelaufen ist startet die zweite Cutszene
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_VisualTimerStart"},
			VisualTimerIsNotActive	{},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_TimerIsOver"},
			MapFlagSetTrue {Name = "mf_P410_StartDwarvesAndElvesCS"},
		},
		
	},	

	
	--GewihtenOutcries
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				MapValueIsGreaterOrEqual	{Name = "mv_OutcryPriest", Value = 3},
				AND
				{
					FigureIsDead	{Tag = "Geweihter01"},
					FigureIsDead	{Tag = "Geweihter02"},
					FigureIsDead	{Tag = "Geweihter03"},
					MapFlagIsTrue {Name = "mf_EndIntroCS"},
				},
			},	
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_OutcryEndeTimer"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_OutcryEndeTimer", Seconds = 7},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P410_StartEndFightCS"},
			MapTimerStop	{Name = "mt_OutcryEndeTimer"},
		},
		
	},
	
	--Atmozone wird getauscht sobald alle Kämpfe vorbei sind.
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Geweihter01"},
		},
		Actions =
		{
			AtmoZoneChange	{Tag = "warsound1", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
			AtmoZoneChange	{Tag = "warsound2", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
			AtmoZoneChange	{Tag = "warsound6", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
		},
	},
	
	--Atmozone wird getauscht sobald alle Kämpfe vorbei sind.
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Geweihter02"},
		},
		Actions =
		{
			AtmoZoneChange	{Tag = "warsound3", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
			AtmoZoneChange	{Tag = "warsound4", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
			AtmoZoneChange	{Tag = "warsound5", AtmoDay = "00_atmoset_humantown_day", AtmoNight = "00_atmoset_humantown_night"},
		},
	},
	
	
	--Wenn alle Geweihten tod sind werden alle Camps deaktiviert.
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_AllSorcererDead"},
		},
		Actions =
		{
			AIPlayerDeactivate	{Player = "pl_Beast"},
			AIPlayerDeactivate	{Player = "pl_Beast2"},
			AIPlayerDeactivate	{Player = "pl_Undead"},
			AIPlayerDeactivate	{Player = "pl_Undead2"},
			AIPlayerDeactivate	{Player = "pl_Undead3"},
		},
		
	},	
	
	
	--Nach der dritten Cutszene geht es im 3 Akt weiter
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_EndEndFightCS"},
			MapFlagIsTrue{ Name = "mf_EndDwarvesAndElvesCS"},
			QuestIsSolved {Quest = "WestguardA1_FollowEscapeRoute"},
		},
		Actions =
		{
			PortalEnable	{Tag = "Westguard_MistyCoast"},
			PortalEnable	{Tag = "Westguard_GoldenFields"},
			PlayerTravelEnable	{},	
			-- Teleporter wieder aktiv
			MapFlagSetFalse	{Name = "mf_PlayerTravelDisabled"},
		},
	},

};