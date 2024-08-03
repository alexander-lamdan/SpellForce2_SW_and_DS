local iSpiderLevel = 20
local sRewardTypeName = "mv_" .. string.upper(GetScriptTag()) .. "RewardType"
local sSpawnedName = "mf_" .. string.upper(GetScriptTag()) .. "Spawned"
local sOtherSpawnedName = "mf_" .. string.upper(sOtherSpider) .. "Spawned"

State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions =
		{
			EntityFlagIsTrue	{Name = "ef_ItsAlive"},
			AvatarIsNotTalking	{},
		},
		Actions =
		{
			EntityFlagSetFalse	{Name = "ef_ItsAlive"},
			-- ein dummy Objekt spawnen um die Spinne an dieselbe Position des Objekts spawnen zu können, mit dem gleichen Scripttag
			ObjectSpawnToEntity	{ObjectId = 1379, TargetTag = GetScriptTag(), Direction = 0, Tag = "SQTicking_SpawnSpider"},
			ObjectVanish	{Tag = GetScriptTag()},
			FigureNpcSpawnToEntity	{Tag = GetScriptTag(), Level = iSpiderLevel, UnitId = iUnitId, TargetTag = "SQTicking_SpawnSpider", Team = "tm_Neutral"},
			ObjectVanish	{Tag = "SQTicking_SpawnSpider"},
			MapFlagSetTrue	{Name = sSpawnedName},
			FigureWalkToEntity	{TargetTag = sOtherSpider},
			MapFlagSetFalse	{Name = "mf_SQTicking_MapChangeDetected"},
			EntityTimerStart	{Name = "et_HappyHippoOutcryDelay"},
		},
	};

	-- both spiders now alive?
	OnEvent
	{
		EventName = "SecondOneAlive",
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_HappyHippoOutcryDelay", Seconds = 3},
			MapFlagIsTrue	{Name = sSpawnedName},
			MapFlagIsTrue	{Name = sOtherSpawnedName},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_HappyHippoOutcryDelay"},
			FigureOutcry	{TextTag = "SQTicking2", Tag = GetScriptTag()},
			SoundGlobalPlayOnceAddon1	{File = "06_level/lvl_mech_click_happy"},

			MapValueSet	{Name = sRewardTypeName, Value = 4},
			EntityTimerStart	{Name = "et_EnableDialog"},
			--DebugMessage	{Message = GetScriptTag() .. ": ich leb als zweites"},
		},
		GotoState = "ItsAlive",
	};

	-- only me alive?
	OnEvent
	{
		EventName = "FirstOneAlive",
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_HappyHippoOutcryDelay", Seconds = 3},
			MapFlagIsTrue	{Name = sSpawnedName},
			MapFlagIsFalse	{Name = sOtherSpawnedName},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_HappyHippoOutcryDelay"},
			FigureOutcry	{TextTag = "SQTicking1", Tag = GetScriptTag()},
			SoundGlobalPlayOnceAddon1	{File = "06_level/lvl_mech_click_sad"},

			MapValueSet	{Name = sRewardTypeName, Value = 1},
			EntityTimerStart	{Name = "et_EnableDialog"},
			--DebugMessage	{Message = GetScriptTag() .. ": ich leb als erstes"},
		},
		GotoState = "ItsAlive",
	};
};

local ATeleport
if string.upper(GetScriptTag()) == string.upper("SQTicking_SpiderSilver") then
	ATeleport = FigureTeleportToEntity	{Tag = "default", TargetTag = "NavigationObject"}
else
	ATeleport = FigureTeleportToEntity	{Tag = "default", TargetTag = "SoulCarrierDiary"}
end

State
{
	StateName = "ItsAlive",
	
	OnEvent
	{
		EventName = "EnableDialog",
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_GotRewardFromDialog"},
			OR
			{
				AND
				{
					QuestIsKnown	{Quest = "Citadel1_IntoTheCitadel"},
					MapValueIsEqual	{Name = sRewardTypeName, Value = 2},
				},
				AND
				{
					QuestIsKnown	{Quest = "DraghLurA1_BackToCitadel"},
					MapValueIsEqual	{Name = sRewardTypeName, Value = 3},
				},
				AND
				{
					QuestIsKnown	{Quest = "Citadel2_DefeatMordecay"},
					MapValueIsEqual	{Name = sRewardTypeName, Value = 4},
				},
				AND
				{
					QuestIsKnown	{Quest = "Refuge_ShaperAttack"},
					MapValueIsEqual	{Name = sRewardTypeName, Value = 5},
				},
			},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			EntityFlagSetFalse	{Name = "ef_GotRewardFromDialog"},
			EntityTimerStart	{Name = "et_EnableDialog"},
		},
	};

	OnEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_EnableDialog", Seconds = 5},
		},
		Actions = 
		{
			EntityTimerStop	{Name = "et_EnableDialog"},
			DialogTypeSetSideQuest	{},
			DialogSetEnabled	{},
		},
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQTicking_MapChangeDetected"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_SQTicking_MapChangeDetected"},
			ATeleport,
		},
	};
	
	OnFollowEvent
	{
		Tag = GetScriptTag(),
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			FigureIsAlive	{},
		},
		Actions = 
		{
		},
	};

	OnEvent
	{
		Conditions =
		{
			FigureIsDead	{},
		},
		Actions =
		{
		},
		GotoState = "END",
	};
};

State	{StateName = "END"};
