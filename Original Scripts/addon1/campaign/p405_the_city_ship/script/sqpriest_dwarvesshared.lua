if iGroup == nil then
	iGroup = 1
else
	iGroup = iGroup + 1
end


local iNumGhostsPerGroup = 5
local iGhostLevelRTA = -3
local iUnitId = 1286

local tSpawnGhosts = {}
local tVanishGhosts = {}

for i = 1, iNumGhostsPerGroup do
	local sTag = "SQPriest_Group" .. iGroup .. "Ghost" .. i
	table.insert(tSpawnGhosts, FigureNpcSpawnLRTAToEntity	{Tag = sTag, Level = iGhostLevelRTA, UnitId = iUnitId, TargetTag = "SQPriest_SpawnDwarf", Team = "tm_Galius"})
	table.insert(tSpawnGhosts, FigureForcedWalkToEntity	{Tag = sTag, TargetTag = "SQPriest_DespawnDwarf"})
	table.insert(tVanishGhosts, FigureVanish	{Tag = sTag})
end

local tWaitForSpawn = {}
if iGroup > 1 then
	local iSeconds = (iGroup - 1) * iGhostSpawnDelay
	table.insert(tWaitForSpawn, MapTimerIsElapsed	{Name = "mt_SQPriest_GhostSpawnDelayTimer", Seconds = iSeconds})
end

State
{
	StateName = "WaitForQuestStart",

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQPriest_StartProtectGhosts"},
			unpack(tWaitForSpawn)	-- muss die letzte Condition sein!
		},
		Actions =
		{
    		--DebugMessage	{Message = "Zwergengruppe " .. iGroup .. " spawnt!"},
			unpack(tSpawnGhosts)	-- muss die letzte Action sein!
		},
		GotoState = "GoGoGhosts",
	};
};

local tResetNaturalCauseFlags = {}

for i = 1, iNumGhostsPerGroup do
	local sTag = "SQPriest_Group" .. iGroup .. "Ghost" .. i
	local sTimerName = "et_DespawnTimer_" .. sTag
	local sNaturalCauseFlag = "ef_DiedOfNaturalCause_" .. sTag
	local sHealMeFlag = "ef_PleaseHealMe_" .. sTag
	
	table.insert(tResetNaturalCauseFlags, EntityFlagSetFalse	{Name = sNaturalCauseFlag})
	table.insert(tResetNaturalCauseFlags, EntityFlagSetFalse	{Name = sHealMeFlag})
	if i == 1 then
		table.insert(tResetNaturalCauseFlags, MapFlagSetFalse	{Name = "mf_SQPriest_GhostNeedsHealing"})
	end

	OnToggleEvent
	{
		EventName = "Vanishing",
		OnConditions =
		{
			FigureIsAlive	{Tag = sTag},
			FigureIsInRangeToEntity	{Tag = sTag, TargetTag = "SQPriest_DespawnDwarf", Range = 3},
		},
		OnActions =
		{
			EffectStart	{Tag = sTag, File = "Effect_DeSpawn_Unit"},
			EntityTimerStart	{Name = sTimerName},
			FigureTeamTransfer	{Tag = sTag, Team = "tm_Neutral"},
			FigureHealthSet	{Tag = sTag, Percent = 100},
		},
		OffConditions =
		{
			OR
			{
				FigureIsDead	{Tag = sTag},
				EntityTimerIsElapsed	{Name = sTimerName, Seconds = 2.0},
			},
		},
		OffActions =
		{
			EntityTimerStop	{Name = sTimerName},
			MapValueIncrease	{Name = "mv_SQPriest_NumberOfGhostsSaved"},
			PlayerNPCKillCountIncrease	{UnitId = iUnitId},
			FigureVanish	{Tag = sTag},
			EntityFlagSetTrue	{Name = sNaturalCauseFlag},
		},
	};
	
	OnEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = sTag},
			EntityFlagIsFalse	{Name = sNaturalCauseFlag},
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = sNaturalCauseFlag},
			MapValueIncrease	{Name = "mv_SQPriest_NumberOfGhostsDead"},
		},
	};

	OnEvent
	{
		Conditions =
		{
			FigureIsAlive	{Tag = sTag},
			FigureHasNotHealth	{Tag = sTag, Percent = 35},
			EntityFlagIsFalse	{Name = sHealMeFlag},
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = sHealMeFlag},
			MapFlagSetTrue	{Name = "mf_SQPriest_GhostNeedsHealing"},
		},
	};
end

State
{
	StateName = "GoGoGhosts",

	OnEvent
	{
		Conditions =
		{
			MapFlagIsFalse	{Name = "mf_SQPriest_StartProtectGhosts"},
		},
		Actions =
		{
    		--DebugMessage	{Message = "Zwerge: Questabbruch"},
			unpack(tVanishGhosts)	-- muss die letzte Action sein!
		},
		GotoState = "WaitForQuestReset",
	};
};


State
{
	StateName = "WaitForQuestReset",

	OnEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "PriestEpicLifeTalkToGalius"},
		},
		Actions =
		{
    		--DebugMessage	{Message = "Zwerge: warten auf Quest restart"},
			unpack(tResetNaturalCauseFlags)	-- muss die letzte Action sein!
		},
		GotoState = "WaitForQuestStart",
	};

	OnEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "PriestEpicLifeProtectGhosts"},
		},
		Actions =
		{
    		--DebugMessage	{Message = "Zwerge: Quest gelöst!"},
		},
		GotoState = "END",
	};
};


State	{StateName = "END"};
