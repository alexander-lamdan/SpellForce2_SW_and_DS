-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "FirstActions",

	OnOneTimeEvent
	{
		GotoState = "Arrival",
		Conditions =
		{
			QuestIsActive	{Player = "default", Quest = "GFPart7ElvenAmbassador"},
			QuestIsActive	{Player = "default", Quest = "OpenPortal"},
		},

		Actions =
		{
			--Quests solven Map erreicht
			QuestSetSolved	{Player = "default", Quest = "GFPart7ElvenAmbassador"}, --uebergeordnete Quest
			QuestSetSolved	{Player = "default", Quest = "OpenPortal"}, --aus GF "Portal nach Dun Mora benutzen"
			--MapFlagSetTrue {Name = "mf_PlayerReachedDM"}, --Flag fuer RewardScript
			FogOfWarRevealAtEntity	{Tag = "Sansha", Range = 10, Height = default},
			FogOfWarTeamAdd	{Team = "tm_HumanPlayer"}, -- Shae
			
		},
	},
};

OnOneTimeEvent
{
    Conditions =
    {
    },
    Actions =
    {
         FigureSwappingDisable {Tag = "GhostExhauster01"},
         FigureSwappingDisable {Tag = "GhostExhauster02"},
         FigureSwappingDisable {Tag = "GhostExhauster03"},
         FigureSwappingDisable {Tag = "GhostExhauster04"},
         FigureSwappingDisable {Tag = "GhostExhauster05"},
         
         FigureSwappingDisable {Tag = "ElvenGuard01"},
         FigureSwappingDisable {Tag = "ElvenGuard02"},
         FigureSwappingDisable {Tag = "ElvenGuard03"},
         FigureSwappingDisable {Tag = "ElvenGuard04"},
         
         FigureSwappingDisable {Tag = "Sansha"},
         
    }
}


State
{
	StateName = "Arrival",

----------------------------------------------------------------------
-- BEFREIUNG UNTER BANN STEHENDER ELFEN
-----------------------------------------------------------------------

	-- Gruppe1, Geist1
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Exhauster1Unbanned"},	-- ist auch Flag fuer RerwardScript
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_UnbannedGhosts", Value = 1},


			FigureTeamTransfer	{Tag = "Group1Elf01", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group1Elf02", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group1Elf03", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group1Elf04", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group1Elf05", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group1Elf06", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group1Elf07", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group1Elf08", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group1Elf09", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group1Elf10", Team = "tm_HumanPlayer"},

			FigurePlayerTransfer	{Tag = "Group1Elf01", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group1Elf02", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group1Elf03", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group1Elf04", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group1Elf05", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group1Elf06", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group1Elf07", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group1Elf08", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group1Elf09", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group1Elf10", Player = "pl_Human"},

			--310 = Druid, 309 = Ranger
			--883 = Ranger Dun Mora, 884 = Druid Dun Mora
			FigureUnitChange	{Tag = "Group1Elf01", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group1Elf02", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group1Elf03", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group1Elf04", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group1Elf05", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group1Elf06", UnitId = 884, Level = 7},
			FigureUnitChange	{Tag = "Group1Elf07", UnitId = 884, Level = 7},
			FigureUnitChange	{Tag = "Group1Elf08", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group1Elf09", UnitId = 884, Level = 7},
			FigureUnitChange	{Tag = "Group1Elf10", UnitId = 883, Level = 7},

			MapFlagSetTrue  {Name = "mf_ArcherIsFree1"},
			MapTimerStart {Name = "mt_Group1Freed"},
			FogOfWarCloak	{FogOfWarId = 01}, --Position Geist bei Dialog
			FogOfWarCloak	{FogOfWarId = 06}, --Position Leiche 
		},
	},



	-- ElfArcher nach Befreiung, alle Elfen zum Sammelpunkt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ArcherIsFree1"},
			MapTimerIsElapsed {Name = "mt_Group1Freed", Seconds = 5},
		},
		Actions =
		{
			FigureOutcryAlert	{Tag = "Group1Elf01", TextTag = "Elfarcher3", TargetTag = "Group1Elf01"},
			--FigureOutcry	{Tag = "Group1Elf01", TextTag = "Elfarcher3"},
			FigureForcedRun	{Tag = "Group1Elf01", X = 365, Y = 365},
			FigureForcedRun	{Tag = "Group1Elf02", X = 366, Y = 365},
			FigureForcedRun	{Tag = "Group1Elf03", X = 367, Y = 365},
			FigureForcedRun	{Tag = "Group1Elf04", X = 368, Y = 365},
			FigureForcedRun	{Tag = "Group1Elf05", X = 369, Y = 365},
			FigureForcedRun	{Tag = "Group1Elf06", X = 365, Y = 364},
			FigureForcedRun	{Tag = "Group1Elf07", X = 366, Y = 364},
			FigureForcedRun	{Tag = "Group1Elf08", X = 367, Y = 364},
			FigureForcedRun	{Tag = "Group1Elf09", X = 368, Y = 364},
			FigureForcedRun	{Tag = "Group1Elf10", X = 369, Y = 364},
		},
	},


	--------------------------------
	-- Gruppe2, Geist2
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Exhauster2Unbanned"},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_UnbannedGhosts", Value = 1},


			FigureTeamTransfer	{Tag = "Group2Elf01", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group2Elf02", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group2Elf03", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group2Elf04", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group2Elf05", Team = "tm_HumanPlayer"},


			FigurePlayerTransfer	{Tag = "Group2Elf01", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group2Elf02", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group2Elf03", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group2Elf04", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group2Elf05", Player = "pl_Human"},


			FigureUnitChange	{Tag = "Group2Elf01", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group2Elf02", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group2Elf03", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group2Elf04", UnitId = 884, Level = 7},
			FigureUnitChange	{Tag = "Group2Elf05", UnitId = 884, Level = 7},



			MapFlagSetTrue   {Name = "mf_ArcherIsFree2"},
			MapTimerStart {Name = "mt_Group2Freed"},
			FogOfWarCloak	{FogOfWarId = 02},
		},
	},



	-- ElfArcher nach Befreiung, alle Elfen zum Sammelpunkt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ArcherIsFree2"},
			MapTimerIsElapsed {Name = "mt_Group2Freed", Seconds = 5},
		},
		Actions =
		{
			FigureOutcryAlert	{Tag = "Group2Elf01", TextTag = "Elfarcher2", TargetTag = "Group2Elf01"},
			--FigureOutcry	{Tag = "Group2Elf01", TextTag = "Elfarcher2"},
			FigureForcedRun	{Tag = "Group2Elf01", X = 376, Y = 365},
			FigureForcedRun	{Tag = "Group2Elf02", X = 377, Y = 365},
			FigureForcedRun	{Tag = "Group2Elf03", X = 378, Y = 365},
			FigureForcedRun	{Tag = "Group2Elf04", X = 376, Y = 364},
			FigureForcedRun	{Tag = "Group2Elf05", X = 378, Y = 364},

		},
	},

	-------------------------
	-- Gruppe3, Geist3
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Exhauster3Unbanned"},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_UnbannedGhosts", Value = 1},


			FigureTeamTransfer	{Tag = "Group3Elf01", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group3Elf02", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group3Elf03", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group3Elf04", Team = "tm_HumanPlayer"},

			FigurePlayerTransfer	{Tag = "Group3Elf01", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group3Elf02", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group3Elf03", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group3Elf04", Player = "pl_Human"},

			FigureUnitChange	{Tag = "Group3Elf01", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group3Elf02", UnitId = 884, Level = 7},
			FigureUnitChange	{Tag = "Group3Elf03", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group3Elf04", UnitId = 884, Level = 7},


			MapTimerStart {Name = "mt_Group3Freed"},
			MapFlagSetTrue   {Name = "mf_ArcherIsFree3"},
			FogOfWarCloak	{FogOfWarId = 03},
		},
	},



	-- ElfArcher nach Befreiung, alle Elfen zum Sammelpunkt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ArcherIsFree3"},
			MapTimerIsElapsed {Name = "mt_Group3Freed", Seconds = 5},
		},
		Actions =
		{
			FigureOutcryAlert	{Tag = "Group3Elf01", TextTag = "Elfarcher3", TargetTag = "Group3Elf01"},
			--FigureOutcry	{Tag = "Group3Elf01", TextTag = "Elfarcher3"},
			FigureForcedRun	{Tag = "Group3Elf01", X = 381, Y = 365},
			FigureForcedRun	{Tag = "Group3Elf02", X = 382, Y = 365},
			FigureForcedRun	{Tag = "Group3Elf03", X = 383, Y = 365},
			FigureForcedRun	{Tag = "Group3Elf04", X = 382, Y = 364},

		},
	},


	-------------------------
	-- Gruppe4, Geist4
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Exhauster4Unbanned"},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_UnbannedGhosts", Value = 1},


			FigureTeamTransfer	{Tag = "Group4Elf01", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group4Elf02", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group4Elf03", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group4Elf04", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group4Elf05", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group4Elf06", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group4Elf07", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group4Elf08", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group4Elf09", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group4Elf10", Team = "tm_HumanPlayer"},

			FigurePlayerTransfer	{Tag = "Group4Elf01", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group4Elf02", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group4Elf03", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group4Elf04", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group4Elf05", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group4Elf06", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group4Elf07", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group4Elf08", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group4Elf09", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group4Elf10", Player = "pl_Human"},

			FigureUnitChange	{Tag = "Group4Elf01", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group4Elf02", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group4Elf03", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group4Elf04", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group4Elf05", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group4Elf06", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group4Elf07", UnitId = 884, Level = 7},
			FigureUnitChange	{Tag = "Group4Elf08", UnitId = 884, Level = 7},
			FigureUnitChange	{Tag = "Group4Elf09", UnitId = 884, Level = 7},
			FigureUnitChange	{Tag = "Group4Elf10", UnitId = 883, Level = 7},

			MapTimerStart {Name = "mt_Group4Freed"},
			MapFlagSetTrue   {Name = "mf_ArcherIsFree4"},
			FogOfWarCloak	{FogOfWarId = 04},	--Position geist bei Dialog
			FogOfWarCloak	{FogOfWarId = 07}, --Position Botschaft im Sumpf
		},
	},



	-- ElfArcher nach Befreiung; alle Elfen zum Sammelpunkt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ArcherIsFree4"},
			MapTimerIsElapsed {Name = "mt_Group4Freed", Seconds = 5},
		},
		Actions =
		{
			FigureOutcryAlert	{Tag = "Group4Elf01", TextTag = "Elfarcher4", TargetTag = "Group4Elf01"},
			--FigureOutcry	{Tag = "Group4Elf01", TextTag = "Elfarcher4"},
			FigureForcedRun	{Tag = "Group4Elf01", X = 368, Y = 361},
			FigureForcedRun	{Tag = "Group4Elf02", X = 369, Y = 361},
			FigureForcedRun	{Tag = "Group4Elf03", X = 370, Y = 361},
			FigureForcedRun	{Tag = "Group4Elf04", X = 371, Y = 361},
			FigureForcedRun	{Tag = "Group4Elf05", X = 372, Y = 361},
			FigureForcedRun	{Tag = "Group4Elf06", X = 368, Y = 360},
			FigureForcedRun	{Tag = "Group4Elf07", X = 369, Y = 360},
			FigureForcedRun	{Tag = "Group4Elf08", X = 370, Y = 360},
			FigureForcedRun	{Tag = "Group4Elf09", X = 371, Y = 360},
			FigureForcedRun	{Tag = "Group4Elf10", X = 372, Y = 360},
		},
	},

	-------------------------
	-- Gruppe5, Geist5
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Exhauster5Unbanned"},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_UnbannedGhosts", Value = 1},


			FigureTeamTransfer	{Tag = "Group5Elf01", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group5Elf02", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group5Elf03", Team = "tm_HumanPlayer"},
			FigureTeamTransfer	{Tag = "Group5Elf04", Team = "tm_HumanPlayer"},

			FigurePlayerTransfer	{Tag = "Group5Elf01", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group5Elf02", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group5Elf03", Player = "pl_Human"},
			FigurePlayerTransfer	{Tag = "Group5Elf04", Player = "pl_Human"},

			FigureUnitChange	{Tag = "Group5Elf01", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group5Elf02", UnitId = 883, Level = 7},
			FigureUnitChange	{Tag = "Group5Elf03", UnitId = 884, Level = 7},
			FigureUnitChange	{Tag = "Group5Elf04", UnitId = 884, Level = 7},

			MapTimerStart {Name = "mt_Group5Freed"},
			MapFlagSetTrue   {Name = "mf_ArcherIsFree5"},
			FogOfWarCloak	{FogOfWarId = 05},
		},
	},



	-- ElfArcher nach Befreiung, alle Elfen zum Sammelpunkt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ArcherIsFree5"},
			MapTimerIsElapsed {Name = "mt_Group5Freed", Seconds = 5},
		},
		Actions =
		{
			FigureOutcryAlert	{Tag = "Group5Elf01", TextTag = "Elfarcher5", TargetTag = "Group5Elf01"},
			--FigureOutcry	{Tag = "Group5Elf01", TextTag = "Elfarcher5"},
			FigureForcedRun	{Tag = "Group5Elf01", X = 379, Y = 361},
			FigureForcedRun	{Tag = "Group5Elf02", X = 380, Y = 361},
			FigureForcedRun	{Tag = "Group5Elf03", X = 381, Y = 361},
			FigureForcedRun	{Tag = "Group5Elf04", X = 380, Y = 360},

		},
	},


-------------------------------------------
--Quest-Management
--------------------------------------------
------------------------
 -- wenn alle Geister erloest:
	OnOneTimeEvent
	{

		Conditions =
		{
			MapValueIsEqual	{Name = "mv_UnbannedGhosts", Value = 5},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_AllGhostsUnbanned"},
			QuestSetSolved	{Player = "default", Quest = "DunMorapart1"}, --eine neue Hoffnung

			QuestSetSolved	{Player = "default", Quest = "FreeDirges"}, --die Klagegeister
		},
	},


---------------------------------------------------------------
--------------------------------------------------------------
--Timer fuer Aufbau-Attacke druch Creeps
OnOneTimeEvent
	{

		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Attack01Over"},
			MapFlagIsTrue	{Name = "mf_CutsceneSanshaDone"}, --Io muss wieder da sein
			OR
			{
				PlayerHasBuilding	{Player = "default", BuildingId = 115, UpgradeId = default, Amount = 1, OnlyCompleted = default},
				PlayerHasBuilding	{Player = "default", BuildingId = 116, UpgradeId = default, Amount = 1, OnlyCompleted = default},
				PlayerHasBuilding	{Player = "default", BuildingId = 118, UpgradeId = default, Amount = 1, OnlyCompleted = default},
			}

		},
		Actions =
		{
			MapTimerStart	{Name = "mt_Creep_Attack"},

		},
	},


-----------------------------------------------------------------------------
--Timer Start fuer Attack2
--wegen linearem Ablauf: erst started, wenn Attack1 vorbei UND Spieler wieder bei Sansha war
--------------------------------------------------------------------------------
OnOneTimeEvent
	{

		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Attack01Over"},
			MapFlagIsTrue	{Name = "mf_CutsceneSanshaDone"}, --Io muss wieder da sein
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_DemonAttack2_01"}, --Init Attacke2
			VisualTimerStart	{Seconds = 1090}, --1090 Dauer des Timers zw. Attack1und2
			PlayerResourceLenyaGive	{Player = "default", Amount = 300},
			PlayerResourceSilverGive	{Player = "default", Amount = 300},
			PlayerResourceStoneGive	{Player = "default", Amount = 300},
		},
	},


-----------------------------------------------------
-----------------------------------------------------
					--OUTCRIES--
------------------------------------------------------
--System OC, wenn Shae uebergeben wurde
OnOneTimeEvent
	{

		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_IoDone"},
			MapTimerIsElapsed {Name = "mt_WelcomeShae", Seconds = 2},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "System1", Tag = "System_Npc"}, --SYSTEM-OC: sie haben einen Helden bekommen
			
		},
	},
	
	
	
-- Outcry Shae, Erstauenen, dass die anderen da sind
OnOneTimeEvent
	{

		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_IoDone"},
			MapTimerIsElapsed {Name = "mt_WelcomeShae", Seconds = 5},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Shae8", Tag = "pl_HumanHeroShae"}, --was sit geschehen?
			FigureOutcry	{TextTag = "Lya3", Tag = "pl_HumanHeroLya"}, --shaikur wird belagert
		},
	},

--Outcry Bor:  Welcome

OnOneTimeEvent
	{

		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_IoDone"},
			MapTimerIsElapsed {Name = "mt_WelcomeShae", Seconds = 25},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Bor3", Tag = "pl_HumanHeroBor"}, --willkommen
			FigureOutcry	{TextTag = "Shae7", Tag = "pl_HumanHeroShae"},--spar die deine sprueche
		},
	},
---------------------------------------------------------------------------------

--System-OC direkt nach CS, in der Io wiederkommt
OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_01", Seconds = 5},
		},
		Actions =
		{
			FigureOutcry	{Tag = "System_Npc", TextTag = "System2"}, --System-OC: Elfen haben sich angeschlossen!
			
		},
	},




--OC zurueck zur Koenigin anch Attack1
OnOneTimeEvent
	{

		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Attack01Over"}, --gesetzt in DemonAttack1.lua
			PlayerIsNotGameOver	{Player = "default"},
		},
		Actions =
		{
			FigureOutcryAlert	{TextTag = "ElvenGuard01", Tag = "ElvenGuard01", TargetTag = "Sansha"},
			--FigureOutcry	{TextTag = "ElvenGuard01", Tag = "ElvenGuard01"}, --Komm zur Koenigin!
			QuestSetActive	{Player = "default", Quest = "ReturnToSansha"},
		},
	},



--------------------------------------------------------------------------------
--Gespraech Sansha - Lya direkt nach CS Ios Wiederkehr

OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_01", Seconds = 10},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Sansha", TextTag = "LyaReturn01"}, --So sehen wir dich wieder
			FigureOutcry	{Tag = "pl_HumanHeroLya", TextTag = "LyaReturn02"}, --Scham hielt mich fern
			FigureOutcry	{Tag = "Sansha", TextTag = "LyaReturn03"}, --du musstest Lektion lernen
			FigureOutcry	{Tag = "pl_HumanHeroLya", TextTag = "LyaReturn04"}, --um welchen Preis
			FigureOutcry	{Tag = "pl_HumanHeroJared", TextTag = "LyaReturn05"}, -- was war denn?
			FigureOutcry	{Tag = "pl_HumanHeroLya", TextTag = "LyaReturn06"}, --Blablabla
			FigureOutcry	{Tag = "pl_HumanHeroLya", TextTag = "LyaReturn07"}, --blablablablubbb
		},
	},

------------------------------------------------------------------------------------
--Gespraech Jared - Shae waehrend Aufbau

OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_01", Seconds = 360}, --6 Minuten nach Uebergabe des HQ
		},
		Actions =
		{
			FigureOutcry	{Tag = "pl_HumanHeroJared", TextTag = "JaredShae01"}, --bist jetzt auch meine Schwester?
			FigureOutcry	{Tag = "pl_HumanHeroShae", TextTag = "JaredShae02"}, --ja, boese, klein
			FigureOutcry	{Tag = "pl_HumanHeroJared", TextTag = "JaredShae03"}, --boese?
			FigureOutcry	{Tag = "pl_HumanHeroShae", TextTag = "JaredShae04"}, --ja, ich esse neugierige Kerle
			FigureOutcry	{Tag = "pl_HumanHeroJared", TextTag = "JaredShae05"}, --oh.

		},
	},

------------------------------------------------------------------------
------------------------------------------------------------------------
-----------------------------------------------------------------------
--Io gibt Hinweis auf Rohstoffe

OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_DemonAttack2_01", Seconds = 120}, --2 Minuten nach Uebergabe des HQ
		},
		Actions =
		{
			FigureOutcry	{Tag = "Io", TextTag = "Io1"}, --Rohstoffe im Sumpf
			FigureOutcry	{Tag = "Io", TextTag = "Io2"}, --dort ist es gefaehrlich
			
			--Aufdecken der Ressourcen auﬂerhalb ds Lagers
			FogOfWarReveal	{FogOfWarId = 20, X = 264, Y = 316, Range = 8, Height = default}, --Stein, Westen
			FogOfWarReveal	{FogOfWarId = 21, X = 209, Y = 374, Range = 8, Height = default}, --Lenya, Westen
			FogOfWarReveal	{FogOfWarId = 22, X = 251, Y = 417, Range = 8, Height = default}, --Silber, Westen
			FogOfWarReveal	{FogOfWarId = 23, X = 491, Y = 306, Range = 8, Height = default}, --Silber, Osten
			FogOfWarReveal	{FogOfWarId = 24, X = 524, Y = 382, Range = 8, Height = default}, --Lenya, Osten
		},
	},


---------------------------------------------------------------------
---------------------------------------------------------------------
-- Flag, wenn alle Suckerdemons tot (fuer CS Sansha Init in Attack1.lua)
OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Demon01"},
			FigureIsDead	{Tag = "Demon02"},
			FigureIsDead	{Tag = "Demon03"},
			FigureIsDead	{Tag = "Demon04"},
			FigureIsDead	{Tag = "Demon05"},
			FigureIsDead	{Tag = "Demon06"},
			FigureIsDead	{Tag = "Demon07"},
			FigureIsDead	{Tag = "Demon08"},
			FigureIsDead	{Tag = "Demon09"},
			FigureIsDead	{Tag = "Demon10"},
			FigureIsDead	{Tag = "Demon11"},
			FigureIsDead	{Tag = "Demon12"},
			FigureIsDead	{Tag = "Demon13"},
			FigureIsDead	{Tag = "Demon14"},
			FigureIsDead	{Tag = "Demon15"},
			FigureIsDead	{Tag = "Demon16"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_AllSuckerDemonsDead01"},

		},
	},




------------------------------------------------------------------------
-------------------------------------------------------------------------


-- CAMP ZERSTOERUNG!!!
	OnOneTimeEvent
	{
		Conditions =
		{
			--wenn camp zerstoert

			BuildingIsDead	{Tag = "P306_DemonShrine_01"},
			BuildingIsDead	{Tag = "P306_DemonShrine_02"},
			BuildingIsDead	{Tag = "P306_DemonShrine_03"},
			BuildingIsDead	{Tag = "P306_DemonShrine_04"},
		},
		Actions =
		{

			MapFlagSetTrue	{Name = "mf_DemonCampDestroyed"}, --aktiviert Ios Dialog Part2, auch Flag fuer RewardScript
			--Quests Solve
			QuestSetSolved	{Player = "default", Quest = "DunMoraPart2"},

			--Quests begin
			QuestSetActive	{Player = "default", Quest = "DunMoraPart3Final"},
			QuestSetActive	{Player = "default", Quest = "TalkToIoAgain"},
		},
	},

-- nur falls Quest zur Campzerstoerung gestartet wurde, diese solven
	OnOneTimeEvent
	{
		Conditions =
		{

			QuestIsActive	{Player = "default", Quest = "DefeatDemons"},
			MapFlagIsTrue	{Name = "mf_DemonCampDestroyed"},
		},
		Actions =
		{
			QuestSetSolved	{Player = "default", Quest = "DefeatDemons"},

		},
	},




	--nach Dialog mit Io, Initflag fuer Cutscene End setzen:
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_DialogIoEnded"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_CutsceneEndInit"},

		},
	},




    ----------------------------------------------------------------------
	--------------------------- RESIDENTS --------------------------------
	----------------------------------------------------------------------
  --mit freundlicher Unterstuetzung von Holger

    OnOneTimeEvent
    {
    	Conditions =
    	{
    	},
    	Actions =
    	{
    		 MapTimerStart{Name = "mt_ResidentTimer"},
    		 AvatarValueSet	{Name = "av_P306_ResidentCounter", Value = 1},
    	},
    },

    -- Um zu verhindern, daﬂ alle Residents zum selben Zeitpunkt loslaufen (Performanceinbruch)
    -- z‰hlt der Counter nicht wie bisher bis 20 hoch, sondern bis 200
    -- und die Residents laufen nicht bei 1,2,3,4,5 ... 10 los
    -- sondern bei 10*x + individualsumme
    -- wobei x von 0 bis 19 geht
    -- und individualsumme 1,2,3,4,5 ... 10 sein kann
    -- d.h. ein NPC mit individualsumme == 1 l‰uft also bei 1,11,21,31 etc. los
    -- ein NPC mit individualsumme == 7 bei 7,17,27,37 etc.


    OnEvent
    {
    	Conditions =
    	{
    		MapFlagIsFalse	{Name = "mf_AllGhostsUnbanned"}, --aus, wenn alle Elfen uebergeben
    		MapTimerIsElapsed {Name = "mt_ResidentTimer", Seconds = 10},
    		AvatarValueIsLess{Name = "av_P306_ResidentCounter", Value = 200},
    	 },
    	Actions =
    	{
    		 AvatarValueAdd{Name = "av_P306_ResidentCounter", Value = 1},
    		 MapTimerStart{Name = "mt_ResidentTimer"},
    	},
    },


    OnEvent
    {
    	Conditions =
    	{
    		MapFlagIsFalse	{Name = "mf_AllGhostsUnbanned"}, --aus, wenn alle Elfen uebergeben
    		MapTimerIsElapsed {Name = "mt_ResidentTimer", Seconds = 10},
    		AvatarValueIsEqual{Name = "av_P306_ResidentCounter", Value = 200},
    	 },
    	Actions =
    	{
    		 AvatarValueSet	{Name = "av_P306_ResidentCounter", Value = 1},
    		 MapTimerStart{Name = "mt_ResidentTimer"},
    	},
    },


	----------------------------------------------------------------------
	--------------------------- ENDE RESIDENTS ---------------------------
	----------------------------------------------------------------------
	--Portaleffekt wieder aus, kurz nachdem Io despawnt: in DunMora.lua, weil Io despawned (tot) ist
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_IoGone", Seconds = 3},
		},
		Actions =
		{
			EffectStop	{Tag = "Portal_Start"},
		},
	},

---------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------


	--Techtree freischalten Spieler
	OnOneTimeEvent
	{

		Conditions =
		{
			MapFlagIsTrue {Name = "mf_TechtreeFree"},
		},
		Actions =
		{
			
		
			PlayerBuildingAdd			{Player = "default", BuildingId = 123}, --Elfenfestung
			PlayerBuildingAdd			{Player = "default", BuildingId = 125}, --Elenschrein
			PlayerBuildingUpgradeAdd	{Player = "default", UpgradeId = 012}, --HH Elfenerweiterung
			PlayerBuildingUpgradeAdd	{Player = "default", UpgradeId = 008}, --Turm Elfenerweiterung
		},
	};

	--------------------------------------------------------------------
							--GHOST EXHAUSTER QUESTEN, die getoetet werden--
	-------------------------------------------------------------------
	--GhostExhauster2, Questsolve, wenn tot
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Exhauster2DialogEnded"},
			FigureIsDead	{Tag = "GhostExhauster02"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_Exhauster2Unbanned"},
			QuestSetSolved	{Player = "default", Quest = "Befreie_zweiten_Geist"},
			MapFlagSetTrue	{Name = "mf_WildDirgeIsDead"}, --Flag fuer RewardScript
		},
	},


	-----------------------------------------------------
	----GhostExhauster5, Questsolve, wenn tot

	--wenn im Kampf geloest:
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Ghost05Spawned"},
			FigureIsDead	{Tag = "GhostExhauster05"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_Exhauster5Unbanned"},
			QuestSetSolved	{Player = "default", Quest = "Befreie_fuenften_Geist"},
		},
	},

-------------------------------------------------------------
-------------------------------------------------------------
					--Bosskill-RewardFlags--
--------------------------------------------------------------
--------------------------------------------------------------
	--Boss bei Attacke1
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_SpawnAttack1Boss"},
			FigureIsDead	{Tag = "DemonAttack1Boss"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_BossAttack1IsDead"}, --Flag fuer RewardScript

		},
	},

	--Boss bei Attacke2
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_SpawnAttack2Boss"},
			FigureIsDead	{Tag = "DemonAttack2Boss"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_BossAttack2IsDead"}, --Flag fuer RewardScript

		},
	},

	--Boss in Camp1
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "DemonCampBoss_01"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_BossCamp1IsDead"}, --Flag fuer RewardScript
		},
	},

	--Boss in Camp2
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "DemonCampBoss_02"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_BossCamp2IsDead"}, --Flag fuer RewardScript
		},
	},
	
	
	
	
------------------------------------------------------------------------------------	
	-------------------------------------------------------------------------
	--Geisterquesten solven, wenn Cutscene Extro abgespielt, Map geloest--
	-------------------------------------------------------------------------
	
	
	--erster Geist (Leiche)
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_EndOfMapGhostQuest"},
			QuestIsNotSolved	{Player = "default", Quest = "Befreie_ersten_Geist"},
		},
		Actions = 
		{
			QuestSetSolved	{Player = "default", Quest = "Befreie_ersten_Geist"}, 
			DialogSetDisabled	{Tag = "GhostExhauster01"},
			DialogSetDisabled	{Tag = "CorpseDirge01"},
			
		},
		
	};
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_EndOfMapGhostQuest"},
			MapFlagIsTrue {Name = "mf_CorpseDialogOn"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "CorpseDirge01"},
		},
		
	};
	
-------------------------------------------	
	--zweiter Geist
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_EndOfMapGhostQuest"},
			QuestIsNotSolved	{Player = "default", Quest = "Befreie_zweiten_Geist"},
		},
		Actions = 
		{
			QuestSetSolved	{Player = "default", Quest = "Befreie_zweiten_Geist"}, 
			DialogSetDisabled	{Tag = "GhostExhauster02"},
			
		},
		
	};
	
------------------------------------------	
	--dritter Geist
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_EndOfMapGhostQuest"},
			QuestIsNotSolved	{Player = "default", Quest = "Befreie_dritten_Geist"},
		},
		Actions = 
		{
			QuestSetSolved	{Player = "default", Quest = "Befreie_dritten_Geist"}, 
			DialogSetDisabled	{Tag = "GhostExhauster03"},
			
		},
		
	};
----------------------------------------	
	--vierter Geist (Botschaft)
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_EndOfMapGhostQuest"},
			QuestIsNotSolved	{Player = "default", Quest = "Befreie_vierten_Geist"},
		},
		Actions = 
		{
			QuestSetSolved	{Player = "default", Quest = "Befreie_vierten_Geist"}, 
			DialogSetDisabled	{Tag = "GhostExhauster04"},
			ObjectVanish	{Tag = "Botschaft"},
		},
		
	};
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_EndOfMapGhostQuest"},
			AvatarHasItemMisc	{Player = "default", ItemId = 79, Amount = 1, SearchEquipment = default, SearchHeroEquipment = default},
		},
		Actions = 
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 079, Amount = 1},
			DialogSetDisabled	{Tag = "Sansha"},
		},
		
	};


-----------------------------------------	
	
	
	--fuenfter Geist
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_EndOfMapGhostQuest"},
			QuestIsNotSolved	{Player = "default", Quest = "Befreie_fuenften_Geist"},
		},
		Actions = 
		{
			QuestSetSolved	{Player = "default", Quest = "Befreie_fuenften_Geist"}, 
			DialogSetDisabled	{Tag = "GhostExhauster05"},
			
		},
		
	};
	
	--QUEST: Ueberquest alle Geister
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_EndOfMapGhostQuest"},
			QuestIsActive	{Player = "default", Quest = "FreeDirges"},
			
		},
		Actions = 
		{
			QuestSetSolved	{Player = "default", Quest = "FreeDirges"}, --von Sansha gegeben, Ueberquest
			QuestSetSolved	{Player = "default", Quest = "DunMorapart1"}, --eine neue Hoffnung
		},
		
	};
	

}