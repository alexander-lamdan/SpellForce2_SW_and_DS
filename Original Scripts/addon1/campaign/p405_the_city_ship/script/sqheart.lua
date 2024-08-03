
if DEBUG and QUESTDEBUG then
	OnOneTimeEvent
	{
		EventName = "Debug",
		Conditions = 
		{
			QuestIsNotKnown	{Quest = "HeartOfIce"},
			DebugQuestionYes	{Question = "Sidequest Herz aus Eis (bei Skjadir) aktivieren?", Caption = "SQ Heart of Ice"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "HeartOfIce"},
			QuestSetActive	{Quest = "HeartOfIceFindCityShip"},
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
			QuestIsActive	{Quest = "HeartOfIce"},
		},
		Actions =
		{
		},
		GotoState = "SQHeartActive",
	};
};

State
{
	StateName = "SQHeartActive",

	-- City Ship gilt als gefunden, sobald man das Navigationsobjekt bedienen kann
	-- als nächstes muss man die Sevenkeeps Koordinaten finden
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "HeartOfIceFindCityShip"},
			AvatarFlagIsTrue	{Name = "af_P405_DiscoveredNavigationObject"},
			MapFlagIsTrue{Name = "mf_CrystalDone"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "HeartOfIceFindCityShip"},
			QuestSetActive	{Quest = "HeartOfIceCoordsSevenkeeps"},
			DialogSetEnabled	{Tag = "SQHeart_SevenkeepsMap"},
		},
	};
	
	-- Sevenkeeps Koordinaten gefunden, nun nach Sevenkeeps navigieren ...
	OnEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "HeartOfIceCoordsSevenkeeps"},
			MapFlagIsTrue	{Name = "mf_SevenkeepsCoordsGiven"},
			MapFlagIsTrue{Name = "mf_CrystalDone"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "HeartOfIceCoordsSevenkeeps"},
			QuestSetActive	{Quest = "HeartOfIceNavigateSevenkeeps"},
		},
		GotoState = "NavigateSevenkeeps",
	};
};

State
{
	StateName = "NavigateSevenkeeps",

	-- City Ship hat bei der Siebenburg angelegt
	OnEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "HeartOfIceNavigateSevenkeeps"},
			AvatarValueIsEqual {Name = "av_P405_CityShipLocation", Value = CityShipAtSevenkeeps},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "HeartOfIceNavigateSevenkeeps"},
		},
		GotoState = "CityShipAtSevenkeeps",
	};
};

State
{
	StateName = "CityShipAtSevenkeeps",

	-- City Ship war zu Questbeginn NICHT bekannt (wahrscheinlicherer Fall)
	-- Avatar muss nochmal auf Sevenkeeps mit Skjadir reden, damit dieser sich auf die City Ship begibt
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsFalse	{Name = "af_P403_SQHeart_CityShipKnownAtQuestStart"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "HeartOfIceGetTroopsOnBoard"},
		},
	};
	OnEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "HeartOfIceTalkToSkjadirOnCityShip"},
		},
		Actions =
		{
		},
		GotoState = "SkjadirOnCityShip",
	};

	-- City Ship war zu Questbeginn bekannt, die Zwerge haben bereits am Portal auf die Ankunft des Schiffs gewartet
	-- Zwerge spawnen direkt auf der City Ship (unwahrscheinlichere Fall von beiden)
	OnEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue	{Name = "af_P403_SQHeart_CityShipKnownAtQuestStart"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "HeartOfIceTalkToSkjadirOnCityShip"},
		},
		GotoState = "SkjadirOnCityShip",
	};
};


local tSpawnDwarves = {}
local tVanishDwarves = {}
local tUnits = dofile("addon1/map/Campaign/P403_Sevenkeeps/script/SQHeart_TroopDefinition.lua")

for _, tUnit in tUnits do
	for i = 1, tUnit.Amount do
		local sTag = "SQHeart_" .. tUnit.Tag .. i
		table.insert(tSpawnDwarves, NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = sTag, Level = tUnit.Level, UnitId = tUnit.UnitId, TargetTag = "SQHeart_Location", Team = "tm_Neutral"}})
		table.insert(tSpawnDwarves, FigureDirectionSetToEntity	{Tag = sTag, TargetTag = "SQHeart_Skjadir"})
		table.insert(tVanishDwarves, FigureVanish	{Tag = sTag})
	end
end

State
{
	StateName = "SkjadirOnCityShip",

	OnOneTimeEvent
	{
		Conditions =
		{
			-- warte bis gespawned, das kann einen Step dauern...
			FigureIsAlive	{Tag = "SQHeart_Skjadir"},
		},
		Actions =
		{
			-- für korrektes Vanish auf der Sevenkeeps
			AvatarFlagSetTrue	{Name = "af_P403_SQHeart_SkjadirNowOnCityShip"},
			unpack(tSpawnDwarves)	-- muss die letzte action sein!
		},
	};

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SQHeart_StartQuestCoordsWinterlight"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "HeartOfIceTalkToSkjadirOnCityShip"},
			QuestSetActive	{Quest = "HeartOfIceCoordsWinterlight"},
			DialogSetEnabled	{Tag = "SQHeart_WinterlightMap"},
		},
		GotoState = "CoordsWinterlight",
	};
};

State
{
	StateName = "CoordsWinterlight",

	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_WinterlightCoordsGiven"},
		},
		Actions =
		{
			QuestSetSolved	{Quest = "HeartOfIceCoordsWinterlight"},
			QuestSetActive	{Quest = "HeartOfIceNavigateWinterlight"},
		},
		GotoState = "NavigateWinterlight",
	};
};

State
{
	StateName = "NavigateWinterlight",
	
	-- je nachdem ob sich die city ship bei winterlight befindet, die "gehe auf winterlicht" quest an-/abschalten
	-- damit ist sichergestellt das skjadir und seine truppen nur dann auf winterlicht spawnen,
	-- wenn die city ship auch dort angelegt hat
	OnToggleEvent
	{
		OnConditions = 
		{
			AvatarValueIsEqual {Name = "av_P405_CityShipLocation", Value = CityShipAtWinterlight},
			QuestIsNotSolved	{Quest = "HeartOfIceGotoWinterlight"},
		},
		OnActions = 
		{
			QuestSetSolved	{Quest = "HeartOfIceNavigateWinterlight"},
			QuestSetActive	{Quest = "HeartOfIceGotoWinterlight"},
		},
		OffConditions = 
		{
			AvatarValueIsNotEqual {Name = "av_P405_CityShipLocation", Value = CityShipAtWinterlight},
			QuestIsNotSolved	{Quest = "HeartOfIceGotoWinterlight"},
		},
		OffActions = 
		{
			QuestSetInactive	{Quest = "HeartOfIceGotoWinterlight"},
			QuestSetActiveAgain	{Quest = "HeartOfIceNavigateWinterlight"},
		},
	};

	OnEvent
	{
		Conditions =
		{
			QuestIsSolved	{Quest = "HeartOfIceGotoWinterlight"},
		},
		Actions =
		{
			FigureVanish	{Tag = "SQHeart_Skjadir"},
			unpack(tVanishDwarves)	-- muss die letzte Action sein!
		},
		GotoState = "END",
	};
};


State	{StateName = "END"};
