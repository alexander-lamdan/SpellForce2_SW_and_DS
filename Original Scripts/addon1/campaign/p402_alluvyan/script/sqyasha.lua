local iLocationRange = 15
local iLocationRangeMax = 25

local tSpawnUndead = {}
local tUndead = 
{
	{Level = -4, UnitId = 442, TargetTag = "SQYasha_Location"},
	{Level = -4, UnitId = 442, TargetTag = "SQYasha_Location"},
	{Level = -4, UnitId = 442, TargetTag = "SQYasha_Location"},

	{Level = -4, UnitId = 377, TargetTag = "SQYasha_Spawn1"},
	{Level = -2, UnitId = 373, TargetTag = "SQYasha_Spawn1"},
	{Level = -2, UnitId = 374, TargetTag = "SQYasha_Spawn3"},
	{Level = -4, UnitId = 377, TargetTag = "SQYasha_Spawn3"},

	{Level = -5, UnitId = 116, TargetTag = "SQYasha_Spawn1"},
	{Level = -5, UnitId = 116, TargetTag = "SQYasha_Spawn1"},
	{Level = -5, UnitId = 116, TargetTag = "SQYasha_Spawn2"},
	{Level = -5, UnitId = 116, TargetTag = "SQYasha_Spawn2"},
	{Level = -5, UnitId = 116, TargetTag = "SQYasha_Spawn2"},
	{Level = -5, UnitId = 116, TargetTag = "SQYasha_Spawn2"},
	{Level = -5, UnitId = 116, TargetTag = "SQYasha_Spawn3"},
	{Level = -5, UnitId = 116, TargetTag = "SQYasha_Spawn3"},
}

for i, tUnit in pairs(tUndead) do
	local sTag = "SQYasha_Undead" .. i
	table.insert(tSpawnUndead, FigureNpcSpawnLRTAToEntity	{Tag = sTag, Level = tUnit.Level, UnitId = tUnit.UnitId, TargetTag = tUnit.TargetTag, Team = "tm_Team2"})
	table.insert(tSpawnUndead, FigureRoamingEnable	{Tag = sTag})
end

if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotKnown	{Quest = "HeroYasha"},
			DebugQuestionYes	{Question = "Hero Yasha Quest starten?"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "HeroYasha"},
			QuestSetActive	{Quest = "HeroYasha_Alluvyan"},
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
			QuestIsActive	{Quest = "HeroYasha_Alluvyan"},
		},
		Actions =
		{
			ObjectSpawnToEntity	{ObjectId = 1093, TargetTag = "SQYasha_Location", Direction = 0, Tag = "SQYasha_Chest"},
			ObjectLootItemMiscAdd	{Tag = "SQYasha_Chest", DropChance = 100, ItemId = 402},
		},
		GotoState = "InRange",
	};
}

State
{
	StateName = "InRange",

	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureTeamIsInRangeToEntity	{Team = "tm_Team1", Range = iLocationRangeMax, TargetTag = "SQYasha_Location"},
				FigureIsInRangeToEntity	{Range = iLocationRangeMax, TargetTag = "SQYasha_Location", Tag = "pl_HumanAvatar"},
				FigureIsInRangeToEntity	{Range = iLocationRangeMax, TargetTag = "SQYasha_Location", Tag = "pl_HumanHeroYasha"},
				FigureIsInRangeToEntity	{Range = iLocationRangeMax, TargetTag = "SQYasha_Location", Tag = "pl_HumanHeroWhisper"},
				FigureIsInRangeToEntity	{Range = iLocationRangeMax, TargetTag = "SQYasha_Location", Tag = "pl_HumanHeroWind"},
				FigureIsInRangeToEntity	{Range = iLocationRangeMax, TargetTag = "SQYasha_Location", Tag = "pl_HumanHeroMordecay"},
				FigureIsInRangeToEntity	{Range = iLocationRangeMax, TargetTag = "SQYasha_Location", Tag = "pl_HumanHeroCaine"},
				FigureIsInRangeToEntity	{Range = iLocationRangeMax, TargetTag = "SQYasha_Location", Tag = "pl_HumanNightsong"},
			},
		},
		Actions =
		{
			FigureOutcryImmediate	{TextTag = "SQYasha1", Tag = "pl_HumanHeroYasha"},
		},
	};

	OnEvent
	{
		Conditions =
		{
			OR
			{
				FigureTeamIsInRangeToEntity	{Team = "tm_Team1", Range = iLocationRange, TargetTag = "SQYasha_Location"},
				FigureIsInRangeToEntity	{Range = iLocationRangeMax, TargetTag = "SQYasha_Location", Tag = "pl_HumanAvatar"},
				FigureIsInRangeToEntity	{Range = iLocationRangeMax, TargetTag = "SQYasha_Location", Tag = "pl_HumanHeroYasha"},
				FigureIsInRangeToEntity	{Range = iLocationRangeMax, TargetTag = "SQYasha_Location", Tag = "pl_HumanHeroWhisper"},
				FigureIsInRangeToEntity	{Range = iLocationRangeMax, TargetTag = "SQYasha_Location", Tag = "pl_HumanHeroWind"},
				FigureIsInRangeToEntity	{Range = iLocationRangeMax, TargetTag = "SQYasha_Location", Tag = "pl_HumanHeroMordecay"},
				FigureIsInRangeToEntity	{Range = iLocationRangeMax, TargetTag = "SQYasha_Location", Tag = "pl_HumanHeroCaine"},
				FigureIsInRangeToEntity	{Range = iLocationRangeMax, TargetTag = "SQYasha_Location", Tag = "pl_HumanNightsong"},
			},
		},
		Actions =
		{
			unpack(tSpawnUndead)	-- muss die letzte Action sein!
		},
		GotoState = "LootMe",
	};
}

State
{
	StateName = "LootMe",

	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc	{ItemId = 402, Amount = 1},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "SQYasha2", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "SQYasha3", Tag = "pl_HumanHeroYasha"},
			FigureOutcry	{TextTag = "SQYasha4", Tag = "pl_HumanAvatar"},
			QuestSetSolved	{Quest = "HeroYasha_Alluvyan"},
			QuestSetActive	{Quest = "HeroYasha_Archfire"},
		},
		GotoState = "END",
	};
};

State	{StateName = "END"};
