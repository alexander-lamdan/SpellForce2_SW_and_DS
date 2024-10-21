---------------------
-- P406_The_Citadel
-- Explorers Sidequest
---------------------

if DEBUG and QUESTDEBUG then
	OnEvent
	{
		Conditions = 
		{
			DebugQuestionYes	{Caption = "SQ Citadel Quickstart Part 2", Question = "Gleich den zweiten Teil der Citadel SideQuest starten? (löst automatisch die ersten 3 Questen)"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_SQCitadel_SpawnExplorerOutcries"},
			MapTimerStart	{Name = "mt_SQCitadel_QuarrelExplorerFrequency"},
			MapFlagSetTrue	{Name = "mf_SQCitadel_StandardQuestsSolved"},
			MapTimerStart	{Name = "mt_SQCitadel_AggroExplorerOutcries"},
    
			QuestSetActive	{Quest = "CitadelExplorers"},
			
			QuestSetActive	{Quest = "CitadelWidegantCollectCrystals"},
			QuestSetActive	{Quest = "CitadelWidegantCollectCrystalsDone"},
			QuestSetActive	{Quest = "CitadelBirnbaumCreatureCatalogue"},
			QuestSetActive	{Quest = "CitadelBirnbaumCreatureCatalogueDone"},
			QuestSetActive	{Quest = "CitadelJonJonCollectDiaryPages"},
			QuestSetActive	{Quest = "CitadelJonJonCollectDiaryPagesDone"},
    
			QuestSetSolved	{Quest = "CitadelWidegantCollectCrystals"},
			QuestSetSolved	{Quest = "CitadelWidegantCollectCrystalsDone"},
			QuestSetSolved	{Quest = "CitadelBirnbaumCreatureCatalogue"},
			QuestSetSolved	{Quest = "CitadelBirnbaumCreatureCatalogueDone"},
			QuestSetSolved	{Quest = "CitadelJonJonCollectDiaryPages"},
			QuestSetSolved	{Quest = "CitadelJonJonCollectDiaryPagesDone"},
			
			ObjectVanish	{Tag = "OldDeposit"},
		},
		GotoState = "AggroQuests",
	};
end

local tRemoveCrystals = {}
for i = 1, 18 do
	table.insert(tRemoveCrystals, ObjectVanish	{Tag = "SQCitadel_Crystal" .. i})
end

local tRemoveDiary = {}
for i = 1, 14 do
	if i > 10 then
		table.insert(tRemoveDiary, ObjectVanish	{Tag = "SQCitadel_Diary" .. i})
	else
		table.insert(tRemoveDiary, FigureVanish	{Tag = "SQCitadel_Diary" .. i})
	end
end

State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{ItemId = 296, Amount = 12},	-- Kristallbrocken
		},
		Actions = tRemoveCrystals,
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{ItemId = 299, Amount = 10},	-- Tagebuchseiten
		},
		Actions = tRemoveDiary,
	};

	-- erst aktiv wenn auch die Quest gestartet wurde
	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CitadelExplorers"},
			FigureIsAlive	{Tag = "Widegant"},
			FigureIsAlive	{Tag = "Birnbaum"},
			FigureIsAlive	{Tag = "JonJon"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_SQCitadel_SpawnExplorerOutcries"},
			MapTimerStart	{Name = "mt_SQCitadel_QuarrelExplorerFrequency"},
		},
		GotoState = "StandardQuests",
	};
}


-- =========================================================================================================
-- die ersten 3 Standardquesten werden hier behandelt
-- =========================================================================================================

State
{
	StateName = "StandardQuests",
	
	-- kann leider nur mutmassen wie lange die Outcries dauern
	-- daher einschalten der Dialoge nach fixer Zeit
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SQCitadel_SpawnExplorerOutcries", Seconds = 30},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Widegant"},
			DialogSetEnabled	{Tag = "Birnbaum"},
			DialogSetEnabled	{Tag = "JonJon"},
		},
	};


	-- Widegants erste Quest lösen wenn die Aufgabe erledigt wurde
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CitadelWidegantCollectCrystals"},
			AvatarHasItemMisc	{ItemId = 296, Amount = 12},	-- Kristallbrocken
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "CitadelWidegantCollectCrystals"},
			QuestSetActive	{Quest = "CitadelWidegantCollectCrystalsDone"},
			DialogSetEnabled	{Tag = "Widegant"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{ItemId = 296, Amount = 12},	-- Kristallbrocken
		},
		Actions = tRemoveCrystals,
	};
	-- Birnbaums Kreaturen killcounten ... reine Questbuch-Anzeige-Geschichte
	-- für den Fall, das der Spieler vor dem Start der Quest bereits Kreaturen gefunden hat
	-- dann muss für die bisher gefundenen Kreaturen der KillCounter erhöht werden
	-- denn ein KillCountIncrease, ohne das die Quest aktiv ist, wird nicht mitgezählt
	OnEvent
	{
		EventName = "___Counting_Birnbaum_Creatures___THIS_EVENT_MAY_TRIGGER_REPEATEDLY___This_is_not_a_Bug___",
		Conditions = 
		{
			QuestIsKnown	{Quest = "CitadelBirnbaumCreatureCatalogue"},
			MapValueIsLessThanVariable	{Name = "mv_BirnbaumCreaturesCounted", Variable = "mv_BirnbaumCreaturesFound"},
		},
		Actions = 
		{
			MapValueAdd	{Name = "mv_BirnbaumCreaturesCounted", Value = 1},
			PlayerNPCKillCountIncrease	{UnitId = 1082},
		},
	};
	-- Birnbaums erste Quest lösen wenn die Aufgabe erledigt wurde
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CitadelBirnbaumCreatureCatalogue"},
			MapValueIsEqual	{Name = "mv_BirnbaumCreaturesFound", Value = 5},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "CitadelBirnbaumCreatureCatalogue"},
			QuestSetActive	{Quest = "CitadelBirnbaumCreatureCatalogueDone"},
			DialogSetEnabled	{Tag = "Birnbaum"},
		},
	};
	-- JonJon Quest lösen wenn die Aufgabe erledigt wurde
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CitadelJonJonCollectDiaryPages"},
			AvatarHasItemMisc	{ItemId = 299, Amount = 10},	-- Tagebuchseiten
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "CitadelJonJonCollectDiaryPages"},
			QuestSetActive	{Quest = "CitadelJonJonCollectDiaryPagesDone"},
			DialogSetEnabled	{Tag = "JonJon"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{ItemId = 299, Amount = 10},	-- Tagebuchseiten
		},
		Actions = tRemoveDiary,
	};

	-- gelegentlich Streit-Outcries abspielen, wenn Avatar in der Nähe ist
	OnToggleEvent
	{
		OnConditions = 
		{
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "OldDeposit", Range = 30},
			MapTimerIsElapsed	{Name = "mt_SQCitadel_SpawnExplorerOutcries", Seconds = 300},
		},
		OnActions = 
		{
			--DebugMessage	{Message = "out of range"},
		},
		OffConditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "OldDeposit", Range = 25},
			MapTimerIsElapsed	{Name = "mt_SQCitadel_QuarrelExplorerFrequency", Seconds = 300},
		},
		OffActions = 
		{
			--DebugMessage	{Message = "in range again, play outcries"},
			MapTimerStart	{Name = "mt_SQCitadel_QuarrelExplorerOutcries"},
			MapValueIncrease	{Name = "mv_SQCitadel_QuarrelCount"},
			MapTimerStart	{Name = "mt_SQCitadel_QuarrelExplorerFrequency"},
		},
	};


	-- wenn alle 3 Standardquesten gelöst wurden, geht es mit den Aggro Questen weiter
	OnEvent
	{
		EventName = "GotoAggroQuests",
		Conditions = 
		{
			QuestIsSolved	{Quest = "CitadelWidegantCollectCrystalsDone"},
			QuestIsSolved	{Quest = "CitadelBirnbaumCreatureCatalogueDone"},
			QuestIsSolved	{Quest = "CitadelJonJonCollectDiaryPagesDone"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_SQCitadel_StandardQuestsSolved"},
			MapTimerStart	{Name = "mt_SQCitadel_AggroExplorerOutcries"},
		},
		GotoState = "AggroQuests",
	};
};


-- =========================================================================================================
-- die abschliessenden Aggroquesten kommen hier zum Zug
-- =========================================================================================================
State
{
	StateName = "AggroQuests",
	
	-- kann leider nur mutmassen wie lange die Outcries dauern
	-- daher wiedereinschalten der Dialoge nach fixer Zeit
	OnOneTimeEvent
	{
		EventName = "EnableDialogForAll_2ndPart",
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SQCitadel_AggroExplorerOutcries", Seconds = 2},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Widegant"},
			DialogSetEnabled	{Tag = "Birnbaum"},
			DialogSetEnabled	{Tag = "JonJon"},
			
			-- Birnbaums Kiste mit Loot füllen und mit "Dialogschloss" versehen:
			--ObjectLootItemMiscAdd	{Tag = "BirnbaumsChest", DropChance = 100, ItemId = 297},
			DialogSetEnabled	{Tag = "BirnbaumsChest"},
		},
	};


	-- Foliant aus Kiste gelootet...
	OnOneTimeEvent
	{
		EventName = "ChestFoliantLooted",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQCitadel_GiveFoliantFromChest"},
			--GameInterfaceIsVisible{},
			AvatarIsNotTalking{},
		},
		Actions = 
		{
			AvatarItemMiscGive	{ItemId = 297, Amount = 1},
			ObjectVanish	{Tag = "BirnbaumsChest"},
		},
	};

	-- Foliant aus Kiste gelootet, Kampf abkürzen...
	OnOneTimeEvent
	{
		EventName = "ChestFoliantLooted",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQCitadel_ExplorersFighting"},
			MapFlagIsTrue	{Name = "mf_SQCitadel_GiveFoliantFromChest"},
			MapTimerIsElapsed	{Name = "mt_SQCitadel_ExplorerFight", Seconds = 8},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_SQCitadel_GotBirnbaumFoliant"},
		},
	};

	-- JonJon's Kampf ist vorbei
	OnOneTimeEvent
	{
		EventName = "JonJonFightOver",
		Conditions = 
		{
			OR
			{
				MapTimerIsElapsed	{Name = "mt_SQCitadel_GotBirnbaumFoliant", Seconds = 6},
				MapTimerIsElapsed	{Name = "mt_SQCitadel_ExplorerFight", Seconds = 60},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_SQCitadel_ExplorersFighting"},
			MapTimerStop	{Name = "mt_SQCitadel_ExplorerFight"},

			MapFlagSetTrue	{Name = "mf_SQCitadel_ExplorerFightOver"},
			MapTimerStart	{Name = "mt_SQCitadel_ExplorerFightOver"},

			FigureTeamTransfer	{Tag = "Birnbaum",	Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "Widegant",	Team = "tm_Neutral"},
			--FigureTeamTransfer	{Tag = "JonJon",	Team = "tm_Neutral"},
			FigureStop	{Tag = "Birnbaum"},
			FigureStop	{Tag = "Widegant"},
			FigureStop	{Tag = "JonJon"},
			FigureHateClear	{Tag = "Birnbaum"},
			FigureHateClear	{Tag = "Widegant"},
			FigureHateClear	{Tag = "JonJon"},
			FigureAbilityRemove	{Tag = "Birnbaum", AbilityId = Ability.Immortal},
			FigureAbilityRemove	{Tag = "Widegant", AbilityId = Ability.Immortal},
			FigureAbilityRemove	{Tag = "JonJon", AbilityId = Ability.Immortal},

			--QuestSetActive	{Quest = "CitadelJonJonWantsThemDead"},
			--QuestSetSolved	{Quest = "CitadelJonJonWantsThemDead"},
		},
	};


	-- killcounter für kill'em all questpart von JonJon
	OnOneTimeEvent
	{
		EventName = "JonJonWantsThemDead_WidegantKillCount",
		Conditions = 
		{
			QuestIsActive	{Quest = "CitadelJonJonWantsThemDead"},
			FigureIsDead	{Tag = "Widegant"},
		},
		Actions = 
		{
			PlayerNPCKillCountIncrease	{UnitId = 1079},
		},
	};
	OnOneTimeEvent
	{
		EventName = "JonJonWantsThemDead_BirnbaumKillCount",
		Conditions = 
		{
			QuestIsActive	{Quest = "CitadelJonJonWantsThemDead"},
			FigureIsDead	{Tag = "Birnbaum"},
		},
		Actions = 
		{
			PlayerNPCKillCountIncrease	{UnitId = 1080},
		},
	};

	-- beide getötet und Schädel gelootet...
	OnOneTimeEvent
	{
		EventName = "JonJonWantsThemDeadAndGotLoot_EnableJonJonDialog",
		Conditions = 
		{
			QuestIsActive	{Quest = "CitadelJonJonWantsThemDead"},
			AvatarHasItemMisc	{ItemId = 300, Amount = 1},
			AvatarHasItemMisc	{ItemId = 301, Amount = 1},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "JonJon"},
		},
	};


	OnOneTimeEvent
	{
		EventName = "OnWidegantDeathSetQuestUnsolvable", 
		Conditions = 
		{
			FigureIsDead	{Tag = "Widegant"},
			QuestIsActive	{Quest = "CitadelWidegantWantsFoliant"},
		},
		Actions = 
		{
			QuestSetUnsolvable	{Quest = "CitadelWidegantWantsFoliant"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "OnBirnbaumDeathSetQuestUnsolvable", 
		Conditions = 
		{
			FigureIsDead	{Tag = "Birnbaum"},
			QuestIsActive	{Quest = "CitadelBirnbaumKnowsWhatWidegantDid"},
		},
		Actions = 
		{
			QuestSetUnsolvable	{Quest = "CitadelBirnbaumKnowsWhatWidegantDid"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "OnJonJonDeathSetQuestUnsolvable", 
		Conditions = 
		{
			FigureIsDead	{Tag = "JonJon"},
			QuestIsActive	{Quest = "CitadelJonJonWantsThemDead"},
		},
		Actions = 
		{
			QuestSetUnsolvable	{Quest = "CitadelJonJonWantsThemDead"},
		},
	};


	-- alle tot bzw. alle Questschritte gelöst
	OnEvent
	{
		EventName = "SQCitadel_FINISHED",
		Conditions = 
		{
			OR
			{
				FigureIsDead	{Tag = "JonJon"},
				QuestIsSolved	{Quest = "CitadelJonJonWantsThemDead"},
				QuestIsUnsolvable	{Quest = "CitadelJonJonWantsThemDead"},
				MapFlagIsTrue	{Name = "mf_SQCitadel_JonJonRewardC"},
			},
			OR
			{
				FigureIsDead	{Tag = "Widegant"},
				QuestIsSolved	{Quest = "CitadelWidegantWantsFoliant"},
				QuestIsUnsolvable	{Quest = "CitadelWidegantWantsFoliant"},
			},
			OR
			{
				FigureIsDead	{Tag = "Birnbaum"},
				QuestIsSolved	{Quest = "CitadelBirnbaumKnowsWhatWidegantDid"},
				QuestIsUnsolvable	{Quest = "CitadelBirnbaumKnowsWhatWidegantDid"},
			},
			OR
			{
				FigureIsDead	{Tag = "Birnbaum"},
				AvatarHasNotItemMisc	{ItemId = 297, Amount = 1},
				MapFlagIsTrue	{Name = "mf_SQCitadel_BirnbaumRewardD"},
			},
			GameInterfaceIsVisible{},
			AvatarIsNotTalking{},
		},
		Actions = 
		{
			-- Schädel entfernen
			AvatarItemMiscTake	{ItemId = 300, Amount = 1},
			AvatarItemMiscTake	{ItemId = 301, Amount = 1},
			FigureLootItemMiscRemove	{Tag = "Widegant", ItemId = 300},
			FigureLootItemMiscRemove	{Tag = "Birnbaum", ItemId = 301},

			QuestSetSolved	{Quest = "CitadelExplorers"},

			FigureKill	{Tag = "JonJon"},
			FigureKill	{Tag = "Widegant"},
			FigureKill	{Tag = "Birnbaum"},
		},
		GotoState = "ENDE",
	};
};

-- =========================================================================================================
-- hier ist Endstation, wenn die Quest komplett abgeschlossen ist
-- =========================================================================================================
State	{StateName = "ENDE"};
