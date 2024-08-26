-- elementals + fire golem
local iFirstWaveLevel = 11
local iNumFirstWaveUnits = 9

-- fire golem zerbricht in x rock golems
local iBreakSpawnALevel = 11
local iNumBreakSpawnAUnits = 4

-- jeder rock golem zerbricht in x rock elementals
local iBreakSpawnBLevel = 12
local iNumBreakSpawnBUnits = 3

-- second wave mit obermotz + weitere fire elementals
local iSecondWaveSpawnDelay = 5	-- Sekunden
local iSecondWaveLevel = 12
local iNumSecondWaveUnits = 8


if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		EventName = "Debug",
		Conditions = 
		{
			DebugQuestionYes	{Question = "Nebenquest Room of Fire starten?"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "ThoughtsOfGlass"},
			QuestSetSolved	{Quest = "ThoughtsOfGlass"},
			EntityTimerStart	{Name = "et_DebugDialogEnable"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "Debug",
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_DebugDialogEnable", Seconds = 1},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "SQThoughts_Thinker"},
		},
	};
end



local tSpawnFirstWave = {}
local tFirstWaveDead = {}
for i = 1, iNumFirstWaveUnits + 1 do
	local sTag = "SQRoomOfFire_FirstWave" .. i
	local sTargetTag = "SQRoomOfFire_Location"
	local iLevel = iFirstWaveLevel

	local iUnitId = 1238
	if i == 1 then
		iUnitId = 1239
		iLevel = iLevel + 2
	end

	table.insert(tSpawnFirstWave, NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = sTag, Level = iLevel, UnitId = iUnitId, TargetTag = sTargetTag, Team = "tm_Team2"}})
	table.insert(tSpawnFirstWave, FigureRoamingEnable {Tag = sTag})
	table.insert(tFirstWaveDead, 1, FigureIsDead {Tag = sTag})
end

State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "RoomOfFireGoThere"},
		},
		Actions =
		{
			GateSetOpen	{Tag = "Door01"},
			GateSetOpen	{Tag = "Gate01"},
			unpack(tSpawnFirstWave)	-- muss die letzte Action sein!
		},
		GotoState = "GoThere",
	};
};

State
{
	StateName = "GoThere",

	OnEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "SQRoomOfFire_Location", Range = 20},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "RoomOfFireGoThere"},
			QuestSetActive	{Quest = "RoomOfFireKillEmAll"},
		},
		GotoState = "KillFirstWave",
	};
};


local tBreakSpawnA = {}
for i = 1, iNumBreakSpawnAUnits do
	local sTag = "SQRoomOfFire_BreakSpawnA" .. i
	local sTargetTag = "SQRoomOfFire_FirstWave1_DEAD"
	table.insert(tBreakSpawnA, FigureNpcSpawnToEntity	{Tag = sTag, Level = iBreakSpawnALevel, UnitId = 1240, TargetTag = sTargetTag, Team = "tm_Team2"})
	table.insert(tBreakSpawnA, FigureRoamingEnable {Tag = sTag})
	table.insert(tFirstWaveDead, 1, FigureIsDead {Tag = sTag})
	
	local tBreakSpawnB = {}
	for j = 1, iNumBreakSpawnBUnits do
		local sTagB = sTag .. "_B" .. j
		table.insert(tBreakSpawnB, FigureNpcSpawnToEntity	{Tag = sTagB, Level = iBreakSpawnBLevel, UnitId = 1241, TargetTag = sTag .. "_DEAD", Team = "tm_Team2"})
		table.insert(tBreakSpawnB, FigureRoamingEnable {Tag = sTagB})
		table.insert(tFirstWaveDead, 1, FigureIsDead {Tag = sTagB})
	end

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue	{Name = "ef_BreakSpawnAHasHappened"},
			FigureIsDead	{Tag = sTag},
		},
		Actions =
		{
			-- aus den toten Rockgolems spawnen jeweils 3 weitere Feuerelementare
			unpack(tBreakSpawnB)	-- muss die letzte Action sein!
		},
	};	
end



State
{
	StateName = "KillFirstWave",

	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "SQRoomOfFire_FirstWave1"},
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = "ef_BreakSpawnAHasHappened"},
			-- aus dem toten Feuergolem spawnen sofort 4 Rock Golems
			unpack(tBreakSpawnA)	-- muss die letzte Action sein!
		},
	};

	OnEvent
	{
		Conditions =
		{
			SetUpdateInterval	{Steps = 10},
			unpack(tFirstWaveDead)	-- muss die letzte Condition sein!
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_SpawnSecondWave"},
		},
		GotoState = "KillSecondWave",
	};
};



local tSpawnSecondWave = {}
local tSecondWaveDead = {}
for i = 1, iNumSecondWaveUnits + 1 do
	local sTag = "SQRoomOfFire_SecondWave" .. i
	local sTargetTag = "SQRoomOfFire_Location"
	local iLevel = iSecondWaveLevel

	local iUnitId = 1243
	if i == 1 then
		iUnitId = 1242
		iLevel = iLevel + 6
	end

	table.insert(tSpawnSecondWave, FigureNpcSpawnToEntity	{Tag = sTag, Level = iLevel, UnitId = iUnitId, TargetTag = sTargetTag, Team = "tm_Team2"})
	table.insert(tSpawnSecondWave, FigureRoamingEnable {Tag = sTag})
	if i == 1 then
		table.insert(tSpawnSecondWave, FigureLootItemEquipmentAdd	{Tag = sTag, DropChance = 100, ItemId = 945})
	end
	table.insert(tSecondWaveDead, FigureIsDead {Tag = sTag})
end

State
{
	StateName = "KillSecondWave",

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_SpawnSecondWave", Seconds = iSecondWaveSpawnDelay},
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = "ef_SecondWaveHasSpawned"},
			unpack(tSpawnSecondWave)	-- muss die letzte Action sein!
		},
	};

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue	{Name = "ef_SecondWaveHasSpawned"},
			FigureIsDead	{Tag = "SQRoomOfFire_SecondWave1"},
		},
		Actions =
		{
			PlayerNPCKillCountIncrease	{UnitId = 1242},
		},
	};
	
	OnEvent
	{
		Conditions =
		{
			SetUpdateInterval	{Steps = 10},
			EntityFlagIsTrue	{Name = "ef_SecondWaveHasSpawned"},
			unpack(tSecondWaveDead)	-- muss die letzte Condition sein!
		},
		Actions =
		{
			QuestSetSolved	{Quest = "RoomOfFireKillEmAll"},
			QuestSetSolved	{Quest = "RoomOfFire"},
			MapFlagSetTrue	{Name = "mf_SQRoomOfFire_Reward"},
		},
		GotoState = "END",
	};
};


State	{StateName = "END"};
