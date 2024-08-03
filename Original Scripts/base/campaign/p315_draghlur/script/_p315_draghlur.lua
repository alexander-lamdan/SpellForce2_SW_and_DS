------------------------------------------------------------------------
--
--	Wie früher N 0, Handling von Vars, die für mehrere Entities gelten etc
--
--	Dragh Lur
--
----------------------------------------------------------------------------

-- SingleMapLoadEvent einladen
dofile("base/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "INIT",

	-- hat man nicht mit dem Pionier auf Tuscari gesprocehn gibt es auch keine Pioniere
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsFalse {Name = "af_P314_PioneerTroopsGained"},
		},
		Actions =
		{
			FigureVanish {Tag = "Pioneer1"},
			FigureVanish {Tag = "Pioneer2"},
			FigureVanish {Tag = "Pioneer3"},
			FigureVanish {Tag = "Pioneer4"},
			FigureVanish {Tag = "Pioneer5"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			
			
			-- "Richtige" Solver, die auch in der Campagne drin bleiben
			QuestSetSolved {Quest = "OnToDraghLur"},
			QuestSetSolved {Quest = "GoSPart9MarchToDraghLur"},
			QuestSetActive {Quest = "DraghLurPart1ReachFortress"},
			QuestSetActive {Quest = "GetToDraghLur"},
			QuestSetActive {Quest = "WatchOutForTraps"},
			
			--PlayerActivate {Player = "pl_SwampCamp1"},
			--PlayerActivate {Player = "pl_SwampCamp2"},
			
			PlayerBuildingUpgradeAdd {UpgradeId = Building.Upgrade.ClansSiegeWorkshop},
			PlayerBuildingUpgradeAdd {UpgradeId = 39},
			FogOfWarRevealAtEntity {Tag = "Fortress", Range = 15, Height = 120},
			PlayerTravelDisable {},
			PortalDisable {Tag = "Portal_Shal"},
			PortalDisable {Tag = "Portal_IronFields"},
			PortalDisable {Tag = "Portal_Start"},
			FigureVanish {Tag = "NightSong"},
		},
	},
	-- Der Eisenfürst muss überleben, bis die Map zu Ende ist
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "IronLordMustLive"},
			FigureIsDead {Tag = "IronLord"},
		},
		Actions =
		{
			PlayerGameOver {Tag = "IronLord_DEAD", LocaTag = "GameOverSF2IronlordDied"},
		}
	},

	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigureOutcry {Tag = "IronLord", TextTag = "IronLord2"},
		}
	},
	
	-- Boss des Lagers kurz vor der Festung ist tot --> XP
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "CampBoss1"}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P315_MiddleCampBossKilled"}
		}
	},
	-- Boss des Lagers kurz im Südosten ist tot --> XP
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "CampBoss2"}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P315_SECampBossKilled"}
		}
	},
	-- Bossgegner der beiden Ebenen sind tot, dafür gibt es XP
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "FortressBoss1"}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P315_DLLvl1Boss"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "FortressBoss2"}
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P315_DLLvl2Boss"}
		}
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "TothLar"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "ToDraghLurTop"},
			QuestSetSolved {Quest = "DraghLurPart2TheFortress"},
			QuestSetSolved {Quest = "SF2_2_Akt"},
			QuestSetSolved {Quest = "4_KapitelAkt2"},
			QuestSetActive {Quest = "SF2_3_Akt"},
			QuestSetActive {Quest = "1_KapitelAkt3"},
			QuestSetActive {Quest = "ShalPart1Trapped"},
			MapTimerStart {Name = "mt_P315_TothLarDead"},
			MapFlagSetTrue {Name = "mf_P315_TothLarKilled"}
		}
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth {Tag = "TothLar", Percent = 99},
		},
		Actions =
		{
			FigureOutcry {Tag = "TothLar", TextTag = "TothLar3"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange {Tag = "TothLar", TargetTag = "pl_HumanAvatar", Range = 5},
		},
		Actions =
		{
			FigureOutcry {Tag = "TothLar", TextTag = "TothLar4"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth {Tag = "TothLar", Percent = 25},
		},
		Actions =
		{
			FigureOutcry {Tag = "IronLord", TextTag = "Avatar2"},
		}
	},
	-- Es gibt nur noch eine bestimmte Anzahl an gebäuden, oder der SPieler ist in die Festung eingedrungen, also werden die KIs in der Festung böse
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AND
				{
					PlayerHasNotFigureAmountEx	{Player  = "pl_SwampCamp1", Amount = 10, CountWorkers = false,  CountAvatarAndHeroes = false},
     				PlayerHasNotBuildingAmount{Player =  "pl_SwampCamp1", Amount = 5, OnlyCompleted = yes},
     			},
     			PlayerFigureIsInRange {Range = 10, X = 476, Y = 485}
     		}

		},
		Actions =
		{
			PlayerActivate {Player = "pl_Fortress1"},
			PlayerActivate {Player = "pl_Fortress2"},
		}
	},
	-- Der Spieler hat es durch den Sumpf geschafft, die Fallenquest wird gelöst der rest gestartet
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerHasNotBuildingAmount {Player =  "pl_SwampCamp1", Amount = 3, OnlyCompleted = yes},
     	},
		Actions =
		{
			GateSetOpen {Tag = "OuterGate"},
			FigureAttackEntity {Tag = "ComeOut1", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity {Tag = "ComeOut2", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity {Tag = "ComeOut3", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity {Tag = "ComeOut4", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity {Tag = "ComeOut5", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity {Tag = "ComeOut6", TargetTag = "pl_HumanAvatar"},
		}	
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerFigureIsInRange {Range = 10, X = 494, Y = 379}
		},
		Actions =
		{
			QuestSetSolved {Quest = "WatchOutForTraps"},
			FigureOutcry {Tag = "IronLord", TextTag = "IronLord1"},
			QuestSetSolved {Quest = "GetToDraghLur"},
			QuestSetSolved {Quest = "DraghLurPart1ReachFortress"},
			QuestSetActive {Quest = "DraghLurPart2TheFortress"},
			QuestSetActive {Quest = "DestroyDraghLurTowers"},
			FogOfWarRevealAtEntity {Tag = "Tower1", Range = 5, Height = 140},
			FogOfWarRevealAtEntity {Tag = "Tower2", Range = 5, Height = 140},
			FogOfWarRevealAtEntity {Tag = "Tower3", Range = 5, Height = 140},
			FogOfWarRevealAtEntity {Tag = "Tower4", Range = 5, Height = 140},
			FogOfWarRevealAtEntity {Tag = "Tower5", Range = 5, Height = 140},
			FogOfWarRevealAtEntity {Tag = "Tower6", Range = 5, Height = 140},
		}
	},
	-- Der Eisenfürst muss überleben, bis die Map zu Ende ist
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "IronLordMustLive"},
			FigureIsDead {Tag = "IronLord"}
		},
		Actions =
		{
			PlayerGameOver {Tag = "IronLord_DEAD", LocaTag = "GameOverSF2IronlordDied"},
		}
	}
}