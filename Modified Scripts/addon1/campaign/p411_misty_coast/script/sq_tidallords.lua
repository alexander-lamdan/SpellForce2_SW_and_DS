local Spray = 1
local Salt = 2
local Wind = 3
local Wave = 4

if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		EventName = "DebugInit",
		Conditions =
		{
			QuestIsNotKnown	{Quest = "MistyCoastTidalLords"},
			DebugQuestionYes	{Question = "Nebelküste \"Herren der Gezeiten\" Nebenquest starten? (Start der Quest normalerweise auf Westwehr)", Caption = "Nebenquest Herren der Gezeiten"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "MistyCoastTidalLords"},
			QuestSetActive	{Quest = "MistyCoastTalkToYliaOnMistyCoast"},
			QuestSetActive	{Quest = "MistyCoastCollectShells"},
			QuestSetSolved	{Quest = "MistyCoastCollectShells"},
			QuestSetActive	{Quest = "MistyCoastCollectShellsDone"},
			DialogSetEnabled	{Tag = "Ylia"},
			DialogSetEnabled	{Tag = "ShellHorn"},
		},
		GotoState = "CreateShellHorn",
	};

	--OnEvent
	--{
	--	EventName = "DebugInit",
	--	Conditions =
	--	{
	--		QuestIsNotKnown	{Quest = "MistyCoastTidalLords"},
	--		DebugQuestionYes	{Question = "gleich zum Hornpart springen?", Caption = "Nebenquest Herren der Gezeiten"},
	--	},
	--	Actions =
	--	{
	--		QuestSetActive	{Quest = "MistyCoastTidalLords"},
	--		QuestSetActive	{Quest = "MistyCoastTidalToneCombo1"},
	--		QuestSetActive	{Quest = "MistyCoastTidalToneCombo2"},
	--		QuestSetActive	{Quest = "MistyCoastTidalToneCombo3"},
	--		QuestSetSolved	{Quest = "MistyCoastTidalToneCombo1"},
	--		QuestSetSolved	{Quest = "MistyCoastTidalToneCombo2"},
	--		QuestSetSolved	{Quest = "MistyCoastTidalToneCombo3"},
	--	},
	--	GotoState = "TheCombos",
	--};
end

State
{
	StateName = "INIT",

	OnEvent
	{
		EventName = "EnableClueDialog",
		Conditions =
		{
			QuestIsKnown	{Quest = "MistyCoastTalkToYliaOnMistyCoast"},
		},
		Actions =
		{
		},
		GotoState = "ShellCollector",
	};
};

State
{
	StateName = "ShellCollector",

	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "Diary"},
		},
	};

	--OnOneTimeEvent
	--{
	--	Conditions =
	--	{
	--		QuestIsActive	{Quest = "MistyCoastSearchForCluesDone"},
	--		AvatarIsNotTalking	{},
	--	},
	--	Actions =
	--	{
	--		ObjectVanish	{Tag = "Diary"},
	--	},
	--};

	OnEvent
	{
		EventName = "EnoughShellsCollected",
		Conditions =
		{
			QuestIsActive	{Quest = "MistyCoastCollectShells"},
			AvatarHasItemMisc	{ItemId = 302, Amount = 24},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "MistyCoastCollectShells"},
			QuestSetActive	{Quest = "MistyCoastCollectShellsDone"},
			DialogSetEnabled	{Tag = "Ylia"},
		},
		GotoState = "CreateShellHorn",
	};
};

if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		EventName = "DEBUG_WaitForMainQuest",
		Conditions =
		{
			DebugQuestionYes	{Question = "MainQuest als beendet betrachten?", Caption = "Nebenquest Herren der Gezeiten"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_MistyCoastMainQuestComplete"},
		},
	};
end

State
{
	StateName = "CreateShellHorn",

	OnOneTimeEvent
	{
		EventName = "WaitForMainQuestDone",
		Conditions =
		{
			QuestIsActive	{Quest = "MistyCoastShellHornWaitForMainQuest"},
			MapFlagIsTrue	{Name = "mf_MistyCoastMainQuestComplete"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "MistyCoastShellHornWaitForMainQuest"},
			QuestSetActive	{Quest = "MistyCoastShellHornWaitForMainQuestDone"},
			DialogSetEnabled	{Tag = "Ylia"},
		},
	};

	OnEvent
	{
		EventName = "LearnTheTones",
		Conditions =
		{
			QuestIsActive	{Quest = "MistyCoastLearnTidalTones"},
		},
		Actions =
		{
		},
		GotoState = "LearnTheTones",
	};
};


for i = 1, 4 do
	OnOneTimeEvent
	{
		EventName = "LearnTone" .. i,
		Conditions =
		{
			FigureIsDead	{Tag = "TidalServant" .. i},
		},
		Actions =
		{
			MapValueAdd	{Name = "mv_TidalTonesLearned", Value = 1},
			MapFlagSetTrue	{Name = "mf_TidalTone" .. i .. "Learned"},
			PlayerNPCKillCountIncrease	{UnitId = 1111},
		},
	};
end

State
{
	StateName = "LearnTheTones",

	OnOneTimeEvent
	{
		EventName = "LearnedTheTones",
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_TidalTonesLearned", Value = 4},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "MistyCoastLearnTidalTones"},
			QuestSetActive	{Quest = "MistyCoastLearnTidalTonesDone"},
			DialogSetEnabled	{Tag = "SeaPeople1"},
		},
	};

	OnEvent
	{
		EventName = "LearnTheCombos",
		Conditions =
		{
			QuestIsActive	{Quest = "MistyCoastTidalToneCombo1"},
			QuestIsActive	{Quest = "MistyCoastTidalToneCombo2"},
			QuestIsActive	{Quest = "MistyCoastTidalToneCombo3"},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "Inscription1"},
			DialogSetEnabled	{Tag = "Inscription2"},
			DialogSetEnabled	{Tag = "Inscription3"},
			DialogSetEnabled	{Tag = "Inscription4"},
			DialogSetEnabled	{Tag = "Inscription5"},
		},
		GotoState = "TheCombos",
	};
};


State
{
	StateName = "TheCombos",

	OnEvent
	{
		EventName = "LearnedTheCombos",
		Conditions =
		{
			QuestIsSolved	{Quest = "MistyCoastTidalToneCombo1"},
			QuestIsSolved	{Quest = "MistyCoastTidalToneCombo2"},
			QuestIsSolved	{Quest = "MistyCoastTidalToneCombo3"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "MistyCoastPlayShellHornCombos"},
			DialogSetEnabled	{Tag = "ShellHorn"},
		},
		GotoState = "TidalBosses",
	};
};

-------------------------------------------------------------------------------------------------
-- Tidal Champion & Tidal Lord States ...
-------------------------------------------------------------------------------------------------

-- hier wird nach dem Dialog der Boss Spawn initiiert ...
State
{
	StateName = "TidalBosses",

	OnEvent
	{
		EventName = "TidalBoss",
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQMistyCoast_TidalBossSpawn"},
			GameInterfaceIsVisible	{},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_SQMistyCoast_TidalBossSpawn"},
		},
		GotoState = "TidalChampionSpawn",
	};
};

-- hier wird anhand der Combotöne entschieden, welcher Boss gespawned werden soll
-- oder natürlich falls die Combo nicht stimmte, wird nichts gespawned
State
{
	StateName = "TidalChampionSpawn",

	OnEvent
	{
		EventName = "TidalChampion1",
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo1", Value = Wind},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo2", Value = Wind},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo3", Value = Wave},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo4", Value = Spray},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_SQMistyCoast_SpawnTIDALCHAMPION1"},
			MapFlagSetTrue	{Name = "mf_SQMistyCoast_TidalChampion1KillCounter"},
			MapFlagSetTrue	{Name = "mf_SQMistyCoast_TidalChampion1_SpawnLootChest"},
		},
		GotoState = "TidalChampionsDead",
	};

	OnEvent
	{
		EventName = "TidalChampion2",
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo1", Value = Salt},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo2", Value = Wave},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo3", Value = Wave},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo4", Value = Spray},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_SQMistyCoast_SpawnTIDALCHAMPION2"},
			MapFlagSetTrue	{Name = "mf_SQMistyCoast_TidalChampion2KillCounter"},
		},
		GotoState = "TidalChampionsDead",
	};

	OnEvent
	{
		EventName = "TidalChampion3",
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo1", Value = Spray},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo2", Value = Spray},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo3", Value = Wave},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo4", Value = Salt},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_SQMistyCoast_SpawnTIDALCHAMPION3"},
			MapFlagSetTrue	{Name = "mf_SQMistyCoast_TidalChampion3KillCounter"},
		},
		GotoState = "TidalChampionsDead",
	};

	OnEvent
	{
		EventName = "TidalChampion4",
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo1", Value = Salt},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo2", Value = Salt},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo3", Value = Wind},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo4", Value = Wind},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_SQMistyCoast_SpawnTIDALCHAMPION4"},
		},
		GotoState = "TidalChampionsDead",
	};

	OnEvent
	{
		EventName = "TidalChampion5",
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo1", Value = Wind},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo2", Value = Wind},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo3", Value = Spray},
			MapValueIsEqual	{Name = "mv_SQMistyCoast_ToneCombo4", Value = Spray},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_SQMistyCoast_SpawnTIDALCHAMPION5"},
			MapFlagSetTrue	{Name = "mf_SQMistyCoast_TidalChampion5_SpawnLootChest"},
		},
		GotoState = "TidalChampionsDead",
	};

	-- Fallback, ungültige Combo, kein Spawn, Dialog wieder anschalten
	OnEvent
	{
		EventName = "InvalidCombo",
		Conditions =
		{
		},
		Actions =
		{
			DebugMessage	{Message = "This Combo did nothing. Try again. This is not a bug, just an informal message."},
			DialogSetEnabled	{Tag = "ShellHorn"},
		},
		GotoState = "TidalBosses",
	};
};


-- hier warten bis der Champion wieder tot ist, damit man erneut eine Combo spielen kann
State
{
	StateName = "TidalChampionsDead",

	-- die Seeleute übergeben, die sollten mitkämpfen
	OnOneTimeEvent
	{
		EventName = "SeaPeopleAggro",
		Conditions =
		{
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "SeaPeople1", Team = "tm_Team1"},
			FigureTeamTransfer	{Tag = "SeaPeople2", Team = "tm_Team1"},
			FigureTeamTransfer	{Tag = "SeaPeople3", Team = "tm_Team1"},
			FigureTeamTransfer	{Tag = "SeaPeople4", Team = "tm_Team1"},
		},
	};

	-- Killcounter einmalig erhöhen
	OnOneTimeEvent
	{
		EventName = "TidalChampionKillCounter",
		Conditions =
		{
			FigureIsDead	{Tag = "TidalChampion1"},
			MapFlagIsTrue	{Name = "mf_SQMistyCoast_TidalChampion1KillCounter"},
		},
		Actions =
		{
			PlayerNPCKillCountIncrease	{UnitId = 1101},
		},
	};
	OnOneTimeEvent
	{
		EventName = "TidalChampionKillCounter",
		Conditions =
		{
			FigureIsDead	{Tag = "TidalChampion2"},
			MapFlagIsTrue	{Name = "mf_SQMistyCoast_TidalChampion2KillCounter"},
		},
		Actions =
		{
			PlayerNPCKillCountIncrease	{UnitId = 1102},
		},
	};
	OnOneTimeEvent
	{
		EventName = "TidalChampionKillCounter",
		Conditions =
		{
			FigureIsDead	{Tag = "TidalChampion3"},
			MapFlagIsTrue	{Name = "mf_SQMistyCoast_TidalChampion3KillCounter"},
		},
		Actions =
		{
			PlayerNPCKillCountIncrease	{UnitId = 1103},
		},
	};

	-- lootkisten für Fliegereinheiten spawnen, da die normalerweise kein Loot droppen!
	OnEvent
	{
		EventName = "Champion1LootChest",
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQMistyCoast_TidalChampion1_SpawnLootChest"},
			FigureIsDead	{Tag = "TidalChampion1"},
			EntityIsNotExisting	{Tag = "LootChestChampion1"},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_SQMistyCoast_TidalChampion1_SpawnLootChest"},
			ObjectSpawnToEntity	{ObjectId = 11, TargetTag = "TidalChampion1_DEAD", Direction = 0, Tag = "LootChestChampion1"},
			ObjectLootItemGenericAdd	{Tag = "LootChestChampion1", DropChance = 25, Level = 30, Skill = 0},
			ObjectLootItemGenericAdd	{Tag = "LootChestChampion1", DropChance = 50, Level = 24, Skill = 0},
			ObjectLootItemMiscAdd		{Tag = "LootChestChampion1", DropChance = 100, ItemId = 302},
		},
	};
	OnEvent
	{
		EventName = "Champion5LootChest",
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQMistyCoast_TidalChampion5_SpawnLootChest"},
			FigureIsDead	{Tag = "TidalChampion5"},
			EntityIsNotExisting	{Tag = "LootChestChampion5"},
		},
		Actions =
		{
			MapFlagSetFalse	{Name = "mf_SQMistyCoast_TidalChampion5_SpawnLootChest"},
			ObjectSpawnToEntity	{ObjectId = 11, TargetTag = "TidalChampion5_DEAD", Direction = 0, Tag = "LootChestChampion5"},
			ObjectLootItemGenericAdd	{Tag = "LootChestChampion5", DropChance = 25, Level = 30, Skill = 0},
			ObjectLootItemGenericAdd	{Tag = "LootChestChampion5", DropChance = 50, Level = 24, Skill = 0},
			ObjectLootItemMiscAdd		{Tag = "LootChestChampion5", DropChance = 100, ItemId = 302},
		},
	};

	-- im Falle das die ersten 3 Champions je einmal gespawned wurden, wird der Tidal Lord Spawn initiiert (einmalig)
	OnOneTimeEvent
	{
		EventName = "TidalLordSpawn1",
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_SQMistyCoast_SpawnedTidalChampions", Value = 3},
			FigureIsDead	{Tag = "TidalChampion1"},
			FigureIsDead	{Tag = "TidalChampion2"},
			FigureIsDead	{Tag = "TidalChampion3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_SQMistyCoast_SpawnTIDALLORD1"},
			QuestSetActive	{Quest = "MistyCoastKillTidalLords"},
		},
		GotoState = "TidalLordSpawn1",
	};

	-- einfach abfragen ob alle tot sind, macht die Sache leichter, da eh immer nur 1 Boss am Leben sein kann
	OnEvent
	{
		EventName = "TidalChampionDeadAgain",
		Conditions =
		{
			FigureIsDead	{Tag = "TidalChampion1"},
			FigureIsDead	{Tag = "TidalChampion2"},
			FigureIsDead	{Tag = "TidalChampion3"},
			FigureIsDead	{Tag = "TidalChampion4"},
			FigureIsDead	{Tag = "TidalChampion5"},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "ShellHorn"},
		},
		GotoState = "TidalBosses",
	};
};


-- Tidal Lord 1 spawnen
State
{
	StateName = "TidalLordSpawn1",

	OnEvent
	{
		EventName = "TidalLordSpawn2",
		Conditions =
		{
			FigureIsDead	{Tag = "TidalLord1"},
		},
		Actions =
		{
			PlayerNPCKillCountIncrease	{UnitId = 1106},
			MapFlagSetTrue	{Name = "mf_SQMistyCoast_SpawnTIDALLORD2"},
		},
		GotoState = "TidalLordSpawn2",
	};
};

-- Tidal Lord 2 spawnen
State
{
	StateName = "TidalLordSpawn2",

	OnEvent
	{
		EventName = "TidalLordSpawn3",
		Conditions =
		{
			FigureIsDead	{Tag = "TidalLord2"},
		},
		Actions =
		{
			PlayerNPCKillCountIncrease	{UnitId = 1107},
			MapFlagSetTrue	{Name = "mf_SQMistyCoast_SpawnTIDALLORD3"},
		},
		GotoState = "TidalLordSpawn3",
	};
};

-- Tidal Lord 3 spawnen, Quest solven, und zurück zum BossSpawn State
State
{
	StateName = "TidalLordSpawn3",

	OnOneTimeEvent
	{
		EventName = "QuestCompleted",
		Conditions =
		{
			FigureIsDead	{Tag = "SeaPeople1"},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "SeaPeople1", Level = 30, UnitId = 1092, TargetTag = "SQTidalLords_SpawnSeaPeople", Team = "tm_Neutral"},
		},
	};

	OnOneTimeEvent
	{
		EventName = "TidalLordSpawnDone",
		Conditions =
		{
			FigureIsDead	{Tag = "TidalLord3"},
		},
		Actions =
		{
			PlayerNPCKillCountIncrease	{UnitId = 1108},

			FigureNpcSpawnToEntity	{Tag = "Shaikan1", Level = 30, UnitId = 1093, TargetTag = "ShellHorn", Team = "tm_Neutral"},
			FigureNpcSpawnToEntity	{Tag = "Shaikan2", Level = 30, UnitId = 1094, TargetTag = "ShellHorn", Team = "tm_Neutral"},
			FigureNpcSpawnToEntity	{Tag = "Shaikan3", Level = 30, UnitId = 1095, TargetTag = "ShellHorn", Team = "tm_Neutral"},
			FigureNpcSpawnToEntity	{Tag = "Shaikan4", Level = 30, UnitId = 1096, TargetTag = "ShellHorn", Team = "tm_Neutral"},
			FigureNpcSpawnToEntity	{Tag = "Shaikan5", Level = 30, UnitId = 1093, TargetTag = "ShellHorn", Team = "tm_Neutral"},
			FigureNpcSpawnToEntity	{Tag = "Shaikan6", Level = 30, UnitId = 1094, TargetTag = "ShellHorn", Team = "tm_Neutral"},
			FigureNpcSpawnToEntity	{Tag = "Shaikan7", Level = 30, UnitId = 1095, TargetTag = "ShellHorn", Team = "tm_Neutral"},
			FigureNpcSpawnToEntity	{Tag = "Shaikan8", Level = 30, UnitId = 1096, TargetTag = "ShellHorn", Team = "tm_Neutral"},

			FigureRoamingEnable	{Tag = "Shaikan1"},
			FigureRoamingEnable	{Tag = "Shaikan2"},
			FigureRoamingEnable	{Tag = "Shaikan3"},
			FigureRoamingEnable	{Tag = "Shaikan4"},
			FigureRoamingEnable	{Tag = "Shaikan5"},
			FigureRoamingEnable	{Tag = "Shaikan6"},
			FigureRoamingEnable	{Tag = "Shaikan7"},
			FigureRoamingEnable	{Tag = "Shaikan8"},

			FigureOutcry	{TextTag = "ShaikanFreed1", Tag = "Shaikan1"},
			FigureOutcry	{TextTag = "ShaikanFreed2", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "ShaikanFreed3", Tag = "Shaikan2"},
			FigureOutcry	{TextTag = "ShaikanFreed4", Tag = "SeaPeople1"},

			EntityTimerStart	{Name = "et_ShaikanWalkHome"},

			QuestSetSolved	{Quest = "MistyCoastPlayShellHornCombos"},
			QuestSetSolved	{Quest = "MistyCoastKillTidalLords"},
			QuestSetActive	{Quest = "MistyCoastTidalLordsCompleted"},
		},
	};

	OnOneTimeEvent
	{
		EventName = "QuestCompleted",
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_ShaikanWalkHome", Seconds = 16},
		},
		Actions =
		{
			FigureRoamingDisable	{Tag = "Shaikan1"},
			FigureRoamingDisable	{Tag = "Shaikan2"},
			FigureRoamingDisable	{Tag = "Shaikan3"},
			FigureRoamingDisable	{Tag = "Shaikan4"},
			FigureRoamingDisable	{Tag = "Shaikan5"},
			FigureRoamingDisable	{Tag = "Shaikan6"},
			FigureRoamingDisable	{Tag = "Shaikan7"},
			FigureRoamingDisable	{Tag = "Shaikan8"},

			FigureRoamingDisable	{Tag = "SeaPeople1"},
			FigureRoamingDisable	{Tag = "SeaPeople2"},
			FigureRoamingDisable	{Tag = "SeaPeople3"},
			FigureRoamingDisable	{Tag = "SeaPeople4"},

			FigureWalkToEntity	{Tag = "Shaikan1", TargetTag = "Bindpoint02"},
			FigureWalkToEntity	{Tag = "Shaikan2", TargetTag = "Bindpoint02"},
			FigureWalkToEntity	{Tag = "Shaikan3", TargetTag = "Bindpoint02"},
			FigureWalkToEntity	{Tag = "Shaikan4", TargetTag = "Bindpoint02"},
			FigureWalkToEntity	{Tag = "Shaikan5", TargetTag = "Bindpoint02"},
			FigureWalkToEntity	{Tag = "Shaikan6", TargetTag = "Bindpoint02"},
			FigureWalkToEntity	{Tag = "Shaikan7", TargetTag = "Bindpoint02"},
			FigureWalkToEntity	{Tag = "Shaikan8", TargetTag = "Bindpoint02"},

			FigureWalkToEntity	{Tag = "SeaPeople1", TargetTag = "SQTidalLords_SpawnSeaPeople"},
			FigureWalkToEntity	{Tag = "SeaPeople2", TargetTag = "SQTidalLords_SpawnSeaPeople"},
			FigureWalkToEntity	{Tag = "SeaPeople3", TargetTag = "SQTidalLords_SpawnSeaPeople"},
			FigureWalkToEntity	{Tag = "SeaPeople4", TargetTag = "SQTidalLords_SpawnSeaPeople"},
		},
	};

	OnOneTimeEvent
	{
		EventName = "QuestCompleted",
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_ShaikanWalkHome", Seconds = 17.5},
		},
		Actions =
		{
			EffectStart	{Tag = "Shaikan1", File = "Effect_DeSpawn_Unit"},
			EffectStart	{Tag = "Shaikan2", File = "Effect_DeSpawn_Unit"},
			EffectStart	{Tag = "Shaikan3", File = "Effect_DeSpawn_Unit"},
			EffectStart	{Tag = "Shaikan4", File = "Effect_DeSpawn_Unit"},
			EffectStart	{Tag = "Shaikan5", File = "Effect_DeSpawn_Unit"},
			EffectStart	{Tag = "Shaikan6", File = "Effect_DeSpawn_Unit"},
			EffectStart	{Tag = "Shaikan7", File = "Effect_DeSpawn_Unit"},
			EffectStart	{Tag = "Shaikan8", File = "Effect_DeSpawn_Unit"},
		},
	};

	OnEvent
	{
		EventName = "QuestCompleted",
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_ShaikanWalkHome", Seconds = 20},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "Ylia"},
			DialogSetEnabled	{Tag = "ShellHorn"},

			FigureKill	{Tag = "SeaPeople1"},
			FigureKill	{Tag = "SeaPeople2"},
			FigureKill	{Tag = "SeaPeople3"},
			FigureKill	{Tag = "SeaPeople4"},

			FigureVanish	{Tag = "Shaikan1"},
			FigureVanish	{Tag = "Shaikan2"},
			FigureVanish	{Tag = "Shaikan3"},
			FigureVanish	{Tag = "Shaikan4"},
			FigureVanish	{Tag = "Shaikan5"},
			FigureVanish	{Tag = "Shaikan6"},
			FigureVanish	{Tag = "Shaikan7"},
			FigureVanish	{Tag = "Shaikan8"},
		},
		GotoState = "TidalBosses",
	};
};
