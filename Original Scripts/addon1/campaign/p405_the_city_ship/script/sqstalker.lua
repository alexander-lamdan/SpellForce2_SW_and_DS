local iSeeShadowsTime = 8
local iStalkerLevel = 18

local iStalkerBaseId = 1306
local iStalkerNoShadowBaseId = 1341

if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		EventName = "Debug",
		Conditions = 
		{
			QuestIsNotKnown	{Quest = "FindAndKillStalkers"},
			DebugQuestionYes	{Question = "Stalker Quest starten?"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "FindAndKillStalkers"},
		},
	};
end


local tSpawnStalker = {}
local tRemoveAbility = {}
local tAddAbility = {}
local tVanishSpyglass = {}
local tLeverDisabled = {}

for i = 1, 5 do
	local sTag = "SQStalker_Stalker" .. i
	local sNoShadowTag = sTag .. "NoShadow"
	local sTargetTag = "SQStalker_Path" .. i .. "1"
	local sTargetTag2 = "SQStalker_Path" .. i .. "2"
	local sSpyglassTag = "SQStalker_Spyglass" .. i
	local sSpyglassSpawnedTag = sSpyglassTag .. "Spawned"
	local iUnitId = iStalkerBaseId + i
	local iNoShadowUnitId = iStalkerNoShadowBaseId + i
	
	table.insert(tSpawnStalker, NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = sTag, Level = iStalkerLevel, UnitId = iUnitId, TargetTag = sTargetTag, Team = "tm_Team2"}})
	table.insert(tSpawnStalker, FigurePathGoto{Goto = FigurePatrolWalkToEntity {Tag = sTag, TargetTag = sTargetTag}, Tags = {sTargetTag2}})
	table.insert(tSpawnStalker, ObjectSpawnToEntity	{ObjectId = 726, TargetTag = sSpyglassTag, Direction = GetEntityDirection(sSpyglassTag) + 90, Tag = sSpyglassSpawnedTag})
	table.insert(tSpawnStalker, LeverSetOff	{Tag = sSpyglassSpawnedTag})
	--table.insert(tSpawnStalker, LeverSetEnabled	{Tag = sSpyglassSpawnedTag})

	table.insert(tLeverDisabled, LeverSetDisabled	{Tag = sSpyglassSpawnedTag})


	table.insert(tRemoveAbility, NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = sNoShadowTag, Level = iStalkerLevel, UnitId = iNoShadowUnitId, TargetTag = sTag, Team = "tm_Neutral"}})
	table.insert(tRemoveAbility, FigurePathGoto{Goto = FigurePatrolWalkToEntity {Tag = sNoShadowTag, TargetTag = sTargetTag}, Tags = {sTargetTag2, sTargetTag, sTargetTag2, sTargetTag, sTargetTag2, sTargetTag, sTargetTag2}})

	table.insert(tAddAbility, FigureVanish	{Tag = sNoShadowTag})

	table.insert(tVanishSpyglass, ObjectVanish	{Tag = sSpyglassSpawnedTag})
end


State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "FindAndKillStalkers"},
			--AvatarIsNotTalking	{},
		},
		Actions =
		{
			unpack(tSpawnStalker)	-- muss die letzte Action sein!
		},
		GotoState = "KillStalker",
	};
};


for i = 1, 5 do
	local sTag = "SQStalker_Stalker" .. i
	local iUnitId = iStalkerBaseId + i
	local sSpyglassSpawnedTag = "SQStalker_Spyglass" .. i .. "Spawned"
	
	OnLeverEvent
	{
		Delay = iSeeShadowsTime,
		Lever = sSpyglassSpawnedTag,
		OnConditions = 
		{
			FigureIsAlive	{Tag = sTag},
		},
		Actions = 
		{
			EntityFlagSetTrue	{Name = "ef_SeeStalkers"},
			EntityTimerStart	{Name = "et_SeeStalkersBeginCutscene" .. i},
			unpack(tLeverDisabled)	-- muss die letzte Action sein!
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = sTag},
		},
		Actions =
		{
			PlayerNPCKillCountIncrease	{UnitId = iUnitId},
			EntityValueIncrease	{Name = "ev_NumStalkersDead"},
		},
	};

	OnEvent
	{
		EventName = "BeginCutscene" .. i,
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_SeeStalkersBeginCutscene" .. i, Seconds = 0.1},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_SeeStalkersBeginCutscene" .. i},
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "Spyglass0" .. i, Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--DebugMessage	{Message = "Begin Cutscene " .. i},
		},
	};

	OnEvent
	{
		EventName = "EnableLevers",
		Conditions =
		{
			FigureIsAlive	{Tag = sTag},
			EntityTimerIsElapsed	{Name = "et_SeeStalkers", Seconds = iSeeShadowsTime},
		},
		Actions =
		{
			LeverSetEnabled	{Tag = sSpyglassSpawnedTag},
		},
	};
end

State
{
	StateName = "KillStalker",

	OnEvent
	{
		EventName = "RemoveShadowAbility",
		Conditions =
		{
			EntityFlagIsTrue	{Name = "ef_SeeStalkers"},
		},
		Actions =
		{
			EntityFlagSetFalse	{Name = "ef_SeeStalkers"},
			EntityTimerStart	{Name = "et_SeeStalkers"},
			--DebugMessage	{Message = "Spawn Stalkers "},
			unpack(tRemoveAbility)	-- muss die letzte Action sein!
		},
	};

	OnEvent
	{
		EventName = "EndCutscene",
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_SeeStalkers", Seconds = iSeeShadowsTime},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_SeeStalkers"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd {},
			unpack(tAddAbility)
		},
	};

	OnEvent
	{
		Conditions =
		{
			EntityValueIsGreaterOrEqual	{Name = "ev_NumStalkersDead", Value = 5},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "FindAndKillStalkers"},
			MapFlagSetTrue	{Name = "mf_SQStalker_Reward"},
			unpack(tVanishSpyglass)	-- muss die letzte Action sein!
		},
		GotoState = "END",
	};
};

State	{StateName = "END"};
