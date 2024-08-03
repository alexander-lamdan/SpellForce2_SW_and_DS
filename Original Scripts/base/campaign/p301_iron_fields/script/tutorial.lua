---------------------------------------------------------------------------------------
--
--   Tutorial Spezialskripting
--
---------------------------------------------------------------------------------------
--local easy = 1
--local medium = 2
--local hard = 3

-- TODO:
-- minimap marker
local MinimapMarker = 1
local buttonsize = 43

-------------------------------------------------------------------------------------------
-- Beginn des Tutorials
-------------------------------------------------------------------------------------------
State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Tutorial"},
		},
		Actions =
		{
			-- zum testen:
			--MapFlagSetTrue {Name = "mf_P301_MoreTutorial"},
			--MapFlagSetTrue {Name = "mf_P301_Tutorial"},
			FigureAbilityAdd {AbilityId = Ability.Immortal, Tag = "Bor"},
		}
	},
	-- EARLY OUT:
	OnOneTimeEvent
	{
		GotoState = "DeadEnd",
		Conditions =
		{
			OR
			{
				--MapValueIsEqual {Name = "mv_P301_TutorialType", Value = medium},
				--MapValueIsEqual {Name = "mv_P301_TutorialType", Value = hard},
				MapFlagIsTrue {Name = "mf_P301_NoTutorial"},
				MapFlagIsTrue {Name = "mf_P301_LessTutorial"}
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
			MapFlagIsTrue {Name = "mf_P301_Cutscene1End"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_TutorialBegins"},
			FigureDirectionSet	{Tag = "pl_HumanAvatar", Direction = 0},
			FigureWalk {Tag = "Bor", X = 165, Y = 299},
			FigurePlayerTransfer {Tag = "Bor", Player = "pl_DarkElves"},
			FigureTeamTransfer	{Tag = "Bor", Team = "tm_Team1"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "TutorialRunning",
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_TutorialBegins", Seconds = 2},
		},
		Actions =
		{
			--PlayerResourceLenyaGive {Amount = 300},
			TutorialInfoTextShow {TextTag = "Tutorial1"},
			TutorialInfoTextShow {TextTag = "Tutorial2"},
			TutorialTaskTextShow {TextTag = "Tutorial3"},
			MapValueSet	{Name = "mv_P301_Marker", Value = 1},
			TutorialCameraCenterOnEntity {Tag = "Offset"},
			TutorialCameraSetZoom {Zoom = 7},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Avatar selektieren
-------------------------------------------------------------------------------------------
State
{
	StateName = "TutorialRunning",
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Bor"},
		},
		Actions =
		{
			FigureDirectionSet	{Tag = "Bor", Direction = 75},
			TutorialCameraSetZoom {Zoom = 7},
			TutorialStateSet {TutorialState = DisableDestroyItemButton},
			TutorialStateSet {TutorialState = FreezeIsoCameraZoom},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Block2",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 3},
			FigureIsSelected {Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 3},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Avatar Portrait rechtsklicken
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block2",
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Bor"},
		},
		Actions =
		{
			FigureDirectionSet	{Tag = "Bor", Direction = 75},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 3},
			TutorialTextIsFinished {Take = 3},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial4"},
			TutorialInfoTextShow {TextTag = "Tutorial5"},
			TutorialInfoTextShow {TextTag = "Tutorial6"},
			TutorialInfoTextShow {TextTag = "Tutorial7"},
			TutorialInfoTextShow {TextTag = "Tutorial8"},
			TutorialInfoTextShow {TextTag = "Tutorial9"},
			TutorialInfoTextShow {TextTag = "Tutorial10"},
			TutorialInfoTextShow {TextTag = "Tutorial11"},
			TutorialTaskTextShow {TextTag = "Tutorial12"},
			TutorialStateClear {TutorialState = AvatarPortraitButtonClicked},
			TutorialStateClear	{TutorialState = FreezeIsoCameraPosition},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Block2b",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 12},
			TutorialStateIsSet	{TutorialState = AvatarPortraitButtonClicked},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_PortaitMarkerQuit"},
			TutorialTaskSetSolved {Take = 12},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Verfolgerperspektive
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block2b",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 12},
			TutorialTextIsFinished {Take = 12},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial13"},
			TutorialTaskTextShow {TextTag = "Tutorial14"},
			TutorialStateClear{TutorialState = FreezeIsoCameraZoom},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block2c",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 14},
			TutorialCameraIsIn3rdPersonView {},

		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 14},
		}
	},
}
-------------------------------------------------------------------------------------------
-- zurück in ISO Ansicht
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block2c",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 14},
			TutorialTextIsFinished {Take = 14},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial15"},
			TutorialTaskTextShow {TextTag = "Tutorial16"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block2d",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 16},
			TutorialCameraIsNotIn3rdPersonView {},
		},
		Actions =
		{
			TutorialCameraCenterOnEntity {Tag = "pl_HumanAvatar"},
			TutorialCameraSetZoom {Zoom = 7},
			TutorialTaskSetSolved {Take = 16},
		}
	},
}
-------------------------------------------------------------------------------------------
-- die ersten Schritte (zum GotoMarker)
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block2d",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 16},
			TutorialTextIsFinished {Take = 16},
		},
		Actions =
		{
			TutorialTaskTextShow {TextTag = "Tutorial17"},
			MapFlagSetTrue	{Name = "mf_ShowGotoMarker"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block3",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 17},
			FigureIsInEntityRange {TargetTag = "GotoMarker", Tag = "pl_HumanAvatar", Range = 5},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_ShowGotoMarker"},
			TutorialTaskSetSolved {Take = 17},
			TutorialInfoTextShow {TextTag = "Tutorial18"},
			TutorialTaskTextShow {TextTag = "Tutorial19"},
			TutorialCameraCenterOnEntity {Tag = "CameraCenter01"},
			TutorialCameraSetZoom {Zoom = 7},
		},
	},
}
-------------------------------------------------------------------------------------------
-- der erste Gegner taucht auf und soll angegriffen werden
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block3",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTextIsFinished {Take = 18},
		},
		Actions =
		{
			FigureDirectionSet	{Tag = "pl_HumanAvatar", Direction = 75},
			FigureDirectionSet	{Tag = "Bor", Direction = 75},
			FigureTeamTransfer {Tag = "FirstFoe", Team = "tm_Team2"},
			FigureTeleport	{Tag = "FirstFoe", X = 192, Y = 284},
			FigureSimpleWalk	{Tag = "FirstFoe", X = 180, Y = 297},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 19},
			FigureIsInRange {Tag = "FirstFoe", X = 180, Y = 297, Range = 2},
		},
		Actions =
		{
			FigureRunToEntity {Tag = "Bor", TargetTag = "FirstFoe"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block3b",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 19},
			OR
			{
				FigureIsInCombat	{Tag = "pl_HumanAvatar"},
				FigureIsDead {Tag = "FirstFoe"},
			}
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_ShowFoeMarker"},
			TutorialTaskSetSolved {Take = 19},
			TutorialTaskTextShow {TextTag = "Tutorial20"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- der erste Gegner ist tot
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block3b",
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "FirstFoe"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_FirstWolfKilled"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 20},
			FigureIsDead {Tag = "FirstFoe"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 20},
			TutorialInfoTextShow {TextTag = "Tutorial21"},
			TutorialTaskTextShow {TextTag = "Tutorial22"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 22},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_Tutorial22"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 22},
			FigureIsSelected	{Tag = "pl_HumanAvatar"},
			EntityTimerIsElapsed	{Name = "et_Tutorial22", Seconds = 3},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 22},
			EntityFlagSetTrue {Name = "ef_Tutorial22Solved"},
		},
		GotoState = "Block4",
	},
};
-------------------------------------------------------------------------------------------
-- zweiter Gegner taucht auf
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block4",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 22},
			EntityFlagIsTrue {Name = "ef_Tutorial22Solved"},
		},
		Actions =
		{
			FigureRunToEntity {Tag = "Bor", TargetTag = "FoeMarker"},

			TutorialTaskTextShow {TextTag = "Tutorial23"},
			FigureTeamTransfer {Tag = "Wolf", Team = "tm_Team2"},
			FigureTeleport	{Tag = "Wolf", X = 199, Y = 303},
			FigureAttackEntity {Tag = "Wolf", TargetTag = "Bor"},
			TutorialCameraCenterOnEntity {Tag = "pl_HumanAvatar"},
			TutorialCameraSetZoom {Zoom = 7},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Wolf"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_SecondWolfKilled"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Block5",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 23},
			FigureIsDead {Tag = "Wolf"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 23},
			TutorialInfoTextShow {TextTag = "Tutorial24"},
			TutorialTaskTextShow {TextTag = "Tutorial25"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Skill Tree Erklärungen
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block5",
	OnOneTimeEvent
	{
		GotoState = "Block6",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 25},
			OR
			{
				DialogSkillTreeIsVisible {},
				OR
				{
					AvatarHasSkill {Skill = 75}, -- Magie Anfang
					AvatarHasSkill {Skill = 6} -- Combat Anfang
				}
			}
		},
		Actions =
		{
			TutorialCameraCenterOnEntity	{Tag = "FoeMarker"},
			TutorialCameraSetZoom {Zoom = 7},
			FigureWalkToEntity {Tag = "Bor", TargetTag = "FoeMarker"},
			TutorialTaskSetSolved {Take = 25},

			TutorialInfoTextShow {TextTag = "Tutorial26"},
			TutorialInfoTextShow {TextTag = "Tutorial27"},
			TutorialInfoTextShow {TextTag = "Tutorial28"},
			TutorialInfoTextShow {TextTag = "Tutorial29"},
			TutorialInfoTextShow {TextTag = "Tutorial30"},
			TutorialTaskTextShow {TextTag = "Tutorial31"},
		}
	},
}
-------------------------------------------------------------------------------------------
-- Bor als Held übergeben
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block6",

	OnOneTimeEvent
	{
		GotoState = "Block6b",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 31},
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
			FigureOutcry {TextTag = "System2", Tag = "System_Npc"}, --SYSTEM-OC: sie haben den Realm bekommen
			FigureHeroSpawnToEntity {Tag = "HeroBor", TargetTag = "pl_HumanAvatar", Direction = 90},
			TutorialTaskSetSolved {Take = 31},

			TutorialInfoTextShow {TextTag = "Tutorial32"},
			TutorialInfoTextShow {TextTag = "Tutorial33"},
			TutorialTaskTextShow {TextTag = "Tutorial34"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- mit Bor zum Tor und den dritten Gegner töten
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block6b",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 34},
			DialogEquipmentIsNotVisible	{},
			DialogInventoryIsNotVisible	{},
			DialogQuestBookIsNotVisible	{},
			DialogSkillTreeIsNotVisible	{},
			DialogSpellBookIsNotVisible	{},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 34},
			TutorialInfoTextShow {TextTag = "Tutorial35"},
			TutorialInfoTextShow {TextTag = "Tutorial36"},
			TutorialTaskTextShow {TextTag = "Tutorial37"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 37},
			FigureIsSelected	{Tag = "pl_HumanHeroBor"},
			FigureIsSelected	{Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 37},
			TutorialTaskTextShow {TextTag = "Tutorial38"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			--SetUpdateInterval	{Steps = 5},
			TutorialTaskTextIsOnScreen {Take = 38},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroBor", TargetTag = "Gate1", Range = 12},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Gate1", Range = 12},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 38},

			TutorialInfoTextShow {TextTag = "Tutorial39"},
			TutorialTaskTextShow {TextTag = "Tutorial40"},
			--TutorialCameraCenterOnEntity {Tag = "pl_HumanAvatar"},
			--TutorialCameraSetZoom {Zoom = 1},
			FigureTeamTransfer {Tag = "SecondEncounter1", Team = "tm_Team2"},
			GateSetOpen	{Tag = "Gate1"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 40},
			FigureIsDead	{Tag = "SecondEncounter1"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 40},
			MapFlagSetTrue {Name = "mf_P301_IdiotOut"},
			TutorialInfoTextShow {TextTag = "Tutorial41"},
			TutorialTaskTextShow {TextTag = "Tutorial42"},
		},
		GotoState = "Block8",
	},
}
-------------------------------------------------------------------------------------------
-- den Gegner looten
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block8",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 42},
			-- loot window visible OR all items looted (Spieler könnte schneller sein!)
			OR
			{
				DialogLootIsVisible {},
				AND
				{
					AvatarHasItemEquipment {ItemId = 258, Amount = 1},
					AvatarHasItemEquipment {ItemId = 259, Amount = 1},
				},
			},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 42},
			TutorialTaskTextShow {TextTag = "Tutorial43"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Block9",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 43},
			AvatarHasItemEquipment {ItemId = 258, Amount = 1},
			AvatarHasItemEquipment {ItemId = 259, Amount = 1},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 43},
			TutorialTaskTextShow {TextTag = "Tutorial44"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Erklärungen zum Inventar & Equipment, dann weiter zu Lyas Haus
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block9",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 44},
			OR
			{
				DialogEquipmentIsVisible	{},
				AvatarHasItemEquipped {ItemId = 258},
				AvatarHasItemEquipped {ItemId = 259},
			}
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 44},
			TutorialInfoTextShow {TextTag = "Tutorial45"},
			TutorialTaskTextShow {TextTag = "Tutorial46"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 46},
			OR
			{
				DialogInventoryIsVisible	{},
				AvatarHasItemEquipped {ItemId = 258},
				AvatarHasItemEquipped {ItemId = 259},
			},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 46},
			TutorialInfoTextShow {TextTag = "Tutorial47"},
			TutorialInfoTextShow {TextTag = "Tutorial48"},
			TutorialInfoTextShow {TextTag = "Tutorial49"},
			TutorialInfoTextShow {TextTag = "Tutorial50"},
			TutorialTaskTextShow {TextTag = "Tutorial51"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 51},
			OR
			{
				AvatarHasItemEquipped {ItemId = 258},
				AvatarHasItemEquipped {ItemId = 259},
			},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 51},
			TutorialTaskTextShow {TextTag = "Tutorial52"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block10",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 52},
			DialogEquipmentIsNotVisible	{},
			DialogInventoryIsNotVisible	{},
			DialogQuestBookIsNotVisible	{},
			DialogSkillTreeIsNotVisible	{},
			DialogSpellBookIsNotVisible	{},
			
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 52},
			TutorialTaskTextShow {TextTag = "Tutorial53"},
		}
	},
}
-------------------------------------------------------------------------------------------
-- bei Lyas Haus angekommen, Cutscene starten
-------------------------------------------------------------------------------------------
-- TODO: Tor ansteuern (das tor gibts noch nicht)
State
{
	StateName = "Block10",
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInEntityRange {Tag = "pl_HumanAvatar", Range = 10, TargetTag = "LaterneVorLyasHaus"},
				FigureIsInEntityRange {Tag = "pl_HumanHeroBor", Range = 10, TargetTag = "LaterneVorLyasHaus"},
			},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P301_BlockerSafety"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P301_BlockerSafety"},
			TutorialTaskTextIsOnScreen {Take = 53},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 53},
			MapTimerStart {Name = "mt_P301_CutsceneSafety"}
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block11",
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 53},
			MapTimerIsElapsed {Name = "mt_P301_CutsceneSafety", Seconds = 2}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_CutsceneLyasHouse"},
		}
	},
	
}
-------------------------------------------------------------------------------------------
-- Lya muss wiederbelebt werden
-------------------------------------------------------------------------------------------
-- TODO: set camera position
State
{
	StateName = "Block11",
	-- Cutscene ist durch
	OnOneTimeEvent
	{
		
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P301CutsceneOneSafetyTimer", Seconds = 2}
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial54"},
			TutorialTaskTextShow {TextTag = "Tutorial55"},
			MapTimerStart {Name = "mt_P301AnalepticSafetyTimer"}
		},
	},
	-- Aktion: Lya wiederbeleben
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 55},
			OR
			{
				FigureIsSelected {Tag = "pl_HumanHeroLya_DEAD"},
				FigureIsAlive {Tag = "pl_HumanHeroLya"},
			},
			MapTimerIsElapsed {Name = "mt_P301AnalepticSafetyTimer", Seconds = 2},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 55},
			TutorialTaskTextShow {TextTag = "Tutorial57"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Block12",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 57},
			FigureIsAlive {Tag = "pl_HumanHeroLya"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 57},
			TutorialInfoTextShow {TextTag = "Tutorial59"},
			TutorialInfoTextShow {TextTag = "Tutorial60"},
			TutorialInfoTextShow {TextTag = "Tutorial61"},
			TutorialTaskTextShow {TextTag = "Tutorial62"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Lya herbeirufen
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block12",
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "pl_HumanHeroLya", Range = 3},
				FigureIsInEntityRange {Tag = "pl_HumanHeroBor", TargetTag = "pl_HumanHeroLya", Range = 3},
			},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 62},
			MapTimerStart {Name = "mt_P301_CutsceneSafetyTwo"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 54},
			TutorialTaskTextIsNotOnScreen {Take = 55},
			TutorialTaskTextIsNotOnScreen {Take = 56},
			TutorialTaskTextIsNotOnScreen {Take = 57},
			TutorialTaskTextIsNotOnScreen {Take = 58},
			TutorialTaskTextIsNotOnScreen {Take = 59},
			TutorialTaskTextIsNotOnScreen {Take = 60},
			TutorialTaskTextIsNotOnScreen {Take = 61},
			TutorialTaskTextIsNotOnScreen {Take = 62},
			MapTimerIsElapsed {Name = "mt_P301_CutsceneSafetyTwo", Seconds = 2}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_CutsceneLyasAlive"},
		},
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
			TutorialTaskTextShow {TextTag = "Tutorial64"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Erklärungen zum Questbuch
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block14",
	OnOneTimeEvent
	{
		GotoState = "Block15",
		Conditions =
		{
			DialogQuestBookIsVisible {},
			TutorialTaskTextIsOnScreen {Take = 64},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 64},
			TutorialInfoTextShow {TextTag = "Tutorial65"},
			TutorialTaskTextShow {TextTag = "Tutorial66"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Questbuch Details
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block15",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 66},
			DialogQuestBookDescriptionIsVisible	{},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 66},
			FogOfWarRevealAtEntity {Tag = "DESiege3", Range = 20, FogOfWarId = 4},
			FogOfWarRevealAtEntity {Tag = "DESiege4", Range = 20, FogOfWarId = 5},
			--FogOfWarCloak {FogOfWarId = 1},
			TutorialInfoTextShow {TextTag = "Tutorial67"},
			TutorialTaskTextShow {TextTag = "Tutorial68"},
			FigureTeamTransfer {Tag = "Encounter3", Team = "tm_Team2"},
		},
	},

	OnOneTimeEvent
	{
		GotoState = "Block16",
		Conditions =
		{
			FigureIsDead {Tag = "Encounter3"},
			TutorialTaskTextIsOnScreen {Take = 68},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 68},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Levelup auf Stufe 3 von Avatar und insbesondere Lya (neuer Spell)
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block16",
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasLevel	{Level = 3},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial69"},
			TutorialTaskTextShow {TextTag = "Tutorial70"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 70},
			OR
			{
				AND
				{
					DialogEquipmentIsVisible	{},
					DialogHeroEquipmentIsSelected {Hero = 2},
				},
				PlayerSpellIsMemorized {Player = "default", Hero = 2, Spell = 13},
			}	
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 70},
			TutorialTaskTextShow {TextTag = "Tutorial71"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 71},
			OR
			{
				AND
				{
					DialogSpellBookIsVisible	{},
					DialogHeroEquipmentIsSelected {Hero = 2},
				},
				PlayerSpellIsMemorized {Player = "default", Hero = 2, Spell = 13},
			}	
			
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 71},
			TutorialInfoTextShow {TextTag = "Tutorial72"},
			TutorialInfoTextShow {TextTag = "Tutorial73"},
			TutorialInfoTextShow {TextTag = "Tutorial74"},
			TutorialTaskTextShow {TextTag = "Tutorial75"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 75},
			PlayerSpellIsMemorized {Player = "default", Hero = 2, Spell = 13},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 75},
			TutorialInfoTextShow {TextTag = "Tutorial76"},
			TutorialTaskTextShow {TextTag = "Tutorial77"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block17",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 77},
			FigureIsSelected	{Tag = "pl_HumanHeroLya"},
			FigureIsNotSelected	{Tag = "pl_HumanHeroBor"},
			FigureIsNotSelected	{Tag = "pl_HumanAvatar"},
			DialogEquipmentIsNotVisible	{},
			DialogInventoryIsNotVisible	{},
			DialogQuestBookIsNotVisible	{},
			DialogSkillTreeIsNotVisible	{},
			DialogSpellBookIsNotVisible	{},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 77},
			TutorialInfoTextShow {TextTag = "Tutorial78"},
			TutorialInfoTextShow {TextTag = "Tutorial79"},
			TutorialTaskTextShow {TextTag = "Tutorial80"},
			MapFlagSetTrue {Name = "mf_P301_Encounter4Marker"},
			FigureTeamTransfer {Tag = "Encounter4", Team = "tm_Team2"},
			FogOfWarRevealAtEntity	{Tag = "Encounter4", Range = 7, Height = 3, FogOfWarId = 7},
		},
	},
}
-------------------------------------------------------------------------------------------
-- den Gegner hinter dem Tor mit dem neuen Blitz Spell angreifen
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block17",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 80},
			FigureIsDead {Tag = "Encounter4"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 80},
			TutorialTaskTextShow {TextTag = "Tutorial81"},
			MapFlagSetFalse {Name = "mf_P301_Encounter4Marker"},
			MapFlagSetTrue {Name = "mf_P301_Encounter5Marker"},
			FigureTeamTransfer {Tag = "Encounter5", Team = "tm_Team2"},
			--FogOfWarCloak {FogOfWarId = 7}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 81},
			FigureIsDead {Tag = "Encounter5"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 81},
			TutorialTaskTextShow {TextTag = "Tutorial82"},
			MapFlagSetFalse {Name = "mf_P301_Encounter5Marker"},
		},
		GotoState = "Block17b",
	},
}
-------------------------------------------------------------------------------------------
-- sicherstellen das Avatar Skillpunkte verteilt hat, dann Tor öffnen
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block17b",
	OnOneTimeEvent
	{
		Conditions =
		{
			HeroHasNoSkillPointsLeft {Player = "default", Hero = 0},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 82},
			TutorialInfoTextShow {TextTag = "Tutorial83"},
			TutorialInfoTextShow {TextTag = "Tutorial84"},
			TutorialTaskTextShow {TextTag = "Tutorial85"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 85},
		},
		Actions =
		{
			GateSetOpen {Tag = "Gate2"},
		},
		GotoState = "Block18",
	},
}
-------------------------------------------------------------------------------------------
-- Cutscene Schattenlied Kampf starten
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block18",
	OnOneTimeEvent
	{
		Conditions =
		{
			SetUpdateInterval {Steps = 2},
			OR
			{
				FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "NightSong_Fight", Range = 13},
				FigureIsInEntityRange {Tag = "pl_HumanHeroBor", TargetTag = "NightSong_Fight", Range = 13},
				FigureIsInEntityRange {Tag = "pl_HumanHeroLya", TargetTag = "NightSong_Fight", Range = 13},
			},
			TutorialTaskTextIsOnScreen {Take = 85},
		},
		Actions =
		{
			MapTimerStart {Name = "mt_P301_CutsceneSafetyNightSong"},
			TutorialTaskSetSolved {Take = 85},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 85},
			MapTimerIsElapsed {Name = "mt_P301_CutsceneSafetyNightSong", Seconds = 2},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_NightSongCutsceneStart"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Block19",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_NightSongCutsceneShown"},
		},
		Actions =
		{
			TutorialTaskTextShow {TextTag = "Tutorial86"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Cutscene Schattenlied Wiederbelebung, Schattenlied wird zum Companion
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block19",
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "DarkElfRanger"},
			FigureIsDead {Tag = "NightSongEncounter2"},
			TutorialTaskTextIsOnScreen {Take = 86},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 86},
			MapTimerStart {Name = "mt_P301_CutsceneNightSongII"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 86},
			MapTimerIsElapsed {Name = "mt_P301_CutsceneNightSongII", Seconds = 2}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_NightsongFree"},
		},
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
			TutorialInfoTextShow {TextTag = "Tutorial87"},
			TutorialInfoTextShow {TextTag = "Tutorial88"},
			TutorialTaskTextShow {TextTag = "Tutorial89"},
			FogOfWarRevealAtEntity	{Tag = "SignalFireLever", Range = 10, Height = 5, FogOfWarId = 8},
			MapFlagSetTrue	{Name = "mf_ShowLeverMarker"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Erklärung zu Hebeln & kurze Cutscene
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block21",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 89},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "SignalFireLever", Range = 10},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 89},
			TutorialTaskTextShow {TextTag = "Tutorial90"},
			--FogOfWarCloak {FogOfWarId = 8},
		},
	},
	OnOneTimeLeverEvent
	{
		Lever = "SignalFireLever",
		OnConditions =
		{
			TutorialTaskTextIsOnScreen {Take = 90},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 90},
			MapTimerStart {Name = "mt_P301_FireLever"},
			MapFlagSetFalse	{Name = "mf_ShowLeverMarker"},
			LeverSetEnabled {Tag = "SignalFireLever"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P301_FireLever", Seconds = 2},
			TutorialTaskTextIsNotOnScreen {Take = 90},
		},
		Actions =
		{
			ObjectChange {Tag = "Tutorial_Watchfire", ObjectId = 1632, X = 391.195, Y = 476.141, Direction = 0},			
			MapFlagSetTrue {Name = "mf_P301_SignalFireCutscene"}
		},
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
			TutorialTaskTextShow {TextTag = "Tutorial91"},
			FogOfWarRevealAtEntity	{Tag = "Wulfger", Range = 25, Height = 15, FogOfWarId = 9},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Spieler im Aufbaugebiet, Dialog von Wulfger anschalten
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block22",
	OnOneTimeEvent
	{
		GotoState = "Block23",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 91},
			OR
			{
				FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "Wulfger", Range = 15},
				FigureIsInEntityRange {Tag = "pl_HumanHeroBor", TargetTag = "Wulfger", Range = 15},
				FigureIsInEntityRange {Tag = "pl_HumanHeroLya", TargetTag = "Wulfger", Range = 15},
			},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 91},
			--FogOfWarCloak {FogOfWarId = 9},
			TutorialInfoTextShow {TextTag = "Tutorial92"},
			TutorialTaskTextShow {TextTag = "Tutorial93"},
			DialogSetEnabled {Tag = "Wulfger"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Dialog mit Wulfger geführt?
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block23",
	OnOneTimeEvent
	{
		GotoState = "Block24",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_TutorialWulfger"},
			TutorialTaskTextIsOnScreen {Take = 93},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 93},
			TutorialCameraCenterOnEntity {Tag = "FirstHQ"},
			TutorialCameraSetZoom {Zoom = 7},
			TutorialInfoTextShow {TextTag = "Tutorial94"},
			TutorialInfoTextShow {TextTag = "Tutorial95"},
			TutorialInfoTextShow {TextTag = "Tutorial96"},
			TutorialInfoTextShow {TextTag = "Tutorial97"},
			TutorialInfoTextShow {TextTag = "Tutorial98"},
			TutorialTaskTextShow {TextTag = "Tutorial99"},
			
		},
	},
}
-------------------------------------------------------------------------------------------
-- Arbeiter zum Silberabbau schicken
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block24",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 99},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ShowSilverMarker"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 99},
			TutorialWorkerIsGatheringSilver	{Amount = 2},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 99},
			TutorialInfoTextShow {TextTag = "Tutorial100"},
			TutorialTaskTextShow {TextTag = "Tutorial101"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Block25",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 101},
			PlayerHasResourceSilver {Amount = 50},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_ShowSilverMarker"},
			TutorialTaskSetSolved {Take = 101},
			TutorialTaskTextShow {TextTag = "Tutorial102"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- weitere Arbeiter am Haupthaus bauen
-------------------------------------------------------------------------------------------
-- TODO: haupthaus selektiert
-- TODO: 5 worker in der queue
State
{
	StateName = "Block25",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 102},
			BuildingIsSelected {BuildingId = Building.RTS.RealmHeadquarter},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 102},
			TutorialInfoTextShow {TextTag = "Tutorial103"},
			TutorialInfoTextShow {TextTag = "Tutorial104"},
			TutorialTaskTextShow {TextTag = "Tutorial105"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Block26",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 105},
			PlayerHasUnitAmount {Amount = 10, UnitId = 69},
			-- oder 5 worker in queue
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_ShowStoneMarker"},
			TutorialTaskSetSolved {Take = 105},
			-- Gibbet nicht mehr
			--TutorialInfoTextShow {TextTag = "Tutorial106"},
			TutorialInfoTextShow {TextTag = "Tutorial107"},
			TutorialInfoTextShow {TextTag = "Tutorial108"},
			TutorialInfoTextShow {TextTag = "Tutorial109"},
			TutorialInfoTextShow {TextTag = "Tutorial110"},
			TutorialInfoTextShow {TextTag = "Tutorial111"},
			TutorialTaskTextShow {TextTag = "Tutorial112"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- eine Schmiede bauen
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block26",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 112},
			OR
			{
				BuildingIsAboutToBeBuilt {BuildingId = 128},
				PlayerHasBuilding {BuildingId = Building.RTS.RealmBlacksmith, Amount = 1, OnlyCompleted = false},
			},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_ShowStoneMarker"},
			MapFlagSetTrue {Name = "mf_ShowForgeMarker"},
			TutorialTaskSetSolved {Take = 112},
			TutorialTaskTextShow {TextTag = "Tutorial113"},
			TutorialCameraCenterOnEntity {Tag = "ForgeMarker"},
			TutorialCameraSetZoom {Zoom = 7},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Block28",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 113},
			PlayerHasBuilding {BuildingId = Building.RTS.RealmBlacksmith, Amount = 1, OnlyCompleted = true},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_ShowForgeMarker"},
			TutorialTaskSetSolved {Take = 113},
			TutorialInfoTextShow {TextTag = "Tutorial114"},
			TutorialInfoTextShow {TextTag = "Tutorial115"},
			TutorialTaskTextShow {TextTag = "Tutorial116"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- 5 Soldaten bauen
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block28",
	OnOneTimeEvent
	{
		GotoState = "Block29",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 116},
			PlayerHasUnitAmount {UnitId = Unit.RTS.RealmSoldier, Amount = 5},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 116},
			TutorialInfoTextShow {TextTag = "Tutorial117"},
			TutorialInfoTextShow {TextTag = "Tutorial118"},
			TutorialTaskTextShow {TextTag = "Tutorial119"},
			--FigureTeamTransfer {Tag = "ArmyTarget1", Team = "tm_Team2"},
			--FigureTeamTransfer {Tag = "ArmyTarget2", Team = "tm_Team2"},
			--FigureTeamTransfer {Tag = "ArmyTarget3", Team = "tm_Team2"},
			--FigureTeamTransfer {Tag = "ArmyTarget4", Team = "tm_Team2"},
			FogOfWarRevealAtEntity	{Tag = "ArmyTarget4", Range = 10, Height = 4, FogOfWarId = 10},
			MapFlagSetTrue {Name = "mf_ShowArmyAttackMarker"},
			MapFlagSetTrue {Name = "mf_P301_BridgeArmyDoNotRespawn"},
			GateSetOpen {Tag = "Gate3"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- mit Soldaten Gegner angreifen
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block29",
	OnOneTimeEvent
	{
		GotoState = "Block30",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 119},
			FigureIsDead {Tag = "ArmyTarget1"},
			FigureIsDead {Tag = "ArmyTarget2"},
			FigureIsDead {Tag = "ArmyTarget3"},
			FigureIsDead {Tag = "ArmyTarget4"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_ShowArmyAttackMarker"},
			TutorialTaskSetSolved {Take = 119},
			TutorialInfoTextShow {TextTag = "Tutorial120"},
			TutorialInfoTextShow {TextTag = "Tutorial121"},
			TutorialTaskTextShow {TextTag = "Tutorial122"},
			--FogOfWarCloak {FogOfWarId = 10},
			
		},
	},
}
-------------------------------------------------------------------------------------------
-- Schmiede upgraden
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block30",
	OnOneTimeEvent
	{
		GotoState = "Block34",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 122},
			PlayerHasBuilding	{BuildingId = Building.RTS.RealmBlacksmith, OnlyCompleted = false,
									UpgradeId = Building.Upgrade.RealmWorkshop, Amount = 1},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 122},
			TutorialInfoTextShow {TextTag = "Tutorial123"},
			TutorialInfoTextShow {TextTag = "Tutorial124"},
			TutorialInfoTextShow {TextTag = "Tutorial125"},
			TutorialInfoTextShow {TextTag = "Tutorial126"},
			TutorialInfoTextShow {TextTag = "Tutorial127"},
			TutorialTaskTextShow {TextTag = "Tutorial128"},
			FigureRtsKitSpawn {UnitId = 69, Level = 2, X = 511, Y = 414, PlayerKit = "pk_Give"},
			FigureRtsKitSpawn {UnitId = 69, Level = 2, X = 511, Y = 413, PlayerKit = "pk_Give"},
			FigureRtsKitSpawn {UnitId = 69, Level = 2, X = 509, Y = 415, PlayerKit = "pk_Give"},
			PlayerKitTransfer {PlayerKit = "pk_Give"}
		},
	},
}
-------------------------------------------------------------------------------------------
-- Bauernhof bauen, dann Fernkämpfer produzieren
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block34",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 128},
			PlayerUnitIsInGroup {Group = 0, UnitId = Unit.RTS.RealmCraftsman, Amount = 3},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 128},
			TutorialTaskTextShow {TextTag = "Tutorial129"},
			MapFlagSetTrue {Name = "mf_ShowFarmMarker"},
			TutorialCameraCenterOnEntity {Tag = "FarmMarker"},
			TutorialCameraSetZoom {Zoom = 7},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 129},
			PlayerHasBuilding  {BuildingId = Building.RTS.RealmFarm, OnlyCompleted = false, Amount = 1},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_ShowFarmMarker"},
			TutorialTaskSetSolved {Take = 129},
			TutorialTaskTextShow {TextTag = "Tutorial130"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 130},
			PlayerHasUnitAmount	{UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 130},
			TutorialInfoTextShow {TextTag = "Tutorial131"},
			TutorialTaskTextShow {TextTag = "Tutorial132"},
		},
		GotoState = "Block35",
	},
}
-------------------------------------------------------------------------------------------
-- Einheiten in Gruppen stecken
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block35",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 132},
			PlayerUnitIsInGroup {Group = 0, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 132},
			TutorialTaskTextShow {TextTag = "Tutorial133"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 133},
			OR
			{
				PlayerUnitIsInGroup {Group = 1, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 2, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 3, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 4, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 5, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 6, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 7, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 8, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 9, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 10, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
			}
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 133},
			TutorialInfoTextShow {TextTag = "Tutorial134"},
			TutorialInfoTextShow {TextTag = "Tutorial135"},
			TutorialTaskTextShow {TextTag = "Tutorial136"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Block37",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 136},
			OR
			{
				PlayerUnitIsInGroup {Group = 1, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 2, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 3, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 4, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 5, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 6, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 7, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 8, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 9, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 10, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
			}
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 136},
			TutorialTaskTextShow {TextTag = "Tutorial137"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- mit den Gruppen zum Gegner latschen
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block37",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 137},
			OR
			{
				PlayerFigureIsInRange {X = 408, Y = 581, Range = 30},
				PlayerFigureIsInRange {X = 403, Y = 638, Range = 30},
				PlayerFigureIsInRange {X = 376, Y = 681, Range = 15},
				FigureIsDead {Tag = "LastTuztorialArmy1"},
				FigureIsDead {Tag = "LastTuztorialArmy2"},
				FigureIsDead {Tag = "LastTuztorialArmy3"},
				FigureIsDead {Tag = "LastTuztorialArmy4"},
				FigureIsDead {Tag = "LastTuztorialArmy5"},
				FigureIsDead {Tag = "LastTuztorialArmy6"},
				FigureIsDead {Tag = "VillageAttack1"},
				FigureIsDead {Tag = "VillageAttack2"},
				FigureIsDead {Tag = "VillageAttack3"},
			},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 137},
			TutorialInfoTextShow {TextTag = "Tutorial138"},
			TutorialInfoTextShow {TextTag = "Tutorial139"},
			TutorialInfoTextShow {TextTag = "Tutorial140"},
			TutorialTaskTextShow {TextTag = "Tutorial141"},
		},
		GotoState = "Block38",
	},
}
-------------------------------------------------------------------------------------------
-- den Gegner vernichten
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block38",
	OnOneTimeEvent
	{
		GotoState = "DeadEnd",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 141},
			FigureIsDead {Tag = "LastTuztorialArmy1"},
			FigureIsDead {Tag = "LastTuztorialArmy2"},
			FigureIsDead {Tag = "LastTuztorialArmy3"},
			FigureIsDead {Tag = "LastTuztorialArmy4"},
			FigureIsDead {Tag = "LastTuztorialArmy5"},
			FigureIsDead {Tag = "LastTuztorialArmy6"},
			FigureIsDead {Tag = "VillageAttack1"},
			FigureIsDead {Tag = "VillageAttack2"},
			FigureIsDead {Tag = "VillageAttack3"},
			BuildingIsDead {Tag = "DESiege3"},
			BuildingIsDead {Tag = "DESiege4"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 141},
			TutorialInfoTextShow {TextTag = "Tutorial142"},
			TutorialInfoTextShow {TextTag = "Tutorial143"},
			MapFlagSetTrue {Name = "mf_P301_DamnedTutorialOver"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Tutorial ENDE
-------------------------------------------------------------------------------------------
State	{StateName = "DeadEnd"}

