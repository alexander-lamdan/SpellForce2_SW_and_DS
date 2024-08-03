local tHeart =
{
	{Level = 20, UnitId = 1200, Tag = "Augmur"},
	{Level = 20, UnitId = 1201, Tag = "DeathFromAbove"},
	{Level = 20, UnitId = 1202, Tag = "Witch"},
	{Level = 20, UnitId = 1203, Tag = "Snapper"},
	{Level = 20, UnitId = 1204, Tag = "Grimfeather"},
}

local iAshukaDelayedSpawnTime = 20	-- x sekunden nach letztem boss soll ashuka spawnen
local tAshuka = {Level = 20, UnitId = 1205, Tag = "Ashuka"}

--local tSkjadir = {Level = 16, UnitId = 1074, Tag = "SQHeart_Skjadir"}

-- unit ids & level der boss helper units
local tHelper = 
{
	Augmur = 
	{
		{UnitId = 706, Level = 16},	-- mistress
		{UnitId = 795, Level = 16},	-- beast
		{UnitId = 795, Level = 16},	-- beast
		{UnitId = 797, Level = 16},	-- storm beast
		{UnitId = 706, Level = 16},	-- mistress
		{UnitId = 795, Level = 16},	-- beast
		{UnitId = 795, Level = 16},	-- beast
		{UnitId = 797, Level = 16},	-- storm beast
		{UnitId = 706, Level = 16},	-- mistress
	},
	DeathFromAbove = 
	{
		{UnitId = 706, Level = 16},	-- mistress
		{UnitId = 795, Level = 16},	-- beast
		{UnitId = 797, Level = 16},	-- storm beast
		--{UnitId = 800, Level = 16},	-- skyclaw
		{UnitId = 800, Level = 16},	-- skyclaw
		{UnitId = 706, Level = 16},	-- mistress
		{UnitId = 795, Level = 16},	-- beast
		{UnitId = 797, Level = 16},	-- storm beast
		--{UnitId = 800, Level = 16},	-- skyclaw
		{UnitId = 800, Level = 16},	-- skyclaw
	},
	Witch = 
	{
		{UnitId = 706, Level = 16},	-- mistress
		{UnitId = 706, Level = 16},	-- mistress
		{UnitId = 799, Level = 16},	-- harpy
		{UnitId = 987, Level = 16},	-- warbeast
		{UnitId = 987, Level = 16},	-- warbeast
		{UnitId = 706, Level = 16},	-- mistress
		{UnitId = 706, Level = 16},	-- mistress
		{UnitId = 799, Level = 16},	-- harpy
		{UnitId = 987, Level = 16},	-- warbeast
		{UnitId = 987, Level = 16},	-- warbeast
	},
	Snapper = 
	{
		{UnitId = 706, Level = 16},	-- mistress
		{UnitId = 798, Level = 16},	-- raptor
		{UnitId = 798, Level = 16},	-- raptor
		{UnitId = 798, Level = 16},	-- raptor
		{UnitId = 799, Level = 16},	-- harpy
		{UnitId = 706, Level = 16},	-- mistress
		{UnitId = 798, Level = 16},	-- raptor
		{UnitId = 798, Level = 16},	-- raptor
		{UnitId = 798, Level = 16},	-- raptor
		{UnitId = 799, Level = 16},	-- harpy
		{UnitId = 706, Level = 16},	-- mistress
	},
	Grimfeather = 
	{
		{UnitId = 706, Level = 16},	-- mistress
		{UnitId = 799, Level = 16},	-- harpy
		{UnitId = 799, Level = 16},	-- harpy
		{UnitId = 987, Level = 16},	-- warbeast
		{UnitId = 987, Level = 16},	-- warbeast
		{UnitId = 706, Level = 16},	-- mistress
		--{UnitId = 799, Level = 16},	-- harpy
		--{UnitId = 799, Level = 16},	-- harpy
		{UnitId = 987, Level = 16},	-- warbeast
		{UnitId = 706, Level = 16},	-- mistress
	},
}

local sHeartTag = "SQHeart_"
local sSpawnTag = sHeartTag .. "Spawn"

local tSpawn = {}
table.insert(tSpawn, QuestSetSolved	{Quest = "HeartOfIceGotoWinterlight"})
table.insert(tSpawn, QuestSetActive	{Quest = "HeartOfIceConquerWinterlight"})


-- die Bosse spawnen
for _, tBoss in ipairs(tHeart) do
	-- spawn boss unit:
	local sTag = sHeartTag .. tBoss.Tag
	local sTargetTag = sSpawnTag .. tBoss.Tag
	table.insert(tSpawn, NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = sTag, Level = tBoss.Level, UnitId = tBoss.UnitId, TargetTag = sTargetTag, Team = "tm_Team2"}})
	table.insert(tSpawn, FigureDirectionSetToEntity	{Tag = sTag, TargetTag = "pl_HumanAvatar"})
	
	-- spawn helper units:
	for i, tHelper in ipairs(tHelper[tBoss.Tag]) do
		local sHelperTag = sHeartTag .. tBoss.Tag .. "Helper" .. i
		table.insert(tSpawn, NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = sHelperTag, Level = tHelper.Level, UnitId = tHelper.UnitId, TargetTag = sTargetTag, Team = "tm_Team2"}})
		table.insert(tSpawn, FigureDirectionSetToEntity	{Tag = sHelperTag, TargetTag = sTag})
		table.insert(tSpawn, FigureRoamingEnable	{Tag = sHelperTag})
	end
end


-- Skjadir und seine Truppen spawnen
local tAnyDwarfAlive = {}
local tDwarvesFollowSkjadir = {}
local tUnits = dofile("addon1/map/Campaign/P403_Sevenkeeps/script/SQHeart_TroopDefinition.lua")

for _, tUnit in tUnits do
	for i = 1, tUnit.Amount do
		local sTag = "SQHeart_" .. tUnit.Tag .. i
		table.insert(tSpawn, NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = sTag, Level = tUnit.Level, UnitId = tUnit.UnitId, TargetTag = "SQHeart_SpawnDwarves", Team = "tm_Team1"}})
		table.insert(tSpawn, FigurePlayerTransfer	{Tag = sTag})
		table.insert(tAnyDwarfAlive, FigureIsAlive	{Tag = sTag})
		table.insert(tDwarvesFollowSkjadir, FigurePlayerTransfer	{Tag = sTag, Player = "pl_Skjadir"})
		table.insert(tDwarvesFollowSkjadir, FigureFollowEntity	{Tag = sTag, TargetTag = "SQHeart_Skjadir"})
	end
end


if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		EventName = "DebugInit",
		Conditions = 
		{
			QuestIsNotKnown		{Quest = "HeartOfIce"},
			DebugQuestionYes	{Question = "Das Ende der Herz aus Eis Quest starten?", Caption = "SQ Heart of Ice - Bossfights"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "HeartOfIce"},
			QuestSetActive	{Quest = "HeartOfIceGotoWinterlight"},
			GateSetOpen	{Tag = "BackDoor"},
			GateSetOpen	{Tag = "CellGate"},
			FigureVanish	{Tag = "Oger1"},
			FigureVanish	{Tag = "Oger2"},
			FigureVanish	{Tag = "Oger3"},
		},
	};
end

State
{
	StateName = "SpawnHeartOfIceBosses",

	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "HeartOfIceGotoWinterlight"},
			MapFlagIsTrue	{Name = "mf_SQHeart_SkjadirHasSpawned"},
		},
		Actions = tSpawn,
		GotoState = "BossFights",
	};
};


local tAllBossesDead = {}
for _, tBoss in ipairs(tHeart) do
	local sTag = sHeartTag .. tBoss.Tag
	table.insert(tAllBossesDead, FigureIsDead	{Tag = sTag})
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = sTag},
		},
		Actions = 
		{
			PlayerNPCKillCountIncrease	{UnitId = tBoss.UnitId},
		},
	};
end


State
{
	StateName = "BossFights",

	OnEvent
	{
		Conditions = tAllBossesDead,
		Actions = 
		{
			EntityTimerStart	{Name = "et_SpawnAshuka"},
			QuestSetSolved	{Quest = "HeartOfIceConquerWinterlight"},
			QuestSetActive	{Quest = "HeartOfIceKillFinalBoss"},
			VisualTimerStart	{Seconds = iAshukaDelayedSpawnTime},
			FigureOutcry	{TextTag = "SQHeartWitchSpawnSkjadir", Tag = "SQHeart_Skjadir"},
		},
		GotoState = "SpawnAshuka",
	};
};


local sAshukaTag = sHeartTag .. tAshuka.Tag
State
{
	StateName = "SpawnAshuka",

	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_SpawnAshuka", Seconds = iAshukaDelayedSpawnTime},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			EntityTimerStop	{Name = "et_SpawnAshuka"},
			FigureNpcSpawnToEntity	{Tag = sAshukaTag, Level = tAshuka.Level, UnitId = tAshuka.UnitId, TargetTag = "pl_HumanAvatar", Team = "tm_Team2"},
			FigureDirectionSetToEntity	{Tag = sAshukaTag, TargetTag = "pl_HumanAvatar"},

			FigureNpcSpawnToEntity	{Tag = sAshukaTag .. "Golem1", Level = tAshuka.Level * 0.7, UnitId = 1439, TargetTag = sAshukaTag, Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = sAshukaTag .. "Golem2", Level = tAshuka.Level * 0.7, UnitId = 1439, TargetTag = sAshukaTag, Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = sAshukaTag .. "Golem3", Level = tAshuka.Level * 0.7, UnitId = 1439, TargetTag = sAshukaTag, Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = sAshukaTag .. "Golem4", Level = tAshuka.Level * 0.7, UnitId = 1439, TargetTag = sAshukaTag, Team = "tm_Team2"},
		},
		GotoState = "FightAshukaPhase1",
	};
};

local tKillAllAdds = {}

for i = 1, 4 do
	local sTag = sAshukaTag .. "Golem" .. i
	
	table.insert(tKillAllAdds, FigureKill	{Tag = sTag})
	table.insert(tKillAllAdds, FigureKill	{Tag = sAshukaTag .. "_Elem" .. i .. "1"})
	table.insert(tKillAllAdds, FigureKill	{Tag = sAshukaTag .. "_Elem" .. i .. "2"})
	table.insert(tKillAllAdds, FigureKill	{Tag = sAshukaTag .. "_Elem" .. i .. "3"})
	table.insert(tKillAllAdds, FigureKill	{Tag = sAshukaTag .. "_Elem" .. i .. "4"})
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = sTag},
			FigureIsAlive	{Tag = sAshukaTag},
		},
		Actions = 
		{
			FigureHealthSubtract	{Tag = sAshukaTag, Percent = 20},
			EffectStart	{Tag = sAshukaTag, File = "Effect_Pain_Hit"},
			EffectStart	{Tag = sAshukaTag, File = "Effect_Deathblows_Hit"},

			FigureNpcSpawnToEntity	{Tag = sAshukaTag .. "_Elem" .. i .. "1", Level = tAshuka.Level * 0.5, UnitId = 1440, TargetTag = sTag .. "_DEAD", Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = sAshukaTag .. "_Elem" .. i .. "2", Level = tAshuka.Level * 0.5, UnitId = 1440, TargetTag = sTag .. "_DEAD", Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = sAshukaTag .. "_Elem" .. i .. "3", Level = tAshuka.Level * 0.5, UnitId = 1440, TargetTag = sTag .. "_DEAD", Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = sAshukaTag .. "_Elem" .. i .. "4", Level = tAshuka.Level * 0.5, UnitId = 1440, TargetTag = sTag .. "_DEAD", Team = "tm_Team2"},
		},
	};
end

State
{
	StateName = "FightAshukaPhase1",
	
	OnEvent
	{
		Conditions = 
		{
			OR
			{
				FigureHasNotHealth	{Tag = sAshukaTag, Percent = 40},
				FigureIsDead	{Tag = sAshukaTag},
			},
		},
		Actions = 
		{
			FigureKill	{Tag = sAshukaTag},
			FigureOutcryImmediate	{TextTag = "SQHeartAshuka", Tag = sAshukaTag .. "_DEAD"},
			FigureVanish	{Tag = sAshukaTag .. "_DEAD"},
			FigureKill	{Tag = sAshukaTag .. "Golem1"},
			FigureKill	{Tag = sAshukaTag .. "Golem2"},
			FigureKill	{Tag = sAshukaTag .. "Golem3"},
			FigureKill	{Tag = sAshukaTag .. "Golem4"},
			EntityTimerStart	{Name = "et_Add1RespawnDelay"},
			EntityTimerStart	{Name = "et_Add2RespawnDelay"},
			EntityTimerStart	{Name = "et_Add3RespawnDelay"},
			EntityTimerStart	{Name = "et_Add4RespawnDelay"},
			EntityTimerStart	{Name = "et_Add5RespawnDelay"},
			EntityTimerStart	{Name = "et_Add6RespawnDelay"},
		},
		GotoState = "SpawnAshukaPhase2",
	};
};

State
{
	StateName = "SpawnAshukaPhase2",

	OnOneTimeEvent
	{
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem11"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem12"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem13"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem14"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem21"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem22"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem23"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem24"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem31"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem32"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem33"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem34"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem41"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem42"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem43"},
			FigureIsDead	{Tag = "SQHeart_Ashuka_Elem44"},
			FigureIsDead	{Tag = sAshukaTag .. "Golem1"},
			FigureIsDead	{Tag = sAshukaTag .. "Golem2"},
			FigureIsDead	{Tag = sAshukaTag .. "Golem3"},
			FigureIsDead	{Tag = sAshukaTag .. "Golem4"},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_SpawnAshuka"},
			VisualTimerStart	{Seconds = iAshukaDelayedSpawnTime / 2},
		},
	};
	
	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_SpawnAshuka", Seconds = iAshukaDelayedSpawnTime},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = sAshukaTag, Level = tAshuka.Level, UnitId = 1441, TargetTag = "pl_HumanAvatar", Team = "tm_Team2"},
			FigureDirectionSetToEntity	{Tag = sAshukaTag, TargetTag = "pl_HumanAvatar"},
			FigureLootItemEquipmentAdd	{Tag = sAshukaTag, DropChance = 100, ItemId = 1187},
			FigureLootItemEquipmentAdd	{Tag = sAshukaTag, DropChance = 100, ItemId = 1188},
			EntityValueSet	{Name = "ev_SpawnMinions", Value = 6},
		},
		GotoState = "FightAshukaPhase2",
	};
};


local tAdds = 
{
	{Level = tAshuka.Level - 1, UnitId = 1442},
	{Level = tAshuka.Level - 1, UnitId = 1443},
	{Level = tAshuka.Level - 1, UnitId = 1444},
	{Level = tAshuka.Level - 1, UnitId = 1445},
	{Level = tAshuka.Level - 1, UnitId = 1446},
	{Level = tAshuka.Level - 1, UnitId = 1447},
}

for i, tAdd in ipairs(tAdds) do
	local sTag = sAshukaTag .. "Add" .. i
	local sTimer = "et_AshukaAdd"..i.."RespawnDelay"
	local sAddFlag = "ef_AshukaAdd"..i.."TimerRunning"

	table.insert(tKillAllAdds, FigureKill	{Tag = sTag})
	table.insert(tKillAllAdds, FigureKill	{Tag = sTag})

	OnEvent
	{
		Conditions = 
		{
			OR
			{
				EntityValueIsGreater	{Name = "ev_SpawnMinions", Value = 0},
			
				AND
				{
					EntityTimerIsElapsed	{Name = sTimer, Seconds = 10},
					FigureIsDead	{Tag = sTag},
					FigureIsAlive	{Tag = sAshukaTag},
					EntityFlagIsTrue	{Name = sAddFlag},
				},
			},
		},
		Actions = 
		{
			EntityValueDecrease	{Name = "ev_SpawnMinions"},
			EntityFlagSetFalse	{Name = sAddFlag},
			EntityTimerStop	{Name = sTimer},
			FigureNpcSpawnToEntity	{Tag = sTag, Level = tAdd.Level, UnitId = tAdd.UnitId, TargetTag = sAshukaTag, Team = "tm_Team2"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = sTag},
			EntityFlagIsFalse	{Name = sAddFlag},
		},
		Actions = 
		{
			EntityFlagSetTrue	{Name = sAddFlag},
			EntityTimerStart	{Name = sTimer},
		},
	};
end


State
{
	StateName = "FightAshukaPhase2",

	OnEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = sAshukaTag},
		},
		Actions = 
		{
			PlayerNPCKillCountIncrease	{UnitId = tAshuka.UnitId},
			QuestSetSolved	{Quest = "HeartOfIceKillFinalBoss"},
			FigureTeleport	{Tag = "Steingrimm", X = GetEntityX("Steingrimm"), Y = GetEntityY("Steingrimm")},
			unpack(tKillAllAdds)	-- muss die letzte Action sein!
		},
		GotoState = "Reward",
	};
};

State
{
	StateName = "Reward",
	
	-- falls Skjadir bereits tot, Quest einfach so beenden, ansonsten auf Dialogführung warten
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "SQHeart_Skjadir"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "HeartOfIce"},
			AvatarFlagSetTrue	{Name = "af_P401_SkjadirHasDiedOnWinterlight"},
		},
	};


	-- Jubel Outcry wenn mind. 1 Zwerg überlebt hat
	OnOneTimeEvent
	{
		Conditions = 
		{
			--FigureIsAlive	{Tag = "SQHeart_Skjadir"},
			OR(tAnyDwarfAlive),
		},
		Actions = 
		{
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "SQHeart_ZwergDerDenLetztenOutcryMacht", Level = 1, UnitId = 312, X = 20, Y = 20, Team = "tm_Team1"}},
			FigureOutcryImmediate	{TextTag = "SQHeartDwarf", Tag = "SQHeart_ZwergDerDenLetztenOutcryMacht"},
			FigureVanish	{Tag = "SQHeart_ZwergDerDenLetztenOutcryMacht"},
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsAlive	{Tag = "SQHeart_Skjadir"},
			OR(tAnyDwarfAlive),
		},
		Actions = 
		{
			unpack(tDwarvesFollowSkjadir)	-- muss die letzte Action sein!
		},
	};
	
	-- ansonsten ist die Quest hiermit offiziell abgeschlossen
	OnEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "HeartOfIce"},
		},
		Actions = 
		{
		},
		GotoState = "END",
	};
};

State	{StateName = "END"};

