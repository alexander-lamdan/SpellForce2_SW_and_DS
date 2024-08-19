local iWillowTreeHealedObjectId = 2403
local iVisualTimerSeconds = 241

-- Level relativ zum Avatarlevel als Ausgangsbasis
local iEnemyBaseLevelRTA = -6

if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		EventName = "Debug",
		Conditions = 
		{
			DebugQuestionYes	{Question = "Priest Epic - Kampf mit Barubas direkt starten?", Caption = "SQ Priest Epic"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "PriestEpicGrowth"},
			QuestSetSolved	{Quest = "PriestEpicGrowth"},
			QuestSetActive	{Quest = "PriestEpicLife"},
			QuestSetSolved	{Quest = "PriestEpicLife"},
			
			QuestSetActive	{Quest = "SevenkeepsA1_BreakSiege"},
			QuestSetSolved	{Quest = "SevenkeepsA1_BreakSiege"},
			
			QuestSetActive	{Quest = "PriestEpicLife"},
			QuestSetActive	{Quest = "PriestEpicLifeBackToTree"},
			
			DialogSetDisabled	{Tag = "SQPriest_Idara"},
			DialogSetEnabled	{Tag = "SQPriest_WillowTree"},
		},
		GotoState = "TalkToWillowTreeAfterGaliusQuestSolved",
	};
end

local tEnemies = 
{
	-- Point 1:
	{
		{UnitId = 102, Level = iEnemyBaseLevelRTA},	-- bow
		--{UnitId = 146, Level = iEnemyBaseLevelRTA},	-- fireball
		{UnitId = 81, Level = iEnemyBaseLevelRTA},		-- sword+shield
		--{UnitId = 116, Level = iEnemyBaseLevelRTA - 1},	-- major fighter
		--{UnitId = 377, Level = iEnemyBaseLevelRTA},	-- Swordfighter
	},
	-- Point 2:
	{
		{UnitId = 81, Level = iEnemyBaseLevelRTA},		-- sword+shield
		{UnitId = 81, Level = iEnemyBaseLevelRTA},		-- sword+shield
		--{UnitId = 102, Level = iEnemyBaseLevelRTA},	-- bow
		{UnitId = 102, Level = iEnemyBaseLevelRTA},	-- bow
	},
	-- Point 3:
	{
		{UnitId = 377, Level = iEnemyBaseLevelRTA},	-- Swordfighter
		--{UnitId = 377, Level = iEnemyBaseLevelRTA},	-- Swordfighter
		--{UnitId = 377, Level = iEnemyBaseLevelRTA},	-- Swordfighter
		{UnitId = 146, Level = iEnemyBaseLevelRTA},	-- fireball
		{UnitId = 146, Level = iEnemyBaseLevelRTA},	-- fireball
	},
	-- Point 4:
	{
		{UnitId = 116, Level = iEnemyBaseLevelRTA - 1},	-- major fighter
		{UnitId = 116, Level = iEnemyBaseLevelRTA - 1},	-- major fighter
		--{UnitId = 116, Level = iEnemyBaseLevelRTA - 1},	-- major fighter
		--{UnitId = 116, Level = iEnemyBaseLevelRTA - 1},	-- major fighter
		{UnitId = 373, Level = iEnemyBaseLevelRTA},	-- pain
		{UnitId = 374, Level = iEnemyBaseLevelRTA},	-- shock
	},
	-- Point 5:
	{
		{UnitId = 377, Level = iEnemyBaseLevelRTA},	-- Swordfighter
		--{UnitId = 377, Level = iEnemyBaseLevelRTA},	-- Swordfighter
		--{UnitId = 116, Level = iEnemyBaseLevelRTA - 1},	-- major fighter
		{UnitId = 116, Level = iEnemyBaseLevelRTA - 1},	-- major fighter
		--{UnitId = 81, Level = iEnemyBaseLevelRTA},		-- sword+shield
		{UnitId = 81, Level = iEnemyBaseLevelRTA},		-- sword+shield
		{UnitId = 102, Level = iEnemyBaseLevelRTA},	-- bow
		{UnitId = 102, Level = iEnemyBaseLevelRTA},	-- bow
		{UnitId = 373, Level = iEnemyBaseLevelRTA + 2},	-- pain
		{UnitId = 374, Level = iEnemyBaseLevelRTA + 2},	-- shock
	},
--	-- Point 6: (aussenrumgeh-Blocker)
--	{
--		{UnitId = 799, Level = 0},	-- Harpy
--		{UnitId = 799, Level = 0},	-- Harpy
--		{UnitId = 799, Level = 0},	-- Harpy
--		{UnitId = 799, Level = 0},	-- Harpy
--		{UnitId = 799, Level = 0},	-- Harpy
--		{UnitId = 799, Level = 0},	-- Harpy
--	},
--	-- Point 7: (aussenrumgeh-Blocker)
--	{
--		{UnitId = 799, Level = 0},	-- Harpy
--		{UnitId = 799, Level = 0},	-- Harpy
--		{UnitId = 799, Level = 0},	-- Harpy
--		{UnitId = 799, Level = 0},	-- Harpy
--		{UnitId = 799, Level = 0},	-- Harpy
--		{UnitId = 799, Level = 0},	-- Harpy
--	},
}

local tSpawnEnemies = {}
local tVanishEnemies = {}
for i, tEnemyPoint in tEnemies do
	for j, tEnemy in tEnemyPoint do
		local sTargetTag = "SQPriest_WellSpawn" .. i
		local sTag = sTargetTag .. "Enemy" .. j
		
		table.insert(tVanishEnemies, FigureVanish	{Tag = sTag})
		table.insert(tSpawnEnemies, FigureVanish	{Tag = sTag})
		table.insert(tSpawnEnemies, NoSpawnEffect{Spawn = FigureNpcSpawnLRTAToEntity	
			{Tag = sTag, Level = tEnemy.Level, UnitId = tEnemy.UnitId, TargetTag = sTargetTag, Team = "tm_Team2"}})
		table.insert(tSpawnEnemies, FigureRoamingEnable	{Tag = sTag})
		
		if i == 1 and j <= 2 then
			-- zwei "Vorboten" losschicken
			table.insert(tSpawnEnemies, FigureWalkToEntity	{Tag = sTag, TargetTag = "pl_HumanAvatar"})
		end
	end
end

State
{
	StateName = "QuestWaitForUlfCS",

	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_KingUlfCS"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Falida"},
			FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Falida", Range = 10, Height = 3},

			DialogSetEnabled	{Tag = "SQPriest_Idara"},
			FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "SQPriest_Idara", Range = 12, Height = 3},

			--DialogSetEnabled	{Tag = "SQPriest_WillowTree"},
		},
		GotoState = "QuestStart",
	};
};

State
{
	StateName = "QuestStart",

	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "PriestEpicTalkToIdara"},
			QuestIsActive	{Quest = "PriestEpicGrowth"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "PriestEpicTalkToIdara"},
		},
	};

	OnEvent
	{
		EventName = "QuestStart",
		Conditions = 
		{
			QuestIsActive	{Quest = "PriestEpicGrowthGetWater"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "SQPriest_Well"},
		},
		GotoState = "GetWaterFromWell",
	};
};

State
{
	StateName = "GetWaterFromWell",

	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "PriestEpicGrowthWaterTree"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			VisualTimerStart	{Seconds = iVisualTimerSeconds},
			DialogSetDisabled	{Tag = "SQPriest_WillowTree"},
			EntityFlagSetTrue	{Name = "ef_CheckEnableDialog"},
			unpack(tSpawnEnemies)	-- muss die letzte Action sein!
		},
		GotoState = "TimerIsRunning",
	};
};


State
{
	StateName = "TimerIsRunning",

	OnEvent
	{
		EventName = "EneniesDead",
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_CheckEnableDialog"},
			FigureIsNotInCombat	{Tag = "pl_HumanAvatar"},
			FigureTeamIsNotInRangeToEntity	{Team = "tm_Team2", Range = 12, TargetTag = "SQPriest_WillowTree"},
		},
		Actions = 
		{
			EntityFlagSetFalse	{Name = "ef_CheckEnableDialog"},
			DialogTypeSetSideQuest	{Tag = "SQPriest_WillowTree"},
			DialogSetEnabled	{Tag = "SQPriest_WillowTree"},
		},
	};
	
	OnEvent
	{
		EventName = "QuestSolved",
		Conditions = 
		{
			QuestIsSolved	{Quest = "PriestEpicGrowthWaterTree"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			ObjectVanish	{Tag = "SQPriest_TravelstoneBlocker"},
			PlayerTravelStoneAdd	{Tag = "SQPriest_Travelstone"},
			ObjectSpawn	{ObjectId = 1700, X = 46.1089, Y = 577.196, Direction = 143, Tag = "SQPriest_TravelstoneSchaufler1"},
			ObjectSpawn	{ObjectId = 1700, X = 53, Y = 575.5, Direction = 35, Tag = "SQPriest_TravelstoneSchaufler2"},

			ObjectChange	{Tag = "SQPriest_WillowTree", ObjectId = iWillowTreeHealedObjectId, X = GetEntityX("SQPriest_WillowTree"), Y = GetEntityY("SQPriest_WillowTree"), Direction = GetEntityDirection("SQPriest_WillowTree")},
			DialogTypeSetSideQuest	{Tag = "SQPriest_WillowTree"},
			DialogSetEnabled	{Tag = "SQPriest_WillowTree"},

			unpack(tVanishEnemies)	-- muss die letzte Action sein!
		},
		GotoState = "ForceTalkToWillowWomanTree",
	};

	OnEvent
	{
		EventName = "QuestFailedRetry",
		Conditions = 
		{
			VisualTimerIsNotActive	{},
			QuestIsNotSolved	{Quest = "PriestEpicGrowthWaterTree"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			QuestSetInactive	{Quest = "PriestEpicGrowthWaterTree"},
			QuestSetActiveAgain	{Quest = "PriestEpicGrowthGetWater"},
			AvatarItemMiscTake	{ItemId = 387, Amount = 1}, -- volles Gefäss
			AvatarItemMiscGive	{ItemId = 386, Amount = 1},	-- leeres Gefäss
		},
		GotoState = "QuestFailed",
	};
};

State
{
	StateName = "QuestFailed",

	OnEvent
	{
		EventName = "QuestFailedRetry",
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			--FigureOutcryImmediate	{TextTag = "SQPriest1", Tag = "pl_HumanAvatar"},	-- quest failed outcry
		},
		GotoState = "QuestStart",
	};
};


State
{
	StateName = "ForceTalkToWillowWomanTree",

	OnEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			DialogBegin	{Tag = "SQPriest_WillowTree"},
		},
		GotoState = "TalkToWillowTreeAfterGaliusQuestSolved",
	};
};

State
{
	StateName = "TalkToWillowTreeAfterGaliusQuestSolved",

	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "PriestEpicLifeBackToTree"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "SQPriest_WillowTree"},
		},
		GotoState = "TalkToWillowTreeAfterHavingTalkedToGhostKids",
	};
};


if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		EventName = "Debug",
		Conditions = 
		{
			QuestIsSolved	{Quest = "PriestEpicDeathTalkToMarcia"},
			DebugQuestionYes	{Question = "gleich davon ausgehen das man auch mit den anderen Kindern geredet hat?", Caption = "SQ Priest Epic"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "PriestEpicDeathTalkToElyria"},
			QuestSetSolved	{Quest = "PriestEpicDeathTalkToJoshua"},
			QuestSetSolved	{Quest = "PriestEpicDeathTalkToMo"},
			AvatarItemMiscGive	{ItemId = 389, Amount = 1},
			AvatarItemMiscGive	{ItemId = 390, Amount = 1},
			AvatarItemMiscGive	{ItemId = 391, Amount = 1},
			QuestSetActive	{Quest = "PriestEpicDeathTalkToWillowTree"},
		},
	};
end

State
{
	StateName = "TalkToWillowTreeAfterHavingTalkedToGhostKids",

	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "PriestEpicDeathTalkToWillowTree"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "SQPriest_WillowTree"},
		},
		GotoState = "TalkToBarubas",
	};
};

State
{
	StateName = "TalkToBarubas",

	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQPriest_FightingBarubas"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureVanish	{Tag = "SQPriest_Marcia"},
			FigureNpcSpawnToEntity	{Tag = "SQPriest_Marcia", Level = 30, UnitId = 1288, TargetTag = "SQPriest_SpawnMarcia", Team = "tm_Neutral"},
			FigureNpcSpawnToEntity	{Tag = "SQPriest_Elyria", Level = 30, UnitId = 1289, TargetTag = "SQPriest_SpawnElyria", Team = "tm_Neutral"},
			FigureNpcSpawnToEntity	{Tag = "SQPriest_Joshua", Level = 30, UnitId = 1290, TargetTag = "SQPriest_SpawnJoshua", Team = "tm_Neutral"},
			FigureNpcSpawnToEntity	{Tag = "SQPriest_Mo", Level = 30, UnitId = 1291, TargetTag = "SQPriest_SpawnMo", Team = "tm_Neutral"},
			FigureDirectionSetToEntity	{Tag = "SQPriest_Marcia", TargetTag = "SQPriest_SpawnMarcia"},
			FigureDirectionSetToEntity	{Tag = "SQPriest_Elyria", TargetTag = "SQPriest_SpawnElyria"},
			FigureDirectionSetToEntity	{Tag = "SQPriest_Joshua", TargetTag = "SQPriest_SpawnJoshua"},
			FigureDirectionSetToEntity	{Tag = "SQPriest_Mo", TargetTag = "SQPriest_SpawnMo"},
			FigureHoldPosition	{Tag = "SQPriest_Marcia"},
			FigureHoldPosition	{Tag = "SQPriest_Elyria"},
			FigureHoldPosition	{Tag = "SQPriest_Joshua"},
			FigureHoldPosition	{Tag = "SQPriest_Mo"},
			FigureSwappingDisable	{Tag = "SQPriest_Marcia"},
			FigureSwappingDisable	{Tag = "SQPriest_Elyria"},
			FigureSwappingDisable	{Tag = "SQPriest_Joshua"},
			FigureSwappingDisable	{Tag = "SQPriest_Mo"},
		},
		GotoState = "FightBarubas",
	};
};

State
{
	StateName = "FightBarubas",

	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQPriest_BarubasMustDie"},
		},
		Actions = 
		{
		},
		GotoState = "CaineKillsBarubas",
	};
};


State
{
	StateName = "CaineKillsBarubas",
	
	-- Hinrichtung
	OnOneTimeEvent
	{
		EventName = "CaineTeleportsToBarubas",
		Conditions = 
		{
			FigureIsDead	{Tag = "pl_HumanHeroCaine"},
		},
		Actions = 
		{
			FigureHeroSpawnToEntity	{Tag = "HeroCaine", TargetTag = "pl_HumanAvatar", Direction = 0},
		},
	};
	OnOneTimeEvent
	{
		EventName = "CaineTeleportsToBarubas",
		Conditions = 
		{
		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "pl_HumanAvatar"},
			FigureOutcryImmediate	{Tag = "pl_HumanHeroCaine", TextTag = "SQPriest51"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "SQPriest_Barubas"},
			EntityFlagSetTrue	{Name = "ef_CaineWalksToBarubas"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_CaineWalksToBarubas"},
			FigureIsIdle	{Tag = "pl_HumanHeroCaine"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureDirectionSetToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "SQPriest_Barubas"},
			FigureDirectionSetToEntity	{TargetTag = "pl_HumanHeroCaine", Tag = "SQPriest_Barubas"},
			EntityFlagSetTrue	{Name = "ef_CaineGetsToKillBarubas"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_CaineGetsToKillBarubas"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_KillBarubas"},
			FigureDirectionSetToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "SQPriest_Barubas"},
			FigureDirectionSetToEntity	{TargetTag = "pl_HumanHeroCaine", Tag = "SQPriest_Barubas"},
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_attack_1h_right_1.ska"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "CaineKilledBarubas",
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_KillBarubas", Seconds = 0.7},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "PriestEpicDeathFightBarubas"},
			QuestSetSolved	{Quest = "PriestEpicDeath"},
			QuestSetActive	{Quest = "PriestEpicFugacity"},
			QuestSetActive	{Quest = "PriestEpicFugacityTalkToWitch"},
			DialogSetEnabled	{Tag = "SQPriest_Hazibelah"},
			FigureLootItemEquipmentAdd	{DropChance = 100, ItemId = 1191, Tag = "SQPriest_Barubas"},	-- reward
			FigureLootItemEquipmentAdd	{DropChance = 100, ItemId = 959, Tag = "SQPriest_Barubas"},	-- reward
			FigureLootItemEquipmentAdd	{DropChance = 100, ItemId = 929, Tag = "SQPriest_Barubas"},	-- Spiegel für Hazibelah

			FigureAbilityRemove	{AbilityId = Ability.Immortal, Tag = "SQPriest_Barubas"},
			FigureKill	{Tag = "SQPriest_Barubas"},
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "KneelDown",
		Tag = "pl_HumanHeroCaine",
		Anim = "emote_kneel_down",
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_KillBarubas", Seconds = 2.6},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_AnimPlayA"},
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "KneelHold",
		Tag = "pl_HumanHeroCaine",
		Anim = "emote_kneel_hold",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_AnimPlayA", Seconds = 2.17},
		},
		Actions = 
		{
			EntityTimerStart {Name = "et_AnimPlayB"},
		},
	};
	OnOneTimePlayHeroAnimEvent
	{
		EventName = "KneelUp",
		Tag = "pl_HumanHeroCaine",
		Anim = "emote_kneel_up",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_AnimPlayB", Seconds = 2},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_CaineHasKilledBarubas"},
		},
	};
	OnEvent
	{
		EventName = "BackToMain",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_AnimPlayB", Seconds = 4.5},
		},
		Actions = 
		{
			EntityTimerStop {Name = "et_AnimPlayA"},
			EntityTimerStop {Name = "et_AnimPlayB"},
			EntityTimerStop	{Name = "et_KillBarubas"},
			
			FigureWalkToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "pl_HumanAvatar"},
		},
		GotoState = "TalkToBitch",
	};
};	

State
{
	StateName = "TalkToBitch",

	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQPriest_TalkedToHazibelah"},
			AvatarHasItemEquipped	{ItemId = 929},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "SQPriest62", Tag = "SQPriest_Hazibelah"},
			FigureOutcry	{TextTag = "SQPriest63", Tag = "SQPriest_Hazibelah"},
			FigureOutcry	{TextTag = "SQPriest64", Tag = "SQPriest_Hazibelah"},
			EntityTimerStart	{Name = "et_ReduceMana"},
			FigureManaSet	{Tag = "SQPriest_Hazibelah", Percent = 5},
			EntityTimerStart	{Name = "et_GoAggro"},
		},
		GotoState = "FightBitch",
	};

	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQPriest_TalkedToHazibelah"},
			AvatarHasNotItemEquipped	{ItemId = 929},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "SQPriest61", Tag = "SQPriest_Hazibelah"},
			EntityTimerStart	{Name = "et_GoAggro"},
		},
		GotoState = "FightBitch",
	};
};

State
{
	StateName = "FightBitch",

	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_GoAggro", Seconds = 5},
		},
		Actions = 
		{
			FigureLootItemEquipmentAdd	{Tag = "SQPriest_Hazibelah", DropChance = 100, ItemId = 1189},
			FigureTeamTransfer	{Tag = "SQPriest_Hazibelah", Team = "tm_Team2"},
			FigureAttackEntity	{Tag = "SQPriest_Hazibelah", TargetTag = "pl_HumanAvatar"},
		},
	};

	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_ReduceMana", Seconds = 0.2},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_ReduceMana"},
			FigureManaSubtract	{Tag = "SQPriest_Hazibelah", Percent = 5},
		},
	};

	OnEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "SQPriest_Hazibelah"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "PriestEpicFugacityKillHazibelah"},
			QuestSetActive	{Quest = "PriestEpicFugacityTalkToWillowTree"},
			DialogSetEnabled	{Tag = "SQPriest_WillowTree"},
		},
		GotoState = "END",
	};
};

State{StateName = "END"};
