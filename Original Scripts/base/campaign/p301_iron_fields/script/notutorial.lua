---------------------------------------------------------------------------------------
--
--   Tutorial Spezialskripting
--
---------------------------------------------------------------------------------------
easy = 1
medium = 2
hard = 3

info = 1
order = 2

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "DeadEnd",
		Conditions =
		{
			OR
			{
				MapValueIsEqual {Name = "mv_P301_TutorialType", Value = medium},
				MapValueIsEqual {Name = "mv_P301_TutorialType", Value = easy},
				MapFlagIsTrue {Name = "mf_P301_LessTutorial"},
				MapFlagIsTrue {Name = "mf_P301_MoreTutorial"}
			},
		},
		Actions =
		{
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_NoTutorial"}
		},
		Actions =
		{
			-- Alle Gegner sind direkt Böse
			FigureTeamTransfer {Tag = "FirstFoe", Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "Wolf", Team = "tm_Team2"},
			FigureTeleport	{Tag = "FirstFoe", X = 192, Y = 284},
			FigureSimpleWalk	{Tag = "FirstFoe", X = 180, Y = 297},
			FigureTeamTransfer {Tag = "SecondEncounter1", Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "SecondEncounter2", Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "Encounter3", Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "Encounter4", Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "Encounter5", Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "ArmyTarget1", Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "ArmyTarget2", Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "ArmyTarget3", Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "ArmyTarget4", Team = "tm_Team2"},
			
			-- Im Tutorial braucht es keine Blocker, wenn der Spieler die Units umgehauen hat, hat er sie umgehauen
			MapFlagSetTrue {Name = "mf_P301_BridgeArmyDoNotRespawn"},
			
			PlayerResourceLenyaGive {Amount = 300},
			
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "FirstFoe"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_FirstWolfKilled"},
			FigureTeamTransfer {Tag = "Wolf", Team = "tm_Team2"},
			FigureTeleport	{Tag = "Wolf", X = 199, Y = 303},
			FigureAttackEntity {Tag = "Wolf", TargetTag = "pl_HumanHeroBor"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "FirstFoe"},
			FigureIsDead {Tag = "Wolf"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_SecondWolfKilled"},
			GateSetOpen {Tag = "Gate1"},
			GateSetOpen {Tag = "Gate2"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			--!!! Hier startet Cutscene, soll später noch mit einem Tor gemacht werden
			OR
			{
				FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 240, Y = 394},
				FigureIsInRange {Tag = "pl_HumanHeroBor", Range = 10, X = 240, Y = 394},
			}
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P301_CutsceneLyasHouse"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_CutsceneLyasHouse"},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "pl_HumanHeroLya", Range = 10},
			MapTimerIsElapsed {Name = "mt_P301CutsceneOneSafetyTimer", Seconds = 10},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_CutsceneLyasAlive"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{       
			OR
			{
				FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "NightSong_Fight", Range = 13},
				FigureIsInEntityRange {Tag = "pl_HumanHeroBor", TargetTag = "NightSong_Fight", Range = 13},
				FigureIsInEntityRange {Tag = "pl_HumanHeroLya", TargetTag = "NightSong_Fight", Range = 13},
			},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_NightSongCutsceneStart"}
		}
	},
	OnOneTimeEvent
	{
		
		Conditions =
		{
			FigureIsDead {Tag = "DarkElfRanger"},
			FigureIsDead {Tag = "NightSongEncounter2"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_NightsongFree"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "LeverMob1"},
			FigureIsDead {Tag = "LeverMob2"},
			FigureIsDead {Tag = "LeverMob3"},
		},
		Actions =
		{
			LeverSetEnabled {Tag = "SignalFireLever"}
		},
	},
	OnOneTimeLeverEvent
	{
		Lever = "SignalFireLever",
		OnConditions = 
		{
			MapFlagIsTrue {Name = "mf_P301_NightsongFreeShown"},
		},
		Actions = 
		{
			ObjectChange {Tag = "Tutorial_Watchfire", ObjectId = 1632, X = 391.195, Y = 476.141, Direction = 0},			
			MapFlagSetTrue {Name = "mf_P301_SignalFireCutscene"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name =  "mf_P301_SignalFireCutsceneShown"},
		},
		Actions =
		{
			DialogSetEnabled {Tag = "Wulfger"},
		}
	},
	-- Erst wenn mit Wulfger gesprochen wurde wird das Tor aufgemacht
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "BreakPactSiege"},
		},
		Actions =
		{
			FogOfWarRevealAtEntity {Tag = "DESiege3", Range = 20, FogOfWarId = 20},
			FogOfWarRevealAtEntity {Tag = "DESiege4", Range = 20, FogOfWarId = 21},
			--FogOfWarCloak {FogOfWarId = 1},
			GateSetOpen {Tag = "Gate3"},
		},
	},
	-- Auch ohne Tutorial muss Thora auftauchen
	OnOneTimeEvent
	{
		GotoState = "DeadEnd",
		Conditions =
		{
			FigureIsDead {Tag = "LastTuztorialArmy1"},
			FigureIsDead {Tag = "LastTuztorialArmy2"},
			FigureIsDead {Tag = "LastTuztorialArmy3"},
			FigureIsDead {Tag = "LastTuztorialArmy4"},
			FigureIsDead {Tag = "LastTuztorialArmy5"},
			FigureIsDead {Tag = "LastTuztorialArmy6"},
			FigureIsDead {Tag = "VillageAttack1"},
			FigureIsDead {Tag = "VillageAttack2"},
			FigureIsDead {Tag = "VillageAttack3"},
			FigureIsDead {Tag = "NoTut1"},
			FigureIsDead {Tag = "NoTut2"},
			FigureIsDead {Tag = "NoTut3"},
			FigureIsDead {Tag = "NoTut4"},
			FigureIsDead {Tag = "NoTut5"},
			BuildingIsDead {Tag = "DESiege3"},
			BuildingIsDead {Tag = "DESiege4"},
			BuildingIsDead {Tag = "DESiege5"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_DamnedTutorialOver"},
			--FogOfWarCloak {FogOfWarId = 18},
			--FogOfWarCloak {FogOfWarId = 19},
			--FogOfWarCloak {FogOfWarId = 20},
			--FogOfWarCloak {FogOfWarId = 21},
			--FogOfWarCloak {FogOfWarId = 22},
		},
	},
}

State
{
	StateName = "DeadEnd",
}