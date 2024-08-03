-- gesamtanzahl der flaggen auf der Karte (irgendwie sollte das verifiziert werden mit der
-- tatsächlichen anzahl flaggen auf der karte)
local NumFlags = 15

-- nach wieviel Sekunden ein neues Ressourcenpaket von einer Flagge übergeben wird:
local GiveResourcesDelay = 7.5

-- gibt den Interval an, mit welcher maximalfrequenz ressourcen übergeben werden
-- d.h. es wird nur alle "Interval" sekunden ein "Ressourcenpaket" übergeben
-- in erster linie ist das wegen der optik, d.h. ein kontinuierlich ansteigende
-- ressourcenanzeige sieht einfach besser aus als unregelmässige/zufällige übergaben
local ResourceTransferInterval = GiveResourcesDelay / NumFlags	-- ergibt: 0.5

-- wieviel von welcher Ressource die versch. Teams pro Ressourcenübergabe erhalten
-- diese werte haben dramatische auswirkungen aufs balancing der karte, selbst bei kleinen änderungen!
local ResourceAmounts = 
{
	Red =		{	Stone = 9,	Lenya = 9,	Iron = 9	},
	Purple =	{	Stone = 9,	Lenya = 9,	Iron = 9	},
	Blue =		{	Stone = 20,	Lenya = 20,	Iron = 20	},
}

local FlagCounter = 
{
	Red		= "mv_FlagCounterTeamRed",
	Purple	= "mv_FlagCounterTeamPurple",	
	Blue	= "mv_FlagCounterTeamBlue",
}


-- player & teamnamen, sowie die Farben der Flaggen
local Players =	{ Red = "pl_SchattenTeamAlpha", Purple = "pl_SchattenTeamBeta", Blue = "pl_Human" }
local Teams =	{ Red = "tm_TeamAlpha", Purple = "tm_TeamBeta", Blue = "tm_TeamAvatar" }
local Flags =	{ "Red", "Purple", "Blue" }

-- wie nah eine Figur einer Flagge kommen muss, um das Farb-umschalten auszulösen
local FlagProtectRange = 8

-- in range conditions für die einzelnen Teams schonmal vordefiniert:
local CTeamInRange =
{
	Red = OR {
		FigureTeamIsInRange		{Team = Teams.Red, Range = FlagProtectRange, X = GetEntityX(), Y = GetEntityY()},
		PlayerBuildingIsInRange	{Player = Players.Red, BuildingId = 0, Range = FlagProtectRange, X = GetEntityX(), Y = GetEntityY()},
	},
	Purple = OR {	
		FigureTeamIsInRange		{Team = Teams.Purple, Range = FlagProtectRange, X = GetEntityX(), Y = GetEntityY()},
		PlayerBuildingIsInRange	{Player = Players.Purple, BuildingId = 0, Range = FlagProtectRange, X = GetEntityX(), Y = GetEntityY()},
	},
	Blue = OR {
		FigureTeamIsInRange		{Team = Teams.Blue, Range = FlagProtectRange, X = GetEntityX(), Y = GetEntityY()},
		PlayerBuildingIsInRange	{Player = Players.Blue, BuildingId = 0, Range = FlagProtectRange, X = GetEntityX(), Y = GetEntityY()},
	},
}
local CTeamNotInRange =
{
	Red = AND {
		FigureTeamIsNotInRange		{Team = Teams.Red, Range = FlagProtectRange, X = GetEntityX(), Y = GetEntityY()},
		PlayerBuildingIsNotInRange	{Player = Players.Red, BuildingId = 0, Range = FlagProtectRange, X = GetEntityX(), Y = GetEntityY()},
	},
	Purple = AND {
		FigureTeamIsNotInRange		{Team = Teams.Purple, Range = FlagProtectRange, X = GetEntityX(), Y = GetEntityY()},
		PlayerBuildingIsNotInRange	{Player = Players.Purple, BuildingId = 0, Range = FlagProtectRange, X = GetEntityX(), Y = GetEntityY()},
	},
	Blue = AND {
		FigureTeamIsNotInRange		{Team = Teams.Blue, Range = FlagProtectRange, X = GetEntityX(), Y = GetEntityY()},
		PlayerBuildingIsNotInRange	{Player = Players.Blue, BuildingId = 0, Range = FlagProtectRange, X = GetEntityX(), Y = GetEntityY()},
	},
}

-- das macht dann auch die Enemy Abfragen leichter:
local CEnemyTeamInRange =
{
	-- Team Blue Einheiten sind für Red UND Purple Feinde
	Red =		CTeamInRange.Blue,
	Purple =	CTeamInRange.Blue,
	-- für Blue sind Red ODER Purple (sowohl als auch) feindliche Einheiten
	Blue = 		OR { table.copy(CTeamInRange.Red), table.copy(CTeamInRange.Purple) },
}

local CEnemyTeamNotInRange =
{
	-- Team Blue Einheiten sind für Red UND Purple Feinde
	Red =		CTeamNotInRange.Blue,
	Purple =	CTeamNotInRange.Blue,
	-- für Blue sind Red ODER Purple (sowohl als auch) feindliche Einheiten
	Blue = 		AND { table.copy(CTeamNotInRange.Red), table.copy(CTeamNotInRange.Purple) },
}

-- Action "Pakete" für Farbwechsel:
local AColorChange =
{
	-- TODO:
	-- alten flaggen-farb-effekt stoppen
	-- flaggen-farb-effekt setzen
	-- farbwechsel effekt setzen
	-- flaggencounter aktualisieren
	White =
	{
	},
	Red =
	{
	},
	Purple =
	{
	},
	Blue =
	{
	},
}

-- die versch. effekte, die beim farbwechsel abgespielt werden
local Effects =
{
	-- wird bei jedem Farbwechsel abgespielt, um "plopp" des objects zu vertuschen
	ChangeColor = "Effect_Spawn_Unit",	
	
	-- farbeffekte, die immer aktiv sind solange die flagge die entspr. farbe hat,
	-- oder demnächst in die entspr. farbe wechseln wird
	White = "Effect_Misc_Territory_Green", -- weiss fehlt noch
	Red = "Effect_Misc_Territory_Red",
	Purple = "Effect_Misc_Territory_Yellow", -- lila fehlt noch
	Blue = "Effect_Misc_Territory_Blue",
}

-- updateinterval, der im gesamten flaggenscript den gleichen Zufallswert haben muss, 
-- aber pro flagge verschieden sein sollte, damit nicht alle flaggen gleichzeitig conditions prüfen werden
local UpdateInterval = math.random(10, 14)

-- Anzahl Sekunden bis eine Flagge ihre Farbe wechselt, getrennt nach neutral werden und farbig werden
local BecomeNeutralDelay = 10
local BecomeColoredDelay = 15

-- object IDs der flaggen
local ObjectWhiteFlag = 1134
local ObjectRedFlag = 1132
local ObjectPurpleFlag = 1133
local ObjectBlueFlag = 1131

local FlagObjectIds = 
{
	White	= 1134,
	Red		= 1132,
	Purple	= 1133,	
	Blue	= 1131,
}


-- ==========================================================================================================
-- INIT: wartet einfach, bis das Spiel beginnt...
-- ==========================================================================================================
State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_GameCommencing"},
		},
		Actions =
		{
			MapTimerStart{Name = "mt_PlayerResourceTransferInterval"},
			-- weissen effekt starten
			--EffectStart	{File = Effects.White},
			-- flaggen gesamtanzahl-counter hochzählen
		},
		GotoState = "FlagIsNeutral",
	},
}

-- ==========================================================================================================
-- NEUTRAL (die Flagge ist weiss, der Effekt ist weiss)
-- ==========================================================================================================
State
{
	StateName = "FlagIsNeutral",

	-- sind nur Rote Einheiten in der Nähe?
	OnEvent
	{
		Conditions =
		{
			-- nur alle paar sekunden prüfen:
			SetUpdateInterval {Steps = UpdateInterval},
			-- wenn keine blauen Einheiten und rote Einheiten im range sind ...
			CTeamInRange.Red,
			CTeamNotInRange.Blue,
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_FlagChangeTimer"},
			-- roten effekt starten
			EffectStop	{},
			--EffectStart	{File = Effects.Red},
		},
		GotoState = "FlagIsAboutToBecomeRed",
	},

	-- sind nur Lila Einheiten in der Nähe?
	OnEvent
	{
		Conditions =
		{
			-- nur alle paar sekunden prüfen:
			SetUpdateInterval {Steps = UpdateInterval},
			-- wenn keine blauen Einheiten und lila Einheiten im range sind ...
			CTeamInRange.Purple,
			CTeamNotInRange.Blue,
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_FlagChangeTimer"},
			-- lila effekt starten
			EffectStop	{},
			--EffectStart	{File = Effects.Purple},
		},
		GotoState = "FlagIsAboutToBecomePurple",
	},

	-- sind nur Blaue Einheiten in der Nähe?
	OnEvent
	{
		Conditions =
		{
			-- nur alle paar sekunden prüfen:
			SetUpdateInterval {Steps = UpdateInterval},
			-- wenn nur einheiten vom blauen team im range sind ...
			CTeamInRange.Blue,
			CTeamNotInRange.Red,
			CTeamNotInRange.Purple,
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_FlagChangeTimer"},
			-- blauen effekt starten
			EffectStop	{},
			--EffectStart	{File = Effects.Blue},
		},
		GotoState = "FlagIsAboutToBecomeBlue",
	},
};


------------------------------------------------------------------------------------------------------------------
-- für jede in "Flags" definierte Flaggen-Farbe:
for i, Color in ipairs(Flags) do

	-- ergibt nacheinander die folgenden Werte für i und Color:
	-- i == 1, 2, 3 ...		(i findet allerdings keine Verwendung)
	-- Color == "Red", "Purple", "Blue" ... (damit ist klar um welche Farbe es sich handelt)
	

	-- ----------------------------------------------------------------------------------
	-- ABOUT TO BECOME COLORED ... (Flagge noch weiss, aber möglicherweise bald farbig...)
	-- ----------------------------------------------------------------------------------
	local AOutcryBlueWinFlag
	
		-- interessiert nur den menschlichen spieler, der KI kanns egal sein
	if Color == "Blue" then
		AOutcryBlueWinFlag = FigureOutcry {Tag = "pl_HumanNightsong", TextTag = "Schattenlied01"}
	end
	
	State
	{
		StateName = "FlagIsAboutToBecome" .. Color,

		-- flagge wird sofort wieder neutral, wenn eine der abbruchbedingungen zutrifft
		-- d.h. gegner im range oder keine eigenen einheiten mehr im range
		OnEvent
		{
			Conditions =
			{
				-- jede sekunde prüfen:
				SetUpdateInterval {Steps = 10},
				OR
				{
					-- wenn einheiten vom gegnerischen team im range sind
					table.copy(CEnemyTeamInRange[Color]),
					-- oder wenn keine eigenen einheiten mehr im range sind
					table.copy(CTeamNotInRange[Color]),
				},
			},
			Actions =
			{
				-- weissen effekt starten
				EffectStop	{},
				--EffectStart	{File = Effects.White},
			},
			GotoState = "FlagIsNeutral",
		},

		-- flagge wird farbig sobald der timer abgelaufen ist...
		-- hier muss NICHT explizit abgefragt werden, ob einheiten des Teams in range sind,
		-- weil das durch obige Abbruchbedingungen bereits abgefangen ist
		OnEvent
		{
			Conditions =
			{
				EntityTimerIsElapsed	{Name = "et_FlagChangeTimer", Seconds = BecomeColoredDelay},
			},
			Actions =
			{
				EntityTimerStop	{Name = "et_FlagChangeTimer"},
				EntityTimerStart {Name = "et_GiveResourcesTimer"},
				-- hier flagge austauschen
				ObjectChange {ObjectId = FlagObjectIds[Color], X = GetEntityX(), Y = GetEntityY(), Direction = 0},
				-- hier flaggenwechsel effekt abspielen
				EffectStop	{},
				--EffectStart	{File = Effects.ChangeColor},
				--EffectStart	{File = Effects[Color]},
				-- hier flaggencounter aktualisieren
				MapValueAdd	{Name = FlagCounter[Color], Value = 1},
				AOutcryBlueWinFlag
			},
			GotoState = "FlagIs" .. Color,
		},
	};

	-- ----------------------------------------------------------------------------------
	-- FLAG IS COLORED ... (Flagge hat jetzt eine der vordefinierten Farben)
	-- ----------------------------------------------------------------------------------
	
	-- hiermit wird sichergestellt, das die ressourcenübergabe an den spieler
	-- einigermassen regelmässig ausfällt (reine Optik-Geschichte)
	
	local CResourceTransferInterval
	local AResourceTransferInterval
	local AOutcryBlueLoseFlag
	local AEffect
	
	-- interessiert nur den menschlichen spieler, der KI kanns egal sein
	if Color == "Blue" then
		CResourceTransferInterval = MapTimerIsElapsed{Name = "mt_PlayerResourceTransferInterval", Seconds = ResourceTransferInterval}
		AResourceTransferInterval = MapTimerStart{Name = "mt_PlayerResourceTransferInterval"}
		AOutcryBlueLoseFlag = FigureOutcry {Tag = "pl_HumanNightsong", TextTag = "Schattenlied02"}
		AEffect = EffectStartAtEntityPosition	{Tag = "default", File = "Effect_Misc_Flagpointcounter"}
	end
	
	
		
	State
	{
		StateName = "FlagIs" .. Color,

		-- event für die Ressourcenübergabe:	
		OnEvent
		{
			EventName = Color .. "GetsResources",
			Conditions =
			{
				EntityTimerIsElapsed {Name = "et_GiveResourcesTimer", Seconds = GiveResourcesDelay},

				-- Ressourcen Transfer Interval für Spieler, muss am ende stehen:
				CResourceTransferInterval
			},
			Actions = 
			{
				EntityTimerStart	{Name = "et_GiveResourcesTimer"},
				PlayerResourceStoneGive	{Amount = ResourceAmounts[Color].Stone,	Player = Players[Color]},
				PlayerResourceLenyaGive	{Amount = ResourceAmounts[Color].Lenya,	Player = Players[Color]},
				PlayerResourceSilverGive	{Amount = ResourceAmounts[Color].Iron,	Player = Players[Color]},
				
				-- Ressourcen Transfer Interval für Spieler, muss am ende stehen:
				AResourceTransferInterval,
				AEffect
			},
		},
		
			
		-- Become neutralTimer wird gestartet
		OnEvent
		{
			Conditions =
			{
				EntityFlagIsFalse {Name = "ef_NeutralizeTimerRunning"},
				CEnemyTeamInRange[Color],
			},
			Actions =
			{
				EntityTimerStart	{Name = "et_FlagChangeTimer"},
				EntityFlagSetTrue {Name = "ef_NeutralizeTimerRunning"},
				EffectStop	{},
				--EffectStart	{File = Effects.White},
			},
			
		},
		-- Become neutralTimer wird gestoppt
		OnEvent
		{
			Conditions =
			{
				EntityFlagIsTrue {Name = "ef_NeutralizeTimerRunning"},
				CEnemyTeamNotInRange[Color],
			},
			Actions =
			{
				EntityTimerStop	{Name = "et_FlagChangeTimer"},
				EntityFlagSetFalse {Name = "ef_NeutralizeTimerRunning"},
				EffectStop	{},
				--EffectStart	{File = Effects[Color]},
			},
			
		},
		-- flagge wird wieder neutral
		OnEvent
		{
			Conditions =
			{
				-- wenn einheiten vom gegnerischen team im range sind und die zeit abgelaufen ist
				EntityTimerIsElapsed	{Name = "et_FlagChangeTimer", Seconds = BecomeNeutralDelay},
			},
			Actions =
			{
				-- farbwechsel effekt starten
				EffectStop	{},
				--EffectStart	{File = Effects.ChangeColor},
				--EffectStart	{File = Effects.White},
				ObjectChange {ObjectId = FlagObjectIds.White, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
				-- hier flaggencounter aktualisieren
				MapValueSubtract {Name = FlagCounter[Color], Value = 1},
				EntityTimerStop	{Name = "et_FlagChangeTimer"},
				EntityFlagSetFalse {Name = "ef_NeutralizeTimerRunning"},
				AOutcryBlueLoseFlag
			},
			GotoState = "FlagIsNeutral",
		},


		-- wenn eine der Win/Lose Bedingungen erfüllt ist, muss das Spiel beendet werden:
		OnEvent
		{
			Conditions =
			{
				MapFlagIsFalse {Name = "mf_GameCommencing"},
			},
			Actions =
			{
				-- hier alle Effekte stoppen
			},
			GotoState = "PeaceBrokeOut",
		},
	};
end



-- ==========================================================================================================
-- END
-- ==========================================================================================================
-- hier wird das script geparkt und die flaggen somit "abgeschaltet"
-- d.h. sie übergeben keine ressourcen mehr, sie schalten nicht mehr um, usw. usf.
State {StateName = "PeaceBrokeOut"};
