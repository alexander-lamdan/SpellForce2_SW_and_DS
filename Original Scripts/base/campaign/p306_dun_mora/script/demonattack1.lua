State
{
	StateName = "INIT",
	--zum Attack-State wechseln, wenn Zeit fue Attacke gekommen, 
	--Timer wird in Dialog mit Sansha gestartet
	OnOneTimeEvent
	{
		GotoState = "DemonAttackI",
		Conditions = 
		{
			OR
			{
				MapTimerIsElapsed	{Name = "mt_DemonAttack1_Init", Seconds = 900}, --900 Zeit bis erster Angriff
				--!!! 900 , wird im Dialog mit Sansha gestartet
				MapFlagIsTrue	{Name = "mf_AllGhostsUnbanned"},
				-- oder wenn alle Geister gebannt
			}
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_DemonAttack1_01"},
		},
	},
}

-------------------------------------------------------------
					--Warning--
-------------------------------------------------------------
-- Shae warnt vor bald anrueckenden Daemonen:
-- WarningI
State
{
	StateName = "DemonAttackI",	
	--Init fuer Attacke
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack1_01", Seconds = 5},	
		},
		Actions = 
		{
			FigureOutcry	{Tag = "pl_HumanHeroShae", TextTag = "Shae1"}, --bald kommen die daemomen zurueck!
			MapTimerStart	{Name = "mt_DemonAttack1_02"}, --Timer fuer WarningII
			
			MapFlagSetTrue	{Name = "mf_SpawnAttack1Boss"}, --Flag fuer Spawning von Attack1Boss
			
			MapFlagSetTrue	{Name = "mf_IndicatorDemonAttack1_on"},	 --Flag zum Anschalten der Pflanzen
			
			MapTimerStart	{Name = "mt_DemonAttack1_03"}, --Init fuer Attacke begin
		},
	},
   
   
   
   --Fluestern
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack1_02", Seconds = 6},			
		},
		Actions = 
		{
			--SoundGlobalPlayLooped	{File = "06_level/map_dm_01_whisper"},
			SoundGlobalPlayOnce	{File = "06_level/map_dm_01_whisper"},
		},
	},
           

	--WarningII: Shae warnt vor gleich anrueckenden Daemonen:
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack1_02", Seconds = 10},			
		},
		Actions = 
		{
			FigureOutcry	{Tag = "pl_HumanHeroShae", TextTag = "Shae2"}, --das fluestern, sie kommen!
			QuestSetActive	{Player = "default", Quest = "DefendAgainstDemons1"},
			SoundGlobalPlayOnce	{File = "06_level/map_dm_01_whisper"},
		},
	},
                      



-----------------------------------------------------------
						--Attacke--
----------------------------------------------------------


	
	-- Daemonen bereit zum Abmarsch
	-- Init für Demon Shared.lua: Waypoints fuer Attack

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack1_03", Seconds = 2}, --startet mit OC WarningI
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_FirstAttackInit"},
			MapTimerStart	{Name = "mt_DemonAttack1_04"}, --Timer fuer Dauer der Attacke (Rueckzug)
			MapFlagSetTrue  {Name = "mf_DemonAttackRunning"}, --Init für Demon Shared.lua: Waypoints fuer Attack
			SoundGlobalPlayOnce	{File = "06_level/map_dm_01_whisper"},
		},
	},
	
	
	


------------------------------
------------------------------
--genaues goto in Demon Shared.lua
-------------------------------
-------------------------------
	


	
	
------------------------------------------------------------
					--Rueckzug--
------------------------------------------------------------

-- Wenn Zeit abgelaufen: Daemonen ziehen sich zurueck
-- InitAus für Demon Shared: Waypoints fuer Attack ausgeschaltet

	OnOneTimeEvent
	{
		GotoState = "Attack1Over",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack1_04", Seconds = 240},	--!!! 240, dauer der Attacke		
			MapFlagIsFalse {Name = "mf_AllSuckerDemonsDead01"},
		},
		Actions = 
		{
			MapFlagSetFalse  {Name = "mf_DemonAttackRunning"}, --InitAus für Demon Shared: Waypoints fuer Attack
			MapFlagSetTrue {Name = "mf_Retreat01"},
			
			MapFlagSetTrue	{Name = "mf_IndicatorDemonAttack1_off"},	--Flag zum Ausschalten der Pflanzen
			MapTimerStart	{Name = "mt_DemonAttack1_05"},
			
			FigureOutcry		{Tag = "pl_HumanAvatar", TextTag = "Avatar2"}, --sie ziehen sich zurück!
			--SoundStop	{File = "06_level/map_dm_01_whisper"},
			
			QuestSetSolved	{Player = "default", Quest = "DefendAgainstDemons1"},
			QuestSetSolved	{Player = "default", Quest = "DemonTime"},
		},
	},
	
	
	
	-- ODER wenn alle Sucker-Daemonen tot sind, 
	-- InitAus für Demon Shared: Waypoints fuer Attack ausgeschaltet
	
	OnOneTimeEvent
	{
		GotoState = "Attack1Over",
		Conditions = 
		{		
			MapFlagIsTrue {Name = "mf_AllSuckerDemonsDead01"},
		},
		Actions = 
		{
			MapFlagSetFalse  {Name = "mf_DemonAttackRunning"}, --InitAus für Demon Shared: Waypoints fuer Attack
			MapFlagSetTrue {Name = "mf_Retreat01"},
			
			MapFlagSetTrue	{Name = "mf_IndicatorDemonAttack1_off"},	--Flag zum Ausschalten der Pflanzen
			MapTimerStart	{Name = "mt_DemonAttack1_05"},
			
			--FigureOutcry		{Tag = "pl_HumanAvatar", TextTag = "Avatar2"}, --sie ziehen sich zurück!
			QuestSetSolved	{Player = "default", Quest = "DefendAgainstDemons1"},
			QuestSetSolved	{Player = "default", Quest = "DemonTime"},
			SoundStop	{File = "06_level/map_dm_01_whisper"},
		},
	},
	
}
	
--------------------------------------------------------------	
---------------------------------------------------------------	

	-- nach Daemonenattacke1 
	
		
State
{
	StateName = "Attack1Over",	
	OnOneTimeEvent
	{
		GotoState = "Off",
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_DemonAttack1_05", Seconds = 3}, 
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_CutsceneSanshaInit"}, --Init CS Sansha
			MapFlagSetTrue	{Name = "mf_Attack01Over"}, -- auch Flag fuer RewardScript und Flag fuer OC zurueck zur Koenigin
			
			MapTimerStart	{Name = "mt_DemonAttackLoop_02"}, --Timer fuer Loop, in Loop-Script zusammen mit FlagAbfrage Io weg
			
		},
	},
	
	
	

}

State
{
	StateName = "Off",	
	
}