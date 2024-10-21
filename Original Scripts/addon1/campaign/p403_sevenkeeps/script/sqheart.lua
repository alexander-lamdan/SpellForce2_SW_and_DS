
if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		EventName = "Debug",
		Conditions = 
		{
			DebugQuestionYes	{Question = "Sidequest Herz aus Eis (bei Skjadir) aktivieren?", Caption = "SQ Heart of Ice"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_KingUlfCS"},
			QuestSetSolved	{Quest = "SevenkeepsA1_GetFugitivesIntoTown"},
		},
	};
end

State
{
	StateName = "INIT",

	OnEvent
	{
		EventName = "SkjadirDialogEnable",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_KingUlfCS"},
		},
		Actions = 
		{
			DialogTypeSetSideQuest	{Tag = "Skjadir"},
			DialogSetEnabled	{Tag = "Skjadir"},
		},
		GotoState = "FindTransportation",
	};
};

State
{
	StateName = "FindTransportation",


	-- Skjadir ist auf der City Ship bereits gespawned, also hier vanishen
	OnEvent
	{
		EventName = "SkjadirMustVanish",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P403_SQHeart_SkjadirNowOnCityShip"},
		},
		Actions = 
		{
		},
		GotoState = "Vanishing",
	};

	-- der spieler hat die City Ship mittlerweile gefunden, muss Skjadir nochmal ansprechen ...
	OnEvent
	{
		EventName = "SkjadirDialogEnable",
		Conditions = 
		{
			QuestIsSolved	{Quest = "HeartOfIceFindCityShip"},
			QuestIsActive	{Quest = "HeartOfIceGetTroopsOnBoard"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Skjadir"},
		},
		GotoState = "MoveToCityShip",
	};
};


local tFollowDwarves = {}
local tWalkDwarves = {}
local tAllDwarvesVanished = {}
local tVanishDwarves = {}
local tStopDwarves = {}
local tUnits = dofile("addon1/map/Campaign/P403_Sevenkeeps/script/SQHeart_TroopDefinition.lua")

for _, tUnit in tUnits do
	for i = 1, tUnit.Amount do
		local sTag = "SQHeart_" .. tUnit.Tag .. i
		local sTargetTag = "SQHeart_SpawnDwarves" .. math.random(1, 2)
		table.insert(tFollowDwarves, NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = sTag, Level = tUnit.Level, UnitId = tUnit.UnitId, TargetTag = sTargetTag, Team = "tm_Neutral"}})
		table.insert(tFollowDwarves, FigureForcedRunToEntity	{Tag = sTag, TargetTag = "CityShipTeleporter"})
		table.insert(tWalkDwarves, FigureForcedRunToEntity	{Tag = sTag, TargetTag = "Sevenkeeps_CityShip"})
		table.insert(tVanishDwarves, FigureVanish	{Tag = sTag})
		table.insert(tStopDwarves, FigureStop	{Tag = sTag})
		table.insert(tAllDwarvesVanished, FigureIsDead	{Tag = sTag})
	end
end

State
{
	StateName = "MoveToCityShip",

	OnOneTimeEvent
	{
		EventName = "Walking",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQHeart_SkjadirTroopsWalkToCityShip"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			EntityFlagSetTrue	{Name = "ef_SpawnDwarves"},
		},
	};

	OnEvent
	{
		EventName = "SpawnDwarves",
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_SpawnDwarves"},
		},
		Actions = 
		{
			unpack(tFollowDwarves)	-- muss die letzte Action sein!
		},
		GotoState = "Vanishing",
	};
};

State
{
	StateName = "Vanishing",
	
	OnEvent
	{
		EventName = "running",
		Conditions = 
		{
			FigureIsIdle	{Tag = "Skjadir"},
			FigureIsNotInRangeToEntity	{Tag = "Skjadir", TargetTag = "Sevenkeeps_CityShip", Range = 2},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "Skjadir", TargetTag = "Sevenkeeps_CityShip"},
		},
	};
	
	OnEvent
	{
		EventName = "Vanish",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P403_SQHeart_SkjadirNowOnCityShip"},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Skjadir"},
			unpack(tVanishDwarves)	-- muss die letzte Action sein!
		},
		GotoState = "END",
	};

	OnEvent
	{
		EventName = "Vanish",
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Skjadir", TargetTag = "Sevenkeeps_CityShip", Range = 2},
			AvatarValueIsEqual	{Name = "av_P405_CityShipLocation", Value = CityShipAtSevenkeeps},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Skjadir"},
			--unpack(tStopDwarves)
		},
		GotoState = "WalkDwarvesIntoTeleporter",
	};
};


for _, tUnit in tUnits do
	for i = 1, tUnit.Amount do
		local sTag = "SQHeart_" .. tUnit.Tag .. i

		OnEvent
		{
			EventName = "Vanish_" .. sTag,
			Conditions = 
			{
				FigureIsInRangeToEntity	{Tag = sTag, TargetTag = "CityShipTeleporter", Range = 2},
			},
			Actions = 
			{
				FigureVanish	{Tag = sTag},
			},
		};
		OnEvent
		{
			EventName = "Goto_" .. sTag,
			Conditions = 
			{
				FigureIsIdle	{Tag = sTag},
				FigureIsNotInRangeToEntity	{Tag = sTag, TargetTag = "CityShipTeleporter", Range = 2},
			},
			Actions = 
			{
				FigureRunToEntity	{Tag = sTag, TargetTag = "CityShipTeleporter"},
			},
		};
	end
end

State
{
	StateName = "WalkDwarvesIntoTeleporter",

	OnOneTimeEvent
	{
		EventName = "SetQuestActive_SkjadirOnCityShip",
		Conditions = 
		{
			QuestIsActive	{Quest = "HeartOfIceGetTroopsOnBoard"},
			QuestIsNotKnown	{Quest = "HeartOfIceTalkToSkjadirOnCityShip"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "HeartOfIceGetTroopsOnBoard"},
			QuestSetActive	{Quest = "HeartOfIceTalkToSkjadirOnCityShip"},
		},
	};
	
	OnEvent
	{
		EventName = "AllGone",
		Conditions = 
		{
			unpack(tAllDwarvesVanished),
		},
		Actions = 
		{
		},
		GotoState = "END",
	};
	OnEvent
	{
		EventName = "VanishAll",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P403_SQHeart_SkjadirNowOnCityShip"},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Skjadir"},
			unpack(tVanishDwarves)	-- muss die letzte Action sein!
		},
		GotoState = "END",
	};
};


State{StateName = "END"};
