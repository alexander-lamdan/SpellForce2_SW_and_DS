local iMinionLevel = -9

if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotKnown	{Quest = "WarriorEpicLoyalty"},
			DebugQuestionYes	{Question = "Warrior Epic <Treue> aktivieren?", Caption = "Warrior Epic"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "WarriorEpicLoyalty"},
			--QuestSetActive	{Quest = "WarriorEpicLoyaltyFindBanner"},
		},
	};
end

State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "WarriorEpicLoyalty"},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_DialogEnableDelay"},
		},
		GotoState = "TalkToSkeleton",
	};
};

State
{
	StateName = "TalkToSkeleton",

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_DialogEnableDelay", Seconds = 1},
		},
		Actions =
		{
			DialogTypeSetSideQuest	{Tag = "SQWarrior_Skeleton"},
			DialogSetEnabled	{Tag = "SQWarrior_Skeleton"},
		},
	};

	OnEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{ItemId = 382, Amount = 1},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
		},
		GotoState = "SpawnLeader",
	};
};


State
{
	StateName = "SpawnLeader",

	OnEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_SQWarrior_SpawnLeader", Value = 0},
		},
		Actions = 
		{
			MapValueIncrease	{Name = "mv_SQWarrior_SpawnLeader"},
		},
		GotoState = "TalkToLeader",
	};
	OnEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_SQWarrior_SpawnLeader", Value = 1},
		},
		Actions = 
		{
			MapValueIncrease	{Name = "mv_SQWarrior_SpawnLeader"},
			MapFlagSetTrue	{Name = "mf_SQWarrior_SpawnLeader1Now"},
		},
		GotoState = "TalkToLeader",
	};
	OnEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_SQWarrior_SpawnLeader", Value = 2},
		},
		Actions = 
		{
			MapValueIncrease	{Name = "mv_SQWarrior_SpawnLeader"},
			MapFlagSetTrue	{Name = "mf_SQWarrior_SpawnLeader2Now"},
		},
		GotoState = "TalkToLeader",
	};
	OnEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_SQWarrior_SpawnLeader", Value = 3},
		},
		Actions = 
		{
			MapValueIncrease	{Name = "mv_SQWarrior_SpawnLeader"},
			MapFlagSetTrue	{Name = "mf_SQWarrior_SpawnLeader3Now"},
		},
		GotoState = "TalkToLeader",
	};

	OnEvent
	{
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_SQWarrior_SpawnLeader", Value = 4},
			VisualTimerIsNotActive	{},
		},
		Actions = 
		{
			MapValueIncrease	{Name = "mv_SQWarrior_SpawnLeader"},
			MapFlagSetTrue	{Name = "mf_SQWarrior_SpawnAllLeadersNow"},
		},
		GotoState = "SpawnMinions",
	};
};

State
{
	StateName = "TalkToLeader",

	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsFalse	{Name = "ef_AvatarWasInRange"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "SQWarrior_Location", Range = 12},
		},
		Actions = 
		{
			EntityFlagSetTrue	{Name = "ef_AvatarWasInRange"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_AvatarWasInRange"},
			OR
			{
				MapValueIsEqual	{Name = "mv_SQWarrior_SpawnLeader", Value = 1},	-- beim ersten durchlauf noch kein dialog
				MapFlagIsTrue	{Name = "mf_SQWarrior_AvatarKeepsBanner"},
				FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "SQWarrior_Location", Range = 18},
			},
			AvatarIsNotTalking	{},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			EntityFlagSetFalse	{Name = "ef_AvatarWasInRange"},
			MapFlagSetFalse	{Name = "mf_SQWarrior_AvatarKeepsBanner"},
		},
		GotoState = "SpawnMinions",
	};
	
	-- Questabbruch!
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQWarrior_AvatarGivesBannerAway"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			--DebugMessage	{Message = "quest unsolvable, tja, leider pech gehabt ..."},
			AvatarItemMiscTake	{ItemId = 382, Amount = 1},
			QuestSetUnsolvable	{Quest = "WarriorEpicLoyaltyFindBanner"},
			QuestSetUnsolvable	{Quest = "WarriorEpicLoyalty"},
		},
		GotoState = "END",
	};
};


local iMaxMinions = 36
local iNumMinionsPerChain = iMaxMinions / 3
local iNumMod = 0

local tSpawnMinions1 = {}
local tSpawnMinions2 = {}
local tSpawnMinions3 = {}

local tSpawnDead = {FigureIsDead{Tag = "SQWarrior_Leader1"},FigureIsDead{Tag = "SQWarrior_Leader2"},FigureIsDead{Tag = "SQWarrior_Leader3"}}
local iSpawnNum = 1

for i = 1, iMaxMinions do
	local sTag = "SQWarrior_Minion" .. i
	local sTargetTag = "SQWarrior_Spawn" .. iSpawnNum
	iSpawnNum = iSpawnNum + 1
	if iSpawnNum > 12 then
		iSpawnNum = 1
	end
	
	table.insert(tSpawnDead, FigureIsDead{Tag = sTag})
	
	if iNumMod < 1 then
		table.insert(tSpawnMinions1, FigureNpcSpawnLRTAToEntity	{Tag = sTag, Level = iMinionLevel, UnitId = 1266, TargetTag = sTargetTag, Team = "tm_Team2"})
		table.insert(tSpawnMinions1, FigureFollowEntity	{Tag = sTag, TargetTag = "SQWarrior_Leader1"})
	end

	if iNumMod < 2 then
		table.insert(tSpawnMinions2, FigureNpcSpawnLRTAToEntity	{Tag = sTag, Level = iMinionLevel - 1, UnitId = 1266, TargetTag = sTargetTag, Team = "tm_Team2"})
		table.insert(tSpawnMinions2, FigureFollowEntity	{Tag = sTag, TargetTag = "SQWarrior_Leader2"})
	end

	if iNumMod < 3 then	
		table.insert(tSpawnMinions3, FigureNpcSpawnLRTAToEntity	{Tag = sTag, Level = iMinionLevel - 2, UnitId = 1266, TargetTag = sTargetTag, Team = "tm_Team2"})
		table.insert(tSpawnMinions3, FigureFollowEntity	{Tag = sTag, TargetTag = "SQWarrior_Leader3"})
	end

	if math.mod(i, iNumMinionsPerChain) == 0 then
		iNumMod = iNumMod + 1
		--MessageBox("mod ist " .. iNumMod .. " bei i == " .. i)
	end
end

--MessageBox("Num Minions in packs:\n1 = " .. table.getn(tSpawnMinions1) / 2 .. "\n2 = " .. table.getn(tSpawnMinions2) / 2 .. "\n3 = " .. table.getn(tSpawnMinions3) / 2)

State
{
	StateName = "SpawnMinions",

	OnEvent
	{
		EventName = "LeaderTransferTeamAndAttack",
		Conditions = 
		{
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "SQWarrior_Leader1"},
			DialogSetDisabled	{Tag = "SQWarrior_Leader2"},
			DialogSetDisabled	{Tag = "SQWarrior_Leader3"},
			FigureTeamTransfer	{Tag = "SQWarrior_Leader1", Team = "tm_Team2"},
			FigureTeamTransfer	{Tag = "SQWarrior_Leader2", Team = "tm_Team2"},
			FigureTeamTransfer	{Tag = "SQWarrior_Leader3", Team = "tm_Team2"},
		},
	};

	OnEvent
	{
		EventName = "SpawnedMinionsAttack",
		Conditions = 
		{
			MapValueIsLess	{Name = "mv_SQWarrior_SpawnLeader", Value = 4},
		},
		Actions = 
		{
			FigureAttackEntity	{Tag = "SQWarrior_Leader1", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "SQWarrior_Leader2", TargetTag = "pl_HumanAvatar"},
			FigureAttackEntity	{Tag = "SQWarrior_Leader3", TargetTag = "pl_HumanAvatar"},
		},
	};
	
	OnEvent
	{
		EventName = "SpawnMinions1",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_SQWarrior_SpawnLeader", Value = 1},
		},
		Actions = 
		{
			--DebugMessage	{Message = "spawn minions 000 (no dialog)"},
			unpack(tSpawnMinions1)	-- muss die letzte Action sein!
		},
		GotoState = "FightMinions",
	};

	OnEvent
	{
		EventName = "SpawnMinions2",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_SQWarrior_SpawnLeader", Value = 2},
		},
		Actions = 
		{
			--DebugMessage	{Message = "spawn minions 111 (after first dialog)"},
			unpack(tSpawnMinions1)	-- muss die letzte Action sein!
		},
		GotoState = "FightMinions",
	};

	OnEvent
	{
		EventName = "SpawnMinions3",
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_SQWarrior_SpawnLeader", Value = 3},
		},
		Actions = 
		{
			--DebugMessage	{Message = "spawn minions 222 (after 2nd dialog)"},
			unpack(tSpawnMinions2)	-- muss die letzte Action sein!
		},
		GotoState = "FightMinions",
	};
		
	OnEvent
	{
		EventName = "SpawnMinions4",
		Conditions = 
		{
			MapValueIsGreaterOrEqual	{Name = "mv_SQWarrior_SpawnLeader", Value = 4},
		},
		Actions = 
		{
			--DebugMessage	{Message = "spawn minions 333 (after 3rd dialog)"},
			unpack(tSpawnMinions3)	-- muss die letzte Action sein!
		},
		GotoState = "FightMinions",
	};
};


State
{
	StateName = "FightMinions",

	OnEvent
	{
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			MapValueIsLess	{Name = "mv_SQWarrior_SpawnLeader", Value = 5},
			unpack(tSpawnDead)	-- muss die letzte Condition sein!
		},
		Actions = 
		{
			--DebugMessage	{Message = "next iteration"},
			EntityTimerStart	{Name = "et_SpawnLeaderDelay"},
		},
		GotoState = "WaitAfterFight",
	};
	OnEvent
	{
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			MapValueIsGreaterOrEqual	{Name = "mv_SQWarrior_SpawnLeader", Value = 5},
			unpack(tSpawnDead)	-- muss die letzte Condition sein!
		},
		Actions = 
		{
			ObjectLootItemEquipmentAdd	{Tag = "SQWarrior_Skeleton", DropChance = 100, ItemId = 1171},
			ObjectLootItemEquipmentAdd	{Tag = "SQWarrior_Skeleton", DropChance = 100, ItemId = 1179},
			AvatarItemMiscTake	{ItemId = 382, Amount = 1},
			QuestSetSolved	{Quest = "WarriorEpicLoyaltyFindBanner"},
			QuestSetSolved	{Quest = "WarriorEpicLoyalty"},
			QuestSetActive	{Quest = "WarriorEpicVeracity"},
			--QuestSetActive	{Quest = "WarriorEpicVeracityCraigsTrial"},
		},
		GotoState = "END",
	};
};


State
{
	StateName = "WaitAfterFight",

	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_SpawnLeaderDelay", Seconds = 2},
			MapValueIsGreaterOrEqual	{Name = "mv_SQWarrior_SpawnLeader", Value = 4},
		},
		Actions = 
		{
			VisualTimerStart	{Seconds = 30},
		},
		GotoState = "SpawnLeader",
	};
	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_SpawnLeaderDelay", Seconds = 2},
		},
		Actions = 
		{
		},
		GotoState = "SpawnLeader",
	};
};



---- je nach leader anderes Item bei Questabbruch übergeben
--for i = 1, 3 do
--	OnEvent
--	{
--		Conditions = 
--		{
--			MapValueIsEqual	{Name = "mv_SQWarrior_SpawnLeader", Value = i},
--		},
--		Actions = 
--		{
--			--MapFlagSetTrue	{Name = "mf_SQWarrior_PseudoRewardFromLeader" .. i},
--		},
--		GotoState = "END",
--	};
--end
--
--State
--{
--	StateName = "GivePseudoReward",
--};

State	{StateName = "END"};

