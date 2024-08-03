------------------------------------------------------------------------
--
--	Wie früher N 0, Handling von Vars, die für mehrere Entities gelten etc
--
--	Iron Fieds
--
----------------------------------------------------------------------------
easy = 1
medium = 2
hard = 3

State
{
	StateName = "INIT",
	-- TEST:
	--OnOneTimeEvent
	--{
	--	EventName = "TUTORIAL_TEXT_TEST_EVENT",
	--	Conditions =
	--	{
	--	},
	--	Actions =
	--	{
	--	},
	--},
	OnOneTimeEvent
	{
		GotoState = "Tutorial",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_GOGOGO"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_NoTutorial"},
			MapFlagSetTrue {Name = "mf_P301_Tutorial"},
		},
	},



	OnOneTimeEvent
	{
		GotoState = "Tutorial",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_Tutorial"},
		},
		Actions =
		{
			PlayerTravelDisable {},
			PortalDisable {Tag = "Portal_Norimar"},
			PortalDisable {Tag = "Portal_DraghLur"},
			PortalDisable {Tag = "Needle"},
			PortalDisable {Tag = "GateOfSwords"},

		},
	},
	OnOneTimeEvent
	{
		GotoState = "Mission",
		Conditions =
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_P301_Mission"},
				QuestIsActive {Quest = "OnToIronFields"},
			}
		},
		Actions =
		{
			GateSetOpen {Tag = "Gate3"},
			GateSetOpen {Tag = "GateTown"},
		},
	},

}

State
{
	StateName = "Tutorial",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			MapTimerStart {Name = "mt_P301_IronFieldsTutorial"},
			QuestSetActive {Quest = "Prolog"},
			QuestSetActive {Quest = "Chapter1ComingHome"},
			FogOfWarRevealAtEntity {Tag = "Fortress", Range = 20, FogOfWarId = 13},
			QuestSetActive {Quest = "IronFieldsPart1Lya"},
			FogOfWarRevealAtEntity {Tag = "LyasHouse", Height = 137, Range = 5, FogOfWarId = 14},
			AvatarFlagSetTrue {Name = "af_P301_CampaignStarted"}
		}
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Encounter3"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_ThirdSpiderKilled"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P301_IronFieldsTutorial", Seconds = 60},
			MapFlagIsTrue {Name = "mf_P301_Cutscene1End"},
			MapValueIsEqual {Name = "mv_P301_TutorialType", Value = hard}
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Bor1", Tag = "Bor"},
			FigureOutcry	{TextTag = "Avatar1", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Avatar2", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Avatar3", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Bor2", Tag = "Bor"},
		}
	},
	-- Vierte Cutscene NightSong Kill bevor es losgeht
	OnOneTimeEvent
	{
		
		Conditions =
		{
			OR
			{
				AND
				{
					FigureIsDead {Tag = "NightSongEncounter2"},
					FigureHasNotHealth	{Tag = "DarkElfRanger", Percent = 40},
				},
				AND
				{
					FigureIsDead {Tag = "DarkElfRanger"},
					FigureHasNotHealth	{Tag = "NightSongEncounter2", Percent = 40},
				},
			},
		},
		Actions =
		{
			FigureAbilityRemove {AbilityId = Ability.Immortal, Tag = "NightSong_Fight"},
			EntityTimerStart {Name = "et_P301_NightSong_Kill"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P301_NightSong_Kill", Seconds = 0.1},
		},
		Actions =
		{
			FigureKill	{Tag = "NightSong_Fight"},
			EntityTimerStop {Name = "et_P301_NightSong_Kill"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "NightSongEncounter2"},
			FigureIsDead {Tag = "DarkElfRanger"},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P301_NightSong_Kill2"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P301_NightSong_Kill2", Seconds = 2},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_P301_NightSong_Kill2"},
			MapFlagSetTrue {Name = "mf_P301_NightSong_Kill"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			--PlayerHasBuilding	{BuildingId = 237, Amount = 1},
			MapTimerIsElapsed {Name = "mt_P301_OutcriesOath", Seconds = 10},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "NightSong1", Tag = "pl_HumanNightsong"},
			FigureOutcry	{TextTag = "Avatar4", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Avatar5", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Avatar6", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Avatar7", Tag = "pl_HumanAvatar"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_TutorialThora"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "NightSong2", Tag = "pl_HumanNightsong"},
			FigureOutcry	{TextTag = "Avatar8", Tag = "pl_HumanAvatar"},
		}
	},
	-- Kolar auf dem Hinweg zu Ur
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Kolar", Range = 20},
		},
		Actions =
		{
			FigureLookAtEntity {Tag = "Kolar", TargetTag = "pl_HumanAvatar"},
			FigureOutcry {TextTag = "Kolar1", Tag = "Kolar"},
			FigureOutcry {TextTag = "Kolar2", Tag = "Kolar"},
			FigureAnimPlayOnce {Tag = "Kolar", File = "base/gfx/figures/hero/figure_hero_male_emote_pray.ska"}
		}
	},
	-- Auf dem Rückweg
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CS_A_08_Darkelves_Vanish"},
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "Kolar", Range = 20},
		},
		Actions =
		{
			FigureOutcryAlert {TextTag = "Kolar3", Tag = "Kolar", TargetTag = "Kolar"},
			FigureOutcry {TextTag = "Kolar4", Tag = "Kolar"},
			MapTimerStart {Name = "mt_P301_KolarOutcries"},
		}
	},
	--Kolar Dialog anmachen, nachdem er den Spieler zu sich gerufen hat
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P301_KolarOutcries", Seconds = 10},
		},
		Actions =
		{
			DialogTypeSetMainQuest {Tag = "Kolar"},
			DialogSetEnabled {Tag = "Kolar"},
			MapTimerStop {Name = "mt_P301_KolarOutcries"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P301_TalkedToUr", Seconds = 10},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "NightSong3", Tag = "pl_HumanNightsong"},
			FigureOutcry	{TextTag = "Avatar9", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Avatar10", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Avatar12", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Avatar13", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "NightSong5", Tag = "pl_HumanNightsong"},
			FigureOutcry	{TextTag = "Avatar14", Tag = "pl_HumanAvatar"},
		}
	},
	-- Spieler bekommt Meldung darüber, dass er die Paktgebäude bekommt
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P301_TutorialWulfger"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "System1", Tag = "System_Npc"}, --SYSTEM-OC: sie haben den Realm bekommen
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Mission",
		Conditions =
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_P301_Mission"},
				QuestIsActive {Quest = "OnToIronFields"},
			}
		},
		Actions =
		{

		},
	},
	
}

-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "Mission",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P301_OutcriesAfterShadowFight", Seconds = 10}
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Malacay1", Tag = "Malacay"},
			FigureOutcry	{TextTag = "Malacay2", Tag = "Malacay"},
			FigureOutcry	{TextTag = "Avatar15", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "NightSong5a", Tag = "pl_HumanNightsong"},
			FigureOutcry	{TextTag = "Avatar15a", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Avatar15b", Tag = "pl_HumanAvatar"},
			
			DialogTypeSetMainQuest {Tag = "IoMission"}, 
			DialogSetEnabled {Tag = "IoMission"},
			DialogTypeSetMainQuest {Tag = "FalkmarMission"}, 
			DialogSetEnabled {Tag = "FalkmarMission"},
			MapTimerStart {Name = "mt_P301_KI"}
		}	
	},
	-- KI startet leicht verzögert
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P301_KI", Seconds = 120}
		},
		Actions =
		{
			PlayerActivate {Player = "pl_DarkElves"},
			PlayerActivate {Player = "pl_EastDECamp"},
		}
	},
	-- Initialisierung beim ersten Betreten der Map, Questen solven starten etc
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue {Name = "af_P301_CampaignStarted"}
		},
		Actions =
		{
			QuestSetSolved {Quest = "OnToIronFields"},
			QuestSetSolved {Quest = "NeedlePart1TheBulwark"},
			QuestSetActive {Quest = "IronFieldsPart21EnterTheShadows"},
			QuestSetActive {Quest = "SpeakToFalkmarAndIo"},
			
			-- Ressourcen übergeben, da der Spieler kein Haupthaus hat
			PlayerTravelDisable {},
			PortalDisable {Tag = "Portal_Norimar"},
			
			-- Für den Aufbau hat der Spieler direkt Ressourcen
			PlayerResourceLenyaGive {Amount = 300},
			PlayerResourceSilverGive {Amount = 300},
			PlayerResourceStoneGive {Amount = 300},

			FigureVanish {Tag = "Bor"},
			FigureVanish {Tag = "Kolar"},
			FigureVanish {Tag = "Thora"},
			FigureVanish {Tag = "Wulfger"},
			
			-- Deko verteilen
			
			ObjectSpawn {X = 49, Y = 620, ObjectId = 80, Direction = 223},
			ObjectSpawn {X = 53, Y = 639, ObjectId = 81, Direction = 69},
			ObjectSpawn {X = 40, Y = 617, ObjectId = 82, Direction = 23},
			ObjectSpawn {X = 49, Y = 625, ObjectId = 83, Direction = 312},
			ObjectSpawn {X = 55, Y = 620, ObjectId = 84, Direction = 323},
			ObjectSpawn {X = 60, Y = 610, ObjectId = 80, Direction = 275},
			-- Blut und Leichern werden erst nach der zweiten Cutscene gespawnt, im Cutscene-Script direkt
			--ObjectSpawn {X = 56, Y = 632, ObjectId = 81, Direction = 69},
			--ObjectSpawn {X = 70, Y = 637, ObjectId = 82, Direction = 77},
			--ObjectSpawn {X = 36, Y = 609, ObjectId = 83, Direction = 17},
			--ObjectSpawn {X = 44, Y = 616, ObjectId = 84, Direction = 188},
			
			--ObjectSpawn {X = 60, Y = 610, ObjectId = 492, Direction = 275},
			--ObjectSpawn {X = 56, Y = 632, ObjectId = 546, Direction = 69},
			--ObjectSpawn {X = 70, Y = 637, ObjectId = 547, Direction = 77},
			--ObjectSpawn {X = 36, Y = 609, ObjectId = 548, Direction = 17},
			--ObjectSpawn {X = 44, Y = 616, ObjectId = 549, Direction = 188},
			
			
		}
	},
	-- Paladinkampf
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigureAbilityAdd {Tag = "Pala1", AbilityId = Ability.Immortal},
			FigureAbilityAdd {Tag = "Pala2", AbilityId = Ability.Immortal},
			FigureAbilityAdd {Tag = "Pala3", AbilityId = Ability.Immortal},
			FigureAbilityAdd {Tag = "Gargoyl1", AbilityId = Ability.Immortal},
		    FigureAbilityAdd {Tag = "Gargoyl2", AbilityId = Ability.Immortal},
			FigureAbilityAdd {Tag = "Gargoyl3", AbilityId = Ability.Immortal},
		}
	},
	-- Wenn der Spieler zum kämpfen da ist wird dem Fakekampf das Unkillable wieder weggenommen
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				PlayerFigureIsInRangeToEntity {TargetTag = "Gargoyl1", Range = 15},
				PlayerFigureIsInRangeToEntity {TargetTag = "Gargoyl2", Range = 15},
				PlayerFigureIsInRangeToEntity {TargetTag = "Gargoyl3", Range = 15},
			}
				
		},
		Actions =
		{
			FigureAbilityRemove {Tag = "Pala1", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "Pala2", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "Pala3", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "Gargoyl1", AbilityId = Ability.Immortal},
		    FigureAbilityRemove {Tag = "Gargoyl2", AbilityId = Ability.Immortal},
			FigureAbilityRemove {Tag = "Gargoyl3", AbilityId = Ability.Immortal},
		}
	},
	-- Wenn der Spieler keine Greifen mehr hat ist Game Over
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AND
				{
					QuestIsActive {Quest = "SendAirUnitsToFreeNorthcamp"},
					FigureIsDead {Tag = "GivenArmy22"},
					FigureIsDead {Tag = "GivenArmy23"},
					FigureIsDead {Tag = "GivenArmy24"},
					FigureIsDead {Tag = "GivenArmy25"},
					FigureIsDead {Tag = "GivenArmy26"},
					FigureIsDead {Tag = "GivenArmy27"},
				},
				AND
				{
					QuestIsNotSolved {Quest = "GatherLenya"},
					FigureUnitRtsIsNotInRange {Range = 30, X = 618, Y = 614, UnitId = 69},
					FigureUnitRtsIsNotInRange {Range = 30, X = 648, Y = 614, UnitId = 69},
					FigureUnitRtsIsNotInRange {Range = 30, X = 590, Y = 614, UnitId = 69},
					FigureUnitRtsIsNotInRange {Range = 30, X = 618, Y = 644, UnitId = 69},
					FigureUnitRtsIsNotInRange {Range = 30, X = 618, Y = 590, UnitId = 69},
					PlayerBuildingIsNotInRange {Range = 20, X = 618, Y = 614, BuildingId = 118}
				},
			}
		},
		Actions =
		{
			PlayerGameOver {LocaTag = "GameOverSF2IFNotEnoughLenya"},
		}
	},
	-- Die KI hat keine Möglichkeit Lenya abzubauen, also bekommt sie es periodisch
	OnEvent
	{
		Conditions =
		{
			PlayerHasNotResourceLenya	{Player = "pl_DarkElves", Amount = 150},
			PlayerHasBuildingAmount	{Player = "pl_DarkElves", Amount = 1, OnlyCompleted = default},
		},
		Actions =
		{
			PlayerResourceLenyaGive	{Player = "pl_DarkElves", Amount = 1200},
		}
	},
	-- Der Spieler hat mit Falkmar und Io gesprcoehn, die Quest wird weitergeschaltet
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_P309_TalkedToIoMission"},
			MapFlagIsTrue {Name = "mf_P309_TalkedToFalkmar"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "SpeakToFalkmarAndIo"}, 
			-- Unexplored bei den Greifen aufdecken
			FogOfWarRevealAtEntity {Tag = "Gargoyl2", Range = 10, FogOfWarId = 15},
		}
	},
	-- Der Drache ist besiegt Malacay fliegt durch den Aether
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P301_OutcriesAfterDragonFight", Seconds = 130},
			FigureIsAlive {Tag = "pl_HumanAvatar"},
			FigureIsAlive {Tag = "Malacay"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Malacay3", Tag = "Malacay"},
			FigureOutcry {TextTag = "Malacay4", Tag = "Malacay"},
			FigureOutcry {TextTag = "Avatar16", Tag = "pl_HumanAvatar"},
			FigureOutcry {TextTag = "Avatar17", Tag = "pl_HumanAvatar"},
			FigureVanish {Tag = "Malacay"},
		}
	},
	-- Faken wir doch mal ein wenig für die KI
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P301_OutcriesAfterDragonFight", Seconds = 420},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Troup1"}
		},
	},
	-- Faken wir doch mal ein wenig für die KI Teil 2
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P301_OutcriesAfterDragonFight", Seconds = 840},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_Troup2"}
		},
	},
	-- Spieler hat Flugeinheiten zum Aussenposten geschickt
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerFigureIsInRange	{Range = 30, X = 615, Y = 610, Player = "pl_Human"},
			FigureIsDead {Tag = "Gargoyl1"},
			FigureIsDead {Tag = "Gargoyl2"},
			FigureIsDead {Tag = "Gargoyl3"},
			QuestIsActive {Quest = "SendAirUnitsToFreeNorthcamp"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "SendAirUnitsToFreeNorthcamp"},
			PlayerKitTransfer {PlayerKit = "pk_Outpost"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerHasResourceLenya {Amount = 1000},
			QuestIsActive {Quest = "GatherLenya"},
		},
		Actions =
		{
			AvatarItemMiscGive {ItemId = 250, Amount = 1},
			PlayerResourceLenyaTake	{Player = "pl_Human", Amount = 1000},
			FigureNpcSpawn {Tag = "Worker", Level = 12, UnitId = 303, Team = "tm_Team2", X = 222, Y = 567},
			FigureOutcry {Tag = "Worker", TextTag = "Lenyacall1"},
			FigureVanish {Tag = "Worker"},
			QuestSetSolved {Quest = "GatherLenya"},
			QuestSetActive {Quest = "AwakeTreants"},
			FogOfWarRevealAtEntity {Tag = "Grimrot", Range = 15, FogOfWarId = 16},
			DialogTypeSetMainQuest {Tag = "ForrestShrine"},
			DialogSetEnabled {Tag = "ForrestShrine"},
			DialogSetEnabled {Tag = "IoMission"}
		}
	},
	
	-- ALle Belagerer sind tot
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "StormTheFortress"},
			FigureIsDead {Tag = "PartIIFortressArmy1"},
			FigureIsDead {Tag = "PartIIFortressArmy2"},
			FigureIsDead {Tag = "PartIIFortressArmy3"},
			FigureIsDead {Tag = "PartIIFortressArmy4"},
			FigureIsDead {Tag = "PartIIFortressArmy5"},
			FigureIsDead {Tag = "PartIIFortressArmy6"},
			FigureIsDead {Tag = "PartIIFortressArmy7"},
			FigureIsDead {Tag = "PartIIFortressArmy8"},
			FigureIsDead {Tag = "PartIIFortressArmy9"},
			FigureIsDead {Tag = "PartIIFortressArmy10"},
			FigureIsDead {Tag = "PartIIFortressArmy11"},
			FigureIsDead {Tag = "PartIIFortressArmy12"},
			FigureIsDead {Tag = "PartIIFortressArmy13"},
			FigureIsDead {Tag = "PartIIFortressArmy14"},
			FigureIsDead {Tag = "PartIIFortressArmy15"},
			FigureIsDead {Tag = "PartIIFortressArmy16"},
			FigureIsDead {Tag = "PartIIFortressArmy17"},
			FigureIsDead {Tag = "PartIIFortressArmy18"},
			FigureIsDead {Tag = "PartIIFortressArmy19"},
			FigureIsDead {Tag = "PartIIFortressArmy20"},
			FigureIsDead {Tag = "PartIIFortressArmy21"},
			FigureIsDead {Tag = "PartIIFortressArmy22"},
			FigureIsDead {Tag = "PartIIFortressArmy23"},
			FigureIsDead {Tag = "PartIIFortressArmy24"},
			FigureIsDead {Tag = "PartIIFortressArmy25"},
			FigureIsDead {Tag = "PartIIFortressArmy26"},
			FigureIsDead {Tag = "PartIIFortressArmy27"},
			FigureIsDead {Tag = "PartIIFortressArmy28"},
			FigureIsDead {Tag = "PartIIFortressArmy29"},
			FigureIsDead {Tag = "PartIIFortressArmy30"},
			FigureIsDead {Tag = "PartIIFortressArmy31"},
			FigureIsDead {Tag = "PartIIFortressArmy32"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "StormTheFortress"}, 
			QuestSetActive {Quest = "KillHydra"},
			FogOfWarRevealAtEntity {Tag = "Hydra", Range = 10, FogOfWarId = 17}
		}	
	},
	-- Questrewards Bossgegner
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "SinistronOkhaz"},						 
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_DarkElfBoss1Dead"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "ArchonShazida"}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P301_DarkElfBoss2Dead"}
		}
	},
	-- Toth Lar geht, wenn Der SPieler kommt
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerFigureIsInRangeToEntity {Range = 20, TargetTag = "TothLar"}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_CS_A_08_TothLar_Vanish"},
		}
	},
}
