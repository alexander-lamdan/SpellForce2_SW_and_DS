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
				MapValueIsEqual {Name = "mv_P301_TutorialType", Value = easy},
				MapValueIsEqual {Name = "mv_P301_TutorialType", Value = hard},
				MapFlagIsTrue {Name = "mf_P301_NoTutorial"},
				MapFlagIsTrue {Name = "mf_P301_MoreTutorial"}
			},
		},
		Actions =
		{
		}
	},
	OnOneTimeEvent
	{
		GotoState = "TutorialRunning",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_LessTutorial"},
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "ArmyTarget1", Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "ArmyTarget2", Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "ArmyTarget3", Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "ArmyTarget4", Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "Encounter3", Team = "tm_Team2"},
			PlayerResourceLenyaGive {Amount = 300},
		}
	},
}
State
{
	StateName = "TutorialRunning",
	OnOneTimeEvent
	{
		Conditions =
		{
		},		
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial1"},
			TutorialInfoTextShow {TextTag = "Tutorial14"},
			TutorialTaskTextShow {TextTag = "Tutorial15"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTextIsFinished {Take = 14},
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "FirstFoe", Team = "tm_Team2"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 15},
			FigureIsDead {Tag = "FirstFoe"},
		},
		Actions =
		{
			FigureRun {Tag = "Bor", X = 163, Y = 307},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block4",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 15},
			FigureIsDead {Tag = "FirstFoe"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 15},
		}
	},
}

State
{
	StateName = "Block4",	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial16"},
			TutorialTaskTextShow {TextTag = "Tutorial17"},
			FigureTeamTransfer {Tag = "Wolf", Team = "tm_Team2"},
			FigureAttackEntity {Tag = "Wolf", TargetTag = "Bor"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block5",
		Conditions =
		{
			FigureIsDead {Tag = "Wolf"}
		},
		Actions =
		{
			AvatarXPGive {Amount = 85},
			TutorialTaskSetSolved {Take = 17},
		}
	},  
}
State
{
	StateName = "Block5",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial18"},
			TutorialInfoTextShow {TextTag = "Tutorial20"},
			TutorialTaskTextShow {TextTag = "Tutorial21"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block6",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 21},
			DialogSkillTreeIsVisible {},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 21},
		}
	},
}
State 
{
	StateName = "Block6",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial22"},
			TutorialTaskTextShow {TextTag = "Tutorial24"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block7",
		Conditions =
		{
			OR
			{
				AvatarHasSkill {Skill = 75}, -- Magie Anfang
				AvatarHasSkill {Skill = 6} -- Combat Anfang
			}
		},
		Actions =
		{
			FigureVanish {Tag = "Bor"},
			PlayerHeroAdd {Player = "pl_Human", HeroId = 8},
			FigureHeroSpawn {Player = "default", Tag = "HeroBor", X = 187, Y = 291, Direction = 90},
			TutorialTaskSetSolved {Take = 24},
			GateSetOpen {Tag = "Gate1"},
		}
	},
}
State
{
	StateName = "Block7",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial5"},
			TutorialInfoTextShow {TextTag = "Tutorial25"},
			TutorialInfoTextShow {TextTag = "Tutorial27"},
			TutorialTaskTextShow {TextTag = "Tutorial28"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 28},
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "SecondEncounter1", Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "SecondEncounter2", Team = "tm_Team2"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block8",
		Conditions =
		{
			FigureIsDead {Tag = "SecondEncounter1"},
			FigureIsDead {Tag = "SecondEncounter2"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 28},
		}
	}
}
State 
{
	StateName = "Block8",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial29"},
			TutorialTaskTextShow {TextTag = "Tutorial30"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block9",
		Conditions =
		{   
			AvatarHasItemEquipment {ItemId = 257, Amount = 1},
			AvatarHasItemEquipment {ItemId = 258, Amount = 1},
			AvatarHasItemEquipment {ItemId = 259, Amount = 1},
		},                                   
		Actions =                            
		{                                    
			TutorialTaskSetSolved {Take = 30},
		},
	},
}
State 
{
	StateName = "Block9",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial31"},
			TutorialInfoTextShow {TextTag = "Tutorial32"},
			TutorialTaskTextShow {TextTag = "Tutorial34"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block10",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 34},
			AvatarHasItemEquipped {ItemId = 259}
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 34},
			TutorialInfoTextShow {TextTag = "Tutorial35"},
			EntityFlagSetTrue {Name = "ef_P301_TextWandShown"}
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block10",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 34},
			AvatarHasItemEquipped {ItemId = 257}
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 34},
			TutorialInfoTextShow {TextTag = "Tutorial36"},
		}
	},
}
State
{
	StateName = "Block10",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial37"},
			TutorialTaskTextShow {TextTag = "Tutorial38"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			--!!! Hier startet Cutscene, soll später noch mit einem Tor gemacht werden
			FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 94, Y = 458},
			FigureIsInRange {Tag = "pl_HumanHeroBor", Range = 10, X = 94, Y = 458},
			TutorialTaskTextIsOnScreen {Take = 38},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 38},
			MapTimerStart {Name = "mt_P301_CutsceneSafety"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 38},
			MapTimerIsElapsed {Name = "mt_P301_CutsceneSafety", Seconds = 4}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_CutsceneLyasHouse"},
		}
	},
	-- Cutscene ist durch
	OnOneTimeEvent
	{
		GotoState = "Block11",
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P301CutsceneOneSafetyTimer", Seconds = 5}
		},
		Actions =
		{
		}
	},
}

State
{
	StateName = "Block11",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial39"},
			TutorialTaskTextShow {TextTag = "Tutorial40"},
			MapTimerStart {Name = "mt_P301AnalepticSafetyTimer"}
		}
	},
	-- Text 40 AktionLya wiederbeleben
	OnOneTimeEvent
	{
		GotoState = "Block12",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 40},
			FigureIsAlive {Tag = "pl_HumanHeroLya"},
			MapTimerIsElapsed {Name = "mt_P301AnalepticSafetyTimer", Seconds = 5}
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 40},
		}
	},
	
}
State
{
	StateName = "Block12",	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial41"},
			TutorialTaskTextShow {TextTag = "Tutorial42"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "pl_HumanHeroLya", Range = 10}
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 42},
			MapTimerStart {Name = "mt_P301_CutsceneSafetyTwo"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 42},
			MapTimerIsElapsed {Name = "mt_P301_CutsceneSafetyTwo", Seconds = 4}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_CutsceneLyasAlive"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block14",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_CutsceneLyasAliveShown"},
		},
		Actions =
		{
		}
	} 
}	

State
{
	StateName = "Block14",
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_P301_TextWandShown"},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial35"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 35},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial43"},
			TutorialInfoTextShow {TextTag = "Tutorial44"},
			TutorialTaskTextShow {TextTag = "Tutorial45"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			DialogQuestBookIsVisible {},
			TutorialTaskTextIsOnScreen {Take = 45},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 45},
			TutorialTaskTextShow {TextTag = "Tutorial46"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block17",
		Conditions =
		{
			FigureIsDead {Tag = "Encounter3"},
			TutorialTaskTextIsOnScreen {Take = 46},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 46},
		}
	}
	
}
State
{
	StateName = "Block17",
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Encounter3"},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial47"},
			TutorialInfoTextShow {TextTag = "Tutorial50"},
			TutorialTaskTextShow {TextTag = "Tutorial51"},
			FigureTeamTransfer {Tag = "Encounter4", Team = "tm_Team2"}
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block18",
		Conditions =
		{
			FigureIsDead {Tag = "Encounter4"},
			TutorialTaskTextIsOnScreen {Take = 51},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 51},
		}
	}
	
}

State
{
	StateName = "Block18",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial52"},
			TutorialTaskTextShow {TextTag = "Tutorial53"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{       
			FigureIsInRange {Tag = "pl_HumanAvatar", X = 267, Y = 487, Range = 10},
			TutorialTaskTextIsOnScreen {Take = 53},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 53},
			MapTimerStart {Name = "mt_P301_CutsceneSafetyNightSong"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P301_CutsceneSafetyNightSong", Seconds = 5},
			TutorialTaskTextIsNotOnScreen {Take = 53},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_NightSongCutsceneStart"}
		}       
	},
	OnOneTimeEvent
	{
		GotoState = "Block19",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_NightSongCutsceneShown"}
		},
		Actions =
		{
		}
	}
}

State
{
	StateName = "Block19",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialTaskTextShow {TextTag = "Tutorial54"},
		}
	},
	OnOneTimeEvent
	{
		
		Conditions =
		{
			FigureIsDead {Tag = "DarkElfRanger"},
			FigureIsDead {Tag = "NightSongEncounter2"},
			TutorialTaskTextIsOnScreen {Take = 54},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 54},
			MapTimerStart {Name = "mt_P301_CutsceneNightSongII"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 54},
			MapTimerIsElapsed {Name = "mt_P301_CutsceneNightSongII", Seconds = 4}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_NightsongFree"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block21",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_NightsongFreeShown"},
		},
		Actions =
		{
		}
	}
	
}

--State
--{
--	StateName = "Block20",
--	OnOneTimeEvent
--	{
--		Conditions =
--		{
--		},
--		Actions =
--		{
--			TutorialTaskTextShow {TextTag = "Tutorial54"},
--			-- !!! Kann erst eingebaut werden, wenn Steady Companions technisch möglich sind
--			--FigureKill {Tag = "NightSong"},	
--		}
--	},
--	OnOneTimeEvent
--	{
--		GotoState = "Block21",
--		Conditions =
--		{
--			FigureIsDead {Tag = "DarkElfRanger"},
--			FigureIsDead {Tag = "NightSongEncounter2"},
--			TutorialTaskTextIsOnScreen {Take = 54},
--		},
--		Actions =
--		{
--			TutorialTaskSetSolved {Take = 54},
--			-- !!! Kann erst ausgebaut werden, wenn Steady Companions technisch möglich sind
--			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "NightSong"},
--		}
--	}
--	
--}

State
{
	StateName = "Block21",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial55"},
			TutorialTaskTextShow {TextTag = "Tutorial56"},
		}
	},
OnOneTimeLeverEvent
	{
		Lever = "SignalFireLever",
		OnConditions = 
		{
			TutorialTaskTextIsOnScreen {Take = 56},
		},
		Actions = 
		{
			TutorialTaskSetSolved {Take = 56},
			MapTimerStart {Name = "mt_P301_FireLever"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P301_FireLever", Seconds = 4},
			TutorialTaskTextIsNotOnScreen {Take = 56},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_SignalFireCutscene"}
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block22",
		Conditions =
		{
			MapFlagIsTrue {Name =  "mf_P301_SignalFireCutsceneShown"},
		},
		Actions =
		{
		}
	},
	
}
State
{
	StateName = "Block22",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialTaskTextShow {TextTag = "Tutorial57"},
		}
	},
	OnOneTimeEvent
	{
		
		Conditions =
		{
			PlayerFigureIsInRange {Player = "pl_Human", X = 403, Y = 471, Range = 15},
			TutorialTaskTextIsOnScreen {Take = 57},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 57},
			MapTimerStart {Name = "mt_P301_AttackCutscene"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 57},
			MapTimerIsElapsed {Name = "mt_P301_AttackCutscene", Seconds = 4},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_AttackCutsceneStart"}
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block23",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_SignalFireCutsceneShown"}
		},
		Actions =
		{
		}
	}
}

State
{
	StateName = "Block23",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial58"},
			TutorialTaskTextShow {TextTag = "Tutorial59"},
			DialogSetEnabled {Tag = "Wulfger"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block24",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_TutorialWulfger"},
			TutorialTaskTextIsOnScreen {Take = 59},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 59},
		}
	}
	
}	

State
{
	StateName = "Block24",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial60"},
			TutorialInfoTextShow {TextTag = "Tutorial61"},
			--TutorialInfoTextShow {TextTag = "Tutorial63"},
			TutorialTaskTextShow {TextTag = "Tutorial64"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block25",
		Conditions =
		{
			-- !!! Achtung aus Eisen wird noch Silber
			PlayerHasResourceSilver {Amount = 100},
			TutorialTaskTextIsOnScreen {Take = 64},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 64},
		}
	}
	
}

State
{
	StateName = "Block25",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial65"},
			TutorialTaskTextShow {TextTag = "Tutorial66"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block27",
		Conditions =
		{
			PlayerHasUnitAmount {Amount = 10, UnitId = 69},
			TutorialTaskTextIsOnScreen {Take = 66},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 66},
		}
	}
	
}


State
{
	StateName = "Block27",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial67"},
			TutorialInfoTextShow {TextTag = "Tutorial71"},
			TutorialTaskTextShow {TextTag = "Tutorial72"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block28",
		Conditions =
		{
			PlayerHasBuilding {BuildingId = Building.RTS.RealmBlacksmith, Amount = 1},
			TutorialTaskTextIsOnScreen {Take = 72},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 72},
		}
	}
	
}

State
{
	StateName = "Block28",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial73"},
			TutorialInfoTextShow {TextTag = "Tutorial74"},
			TutorialTaskTextShow {TextTag = "Tutorial75"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block31",
		Conditions =
		{
			PlayerHasUnitAmount {UnitId = Unit.RTS.RealmSoldier, Amount = 5},
			TutorialTaskTextIsOnScreen {Take = 75},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 75},
		}
	}
	
}

State
{
	StateName = "Block31",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialTaskTextShow {TextTag = "Tutorial84"},
			MapFlagSetTrue {Name = "mf_P301_BridgeArmyDoNotRespawn"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block32",
		Conditions =
		{
			FigureIsDead {Tag = "ArmyTarget1"},
			FigureIsDead {Tag = "ArmyTarget2"},
			FigureIsDead {Tag = "ArmyTarget3"},
			FigureIsDead {Tag = "ArmyTarget4"},
			TutorialTaskTextIsOnScreen {Take = 84},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 84},
		}
	}
	
}

State
{
	StateName = "Block32",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial85"},
			TutorialInfoTextShow {TextTag = "Tutorial86"},
			TutorialTaskTextShow {TextTag = "Tutorial87"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block38",
		Conditions =
		{
			PlayerHasBuilding {BuildingId = Building.RTS.RealmBlacksmith, Amount = 1, UpgradeId = Building.Upgrade.RealmWorkshop},
			TutorialTaskTextIsOnScreen {Take = 87},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 87},
		}
	}
	
}
State
{
	StateName = "Block38",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial96"},
			TutorialInfoTextShow {TextTag = "Tutorial97"},
			TutorialInfoTextShow {TextTag = "Tutorial98"},
			TutorialTaskTextShow {TextTag = "Tutorial99"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block39",
		Conditions =
		{
			FigureIsDead {Tag = "LastTuztorialArmy1"},
			FigureIsDead {Tag = "LastTuztorialArmy2"},
			FigureIsDead {Tag = "LastTuztorialArmy3"},
			FigureIsDead {Tag = "LastTuztorialArmy4"},
			FigureIsDead {Tag = "LastTuztorialArmy5"},
			FigureIsDead {Tag = "LastTuztorialArmy6"},
			TutorialTaskTextIsOnScreen {Take = 99},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 99},
		}
	}
}
State
{
	StateName = "Block39",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial100"},
			TutorialInfoTextShow {TextTag = "Tutorial101"},
		}
	},
}

State
{
	StateName = "DeadEnd",
}