local iGhostLevel = 16

if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		EventName = "Debug",
		Conditions = 
		{
		},
		Actions = 
		{
		},
	};
end


local tSpawnThoughts = {}
for i = 1, 12 do
	local sTag = "SQThoughts_FledThought" .. i
	local sTargetTag = "SQThoughts_SpawnThought" .. i
	table.insert(tSpawnThoughts, FigureNpcSpawnToEntity	{Tag = sTag, Level = iGhostLevel, UnitId = 1215, TargetTag = sTargetTag, Team = "tm_Team2"})
	table.insert(tSpawnThoughts, FigureRoamingEnable {Tag = sTag})
end

State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "ThoughtsOfGlassCatchThoughts"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "SQThoughts_Thinker"},
			unpack(tSpawnThoughts)	-- muss die letzte Action sein!
		},
		GotoState = "KillThoughts",
	};
};

local tStopThoughts = {}
local tFollowThoughts = {}
for i = 1, 12 do
	local sTag = "SQThoughts_CapturedThought" .. i
	table.insert(tStopThoughts, FigureStop	{Tag = sTag})
	--local sAvoidRepeatTrigger = "et_AvoidRepeatTrigger_Thought" .. i
	--table.insert(tStopThoughts, EntityTimerStart	{Name = sAvoidRepeatTrigger})
	table.insert(tFollowThoughts, FigureFollowEntity	{Tag = sTag, TargetTag = "pl_HumanAvatar"})
end

for i = 1, 12 do
	local sFledTag = "SQThoughts_FledThought" .. i
	local sNewTag = "SQThoughts_CapturedThought" .. i
	local sMoveCloser = "ef_MoveCloser_Thought" .. i
	--local sAvoidRepeatTrigger = "et_AvoidRepeatTrigger_Thought" .. i

	-- respawn as same but friendly unit	
	OnOneTimeEvent
	{
		EventName = "RespawnAsFriendlyUnit" .. i,
		Conditions =
		{
			FigureIsDead	{Tag = sFledTag},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			EntityFlagIsFalse	{Name = "ef_Spawned_" .. sNewTag},
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = "ef_Spawned_" .. sNewTag},
			PlayerNPCKillCountIncrease	{UnitId = 1215},
			FigureNpcSpawnToEntity	{Tag = sNewTag, Level = iGhostLevel, UnitId = 1215, TargetTag = "pl_HumanAvatar", Team = "tm_Neutral"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "RespawnAsFriendlyUnit" .. i,
		Conditions =
		{
			FigureIsDead	{Tag = sFledTag},
			FigureIsDead	{Tag = "pl_HumanAvatar"},
			EntityFlagIsFalse	{Name = "ef_Spawned_" .. sNewTag},
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = "ef_Spawned_" .. sNewTag},
			PlayerNPCKillCountIncrease	{UnitId = 1215},
			FigureNpcSpawnToEntity	{Tag = sNewTag, Level = iGhostLevel, UnitId = 1215, TargetTag = "pl_HumanAvatar_DEAD", Team = "tm_Neutral"},
		},
	};

	OnEvent
	{
		EventName = "FollowAvatar" .. i,
		Conditions =
		{
			FigureIsAlive	{Tag = sNewTag},
			FigureIsIdle	{Tag = sNewTag},
			FigureIsNotFollowing	{Tag = sNewTag, TargetTag = "pl_HumanAvatar"},
			EntityFlagIsFalse	{Name = sMoveCloser},
		},
		Actions =
		{
			FigureFollowEntity	{Tag = sNewTag, TargetTag = "pl_HumanAvatar"},
		},
	};

	-- move to cristalization process
	OnOneTimeEvent
	{
		EventName = "NearCrystalizer" .. i,
		Conditions =
		{
			FigureIsInRangeToEntity	{Tag = sNewTag, TargetTag = "SQThoughts_Crystalizer", Range = 8},
		},
		Actions =
		{
			FigureStop	{Tag = sNewTag},
			EntityFlagSetTrue	{Name = sMoveCloser},
		},
	};
	OnEvent
	{
		EventName = sMoveCloser,
		Conditions =
		{
			EntityFlagIsTrue	{Name = sMoveCloser},
			OR
			{
				FigureIsIdle	{Tag = sNewTag},
				FigureIsFollowing	{Tag = sNewTag, TargetTag = "pl_HumanAvatar"},
			},
			FigureIsNotInRangeToEntity	{Tag = sNewTag, TargetTag = "SQThoughts_Crystalizer", Range = 0.5},
		},
		Actions =
		{
			FigureForcedRunToEntity	{Tag = sNewTag, TargetTag = "SQThoughts_Crystalizer"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "VeryCloseToCrystalizer" .. i,
		Conditions =
		{
			EntityFlagIsTrue	{Name = sMoveCloser},
			FigureIsInRangeToEntity	{Tag = sNewTag, TargetTag = "SQThoughts_Crystalizer", Range = 0.5},
		},
		Actions =
		{
			EntityFlagSetFalse	{Name = sMoveCloser},
			CutsceneFigureFreeze	{Tag = sNewTag},
			EffectStart	{Tag = sNewTag, File = "Effect_DivineBolt_Hit"},
			EntityTimerStart	{Name = "et_VanishMe_Thought" .. i},
			unpack(tStopThoughts)	-- muss die letzte Action sein!
		},
		GotoState = "CrystalizeMe_Thought" .. i,
	};
end

State
{
	StateName = "KillThoughts",

	-- HACK: der spieler hat sich items ermogelt! Also einfach die überschüssigen entfernen...
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 344, Amount = 12},
			EntityValueIsLess	{Name = "ev_NumGhostsCrystalized", Value = 12},
		},
		Actions =
		{
			AvatarItemMiscTake	{ItemId = 344, Amount = 1},
		},
	};

	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 344, Amount = 12},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "ThoughtsOfGlassCatchThoughts"},
			QuestSetActive	{Quest = "ThoughtsOfGlassActivateThinker"},
			ObjectSpawnToEntity	{ObjectId = 1199, TargetTag = "SQThoughts_Reward", Direction = 222, Tag = "SQThoughts_RewardChest"},
			ObjectLootItemEquipmentAdd	{Tag = "SQThoughts_RewardChest", DropChance = 100, ItemId = 1167},
		},
		GotoState = "WaitForOtherQuests",
	};
};



for i = 1, 12 do
	local sNewTag = "SQThoughts_CapturedThought" .. i

	State
	{
		StateName = "CrystalizeMe_Thought" .. i,
		
		OnOneTimeEvent
		{
			EventName = "StartDespawnEffect" .. i,
			Conditions =
			{
				EntityTimerIsElapsed	{Name = "et_VanishMe_Thought" .. i, Seconds = 0.5},
			},
			Actions =
			{
				EffectStart	{Tag = sNewTag, File = "Effect_DivineBolt_Impact"},
			},
		};

		OnEvent
		{
			EventName = "ZACKWUUUUSCH" .. i,
			Conditions =
			{
				EntityTimerIsElapsed	{Name = "et_VanishMe_Thought" .. i, Seconds = 0.9},
			},
			Actions =
			{
				FigureVanish	{Tag = sNewTag},
				EntityValueIncrease	{Name = "ev_NumGhostsCrystalized"},
				unpack(tFollowThoughts)	-- muss die letzte Action sein!
			},
			GotoState = "AddCrystalToLoot",
		};
	};
end


for i = 1, 3 do
	-- TODO:
	-- ist kiste 1-3 da?
	-- wenn ja, ist die kiste voll?
	-- dann kristall hinzufügen und kiste auf voll setzen
	-- sonst neue kiste spawnen und kristall hinzufügen, kiste noch nicht voll
	local sLootTag = "SQThoughts_Loot" .. i
	local sLootFull = "ev_Loot" .. i .. "IsFull"
	
	OnEvent
	{
		Conditions =
		{
			EntityIsNotExisting	{Tag = sLootTag},
		},
		Actions =
		{
			EntityValueSet	{Name = sLootFull, Value = 1},
			ObjectSpawnToEntity	{ObjectId = 1581, TargetTag = sLootTag .. "Spawn", Direction = 0, Tag = sLootTag},
			ObjectLootItemMiscAdd	{Tag = sLootTag, DropChance = 100, ItemId = 344},
		},
		GotoState = "KillThoughts",
	};
	
	OnEvent
	{
		Conditions =
		{
			EntityIsExisting	{Tag = sLootTag},
			EntityValueIsLessOrEqual	{Name = sLootFull, Value = 4},
		},
		Actions =
		{
			EntityValueIncrease	{Name = sLootFull},
			ObjectLootItemMiscAdd	{Tag = sLootTag, DropChance = 100, ItemId = 344},
		},
		GotoState = "KillThoughts",
	};
end

State
{
	StateName = "AddCrystalToLoot",
};


State
{
	StateName = "WaitForOtherQuests",

	OnEvent
	{
		Conditions =
		{
			QuestIsKnown	{Quest = "RoomOfFire"},
			QuestIsKnown	{Quest = "FindAndKillStalkers"},
			EntityIsNotExisting	{Tag = "PuzzleChest"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "SQThoughts_Thinker"},
		},
		GotoState = "END",
	};
};

State	{StateName = "END"};
