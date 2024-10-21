--Achtung! Bei Timing-Anpassung auch Timer fuer OC-Gespraeche in P306_DunMora.lua anpassen!
---------------------------------------------------------------
State
{
	StateName = "INIT",
	
	
	OnOneTimeEvent
	{
		--respawn fuer evtl. tote Flugdaemonen aus Attack1
		--frueher als AttackInit, damit sie auch da sind
		--Tor auf, wegen pathing recht frueh
		Conditions = 
		{
			
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_01", Seconds = 1030}, 
			
		},
		Actions = 
		{
			GateSetOpen	{Tag = "P306Gate01"},--Tor auf, wegen pathing recht frueh
			MapFlagSetTrue	{Name = "mf_FlightDemonRespawnInit"}, -- Respawnen fuer Flugeinheiten
			MapFlagSetTrue {Name = "mf_DemonAttack2Running"}, --DemonShared01-04: Uebergabe der Units an KI, Rest ueber KI activate
			MapFlagSetTrue	{Name = "mf_SecondAttackInit"}, --condition fuer KI active, zusammen mit jew. Timer
		},
	},
	
	


	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_01", Seconds = 1080}, --!!!1080 (18Min) Dauer zwischen Ende Attack1 und begin Attack2;
			-- wenn Sekundendauer editiert wird, unbedingt auch Visual Timer in Dun_Mora.lua anpassen!
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_DemonAttack2_02"}, --Timer fuer Init
			MapTimerStart	{Name = "mt_DemonAttack2_03"}, --Timer fuer Warning1 und Fluestern
		 
			
			
		},
		
	};
	

	

-------------------------------------------------------------
					--Warning--
-------------------------------------------------------------

	
	

--Fluestern
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_03", Seconds = 3},
		},
		Actions = 
		{
			SoundGlobalPlayOnce	{File = "06_level/map_dm_01_whisper"},
		},
	},	

--Sansha warnt vor baldigem Angriff
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_03", Seconds = 5},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Sansha", TextTag = "Sansha1"}, --Das Fluestern, sie kommen bald
			MapFlagSetTrue	{Name = "mf_IndicatorDemonAttack2_on"},	 --Flag zum Anschalten der Pflanzen
			
		},
	},
	
	
--Fluestern2

	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_03", Seconds = 13},
		},
		Actions = 
		{
			SoundGlobalPlayOnce	{File = "06_level/map_dm_01_whisper"},
		},
	},
	
	



----------------------------------------------------------
-----------------------------------------------------------
						--Attacke--
----------------------------------------------------------

	--Daemonen greifen an
	--AI wird aktiviert
	--Demon SharedScripte: 
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_02", Seconds = 3},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_DemonAttack2_04"}, --Timer fuer Dauer der Attacke2
			
			PlayerActivate	{Player = "pl_Demon"}, --Military Spawn-AI an
			MapFlagSetTrue	{Name = "mf_SpawnAttack2Boss"},
		},
		
	};
	
	

	--Bodentruppen-KI frueher aktivieren, weil sie so lange braucht
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SecondAttackInit"},
			--MapTimerIsElapsed	{Name = "mt_DemonAttack2_02", Seconds = 5},
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_01", Seconds = 1040}, 
		},
		Actions = 
		{
			PlayerActivate	{Player = "pl_GroundDemon"}, --Military Boden-AI an  
		},
		
	};

	--Flugeinheiten aktivieren
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SecondAttackInit"},
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_02", Seconds = 10},
		},
		Actions = 
		{
			
			PlayerActivate	{Player = "pl_FlightDemon"}, --Military Flug-AI an
			
			
			
		},
	},

	--Sansha macht Panik
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_02", Seconds = 15},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Sansha", TextTag = "Sansha2"}, --sie kommen jetzt
			SoundGlobalPlayOnce	{File = "06_level/map_dm_01_whisper"},
		},
	},


------------------------------------------------------------
					--Rueckzug--
------------------------------------------------------------	
	--Daemonen ziehen sich zurueck
	--nach Ablauf der Zeit
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_04", Seconds = 360}, --!!! 360 Dauer der Attacke 6 Minuten		
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_Retreat02"},
			
			AIMilitaryOffensiveSet	{Player = "pl_GroundDemon", Percent = 0},
			AIMilitaryOffensiveSet	{Player = "pl_FlightDemon", Percent = 0},
			AIMilitaryOffensiveSet	{Player = "pl_Demon", Percent = 30},
			
			--MapFlagSetFalse  {Name = "mf_DemonAttackRunning"}, --InitAus für Demon Shared: Waypoints fuer Attack
			MapFlagSetFalse {Name = "mf_DemonAttack2Running"}, --InitAus für Demon Shared02: Waypoints fuer Attack
			
			MapFlagSetTrue	{Name = "mf_IndicatorDemonAttack2_off"},--Flag zum Ausschalten der Pflanzen
			MapFlagSetTrue	{Name = "mf_DemonAttack2Defeated"},
			
			QuestSetSolved	{Player = "default", Quest = "DefendAgainstDemons2"},
			QuestSetActive	{Player = "default", Quest = "DefeatDemons"},
			
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar2"}, --sie ziehen sich zurück!
			
		},
	},
	
	
	
	
	------------------------------------------------------------------------
	--falls camps schon zerstoert, wenn Zeit abgelaufen:
	--in naechsten State und kein OC Sansha
	OnOneTimeEvent
	{
		GotoState = "Attack2Over",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_Retreat02"},
			BuildingIsDead	{Tag = "P306_DemonShrine_01"},
			BuildingIsDead	{Tag = "P306_DemonShrine_02"},
			BuildingIsDead	{Tag = "P306_DemonShrine_03"},
			BuildingIsDead	{Tag = "P306_DemonShrine_04"},		
			
		},
		Actions = 
		{
			
		},
	},
	
	--falls camps noch nicht oder nur teilweise zerstoert:
	--OC Sansha: Ab in den Norden, das Camp zerstoeren
	OnOneTimeEvent
	{
		GotoState = "Attack2Over",
		Conditions = 
		{
			
			MapFlagIsTrue {Name = "mf_Retreat02"},
			OR	
			{
				BuildingIsAlive	{Tag = "P306_DemonShrine_01"},
				BuildingIsAlive	{Tag = "P306_DemonShrine_02"},
				BuildingIsAlive	{Tag = "P306_DemonShrine_03"},
				BuildingIsAlive	{Tag = "P306_DemonShrine_04"},
			},
				
		},
		Actions = 
		{
			--FigureOutcry	{Tag = "Sansha", TextTag = "Sansha3"}, 
			FigureOutcryAlert	{TextTag = "Sansha3", Tag = "Sansha", TargetTag = "P306_DemonShrine_01"}, -- auf in den Norden, zerstoeren wir ihre Nester!
			
			
		},
	},
	
	


-------------------------------------------------
--nicht uebergeben Elfen bei Attack2 neutral schalten
------------------------------------------------



-- Gruppe1, Geist1
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_Exhauster1Unbanned"},
			MapFlagIsTrue {Name = "mf_DemonAttack2Running"},		
		},
		Actions = 
		{
			FigureTeamTransfer	{Tag = "Group1Elf01", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group1Elf02", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group1Elf03", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group1Elf04", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group1Elf05", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group1Elf06", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group1Elf07", Team = "tm_ElfNeutral"},
		  	FigureTeamTransfer  {Tag = "Group1Elf08", Team = "tm_ElfNeutral"},
	     	FigureTeamTransfer  {Tag = "Group1Elf09", Team = "tm_ElfNeutral"},
	        FigureTeamTransfer  {Tag = "Group1Elf10", Team = "tm_ElfNeutral"},
	     },   
	        
	  },      
	-- Gruppe2, Geist2
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_Exhauster2Unbanned"},
			MapFlagIsTrue {Name = "mf_DemonAttack2Running"},		
		},
		Actions = 
		{
			FigureTeamTransfer	{Tag = "Group2Elf01", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group2Elf02", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group2Elf03", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group2Elf04", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group2Elf05", Team = "tm_ElfNeutral"},
			
		},                                            
	},
	
	-- Gruppe3, Geist3
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_Exhauster3Unbanned"},
			MapFlagIsTrue {Name = "mf_DemonAttack2Running"},		
		},
		Actions = 
		{
			FigureTeamTransfer	{Tag = "Group3Elf01", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group3Elf02", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group3Elf03", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group3Elf04", Team = "tm_ElfNeutral"},
			
		},                                            
	},
	
	-- Gruppe4, Geist4
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_Exhauster4Unbanned"},
			MapFlagIsTrue {Name = "mf_DemonAttack2Running"},		
		},
		Actions = 
		{
			FigureTeamTransfer	{Tag = "Group4Elf01", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group4Elf02", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group4Elf03", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group4Elf04", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group4Elf05", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group4Elf06", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group4Elf07", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group4Elf08", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group4Elf09", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group4Elf10", Team = "tm_ElfNeutral"},
		},                                           
	},
	
	-- Gruppe5, Geist5
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_Exhauster5Unbanned"},
			MapFlagIsTrue {Name = "mf_DemonAttack2Running"},		
		},
		Actions = 
		{
			FigureTeamTransfer	{Tag = "Group5Elf01", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group5Elf02", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group5Elf03", Team = "tm_ElfNeutral"},
			FigureTeamTransfer	{Tag = "Group5Elf04", Team = "tm_ElfNeutral"},
			
		},
	},

}


---------------------------------------------------------------	
	-- Script ausschalten nach Daemonenattacke2 --
---------------------------------------------------------------
State
{
	StateName = "Attack2Over",	
	
}
